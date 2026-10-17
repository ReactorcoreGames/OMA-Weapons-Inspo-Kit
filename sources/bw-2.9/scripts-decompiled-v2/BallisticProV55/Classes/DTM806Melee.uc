class DTM806Melee extends DT_BWBlunt
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o was beaten like an egg by %k and %kh M806."
	DeathStrings[1]="%k used %kh M806 pistol to tenderise %o."
	DisplacementType=1
	AimDisplacementDuration=0.3000000
	DamageIdent="Melee"
	WeaponClass=Class'BallisticProV55.M806Pistol'
	DeathString="%o was beaten like an egg by %k's M806."
	FemaleSuicide="%o beat herself up with an M806."
	MaleSuicide="%o beat himself up with an M806."
	KDamageImpulse=1000.0000000
	VehicleDamageScaling=0.3000000
}
