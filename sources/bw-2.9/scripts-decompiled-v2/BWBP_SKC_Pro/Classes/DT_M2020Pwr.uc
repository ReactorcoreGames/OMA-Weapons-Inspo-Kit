class DT_M2020Pwr extends DT_BWBullet
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k sent a superaccelerated M2020 gauss round through %o."
	DeathStrings[1]="%o was polarized by %k's heavy gauss rifle."
	DeathStrings[2]="%k hunted down %o with %kh advanced gauss gun."
	DeathStrings[3]="%o experienced the power of %k's magnetic accelerator first hand."
	ImpactManager=Class'BWBP_SKC_Pro.IM_ExpBullet'
	ShieldDamage=150
	DisplacementType=1
	AimDisplacementDamageThreshold=100
	AimDisplacementDuration=0.3000000
	InvasionDamageScaling=2.0000000
	DamageIdent="Sniper"
	WeaponClass=Class'BWBP_SKC_Pro.M2020GaussDMR'
	DeathString="%k sent a superaccelerated M2020 gauss round through %o."
	FemaleSuicide="%o polarized herself."
	MaleSuicide="%o polarized himself."
	bFastInstantHit=true
	bExtraMomentumZ=true
	GibPerterbation=0.1000000
	KDamageImpulse=3000.0000000
	VehicleDamageScaling=0.8000000
}
