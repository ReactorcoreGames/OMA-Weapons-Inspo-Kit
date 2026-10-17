class DT_CYLOFirestormShotgunHead extends DT_BWShell
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k cooked %o's head to roasted perfection."
	DeathStrings[1]="%o's face was flame broiled by %k's Firestorm."
	DeathStrings[2]="%o took %k's firestorm to the face."
	DeathStrings[3]="%k's let %kh Firestorm make a charred meal out of %o's face."
	bIgniteFires=true
	bHeaddie=true
	InvasionDamageScaling=2.0000000
	DamageIdent="Shotgun"
	WeaponClass=Class'BWBP_SKC_Pro.CYLOUAW'
	DeathString="%k uncorked %o with the CYLO."
	FemaleSuicide="%o nailed herself with the CYLO."
	MaleSuicide="%o nailed himself with the CYLO."
	bAlwaysSevers=true
	bSpecial=true
	bExtraMomentumZ=true
	GibPerterbation=0.4000000
	KDamageImpulse=10000.0000000
}
