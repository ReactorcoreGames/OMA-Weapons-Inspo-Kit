class DTA42Melee extends DT_BWBlunt
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o was beaten like an egg by %k and %kh A42."
	DeathStrings[1]="%k used %kh A42 pistol to tenderise %o."
	DisplacementType=1
	AimDisplacementDuration=0.3000000
	DamageIdent="Melee"
	WeaponClass=Class'BallisticProV55.A42SkrithPistol'
	DeathString="%o was beaten like an egg by %k's A42."
	FemaleSuicide="%o beat herself up with an A42."
	MaleSuicide="%o beat himself up with an A42."
	KDamageImpulse=1000.0000000
	VehicleDamageScaling=0.3000000
}
