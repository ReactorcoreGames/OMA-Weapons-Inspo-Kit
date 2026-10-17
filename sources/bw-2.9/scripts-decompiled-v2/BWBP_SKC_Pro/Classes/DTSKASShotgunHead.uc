class DTSKASShotgunHead extends DT_BWShell
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k's 10-gauge street sweeper clipped off %o's head."
	DeathStrings[1]="%o's mind was blown by %k's 10-gauge rotary beast."
	DeathStrings[2]="%k executed %o with a massive 10-gauge cannon."
	bHeaddie=true
	InvasionDamageScaling=2.0000000
	DamageIdent="Shotgun"
	WeaponClass=Class'BWBP_SKC_Pro.SKASShotgun'
	DeathString="%k's 10-gauge street sweeper clipped off %o's head."
	FemaleSuicide="%o put the SKAS to her chin and shot."
	MaleSuicide="%o put a SKAS to his chin and fired."
	bAlwaysSevers=true
	bSpecial=true
	GibPerterbation=0.4000000
	KDamageImpulse=10000.0000000
}
