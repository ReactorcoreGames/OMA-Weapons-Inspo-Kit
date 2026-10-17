class DT_FM13Hit extends DT_BWBlunt
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k bludgeoned %o to death in a wild frenzy with the FM13."
	DeathStrings[1]="%o was pummelled into a heap by %k with the FM13."
	DeathStrings[2]="%k beat %o to a pulp with the FM13."
	BlockFatiguePenalty=0.2500000
	DisplacementType=1
	AimDisplacementDamageThreshold=60
	AimDisplacementDuration=0.6500000
	DamageIdent="Melee"
	WeaponClass=Class'BWBP_OP_Pro.FM13Shotgun'
	DeathString="%k bludgeoned %o to death in a wild frenzy with the FM13."
	FemaleSuicide="%o beat herself to death with the FM13."
	MaleSuicide="%o beat himself to death with the FM13."
}
