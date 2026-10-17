class DTRS8Stab extends DT_BWBlade
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k poked holes into %o with an X3."
	DeathStrings[1]="%o found out why %k had a knife with %kh RS8."
	DeathStrings[2]="%k tactically stabbed %o with an X3."
	DeathStrings[3]="%o didn't notice the knife under %k's RS8."
	AimDisplacementDamageThreshold=25
	DamageIdent="Melee"
	WeaponClass=Class'BallisticProV55.RS8Pistol'
	DeathString="%k poked holes into %o with an X3."
	FemaleSuicide="%o forgot how to use the handle of her X3."
	MaleSuicide="%o forgot how to use the handle of his X3."
	KDamageImpulse=1000.0000000
}
