class DTRS04Bonk extends DT_BWBlade
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k bonked %o with an RS04."
	DeathStrings[1]="%o got the bonk from %k's RS04."
	DeathStrings[2]="%k slapped %o with an RS04."
	AimDisplacementDamageThreshold=25
	DamageIdent="Melee"
	WeaponClass=Class'BWBP_SKC_Pro.RS04Pistol'
	DeathString="%k bonked %o with an RS04."
	FemaleSuicide="%o committed self-bonk."
	MaleSuicide="%o committed self-bonk."
	KDamageImpulse=1000.0000000
}
