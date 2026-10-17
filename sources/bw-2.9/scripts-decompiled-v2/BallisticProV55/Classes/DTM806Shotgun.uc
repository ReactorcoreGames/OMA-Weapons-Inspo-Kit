class DTM806Shotgun extends DT_BWShell
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o didn't realize %k's M806 had a shotgun."
	DeathStrings[1]="%k finished off %o with %kh M806 underbarrel shotgun."
	DeathStrings[2]="%o was blown away by %k's M806 16 gauge."
	SimpleKillString="M806 Shotgun"
	InvasionDamageScaling=2.0000000
	DamageIdent="Shotgun"
	WeaponClass=Class'BallisticProV55.M806Pistol'
	DeathString="%o didn't realize %k's M806 had a shotgun."
	FemaleSuicide="%o perforated herself with the M806."
	MaleSuicide="%o perforated himself with the M806."
	bExtraMomentumZ=true
	GibPerterbation=0.4000000
	KDamageImpulse=15000.0000000
}
