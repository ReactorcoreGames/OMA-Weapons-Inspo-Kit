class DT_LightningRifle extends DT_BWMiscDamage
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o's body was fried by %k's lightning rifle."
	DeathStrings[1]="%k's lightning bolt cooked %o's carcass to a perfect temperature in an instant."
	DeathStrings[2]="%o felt the full force of a lightning strike from %k's lightning bolt."
	AimedString="Scoped"
	bSnipingDamage=true
	InvasionDamageScaling=2.0000000
	DamageIdent="Sniper"
	WeaponClass=Class'BWBP_OP_Pro.LightningRifle'
	DeathString="%o was silenced by %k's R78."
	FemaleSuicide="%o held her lightning rifle the wrong way around."
	MaleSuicide="%o held his lightning rifle the wrong way around."
	DamageOverlayMaterial=Shader'XGameShaders.PlayerShaders.LightningHit'
	DamageOverlayTime=0.5000000
	VehicleDamageScaling=0.1500000
	VehicleMomentumScaling=0.3000000
}
