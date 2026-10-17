class DTMRS138Shotgun extends DT_BWShell
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k fired a tenner into %o with the MRS-138."
	DeathStrings[1]="%o absorbed the random shots of %k's combat shotgun."
	DeathStrings[2]="%k blasted %o down as %ve tried to scamper away in fear."
	DeathStrings[3]="%o was disassembled by %k's MRS-138 barrage."
	InvasionDamageScaling=2.0000000
	DamageIdent="Shotgun"
	WeaponClass=Class'BallisticProV55.MRS138Shotgun'
	DeathString="%k fired a tenner into %o with the MRS-138."
	FemaleSuicide="%o fired a tenner into herself with the MRS-138."
	MaleSuicide="%o fired a tenner into himself with the MRS-138."
	bExtraMomentumZ=true
	GibPerterbation=0.4000000
	KDamageImpulse=25000.0000000
}
