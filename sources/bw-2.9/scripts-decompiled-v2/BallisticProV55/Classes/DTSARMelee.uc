class DTSARMelee extends DT_BWBlunt
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k bludgeoned %o to death in a wild frenzy with the SAR."
	DeathStrings[1]="%o was pummelled into a heap by %k with the SAR."
	DeathStrings[2]="%k beat %o to a pulp with the SAR."
	BlockFatiguePenalty=0.2500000
	DisplacementType=1
	AimDisplacementDamageThreshold=60
	DamageIdent="Melee"
	WeaponClass=Class'BallisticProV55.SARAssaultRifle'
	DeathString="%k bludgeoned %o to death in a wild frenzy with the SAR."
	FemaleSuicide="%o beat herself to death with the SAR."
	MaleSuicide="%o beat himself to death with the SAR."
}
