class DTX3Knife extends DT_BWBlade
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k viciously shanked %o with the X3."
	DeathStrings[1]="%o was stabbed in the back by %k."
	DeathStrings[2]="%k gutted %o like a fish."
	DeathStrings[3]="%o lurched onto %k's outstretched X3."
	AimDisplacementDamageThreshold=25
	DamageIdent="Melee"
	WeaponClass=Class'BallisticProV55.X3Knife'
	DeathString="%k viciously shanked %o with the X3."
	FemaleSuicide="%o forgot how to use the handle of her X3."
	MaleSuicide="%o forgot how to use the handle of his X3."
	KDamageImpulse=1000.0000000
}
