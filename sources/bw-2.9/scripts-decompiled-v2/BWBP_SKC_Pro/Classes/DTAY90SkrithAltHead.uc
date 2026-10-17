class DTAY90SkrithAltHead extends DT_BWMiscDamage
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k decapitated and cauterized %o's neck stump."
	DeathStrings[1]="%o's head was bifurcated by %k's Vulture."
	DeathStrings[2]="%k's Vulture annihilated %o's face into something unrecognizable."
	DeathStrings[3]="%o couldn't eat all of %k's Plasma spread, it was too spicy."
	BloodManagerName="BWBP_SKC_Pro.BloodMan_A73B"
	bIgniteFires=true
	DamageDescription=",Flame,Plasma,"
	WeaponClass=Class'BWBP_SKC_Pro.AY90SkrithBoltcaster'
	DeathString="%k burned through %o's scalp with the AY90."
	FemaleSuicide="%o's AY90 turned on her."
	MaleSuicide="%o's AY90 turned on him."
	bAlwaysSevers=true
	bSpecial=true
	GibPerterbation=0.2000000
	KDamageImpulse=1000.0000000
}
