class DTM763Shotgun extends DT_BWShell
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k blasted a pound of lead into %o with the M763 Avenger."
	DeathStrings[1]="%k's Avenger punctured %o with pellets."
	DeathStrings[2]="%o was blown across the map by %k's M763."
	DeathStrings[3]="%k's 12-gauge M763 flurry cast %o to the wind."
	InvasionDamageScaling=2.0000000
	DamageIdent="Shotgun"
	WeaponClass=Class'BallisticProV55.M763Shotgun'
	DeathString="%k blasted a pound of lead into %o with the M763."
	FemaleSuicide="%o nailed herself with the M763."
	MaleSuicide="%o nailed himself with the M763."
	bExtraMomentumZ=true
	GibPerterbation=0.4000000
	KDamageImpulse=25000.0000000
	VehicleMomentumScaling=0.2000000
}
