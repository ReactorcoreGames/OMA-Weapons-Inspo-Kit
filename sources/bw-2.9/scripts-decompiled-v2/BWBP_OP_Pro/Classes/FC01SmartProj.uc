class FC01SmartProj extends BallisticProjectile;

var Actor Target;
var Vector LastLoc;
var() float TurnRate;
var() float ArmingDelay;
var() bool bSeeking;
var() bool bArmed;
var() float LastSendTargetTime;
var() FC01SmartGun Master;

replication
{
	// Pos:0x000
	reliable if((int(Role) == int(ROLE_Authority)) && bNetInitial)
		LastLoc, Target, 
		bArmed, bSeeking;
}

simulated function ApplyParams(ProjectileEffectParams Params)
{
	super.ApplyParams(Params);
	// End:0x24
	if(ArmingDelay > float(0))
	{
		SetTimer(ArmingDelay, false);		
	}
	else
	{
		bArmed = true;
	}
	//return;	
}

simulated event Timer()
{
	// End:0x13
	if(!bArmed)
	{
		bArmed = true;
	}
	//return;	
}

function SetSmartProjTarget(Actor targ)
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

simulated event Tick(float dt)
{
	local Vector V, X, Y, Z;
	local Rotator R, AxisDir;
	local float TurnNeeded;

	// End:0x5B
	if(int(Role) == int(ROLE_Authority))
	{
		// End:0x5B
		if(Target != none)
		{
			// End:0x53
			if(FastTrace(Location, Target.Location))
			{
				LastLoc = Target.Location;
				bSeeking = true;				
			}
			else
			{
				bSeeking = false;
			}
		}
	}
	// End:0x1D9
	if(bSeeking && bArmed)
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
		// End:0x1D9
		if(((Normal(Velocity) Dot Normal(V)) > 0.6000000) && VSize(V) < (Speed * 0.1000000))
		{
			bSeeking = false;
		}
	}
	//return;	
}

simulated event Landed(Vector HitNormal)
{
	HitWall(HitNormal, Level);
	//return;	
}

defaultproperties
{
	TurnRate=16384.0000000
	ArmingDelay=0.0500000
	WeaponClass=Class'BWBP_OP_Pro.FC01SmartGun'
	ImpactManager=Class'BallisticProV55.IM_XMK5Dart'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	TrailClass=Class'BallisticProV55.PineappleTrail'
	TrailOffset=(X=-4.0000000,Y=0.0000000,Z=0.0000000)
	MyRadiusDamageType=Class'BWBP_OP_Pro.DTFC01Bullet'
	AccelSpeed=1000.0000000
	Speed=10000.0000000
	MaxSpeed=10000.0000000
	Damage=85.0000000
	DamageRadius=192.0000000
	MomentumTransfer=20000.0000000
	MyDamageType=Class'BWBP_OP_Pro.DTFC01Bullet'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.MRL.MRLRocket'
	AmbientSound=Sound'BW_Core_WeaponSound.MRL.MRL-RocketFly'
	SoundVolume=64
	bFixedRotationDir=true
	RotationRate=(Pitch=0,Yaw=0,Roll=32768)
}
