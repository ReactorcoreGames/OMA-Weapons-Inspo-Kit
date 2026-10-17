class DTA51Grenade extends DT_BWBlunt
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k bounced an A51 off %o's head."
	BloodManagerName="BallisticProV55.BloodMan_BluntSmall"
	bDetonatesBombs=false
	DamageDescription=",Blunt,Hazard,"
	WeaponClass=Class'BWBP_SWC_Pro.A51Grenade'
	DeathString="%k bounce an A51 off %o's head."
	FemaleSuicide="%o tripped on her own A51."
	MaleSuicide="%o tripped on his own A51."
	bDelayedDamage=true
	GibPerterbation=0.5000000
	KDamageImpulse=20000.0000000
}
