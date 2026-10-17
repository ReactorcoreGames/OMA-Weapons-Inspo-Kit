class DTHMCBlast extends DT_BWMiscDamage
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o was fatally shocked by %k's HMC test pulse."
	DeathStrings[1]="%k mistook %o for an HMC heat shield."
	DeathStrings[2]="%o got fried by %k's laser pulse."
	BloodManagerName="BWBP_SKC_Pro.BloodMan_HMCLaser"
	MinMotionBlurDamage=5.0000000
	MotionBlurDamageRange=20.0000000
	MotionBlurFactor=2.0000000
	ShieldDamage=3
	bIgniteFires=true
	InvasionDamageScaling=2.5000000
	DamageIdent="Energy"
	WeaponClass=Class'BWBP_SKC_Pro.HMCBeamCannon'
	DeathString="%o was fataly shocked by %k's HMC test pulse."
	FemaleSuicide="%o got clumsy with a military-grade photon cannon."
	MaleSuicide="%o got clumsy with a military-grade photon cannon."
	bInstantHit=true
	GibModifier=4.0000000
	GibPerterbation=0.2000000
	KDamageImpulse=1000.0000000
	VehicleDamageScaling=2.0000000
}
