class DT_M202Immolation extends DT_BWFire
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o died a horribly painful death to %k's napalm."
	DeathStrings[1]="%k toasted marshmallows over %o's firey corpse."
	DeathStrings[2]="%o collapsed screaming to %k's AT40 napalm coating."
	DeathStrings[3]="%k seared the flesh from %o's bones with a liberal coating of napalm."
	DeathStrings[4]="%k's AT40 gruesomely burned %o for %vh sins."
	FemaleSuicides[0]="%o mishandled a rocket and burst into flames."
	FemaleSuicides[1]="%o pretended to be a Buddhist monk."
	FemaleSuicides[2]="%o learned the downside of playing with Napalm."
	MaleSuicides[0]="%o spontaneously burst into flames."
	MaleSuicides[1]="%o pretended to be a Buddhist monk."
	MaleSuicides[2]="%o learned the downside of playing with Napalm."
	SimpleKillString="AT40 Immolation"
	InvasionDamageScaling=2.0000000
	DamageIdent="Killstreak"
	WeaponClass=Class'BWBP_SKC_Pro.FLASHLauncher'
	DeathString="%o was coated in %k's napalm. Mmm, smells like victory."
	FemaleSuicide="%o lit herself on fire and unsurprisingly died."
	MaleSuicide="%o lit himself on fire and unsurprisingly died."
	bSkeletize=true
	bDelayedDamage=true
	GibPerterbation=0.1000000
	KDamageImpulse=200.0000000
}
