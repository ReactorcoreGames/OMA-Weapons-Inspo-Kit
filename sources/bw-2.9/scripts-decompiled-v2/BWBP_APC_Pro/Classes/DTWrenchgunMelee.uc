class DTWrenchgunMelee extends DT_BWBlunt
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k wrench-pummeled %o with %kh wrenchgun wrench bayonet."
	DeathStrings[1]="%o was wrenched down by %k's wrenchgun wrench."
	DeathStrings[2]="%k's wrenchgun wrenched a couple of %o's ribs."
	AimDisplacementDamageThreshold=60
	AimDisplacementDuration=1.7000000
	DamageIdent="Melee"
	WeaponClass=Class'BWBP_APC_Pro.Wrenchgun'
	DeathString="%k wrench-pummeled %o with %kh wrenchgun wrench bayonet."
	FemaleSuicide="%o bashed herself with the wrenchgun."
	MaleSuicide="%o headbutted his wrenchgun."
	bExtraMomentumZ=true
}
