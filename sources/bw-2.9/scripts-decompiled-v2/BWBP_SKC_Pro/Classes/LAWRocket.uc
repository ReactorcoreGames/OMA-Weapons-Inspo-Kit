class LAWRocket extends BallisticProjectile;

var() Sound FlySound;
var Vector StrafeVelocity;
var float StrafeEndTime;
var int RollRange;
var int ShockRadius;
var float ScrewRadius;
var() float MaxStrafeSpeed;
var() int ImpactDamage;
var() Class<DamageType> ImpactDamageType;

simulated event PostBeginPlay()
{
	RotationRate.Roll = int(float(RollRange) * ((FRand() * float(2)) - 1.0000000));
	super.PostBeginPlay();
	// End:0x64
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
	//return;	
}

simulated event Tick(float dt)
{
	// End:0x60
	if((StrafeEndTime != float(0)) && Level.TimeSeconds >= StrafeEndTime)
	{
		StrafeEndTime = 0.0000000;
		Velocity -= StrafeVelocity;
		AccelSpeed += float(3000);
		Acceleration = Vector(Rotation) * AccelSpeed;
	}
	//return;	
}

simulated event HitWall(Vector HitNormal, Actor Wall)
{
	Explode(Location, HitNormal);
	//return;	
}

defaultproperties
{
	FlySound=Sound'BWBP_SKC_Sounds.Misc.M202-Flyby'
	RollRange=100000
	ShockRadius=2600
	ScrewRadius=14.0000000
	MaxStrafeSpeed=8.0000000
	ImpactDamage=85
	ImpactDamageType=Class'BWBP_SKC_Pro.DTLAW'
	WeaponClass=Class'BWBP_SKC_Pro.LAWLauncher'
	ImpactManager=Class'BWBP_SKC_Pro.IM_LAWSmall'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	TrailClass=Class'BWBP_SKC_Pro.LAWRocketTrail'
	TrailOffset=(X=-14.0000000,Y=0.0000000,Z=0.0000000)
	bRandomStartRotation=false
	MyRadiusDamageType=Class'BWBP_SKC_Pro.DTLAWRadius'
	bLimitMomentumZ=false
	WallPenetrationForce=512.0000000
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
	AccelSpeed=8000.0000000
	Speed=2000.0000000
	MaxSpeed=30000.0000000
	Damage=225.0000000
	DamageRadius=1536.0000000
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
