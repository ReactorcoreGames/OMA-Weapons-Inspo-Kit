class DTAS50Melee extends DT_BWBlunt
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k pummeled %o with %kh FSSG-50 stock."
	DeathStrings[1]="%o was beat down by %k's FSSG-50."
	DeathStrings[2]="%k's FSSG-50 cracked a couple of %o's ribs."
	BlockFatiguePenalty=0.2500000
	DisplacementType=1
	AimDisplacementDamageThreshold=60
	AimDisplacementDuration=0.7500000
	DamageIdent="Melee"
	WeaponClass=Class'BWBP_SKC_Pro.AS50Rifle'
	DeathString="%k pummeled %o with %kh FSSG-50 stock."
	FemaleSuicide="%o bashed herself with the FSSG-50."
	MaleSuicide="%o headbutted his FSSG-50 Machinegun."
	bExtraMomentumZ=true
}
