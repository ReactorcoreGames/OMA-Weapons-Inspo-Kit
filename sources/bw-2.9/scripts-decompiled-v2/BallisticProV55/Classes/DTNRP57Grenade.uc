class DTNRP57Grenade extends DT_BWBlunt
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k rammed a pineapple down %o's throat."
	BloodManagerName="BallisticProV55.BloodMan_BluntSmall"
	bDetonatesBombs=false
	DamageIdent="Grenade"
	DamageDescription=",Blunt,Hazard,"
	WeaponClass=Class'BallisticProV55.NRP57Grenade'
	DeathString="%k rammed a pineapple down %k's throat."
	FemaleSuicide="%o tripped on her own pineapple."
	MaleSuicide="%o tripped on his own pineapple."
	bDelayedDamage=true
	GibPerterbation=0.5000000
	KDamageImpulse=20000.0000000
}
