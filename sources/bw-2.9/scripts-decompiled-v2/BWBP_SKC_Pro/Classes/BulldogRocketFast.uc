class BulldogRocketFast extends BallisticGrenade;

simulated function Landed(Vector HitNormal)
{
	Explode(Location, HitNormal);
	//return;	
}

defaultproperties
{
	UnarmedDetonateOn=4
	ArmedDetonateOn=1
	ArmedPlayerImpactType=1
	ReflectImpactManager=Class'BallisticProV55.IM_GunHit'
	DampenFactor=0.1500000
	DampenFactorParallel=0.3000000
	ArmingDelay=0.0100000
	ImpactDamage=125
	ImpactDamageType=Class'BWBP_SKC_Pro.DT_BulldogImpact'
	WeaponClass=Class'BWBP_SKC_Pro.BulldogAssaultCannon'
	ImpactManager=Class'BWBP_SKC_Pro.IM_BulldogFRAG'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	TrailClass=Class'BallisticProV55.MRLTrailEmitter'
	TrailOffset=(X=-14.0000000,Y=0.0000000,Z=0.0000000)
	ModeIndex=1
	MyRadiusDamageType=Class'BWBP_SKC_Pro.DTBulldogFRAGRadius'
	WallPenetrationForce=64.0000000
	Speed=23000.0000000
	MaxSpeed=23000.0000000
	Damage=110.0000000
	DamageRadius=512.0000000
	MomentumTransfer=60000.0000000
	MyDamageType=Class'BWBP_SKC_Pro.DTBulldogFRAG'
	LightType=1
	LightEffect=21
	LightHue=25
	LightSaturation=100
	LightBrightness=200.0000000
	LightRadius=15.0000000
	StaticMesh=StaticMesh'BWBP_SKC_Static.Bulldog.Frag12Proj'
	bDynamicLight=true
	AmbientSound=Sound'BW_Core_WeaponSound.G5.G5-RocketFly'
	DrawScale=2.5000000
	SoundVolume=192
	SoundRadius=128.0000000
	bIgnoreTerminalVelocity=true
	RotationRate=(Pitch=0,Yaw=0,Roll=32768)
}
