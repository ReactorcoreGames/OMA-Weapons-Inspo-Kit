class DTLAWMineDet extends DT_BWExplode
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o happily sat on %k's idle LAW rocket."
	DeathStrings[1]="%o thought %k's idle LAW rocket was a dud."
	DeathStrings[2]="%k's LAW missile took %o out with its dying pulse."
	FemaleSuicides[0]="%o couldn't part ways with her dying LAW rocket."
	FemaleSuicides[1]="%o stupidly stood on her dying LAW rocket."
	MaleSuicides[0]="%o couldn't part ways with his dying LAW rocket."
	MaleSuicides[1]="%o stupidly stood on his dying LAW rocket."
	SimpleKillString="LAW Mine Explosion"
	InvasionDamageScaling=3.0000000
	DamageIdent="Killstreak"
	WeaponClass=Class'BWBP_SKC_Pro.LAWLauncher'
	DeathString="%o happily sat on %k's idle LAW rocket."
	FemaleSuicide="%o couldn't part ways with her dying LAW rocket."
	MaleSuicide="%o couldn't part ways with his dying LAW rocket."
	bDelayedDamage=true
	VehicleDamageScaling=1.9000000
	VehicleMomentumScaling=0.8000000
}
