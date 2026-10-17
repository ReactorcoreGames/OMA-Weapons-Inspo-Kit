class DTAmmoPack extends DT_BWBlunt
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k bounced an ammo pack off %o's head."
	BloodManagerName="BallisticProV55.BloodMan_BluntSmall"
	bDetonatesBombs=false
	DamageDescription=",Blunt,Hazard,"
	WeaponClass=Class'BWBP_OP_Pro.L8GIAmmoPack'
	DeathString="%k bounce an ammo pack off %o's head."
	FemaleSuicide="%o tripped on her own ammo pack."
	MaleSuicide="%o tripped on his own ammo pack."
	bDelayedDamage=true
	GibPerterbation=0.5000000
	KDamageImpulse=20000.0000000
}
