class DTM290ShotgunHead extends DT_BWShell
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k uncorked %o with the M290."
	DeathStrings[1]="%o lost %vh head in an M290 brawl with %k."
	DeathStrings[2]="%k popped %o's melon with %kh M290."
	bHeaddie=true
	InvasionDamageScaling=2.0000000
	DamageIdent="Shotgun"
	WeaponClass=Class'BallisticProV55.M290Shotgun'
	DeathString="%k uncorked %o with the M290."
	FemaleSuicide="%o nailed herself with the M290."
	MaleSuicide="%o nailed himself with the M290."
	bAlwaysSevers=true
	bSpecial=true
	bExtraMomentumZ=true
	GibPerterbation=0.4000000
	KDamageImpulse=10000.0000000
}
