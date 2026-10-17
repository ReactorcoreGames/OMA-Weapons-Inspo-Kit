class CX85Flechette extends BallisticProjectile;

var Actor Target;
var Vector LastLoc;
var() float TurnRate;
var() float ArmingDelay;
var() bool bSeeking;
var() bool bArmed;
var() float LastSendTargetTime;
var() CX85AssaultWeapon Master;

replication
{
	// Pos:0x000
	reliable if((int(Role) == int(ROLE_Authority)) && bNetInitial)
		ArmingDelay, LastLoc, 
		Target, TurnRate;
}

simulated function ApplyParams(ProjectileEffectParams Params)
{
	super.ApplyParams(Params);
	// End:0x64
	if((Master != none) && Master.StuckDarts.Length != 0)
	{
		TurnRate *= float(Master.StuckDarts.Length);
		ArmingDelay -= (float(Master.StuckDarts.Length) * 0.0250000);
	}
	// End:0x7D
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

function SetFlechetteTarget(Actor targ)
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

function SetFlechetteDestination()
{
	// End:0x56
	if((Master != none) && Master.StuckDarts.Length != 0)
	{
		LastLoc = Master.GetFlechetteTarget();
		// End:0x56
		if(LastLoc != vect(0.0000000, 0.0000000, 0.0000000))
		{
			bSeeking = true;
		}
	}
	//return;	
}

simulated event Tick(float dt)
{
	local Vector V, X, Y, Z;
	local Rotator R, AxisDir;
	local float TurnNeeded;

	// End:0x4B
	if((int(Role) == int(ROLE_Authority)) && (Level.TimeSeconds - LastSendTargetTime) > 0.0400000)
	{
		LastSendTargetTime = Level.TimeSeconds;
		SetFlechetteDestination();
	}
	// End:0x1C9
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
		// End:0x1C9
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
	TurnRate=8192.0000000
	ArmingDelay=0.1250000
	WeaponClass=Class'BWBP_OP_Pro.CX85AssaultWeapon'
	ImpactManager=Class'BallisticProV55.IM_XMK5Dart'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	TrailClass=Class'BallisticProV55.PineappleTrail'
	TrailOffset=(X=-4.0000000,Y=0.0000000,Z=0.0000000)
	MyRadiusDamageType=Class'BWBP_OP_Pro.DTCX85Bullet'
	AccelSpeed=1000.0000000
	Speed=10000.0000000
	MaxSpeed=10000.0000000
	Damage=85.0000000
	DamageRadius=192.0000000
	MomentumTransfer=20000.0000000
	MyDamageType=Class'BWBP_OP_Pro.DTCX85Bullet'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.MRL.MRLRocket'
	AmbientSound=Sound'BW_Core_WeaponSound.MRL.MRL-RocketFly'
	SoundVolume=64
	bFixedRotationDir=true
	RotationRate=(Pitch=0,Yaw=0,Roll=32768)
}
