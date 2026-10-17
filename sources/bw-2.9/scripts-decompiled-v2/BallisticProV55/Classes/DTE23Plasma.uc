class DTE23Plasma extends DT_BWMiscDamage
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k melted a burning hole through %o with the E-23 ViPeR."
	DeathStrings[1]="%o begged for mercy before %ve was toasted by %k's plasma."
	DeathStrings[2]="%k burnt a wormhole through %o with %kh ViPeR."
	DeathStrings[3]="%o was glazed over by %k's plasma rifle."
	BloodManagerName="BallisticProV55.BloodMan_GRS9Laser"
	bOnlySeverLimbs=true
	bIgniteFires=true
	DamageIdent="Energy"
	DamageDescription=",Plasma,"
	WeaponClass=Class'BallisticProV55.E23PlasmaRifle'
	DeathString="%k melted a burning hole through %o with the E-23 ViPeR."
	FemaleSuicide="%o's ViPeR bit her in half."
	MaleSuicide="%o's ViPeR bit him in half."
	GibModifier=2.0000000
	GibPerterbation=0.2000000
	KDamageImpulse=1000.0000000
	VehicleDamageScaling=0.6000000
}
