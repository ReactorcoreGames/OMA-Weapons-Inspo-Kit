class PKMRocket extends BallisticProjectile;

var Vector StrafeVelocity;
var float StrafeEndTime;
var bool bSideWinder;
var int RollRange;
var float ScrewRadius;
var bool bCrazy;
var() float DudChance;
var() float SideWinderChance;
var() float MaxStrafeSpeed;
var() int ImpactDamage;
var() Class<DamageType> ImpactDamageType;
//var delegate<OnDie> __OnDie__Delegate;

delegate OnDie(Actor cam)
{
	//return;	
}

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
	OnDie(self);
	super.Explode(HitLocation, HitNormal);
	//return;	
}

simulated event PostBeginPlay()
{
	local Rotator R;

	// End:0x130
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
	RollRange=100000
	ScrewRadius=8.0000000
	DudChance=0.0300000
	SideWinderChance=1.0000000
	MaxStrafeSpeed=8.0000000
	ImpactDamage=90
	ImpactDamageType=Class'BWBP_APC_Pro.DTPKM'
	WeaponClass=Class'BWBP_APC_Pro.PKMMachinegun'
	ImpactManager=Class'BWBP_APC_Pro.IM_PKMRocket'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	TrailClass=Class'BWBP_APC_Pro.PKMRocketTrail'
	TrailOffset=(X=-14.0000000,Y=0.0000000,Z=0.0000000)
	ModeIndex=1
	MyRadiusDamageType=Class'BWBP_APC_Pro.DTE5Plasma'
	ShakeRotMag=(X=512.0000000,Y=400.0000000,Z=256.0000000)
	ShakeRotRate=(X=3000.0000000,Y=2500.0000000,Z=3000.0000000)
	ShakeOffsetMag=(X=20.0000000,Y=30.0000000,Z=30.0000000)
	MotionBlurRadius=1024.0000000
	AccelSpeed=18000.0000000
	Speed=5000.0000000
	MaxSpeed=17500.0000000
	Damage=30.0000000
	DamageRadius=500.0000000
	MomentumTransfer=100000.0000000
	MyDamageType=Class'BWBP_APC_Pro.DTE5Plasma'
	LightType=1
	LightEffect=21
	LightHue=25
	LightSaturation=100
	LightBrightness=200.0000000
	LightRadius=15.0000000
	StaticMesh=StaticMesh'BWBP_APC_Static.PKMA.PKMARocket'
	bDynamicLight=true
	AmbientSound=Sound'BWBP_APC_Sounds.rpk940.RPGFly'
	DrawScale=0.5000000
	SoundVolume=192
	SoundRadius=128.0000000
	bFixedRotationDir=true
	RotationRate=(Pitch=0,Yaw=0,Roll=32768)
}
