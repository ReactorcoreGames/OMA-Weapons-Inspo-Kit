class DTPlasmaCharge extends DT_BWMiscDamage
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k burned %o a new one with the H-VPC."
	DeathStrings[1]="%o was atomized in a big ball of %k's plasma."
	DeathStrings[2]="%o felt the fury of %k's H-VPC."
	DeathStrings[3]="%k's H-VPC likes %kh %o extra crispy."
	BloodManagerName="BloodMan_HVPC"
	bIgniteFires=true
	DamageIdent="Streak"
	DamageDescription=",Plasma,"
	WeaponClass=Class'BWBP_SKC_Pro.HVPCMk5PlasmaCannon'
	DeathString="%k burned %o a new one with the H-VPC."
	FemaleSuicide="%o valiantly attacked a wall and died for it."
	MaleSuicide="%o valiantly attacked a wall and died for it."
	bFlaming=true
	GibModifier=2.0000000
	GibPerterbation=0.2000000
	KDamageImpulse=1000.0000000
	VehicleDamageScaling=0.6500000
	VehicleMomentumScaling=0.7500000
}
