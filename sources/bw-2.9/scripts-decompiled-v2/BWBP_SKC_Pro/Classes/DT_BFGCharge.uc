class DT_BFGCharge extends DT_BWMiscDamage
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k destroyed %o with a giant green ball of death."
	DeathStrings[1]="%o was annihilated in a big ball of %k's plasma."
	DeathStrings[2]="%o exploded at the sight of %k's E-V HPC."
	DeathStrings[3]="%k's E-V HPC pasted %o all over the walls."
	BloodManagerName="BloodMan_HVPC"
	bIgniteFires=true
	InvasionDamageScaling=2.5000000
	DamageDescription=",Plasma,"
	WeaponClass=Class'BWBP_SKC_Pro.HVPCMk66PlasmaCannon'
	DeathString="%k destroyed %o with a giant green ball of death."
	FemaleSuicide="%o ANNIHILATED herself."
	MaleSuicide="%o OBLITERATED himself."
	bFlaming=true
	GibModifier=3.0000000
	GibPerterbation=0.5000000
	KDamageImpulse=1000.0000000
	VehicleDamageScaling=2.5000000
	VehicleMomentumScaling=1.7500000
}
