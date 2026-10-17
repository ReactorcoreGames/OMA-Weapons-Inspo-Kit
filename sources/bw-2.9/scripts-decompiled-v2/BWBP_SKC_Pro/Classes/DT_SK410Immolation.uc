class DT_SK410Immolation extends DT_BWFire
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o was immolated by %k."
	DeathStrings[1]="%k's incineration finally overcame %o."
	DeathStrings[2]="%o ran around sizzling and popping as %k set %vm alight."
	DeathStrings[3]="%k coated %o with flaming gas."
	SimpleKillString="SK-410 Immolation"
	FlashThreshold=0
	FlashV=(X=750.0000000,Y=250.0000000,Z=0.0000000)
	FlashF=-0.0500000
	InvasionDamageScaling=2.0000000
	DamageIdent="Shotgun"
	WeaponClass=Class'BWBP_SKC_Pro.SK410Shotgun'
	DeathString="%o was immolated by %k."
	FemaleSuicide="%o immolated herself."
	MaleSuicide="%o immolated himself."
	bDelayedDamage=true
	GibPerterbation=0.1000000
	KDamageImpulse=200.0000000
	VehicleDamageScaling=0.5000000
}
