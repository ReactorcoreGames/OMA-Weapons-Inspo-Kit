class CX61Flechette extends BallisticProjectile;

simulated event Landed(Vector HitNormal)
{
	HitWall(HitNormal, Level);
	//return;	
}

defaultproperties
{
	WeaponClass=Class'BWBP_OP_Pro.CX61AssaultRifle'
	ImpactManager=Class'BallisticProV55.IM_XMK5Dart'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	TrailClass=Class'BallisticProV55.PineappleTrail'
	TrailOffset=(X=-4.0000000,Y=0.0000000,Z=0.0000000)
	MyRadiusDamageType=Class'BWBP_OP_Pro.DT_CX61Chest'
	AccelSpeed=1000.0000000
	Speed=10000.0000000
	MaxSpeed=20000.0000000
	Damage=85.0000000
	DamageRadius=192.0000000
	MomentumTransfer=20000.0000000
	MyDamageType=Class'BWBP_OP_Pro.DT_CX61Chest'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.MRL.MRLRocket'
	AmbientSound=Sound'BW_Core_WeaponSound.MRL.MRL-RocketFly'
	SoundVolume=64
	bFixedRotationDir=true
	RotationRate=(Pitch=0,Yaw=0,Roll=32768)
}
