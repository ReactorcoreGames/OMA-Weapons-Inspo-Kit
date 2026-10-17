class DTM763Hit extends DT_BWBlunt
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k bludgeoned %o to death in a wild frenzy with the M763."
	DeathStrings[1]="%o was pummelled into a heap by %k with the M763."
	DeathStrings[2]="%k beat %o to a pulp with the M763."
	BlockFatiguePenalty=0.2500000
	DisplacementType=1
	AimDisplacementDuration=0.7500000
	DamageIdent="Melee"
	WeaponClass=Class'BallisticProV55.M763Shotgun'
	DeathString="%k bludgeoned %o to death in a wild frenzy with the M763."
	FemaleSuicide="%o beat herself to death with the M763."
	MaleSuicide="%o beat himself to death with the M763."
}
