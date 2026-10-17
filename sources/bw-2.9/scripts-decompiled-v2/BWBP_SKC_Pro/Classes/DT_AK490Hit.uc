class DT_AK490Hit extends DT_BWBlunt
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k RAGED LIKE BEAR and beat %o's face in with an AK!"
	DeathStrings[1]="%k beat %o with %kh Wooden Stock of Killing."
	DeathStrings[2]="%o was killed by a raving %k's AK-490 stock."
	BlockFatiguePenalty=0.2500000
	DisplacementType=1
	AimDisplacementDamageThreshold=55
	AimDisplacementDuration=0.7500000
	DamageIdent="Melee"
	WeaponClass=Class'BWBP_SKC_Pro.AK490BattleRifle'
	DeathString="%k RAGED LIKE BEAR and beat %o's face in with an AK!"
	FemaleSuicide="%o beat herself to death with the AK490."
	MaleSuicide="%o beat himself to death with the AK490."
}
