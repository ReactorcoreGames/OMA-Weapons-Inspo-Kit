class DT_BFGChargeSmall extends DT_BWMiscDamage
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k ripped into %o with a E-V HPC plasma barrage."
	DeathStrings[1]="%o was severely burned by %k's green plasma."
	DeathStrings[2]="%k's E-V HPC melted %o during a discharge."
	DeathStrings[3]="%k's Hyper Plasma Cannon overcharged %o."
	BloodManagerName="BloodMan_HVPC"
	bOnlySeverLimbs=true
	bIgniteFires=true
	InvasionDamageScaling=1.5000000
	DamageDescription=",Plasma,"
	WeaponClass=Class'BWBP_SKC_Pro.HVPCMk66PlasmaCannon'
	DeathString="%k ripped into %o with a E-V HPC plasma barrage."
	FemaleSuicide="%o shot off her toes."
	MaleSuicide="%o shot off his toes."
	bFlaming=true
	GibModifier=2.0000000
	GibPerterbation=0.2000000
	KDamageImpulse=1000.0000000
	VehicleDamageScaling=3.0000000
	VehicleMomentumScaling=0.7500000
}
