class DT_FG50Melee extends DT_BWBlunt
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k pummeled %o with %kh FG50 stock."
	DeathStrings[1]="%o was beat down by %k's FG50."
	DeathStrings[2]="%k's FG50 cracked a couple of %o's ribs."
	BlockFatiguePenalty=0.2500000
	DisplacementType=1
	AimDisplacementDamageThreshold=60
	AimDisplacementDuration=0.7500000
	DamageIdent="Melee"
	WeaponClass=Class'BWBP_SKC_Pro.FG50MachineGun'
	DeathString="%k pummeled %o with %kh FG50 stock."
	FemaleSuicide="%o bashed herself with the FG50."
	MaleSuicide="%o headbutted his FG50 Machinegun."
	bExtraMomentumZ=true
}
