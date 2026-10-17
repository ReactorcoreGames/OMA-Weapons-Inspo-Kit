class DTM50Assault extends DT_BWBullet
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k eliminated %o with the M50."
	DeathStrings[1]="%o was drilled by %k's M50."
	DeathStrings[2]="%k purified %o with M50 rounds."
	DamageIdent="Assault"
	WeaponClass=Class'BallisticProV55.M50AssaultRifle'
	DeathString="%k eliminated %o with the M50."
	FemaleSuicide="%o nailed herself with the M50."
	MaleSuicide="%o nailed himself with the M50."
	bFastInstantHit=true
	GibPerterbation=0.1000000
	KDamageImpulse=3000.0000000
}
