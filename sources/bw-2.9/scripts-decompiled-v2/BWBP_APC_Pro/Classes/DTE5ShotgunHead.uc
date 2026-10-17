class DTE5ShotgunHead extends DT_BWMiscDamage
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o's head was pumped full of %k's plasma until it exploded in a ball of light."
	DeathStrings[1]="%k filled %o's head with shotgun pulses before %ve succumbed to the ASP."
	DeathStrings[2]="%o's mind was full of thoughts and dreams, now it's home to %k's plasma bolts."
	DeathStrings[3]="%k sicced %kh ASP on %o, biting %vh head off."
	BloodManagerName="BallisticProV55.BloodMan_GRS9Laser"
	bIgniteFires=true
	bHeaddie=true
	DamageIdent="Energy"
	DamageDescription=",Plasma,"
	WeaponClass=Class'BWBP_APC_Pro.E5PlasmaRifle'
	DeathString="%k left %o stumped with %kh E-5."
	FemaleSuicide="%o stumped herself with the E-5."
	MaleSuicide="%o stumped himself with the E-5."
	bAlwaysSevers=true
	bSpecial=true
	GibPerterbation=0.2000000
	KDamageImpulse=1000.0000000
}
