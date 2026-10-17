class DTHydraBazookaSeeker extends DT_BWExplode
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o ran so far away, only to be annihilated by %k's lock on rockets."
	DeathStrings[1]="%k made sure that %o couldn't escape from the cacophony of explosions."
	DeathStrings[2]="%o tried to hide, but it was fruitless as %ve were reduced to a puddle by %k's Hydra."
	DeathStrings[3]="%k's rockets tracked %o down and devastated %vm to the point of no return."
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
