class MK781PulseProjectile extends BallisticProjectile;

var() Sound FlySound;
var int ImpactDamage;

simulated function InitParams()
{
	WeaponClass.default.ParamsClasses[int(Class'BCoreProV55.BallisticReplicationInfo'.default.GameStyle)].OverrideProjectileParams(self, 3);
	//return;	
}

simulated function PostBeginPlay()
{
	SetTimer(0.1500000, false);
	super.PostBeginPlay();
	// End:0x48
	if(FastTrace(Location + (Vector(Rotation) * float(3000)), Location))
	{
		PlaySound(FlySound, 3, 1.0000000,, 512.0000000,, false);
	}
	//return;	
}

simulated event Landed(Vector HitNormal)
{
	HitWall(HitNormal, none);
	//return;	
}

simulated event HitWall(Vector HitNormal, Actor Wall)
{
	Explode(Location, HitNormal);
	//return;	
}

simulated event Tick(float dt)
{
	local Rotator R;

	R.Roll = Rotation.Roll;
	SetRotation(Rotator(Velocity) + R);
	//return;	
}

simulated event Timer()
{
	SetPhysics(2);
	//return;	
}

defaultproperties
{
	ImpactDamage=100
	WeaponClass=Class'BWBP_SKC_Pro.MK781Shotgun'
	ImpactManager=Class'BWBP_SKC_Pro.IM_EMPRocketAlt'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	TrailClass=Class'Onslaught.ONSBluePlasmaSmallFireEffect'
	bRandomStartRotation=false
	ModeIndex=1
	bCheckHitSurface=true
	MyRadiusDamageType=Class'BWBP_SKC_Pro.DT_Mk781Bolt'
	ShakeRadius=1024.0000000
	MotionBlurRadius=200.0000000
	AccelSpeed=50000.0000000
	Speed=2500.0000000
	MaxSpeed=5000.0000000
	Damage=100.0000000
	DamageRadius=256.0000000
	MomentumTransfer=70000.0000000
	MyDamageType=Class'BWBP_SKC_Pro.DT_Mk781Bolt'
	LightHue=180
	LightSaturation=100
	LightBrightness=160.0000000
	LightRadius=8.0000000
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.DarkStar.DarkProjBig'
	AmbientSound=Sound'WeaponSounds.ShockRifle.ShockRifleProjectile'
	LifeSpan=16.0000000
	Skins[0]=FinalBlend'BWBP_SKC_Tex.LS14.EMPProjFB'
	Skins[1]=FinalBlend'BWBP_SKC_Tex.LS14.EMPProjFB'
	Style=6
	SoundVolume=255
	SoundRadius=75.0000000
	bFixedRotationDir=true
	RotationRate=(Pitch=0,Yaw=0,Roll=32768)
}
