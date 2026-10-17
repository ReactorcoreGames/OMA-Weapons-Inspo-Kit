class DTHydraBazooka extends DT_BWExplode
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o thought %ve could avoid one rocket, but %ve couldn't avoid %k's six rocket storm."
	DeathStrings[1]="%k's Multi-barreled Hydra slayed the warrior %o with an explosive barrage."
	DeathStrings[2]="%o found out that %k's launcher Hydra is versatile in exploding enemies in many ways."
	DeathStrings[3]="%k mightâ€™ve missed with one rocket, but a couple more reduced %o into a light mist."
	DeathStrings[4]="%o was the willing assistant, disappearing in a cloud because of %k's explosive magic show."
	DeathStrings[5]="%k brought down multiple rockets unto %o, who couldn't accept them all."
	DisplacementType=1
	AimDisplacementDamageThreshold=100
	AimDisplacementDuration=0.7000000
	InvasionDamageScaling=3.0000000
	DamageIdent="Ordnance"
	WeaponClass=Class'BWBP_APC_Pro.HydraBazooka'
	DeathString="%o was blown to pieces by %k's Hydra."
	FemaleSuicide="%o splattered the walls with her gibs using a Hydra."
	MaleSuicide="%o splattered the walls with his gibs using a Hydra."
	bDelayedDamage=true
	VehicleDamageScaling=1.5000000
	VehicleMomentumScaling=1.5000000
}
