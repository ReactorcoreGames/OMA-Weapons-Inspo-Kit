class DTG28Grenade extends DT_BWBlunt
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k ironically murdered %o with a health grenade."
	BloodManagerName="BallisticV21.BloodMan_BluntSmall"
	bDetonatesBombs=false
	DamageDescription=",Blunt,Hazard,"
	WeaponClass=Class'BWBP_SKC_Pro.G28Grenade'
	DeathString="%k ironically murdered %o with a health grenade."
	FemaleSuicide="%o tripped on her own med grenade."
	MaleSuicide="%o tripped on his own med grenade."
	bDelayedDamage=true
	GibPerterbation=0.5000000
	KDamageImpulse=20000.0000000
}
