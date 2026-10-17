class DTX8KnifeLaunched extends DT_BWBlade
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k's X8 Ballistic Knife reached out and touched %o."
	DeathStrings[1]="%k fired an X8 into %o's chest."
	DeathStrings[2]="%k launched an X8 Ballistic Knife into unwitting %o."
	SimpleKillString="X8 Ballistic Knife Launched"
	bCanBeBlocked=false
	WeaponClass=Class'BWBP_SKC_Pro.X8Knife'
	DeathString="%k's X8 Ballistic Knife reached out and touched %o."
	FemaleSuicide="%o shot a knife at herself."
	MaleSuicide="%o shot a knife at himself."
	bNeverSevers=true
	KDamageImpulse=1000.0000000
	VehicleDamageScaling=0.1000000
}
