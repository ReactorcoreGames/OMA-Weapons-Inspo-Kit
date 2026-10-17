class DTM763ShotgunHead extends DT_BWShell
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k uncorked %o with the M763."
	DeathStrings[1]="%o's head was blasted clean off by %k's M763."
	DeathStrings[2]="%k obliterated %o's head with %kh M763."
	DeathStrings[3]="%k's Avenger blast purged %o's face from the battlefield."
	bHeaddie=true
	InvasionDamageScaling=2.0000000
	DamageIdent="Shotgun"
	WeaponClass=Class'BallisticProV55.M763Shotgun'
	DeathString="%k uncorked %o with the M763."
	FemaleSuicide="%o nailed herself with the M763."
	MaleSuicide="%o nailed himself with the M763."
	bAlwaysSevers=true
	bSpecial=true
	bExtraMomentumZ=true
	GibPerterbation=0.4000000
	KDamageImpulse=10000.0000000
}
