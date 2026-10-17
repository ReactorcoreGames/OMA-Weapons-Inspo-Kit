class DT_LightningProjectile extends DT_BWMiscDamage
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o was fried by %k's lightning projectile."
	DeathStrings[1]="%o felt the shock from %k's lightning projectile."
	DeathStrings[2]="%k's lightning projectile broke every bone in %o's body."
	SimpleKillString="ARC-79 Lightning Projectile"
	DisplacementType=1
	AimDisplacementDamageThreshold=50
	AimDisplacementDuration=0.4000000
	InvasionDamageScaling=2.0000000
	DamageIdent="Energy"
	WeaponClass=Class'BWBP_OP_Pro.LightningRifle'
	DeathString="%o was fried by %k's lightning projectile."
	FemaleSuicide="%o was fried by her own lightning projectile."
	MaleSuicide="%o was fried by his own lightning projectile."
	bLocationalHit=false
	DamageOverlayMaterial=Shader'XGameShaders.PlayerShaders.LightningHit'
	DamageOverlayTime=0.9000000
	VehicleDamageScaling=3.0000000
	VehicleMomentumScaling=0.3000000
}
