class PD97Rocket extends BallisticProjectile;

var Actor Target;
var Vector LastLoc;
var() float TurnRate;
var() bool bSeeking;
var() float LastSendTargetTime;
var Vector StrafeVelocity;
var float StrafeEndTime;
var bool bSideWinder;
var int RollRange;
var float ScrewRadius;
var bool bCrazy;
var() float DudChance;
var() float SideWinderChance;
var() float MaxStrafeSpeed;
var() PD97Bloodhound Master;

replication
{
	// Pos:0x000
	reliable if((int(Role) == int(ROLE_Authority)) && bNetInitial)
		LastLoc, SetRocketDestination, 
		SetRocketTarget, Target, 
		bSeeking;

	// Pos:0x018
	reliable if(bNetOwner && int(Role) < int(ROLE_Authority))
		ServerNotifyReceived;
}

function SetRocketTarget(Actor targ)
{
	local Vector HitLoc, HitNorm, Start, End;
	local Actor t;

	Target = targ;
	// End:0x2D
	if(Target != none)
	{
		LastLoc = Target.Location;		
	}
	else
	{
		Start = Instigator.Location + Instigator.EyePosition();
		End = Start + (Vector(Instigator.GetViewRotation()) * float(20000));
		t = Instigator.Trace(HitLoc, HitNorm, End, Start, true);
		// End:0xB9
		if(t != none)
		{
			LastLoc = HitLoc;			
		}
		else
		{
			LastLoc = End;
		}
	}
	//return;	
}

function SetRocketDestination()
{
	// End:0x3C
	if((Master != none) && Master.bLockedOn)
	{
		bSeeking = true;
		LastLoc = Master.GetRocketTarget();
	}
	//return;	
}

simulated event PostBeginPlay()
{
	local Rotator R;

	// End:0x130
	if(DudChance > FRand())
	{
		bCrazy = true;
		AccelSpeed = 500.0000000 + float(Rand(1000));
		Speed += float(Rand(500));
		MaxSpeed = 1000.0000000 + float(Rand(2000));
		RotationRate.Pitch = int(float(RollRange) * ((FRand() * float(2)) - 1.0000000));
		RotationRate.Yaw = int(float(RollRange) * ((FRand() * float(2)) - 1.0000000));
		RotationRate.Roll = int(float(RollRange) * ((FRand() * float(2)) - 1.0000000));
		R.Yaw = -4000 + Rand(8000);
		R.Pitch = -4000 + Rand(8000);
		SetRotation(R + Rotation);
		bSideWinder = true;
		ScrewRadius = (ScrewRadius * float(4)) + float(Rand(int(ScrewRadius * float(24))));		
	}
	else
	{
		// End:0x1BC
		if(!bSeeking)
		{
			RotationRate.Roll = int(float(RollRange) * ((FRand() * float(2)) - 1.0000000));
			// End:0x18C
			if(SideWinderChance >= FRand())
			{
				bSideWinder = true;
				ScrewRadius += float(Rand(int(ScrewRadius * float(3))));
			}
			AccelSpeed += float(Rand(1000));
			Speed += float(Rand(500));
			MaxSpeed += float(Rand(1000));
		}
	}
	SetTimer(1.0000000 + (FRand() * 2.0000000), false);
	super.PostBeginPlay();
	//return;	
}

simulated event PostNetBeginPlay()
{
	local Vector X, Y, Z;

	super.PostNetBeginPlay();
	// End:0x1E
	if(Instigator.IsLocallyControlled())
	{
		ServerNotifyReceived();
	}
	GetAxes(Rotation, X, Y, Z);
	StrafeVelocity = (Y * ((FRand() * float(2)) - float(1))) * MaxStrafeSpeed;
	Velocity += StrafeVelocity;
	StrafeEndTime = Level.TimeSeconds + (FRand() * 0.5000000);
	// End:0x9D
	if(bCrazy)
	{
		Velocity += vect(0.0000000, 0.0000000, 300.0000000);
	}
	//return;	
}

function ServerNotifyReceived()
{
	//return;	
}

simulated event Tick(float dt)
{
	local Vector V, X, Y, Z, ScrewCenter;

	local Rotator R, AxisDir;
	local float TurnNeeded;

	// End:0x4B
	if((int(Role) == int(ROLE_Authority)) && (Level.TimeSeconds - LastSendTargetTime) > 0.0400000)
	{
		LastSendTargetTime = Level.TimeSeconds;
		SetRocketDestination();
	}
	// End:0x16B
	if(!bSeeking)
	{
		// End:0x75
		if(bCrazy)
		{
			Acceleration = VSize(Acceleration) * Vector(Rotation);
		}
		// End:0x108
		if(bSideWinder)
		{
			R = Rotation;
			R.Roll -= int(float(RotationRate.Roll) * dt);
			GetAxes(R, X, Y, Z);
			ScrewCenter = Location + (Y * ScrewRadius);
			GetAxes(Rotation, X, Y, Z);
			SetLocation(ScrewCenter - (Y * ScrewRadius));			
		}
		else
		{
			// End:0x168
			if((StrafeEndTime != float(0)) && Level.TimeSeconds >= StrafeEndTime)
			{
				StrafeEndTime = 0.0000000;
				Velocity -= StrafeVelocity;
				AccelSpeed += float(3000);
				Acceleration = Vector(Rotation) * AccelSpeed;
			}
		}		
	}
	else
	{
		V = LastLoc - Location;
		X = Normal(Velocity);
		Y = Normal(V Cross Velocity);
		Z = Normal(X Cross Y);
		AxisDir = OrthoRotation(X, Y, Z);
		TurnNeeded = Acos(Normal(V) Dot Normal(Velocity)) * (float(32768) / 3.1415930);
		R.Pitch = int(FMin(TurnRate * dt, TurnNeeded));
		GetAxes(R, X, Y, Z);
		X = X >> AxisDir;
		Y = Y >> AxisDir;
		Z = Z >> AxisDir;
		R = OrthoRotation(X, Y, Z);
		Velocity = Normal(Vector(R)) * Speed;
		// End:0x2D5
		if(((Normal(Velocity) Dot Normal(V)) > 0.6000000) && VSize(V) < (Speed * 0.1000000))
		{
			bSeeking = false;
		}
	}
	//return;	
}

simulated event Timer()
{
	SetPhysics(2);
	//return;	
}

simulated event Landed(Vector HitNormal)
{
	HitWall(HitNormal, Level);
	//return;	
}

defaultproperties
{
	TurnRate=32768.0000000
	RollRange=192000
	ScrewRadius=3.0000000
	DudChance=0.0200000
	SideWinderChance=0.0500000
	MaxStrafeSpeed=32.0000000
	WeaponClass=Class'BWBP_OP_Pro.PD97Bloodhound'
	ImpactManager=Class'BallisticProV55.IM_MRLRocket'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	TrailClass=Class'BallisticProV55.MRLTrailEmitter'
	TrailOffset=(X=-4.0000000,Y=0.0000000,Z=0.0000000)
	MyRadiusDamageType=Class'BWBP_OP_Pro.DT_PD97RocketRadius'
	MyDamageType=Class'BWBP_OP_Pro.DT_PD97Rocket'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.MRL.MRLRocket'
	bNetTemporary=false
	bUpdateSimulatedPosition=true
	AmbientSound=Sound'BW_Core_WeaponSound.MRL.MRL-RocketFly'
	SoundVolume=64
	bFixedRotationDir=true
	RotationRate=(Pitch=0,Yaw=0,Roll=32768)
}
