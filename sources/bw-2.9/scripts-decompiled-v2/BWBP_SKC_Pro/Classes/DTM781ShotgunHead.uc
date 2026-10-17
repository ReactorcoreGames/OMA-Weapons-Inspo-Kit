class DTM781ShotgunHead extends DT_BWShell
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k's Mk.781 filled %o's face with steel darts."
	DeathStrings[1]="%o got a face full of flechettes from %k's Mk.781."
	DeathStrings[2]="%k gave %o several new piercings with %kh Mk.781 darts."
	bHeaddie=true
	InvasionDamageScaling=1.5000000
	DamageIdent="Shotgun"
	WeaponClass=Class'BWBP_SKC_Pro.MK781Shotgun'
	DeathString="%k's Mk.781 filled %o's face with steel darts."
	FemaleSuicide="%o nailed herself with the M781."
	MaleSuicide="%o nailed himself with the M781."
	bSpecial=true
	GibPerterbation=0.4000000
	KDamageImpulse=10000.0000000
}
