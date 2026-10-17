class DTZ250Immolation extends DT_BWFire
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o fought valiantly, but %k's Z250 induced inferno consumed %vm all the same."
	DeathStrings[1]="%k deep fried %o in some Z250 fire, the flames overcooked %vm though."
	DeathStrings[2]="%o tried to crawl out of %k's kiddy pool of Z250 fire, no such luck."
	DeathStrings[3]="%k slow cooked %o over on an open fire."
	SimpleKillString="Z250 Burn"
	InvasionDamageScaling=1.5000000
	DamageIdent="Machinegun"
	WeaponClass=Class'BWBP_OP_Pro.Z250Minigun'
	DeathString="%o was immolated %k."
	FemaleSuicide="%o avoided the 'don't swim in your own fire' sign."
	MaleSuicide="%o avoided the 'don't swim in your own fire' sign."
	bSkeletize=true
	bDelayedDamage=true
	GibPerterbation=0.1000000
	KDamageImpulse=200.0000000
}
