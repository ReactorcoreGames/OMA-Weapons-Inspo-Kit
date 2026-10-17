class FM13FlakProjectile extends BallisticProjectile;

defaultproperties
{
	WeaponClass=Class'BWBP_OP_Pro.FM13Shotgun'
	ImpactManager=Class'BWBP_SKC_Pro.IM_LonghornCluster'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	TrailClass=Class'BallisticProV55.MRLTrailEmitter'
	ModeIndex=1
	MyRadiusDamageType=Class'BWBP_OP_Pro.DT_FM13GrenadeRadius'
	ShakeRadius=0.0000000
	MotionBlurRadius=0.0000000
	MotionBlurFactor=0.0000000
	MotionBlurTime=0.0000000
	Speed=10000.0000000
	Damage=25.0000000
	DamageRadius=250.0000000
	MyDamageType=Class'BWBP_OP_Pro.DT_FM13Grenade'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.OA-SMG.OA-SMG_Dart'
	LifeSpan=1.5000000
	bIgnoreTerminalVelocity=true
}
