class DT_CoachMelee extends DT_BWBlunt
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k pummeled %o with %kh coach gun stock."
	DeathStrings[1]="%o was beat down by %k's coach gun."
	DeathStrings[2]="%k's coach gun cracked a couple of %o's ribs."
	BlockFatiguePenalty=0.2500000
	DisplacementType=1
	AimDisplacementDamageThreshold=60
	AimDisplacementDuration=0.7500000
	DamageIdent="Melee"
	WeaponClass=Class'BWBP_SKC_Pro.CoachGun'
	DeathString="%k pummeled %o with %kh coach gun stock."
	FemaleSuicide="%o bashed herself with the coach gun."
	MaleSuicide="%o headbutted his coach gun."
	bExtraMomentumZ=true
}
