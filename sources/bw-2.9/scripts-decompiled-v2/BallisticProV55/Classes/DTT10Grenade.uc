class DTT10Grenade extends DT_BWBlunt
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k bounced a T10 off %o's head."
	BloodManagerName="BallisticProV55.BloodMan_BluntSmall"
	bDetonatesBombs=false
	DamageIdent="Grenade"
	DamageDescription=",Blunt,Hazard,"
	WeaponClass=Class'BallisticProV55.T10Grenade'
	DeathString="%k bounced a T10 off %o's head."
	FemaleSuicide="%o tripped on her own T10."
	MaleSuicide="%o tripped on his own T10."
	bDelayedDamage=true
	GibPerterbation=0.5000000
	KDamageImpulse=20000.0000000
}
