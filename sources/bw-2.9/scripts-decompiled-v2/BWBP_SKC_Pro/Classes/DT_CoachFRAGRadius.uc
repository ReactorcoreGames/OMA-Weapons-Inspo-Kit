class DT_CoachFRAGRadius extends DT_BWExplode
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o bit the explosive end of %k's FRAG-12."
	DeathStrings[1]="%o's organs were relocated by %k's FRAG-12."
	DeathStrings[2]="%k fragged %o real good with a FRAG-12."
	DeathStrings[3]="%k's FRAG-12 reduced %o to bloody paste."
	FemaleSuicides[0]="%o's FRAG-12 rocket jump ended in disaster."
	FemaleSuicides[1]="%o forgot that FRAG-12s explode."
	FemaleSuicides[2]="%o couldn't control her Trench Gun's explosives."
	MaleSuicides[0]="%o's FRAG-12 rocket jump ended in disaster."
	MaleSuicides[1]="%o forgot that FRAG-12s explode."
	MaleSuicides[2]="%o couldn't control his Trench Gun's explosives."
	SimpleKillString="Trenchgun FRAG-12"
	InvasionDamageScaling=2.0000000
	DamageIdent="Ordnance"
	WeaponClass=Class'BWBP_SKC_Pro.CoachGun'
	DeathString="%k fragged %o real good with a FRAG-12."
	FemaleSuicide="%o forgot that FRAG-12s explode."
	MaleSuicide="%o forgot that FRAG-12s explode."
	bDelayedDamage=true
}
