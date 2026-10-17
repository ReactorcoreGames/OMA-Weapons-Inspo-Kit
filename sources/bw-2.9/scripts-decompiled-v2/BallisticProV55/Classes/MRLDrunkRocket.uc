class MRLDrunkRocket extends BallisticProjectile;

var Vector StrafeVelocity;
var float StrafeEndTime;
var bool bSideWinder;
var int RollRange;
var float ScrewRadius;
var bool bCrazy;
var() float DudChance;
var() float SideWinderChance;
var() float MaxStrafeSpeed;

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
		RotationRate.Roll = int(float(RollRange) * ((FRand() * float(2)) - 1.0000000));
		// End:0x181
		if(SideWinderChance >= FRand())
		{
			bSideWinder = true;
			ScrewRadius += float(Rand(int(ScrewRadius * float(3))));
		}
		AccelSpeed += float(Rand(1000));
		Speed += float(Rand(500));
		MaxSpeed += float(Rand(1000));
	}
	SetTimer(1.0000000 + (FRand() * 2.0000000), false);
	super.PostBeginPlay();
	//return;	
}

simulated event PostNetBeginPlay()
{
	local Vector X, Y, Z;

	super.PostNetBeginPlay();
	GetAxes(Rotation, X, Y, Z);
	StrafeVelocity = (Y * ((FRand() * float(2)) - float(1))) * MaxStrafeSpeed;
	Velocity += StrafeVelocity;
	StrafeEndTime = Level.TimeSeconds + (FRand() * 0.5000000);
	// End:0x85
	if(bCrazy)
	{
		Velocity += vect(0.0000000, 0.0000000, 300.0000000);
	}
	//return;	
}

simulated event Tick(float dt)
{
	local Vector X, Y, Z, ScrewCenter;
	local Rotator R;

	// End:0x1F
	if(bCrazy)
	{
		Acceleration = VSize(Acceleration) * Vector(Rotation);
	}
	// End:0xB2
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
		// End:0x112
		if((StrafeEndTime != float(0)) && Level.TimeSeconds >= StrafeEndTime)
		{
			StrafeEndTime = 0.0000000;
			Velocity -= StrafeVelocity;
			AccelSpeed += float(3000);
			Acceleration = Vector(Rotation) * AccelSpeed;
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
	RollRange=192000
	ScrewRadius=3.0000000
	DudChance=-1.0000000
	SideWinderChance=0.5000000
	MaxStrafeSpeed=32.0000000
	WeaponClass=Class'BallisticProV55.MRocketLauncher'
	ImpactManager=Class'BallisticProV55.IM_MRLRocket'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	TrailClass=Class'BallisticProV55.MRLTrailEmitter_C'
	TrailOffset=(X=-4.0000000,Y=0.0000000,Z=0.0000000)
	MyRadiusDamageType=Class'BallisticProV55.DT_MRLRadius'
	AccelSpeed=500.0000000
	Speed=1000.0000000
	MaxSpeed=5000.0000000
	Damage=30.0000000
	DamageRadius=96.0000000
	MomentumTransfer=20000.0000000
	MyDamageType=Class'BallisticProV55.DT_MRL'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.MRL.MRLRocket'
	AmbientSound=Sound'BW_Core_WeaponSound.MRL.MRL-RocketFly'
	DrawScale=0.5000000
	SoundVolume=64
	bFixedRotationDir=true
	RotationRate=(Pitch=0,Yaw=0,Roll=32768)
}
