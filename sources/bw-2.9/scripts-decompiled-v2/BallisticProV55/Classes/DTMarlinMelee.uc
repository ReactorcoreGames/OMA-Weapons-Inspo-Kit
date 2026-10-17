class DTMarlinMelee extends DT_BWBlunt
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k smashed %o's chest with the back of %kh Deermaster."
	DeathStrings[1]="%o crumpled and fell before %k's Redwood rifle."
	DeathStrings[2]="%k's Deermaster stock pulverised the life out of %o."
	BlockFatiguePenalty=0.2500000
	DisplacementType=1
	AimDisplacementDamageThreshold=60
	AimDisplacementDuration=0.7500000
	DamageIdent="Melee"
	WeaponClass=Class'BallisticProV55.MarlinRifle'
	DeathString="%k smashed %o's chest with the back of %kh Deermaster."
	FemaleSuicide="%o bashed herself with a Deermaster."
	MaleSuicide="%o bashed himself with a Deermaster."
}
