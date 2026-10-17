class DTM290Shotgun extends DT_BWShell
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k blasted two pounds of lead into %o with the M290."
	DeathStrings[1]="%o was blown into a ball by %k's M290."
	DeathStrings[2]="%o was atoned by %k's double barreled shotgun."
	InvasionDamageScaling=2.0000000
	DamageIdent="Shotgun"
	WeaponClass=Class'BallisticProV55.M290Shotgun'
	DeathString="%k blasted two pounds of lead into %o with the M290."
	FemaleSuicide="%o nailed herself with the M290."
	MaleSuicide="%o nailed himself with the M290."
	GibPerterbation=0.4000000
	KDamageImpulse=15000.0000000
	VehicleDamageScaling=0.5000000
}
