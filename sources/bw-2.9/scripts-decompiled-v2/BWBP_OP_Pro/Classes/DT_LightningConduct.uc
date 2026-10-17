class DT_LightningConduct extends DT_BWMiscDamage
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o was fried by %k's lightning conduction."
	DeathStrings[1]="%o felt the shock from %k's lightning conduction."
	DeathStrings[2]="%k's lightning conduction jumped to %o's body."
	SimpleKillString="ARC-79 Lightning Conduction"
	InvasionDamageScaling=2.0000000
	DamageIdent="Energy"
	WeaponClass=Class'BWBP_OP_Pro.LightningRifle'
	DeathString="%o was fried by %k's lightning rifle conduction."
	FemaleSuicide="%o was fried by her own lightning rifle conduction."
	MaleSuicide="%o was fried by his own lightning rifle conduction."
	bLocationalHit=false
	DamageOverlayMaterial=Shader'XGameShaders.PlayerShaders.LightningHit'
	DamageOverlayTime=0.9000000
	VehicleDamageScaling=3.0000000
	VehicleMomentumScaling=0.3000000
}
