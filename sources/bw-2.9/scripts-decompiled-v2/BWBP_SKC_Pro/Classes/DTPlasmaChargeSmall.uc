class DTPlasmaChargeSmall extends DT_BWMiscDamage
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k turned %o into Swiss cheese with plasma."
	DeathStrings[1]="%o accepted %k's offering of plasma."
	DeathStrings[2]="%k turned %kh H-VPC on %o."
	DeathStrings[3]="%k's H-VPC gave %o a lethal dose."
	BloodManagerName="BloodMan_HVPC"
	bOnlySeverLimbs=true
	bIgniteFires=true
	DamageIdent="Streak"
	DamageDescription=",Plasma,"
	WeaponClass=Class'BWBP_SKC_Pro.HVPCMk5PlasmaCannon'
	DeathString="%k turned %o into Swiss cheese with plasma."
	FemaleSuicide="%o shot off her toes."
	MaleSuicide="%o shot off his toes."
	bFlaming=true
	GibModifier=2.0000000
	GibPerterbation=0.2000000
	KDamageImpulse=1000.0000000
	VehicleDamageScaling=0.5000000
	VehicleMomentumScaling=0.7500000
}
