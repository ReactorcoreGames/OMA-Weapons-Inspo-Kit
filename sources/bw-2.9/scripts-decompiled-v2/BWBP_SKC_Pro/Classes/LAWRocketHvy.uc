class LAWRocketHvy extends BallisticProjectile;

var() Sound FlySound;
var Vector StrafeVelocity;
var float StrafeEndTime;
var bool bSideWinder;
var int RollRange;
var int ShockRadius;
var float ScrewRadius;
var bool bCrazy;
var() float DudChance;
var() float SideWinderChance;
var() float MaxStrafeSpeed;
var() int ImpactDamage;
var() Class<DamageType> ImpactDamageType;

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
	local Actor A;

	// End:0xA9
	foreach RadiusActors(Class'Engine.Actor', A, float(ShockRadius), Location)
	{
		// End:0xA8
		if(A.bCanBeDamaged)
		{
			Class'BCoreProV55.BallisticDamageType'.static.Hurt(A, (1.0000000 - (VSize(A.Location - Location) / float(ShockRadius))) * 45.0000000, Instigator, A.Location, Normal(A.Location - Location) * float(500), Class'BWBP_SKC_Pro.DTLAWRadius');
		}		
	}	
	super.Explode(HitLocation, HitNormal);
	//return;	
}

simulated event PostBeginPlay()
{
	local Rotator R;

	SetTimer(0.1000000, false);
	// End:0x139
	if(DudChance > FRand())
	{
		bCrazy = true;
		AccelSpeed = 6000.0000000 + float(Rand(2000));
		Speed += float(Rand(1000));
		MaxSpeed = 4000.0000000 + float(Rand(2000));
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
		bSideWinder = true;
		ScrewRadius += float(Rand(int(ScrewRadius * float(3))));
		AccelSpeed += float(Rand(1000));
		Speed += float(Rand(500));
		MaxSpeed += float(Rand(1000));
	}
	SetTimer(1.0000000 + (FRand() * 2.0000000), false);
	super.PostBeginPlay();
	// End:0x201
	if(FastTrace(Location + (Vector(Rotation) * float(3000)), Location))
	{
		PlaySound(FlySound, 3, 1.0000000,, 512.0000000,, false);
	}
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

simulated event HitWall(Vector HitNormal, Actor Wall)
{
	Explode(Location, HitNormal);
	//return;	
}

simulated function ProcessTouch(Actor Other, Vector HitLocation)
{
	local Vector X;

	// End:0x3C
	if((Other == none) || !bCanHitOwner && (Other == Instigator) || Other == Owner)
	{
		return;
	}
	// End:0x94
	if(int(Role) == int(ROLE_Authority))
	{
		Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Other, float(ImpactDamage), Instigator, HitLocation, MomentumTransfer * Normal(Velocity), ImpactDamageType);
		DoDamage(Other, HitLocation);
	}
	// End:0x189
	if((CanPenetrate(Other)) && Other != HitActor)
	{
		HitActor = Other;
		X = Normal(Velocity);
		SetLocation(HitLocation + ((X * (((Other.CollisionHeight * float(2)) * X.Z) + ((Other.CollisionRadius * float(2)) * (float(1) - X.Z)))) * 1.2000000));
		// End:0x186
		if((EffectIsRelevant(Location, false)) && PenetrateManager != none)
		{
			PenetrateManager.static.StartSpawn(HitLocation, Other.Location - HitLocation, int(Other.SurfaceType), Owner, 4);
		}		
	}
	else
	{
		HitActor = Other;
		Explode(HitLocation, vect(0.0000000, 0.0000000, 1.0000000));
	}
	//return;	
}

defaultproperties
{
	FlySound=Sound'BWBP_SKC_Sounds.Misc.M202-Flyby'
	RollRange=100000
	ShockRadius=2600
	ScrewRadius=14.0000000
	DudChance=0.0100000
	SideWinderChance=1.0000000
	MaxStrafeSpeed=8.0000000
	ImpactDamage=85
	ImpactDamageType=Class'BWBP_SKC_Pro.DTLAW'
	WeaponClass=Class'BWBP_SKC_Pro.LAWLauncher'
	ImpactManager=Class'BWBP_SKC_Pro.IM_LAWSmall'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	TrailClass=Class'BWBP_SKC_Pro.LAWRocketTrail'
	TrailOffset=(X=-14.0000000,Y=0.0000000,Z=0.0000000)
	MyRadiusDamageType=Class'BWBP_SKC_Pro.DTLAWRadius'
	ShakeRadius=5536.0000000
	ShakeRotMag=(X=576.0000000,Y=450.0000000,Z=400.0000000)
	ShakeRotRate=(X=7000.0000000,Y=7000.0000000,Z=5500.0000000)
	ShakeRotTime=8.0000000
	ShakeOffsetMag=(X=40.0000000,Y=40.0000000,Z=40.0000000)
	ShakeOffsetRate=(X=650.0000000,Y=650.0000000,Z=650.0000000)
	ShakeOffsetTime=10.0000000
	MotionBlurRadius=3536.0000000
	MotionBlurFactor=6.0000000
	MotionBlurTime=2.0000000
	AccelSpeed=500.0000000
	Speed=6000.0000000
	MaxSpeed=14000.0000000
	Damage=160.0000000
	DamageRadius=1200.0000000
	MomentumTransfer=300000.0000000
	MyDamageType=Class'BWBP_SKC_Pro.DTLAW'
	LightType=1
	LightEffect=21
	LightHue=25
	LightSaturation=100
	LightBrightness=200.0000000
	LightRadius=15.0000000
	StaticMesh=StaticMesh'BWBP_SKC_Static.LAW.LAWRocket'
	bDynamicLight=true
	AmbientSound=Sound'BW_Core_WeaponSound.G5.G5-RocketFly'
	DrawScale=0.5000000
	SoundVolume=192
	SoundRadius=128.0000000
	bFixedRotationDir=true
	RotationRate=(Pitch=0,Yaw=0,Roll=32768)
}
