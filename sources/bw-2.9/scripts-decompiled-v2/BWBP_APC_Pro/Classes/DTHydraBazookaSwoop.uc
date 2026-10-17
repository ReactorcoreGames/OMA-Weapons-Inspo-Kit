class DTHydraBazookaSwoop extends DT_BWExplode
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o was swooped off to Hell by %k's swooping rockets."
	DeathStrings[1]="%k got around some barricades to blow %o to smithereens."
	DeathStrings[2]="%o got swept off the mortal coil thanks to %k and %kh multi-purpose Hydra."
	DeathStrings[3]="%k sweeped the floor with the blood and guts of %o."
	DisplacementType=1
	AimDisplacementDamageThreshold=100
	AimDisplacementDuration=0.7000000
	InvasionDamageScaling=3.0000000
	DamageIdent="Ordnance"
	WeaponClass=Class'BWBP_APC_Pro.HydraBazooka'
	DeathString="%o was blown to pieces by %k's Hydra."
	FemaleSuicide="%o thought multiple rockets could be useful for a powerful rocket jump."
	MaleSuicide="%o thought multiple rockets could be useful for a powerful rocket jump."
	bDelayedDamage=true
	VehicleDamageScaling=1.5000000
	VehicleMomentumScaling=1.5000000
}
