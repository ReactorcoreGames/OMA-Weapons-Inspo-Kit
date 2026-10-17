class DTM46Assault extends DT_BWBullet
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o was brutally gunned down by %k's M46A1 battle rifle."
	DeathStrings[1]="%o was savaged by %k's Jackal."
	DeathStrings[2]="%o got shredded by %k's M46A1 Jackal."
	DeathStrings[3]="%k pumped lead into %o with %kh M46A1."
	DamageIdent="Assault"
	WeaponClass=Class'BallisticProV55.M46AssaultRifle'
	DeathString="%o was brutally gunned down by %k's rabid M46A1 assault rifle."
	FemaleSuicide="%o's Jackal tore her to shreds."
	MaleSuicide="%o's Jackal tore him to shreds."
	bFastInstantHit=true
	GibPerterbation=0.1000000
	KDamageImpulse=3000.0000000
}
