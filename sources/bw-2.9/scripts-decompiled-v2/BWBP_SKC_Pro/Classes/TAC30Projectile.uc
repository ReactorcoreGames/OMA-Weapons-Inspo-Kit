class TAC30Projectile extends BallisticProjectile;

defaultproperties
{
	ImpactManager=Class'BWBP_SKC_Pro.IM_BulldogFRAG'
	TrailClass=Class'BWBP_SKC_Pro.TraceEmitter_Incendiary'
	MyRadiusDamageType=Class'BWBP_SKC_Pro.DTTAC30FRAGRadius'
	MotionBlurRadius=130.0000000
	AccelSpeed=50000.0000000
	Speed=8000.0000000
	MaxSpeed=10000.0000000
	Damage=110.0000000
	DamageRadius=180.0000000
	MomentumTransfer=30000.0000000
	MyDamageType=Class'BWBP_SKC_Pro.DTTAC30FRAG'
	StaticMesh=StaticMesh'BWBP_SKC_Static.Bulldog.BulldogFRAG'
}
