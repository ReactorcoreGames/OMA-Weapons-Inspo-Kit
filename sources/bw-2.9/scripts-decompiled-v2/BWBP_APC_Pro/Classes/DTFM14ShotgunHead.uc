class DTFM14ShotgunHead extends DT_BWShell
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k turned %o's gray matter bait for any aviary prey to snack on."
	DeathStrings[1]="%o had %vh skull shattered into fine dust by %k's big ass shotgun."
	DeathStrings[2]="%kâ€™s gnasher lived up to the moniker by gnashing &o's visage off."
	DeathStrings[3]="%oâ€™s head will be mounted on %k's wall after getting decapped by a slug."
	bIgniteFires=true
	bHeaddie=true
	InvasionDamageScaling=2.0000000
	DamageIdent="Shotgun"
	WeaponClass=Class'BWBP_APC_Pro.FM14Shotgun'
	DeathString="%k uncorked %o with the FM13."
	FemaleSuicide="%o nailed herself with the FM13."
	MaleSuicide="%o nailed himself with the FM13."
	bAlwaysSevers=true
	bSpecial=true
	bExtraMomentumZ=true
	GibPerterbation=0.4000000
	KDamageImpulse=10000.0000000
}
