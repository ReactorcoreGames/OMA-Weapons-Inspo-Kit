class DT_FM13ShotgunHead extends DT_BWShell
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k melted %o's helmet and head into molten slag."
	DeathStrings[1]="%o got his neck ripped out by by %k's Pitbull."
	DeathStrings[2]="%o took a whole facial of  %k's Pitbull breath shells."
	DeathStrings[3]="%k's let his Pitbull make a meal out of %o's face."
	bIgniteFires=true
	bHeaddie=true
	InvasionDamageScaling=2.0000000
	DamageIdent="Shotgun"
	WeaponClass=Class'BWBP_OP_Pro.FM13Shotgun'
	DeathString="%k uncorked %o with the FM13."
	FemaleSuicide="%o nailed herself with the FM13."
	MaleSuicide="%o nailed himself with the FM13."
	bAlwaysSevers=true
	bSpecial=true
	bExtraMomentumZ=true
	GibPerterbation=0.4000000
	KDamageImpulse=10000.0000000
}
