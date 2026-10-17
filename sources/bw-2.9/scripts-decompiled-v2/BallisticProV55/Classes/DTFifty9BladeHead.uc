class DTFifty9BladeHead extends DT_BWBlade
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k furiously hacked off %o's head with the Fifty-9."
	DeathStrings[1]="%o's head was shredded by %k's Fifty-9."
	DeathStrings[2]="%k's Fifty-9 found its way into %o's crazy cranium."
	AimDisplacementDamageThreshold=40
	bHeaddie=true
	DamageIdent="Melee"
	WeaponClass=Class'BallisticProV55.Fifty9MachinePistol'
	DeathString="%k furiously hacked off %o's head with the Fifty-9."
	FemaleSuicide="%o stabbed herself in the head with her Fifty-9."
	MaleSuicide="%o stabbed himself in the head with his Fifty-9."
	bAlwaysSevers=true
	bSpecial=true
	KDamageImpulse=1000.0000000
}
