class DTGRS9Laser extends DT_BWMiscDamage
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o discovered %k's flailing GRS-9 laser."
	DeathStrings[1]="%k intensified %o to a crisp."
	DeathStrings[2]="%o flailed and thrashed through %k's death beam."
	DeathStrings[3]="%k cross-examined %o with %kh GRS-9 laser."
	SimpleKillString="GRS-9 Laser"
	BloodManagerName="BallisticProV55.BloodMan_GRS9Laser"
	bIgniteFires=true
	DamageIdent="Sidearm"
	DamageDescription=",Laser,"
	WeaponClass=Class'BallisticProV55.GRS9Pistol'
	DeathString="%o discovered %k's flailing GRS-9 laser."
	FemaleSuicide="%o tripped and thrashed through her own death beam."
	MaleSuicide="%o tripped and thrashed through his own death beam."
	bInstantHit=true
	GibModifier=4.0000000
	GibPerterbation=0.2000000
	KDamageImpulse=1000.0000000
	VehicleDamageScaling=0.2000000
}
