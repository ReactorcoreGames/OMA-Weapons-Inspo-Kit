class DTA73SkrithHead extends DT_BWMiscDamage
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k seared %o's head off with A73 bolts."
	DeathStrings[1]="%k's Skrith bolts lanced through %o's face."
	DeathStrings[2]="%o's head was fried by %k's searing blue death."
	DeathStrings[3]="%o chowed down on %k's energy blast."
	DeathStrings[4]="%k's A73 bolt rendered %o's head a fading memory."
	BloodManagerName="BallisticProV55.BloodMan_A73Burn"
	bIgniteFires=true
	bHeaddie=true
	InvasionDamageScaling=1.5000000
	DamageIdent="Energy"
	DamageDescription=",Plasma,"
	WeaponClass=Class'BallisticProV55.A73SkrithRifle'
	DeathString="%k's Skrith bolts lanced through %o's face."
	FemaleSuicide="%o's A73 turned on her."
	MaleSuicide="%o's A73 turned on him."
	bAlwaysSevers=true
	bSpecial=true
	GibPerterbation=0.2000000
	KDamageImpulse=1000.0000000
}
