class DTE23PlasmaHead extends DT_BWMiscDamage
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k left %o stumped with %kh E-23."
	DeathStrings[1]="%o's head was bitten off by %k's ViPeR."
	DeathStrings[2]="%k scorched and roasted %o's tiny little head with the E-23 plasma rifle."
	BloodManagerName="BallisticProV55.BloodMan_GRS9Laser"
	bIgniteFires=true
	bHeaddie=true
	DamageIdent="Energy"
	DamageDescription=",Plasma,"
	WeaponClass=Class'BallisticProV55.E23PlasmaRifle'
	DeathString="%k left %o stumped with %kh E-23."
	FemaleSuicide="%o stumped herself with the E-23."
	MaleSuicide="%o stumped himself with the E-23."
	bAlwaysSevers=true
	bSpecial=true
	GibPerterbation=0.2000000
	KDamageImpulse=1000.0000000
}
