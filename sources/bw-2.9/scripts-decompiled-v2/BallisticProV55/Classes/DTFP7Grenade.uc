class DTFP7Grenade extends DT_BWBlunt
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k bounced an FP7 off %o's head."
	BloodManagerName="BallisticProV55.BloodMan_BluntSmall"
	bDetonatesBombs=false
	bIgnoredOnLifts=true
	DamageIdent="Grenade"
	DamageDescription=",Blunt,Hazard,"
	WeaponClass=Class'BallisticProV55.FP7Grenade'
	DeathString="%k bounce an FP7 off %o's head."
	FemaleSuicide="%o tripped on her own FP7."
	MaleSuicide="%o tripped on his own FP7."
	bDelayedDamage=true
	GibPerterbation=0.5000000
	KDamageImpulse=20000.0000000
}
