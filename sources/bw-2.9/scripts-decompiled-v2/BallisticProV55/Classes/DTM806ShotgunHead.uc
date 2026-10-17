class DTM806ShotgunHead extends DT_BWShell
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o got a face full of buck from %k's M806 attachment."
	DeathStrings[1]="%k blew %o's face off with %kh M806 shotgun."
	DeathStrings[2]="%o got a face to face with %k's M806 shotgun."
	SimpleKillString="M806 Shotgun"
	bHeaddie=true
	InvasionDamageScaling=2.0000000
	DamageIdent="Shotgun"
	WeaponClass=Class'BallisticProV55.M806Pistol'
	DeathString="%o got a face full of buck from %k's M806 attachment."
	FemaleSuicide="%o perforated herself with the M806."
	MaleSuicide="%o perforated himself with the M806."
	bAlwaysSevers=true
	bSpecial=true
	bExtraMomentumZ=true
	GibPerterbation=0.4000000
	KDamageImpulse=10000.0000000
}
