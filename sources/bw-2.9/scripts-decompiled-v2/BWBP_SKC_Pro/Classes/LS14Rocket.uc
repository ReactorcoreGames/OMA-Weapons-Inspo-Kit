class LS14Rocket extends BallisticProjectile;

simulated event Landed(Vector HitNormal)
{
	HitWall(HitNormal, Level);
	//return;	
}

defaultproperties
{
	WeaponClass=Class'BWBP_SKC_Pro.LS14Carbine'
	ImpactManager=Class'BallisticProV55.IM_MRLRocket'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	TrailClass=Class'BallisticProV55.MRLTrailEmitter'
	TrailOffset=(X=-4.0000000,Y=0.0000000,Z=0.0000000)
	bRandomStartRotation=false
	ModeIndex=1
	MyRadiusDamageType=Class'BWBP_SKC_Pro.DT_LS14RocketRadius'
	WallPenetrationForce=64.0000000
	AccelSpeed=6750.0000000
	Speed=750.0000000
	MaxSpeed=9000.0000000
	Damage=70.0000000
	DamageRadius=384.0000000
	MomentumTransfer=50000.0000000
	MyDamageType=Class'BWBP_SKC_Pro.DT_LS14Rocket'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.MRL.MRLRocket'
	AmbientSound=Sound'BW_Core_WeaponSound.MRL.MRL-RocketFly'
	SoundVolume=64
	bFixedRotationDir=true
	RotationRate=(Pitch=0,Yaw=0,Roll=32768)
}
