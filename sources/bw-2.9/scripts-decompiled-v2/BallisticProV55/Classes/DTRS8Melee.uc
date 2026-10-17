class DTRS8Melee extends DT_BWBlunt
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o was beaten like an egg by %k and %kh RS8."
	DeathStrings[1]="%k used %kh RS8 pistol to tenderise %o."
	DisplacementType=1
	AimDisplacementDuration=0.3000000
	DamageIdent="Melee"
	WeaponClass=Class'BallisticProV55.RS8Pistol'
	DeathString="%o was beaten like an egg by %k's RS8."
	FemaleSuicide="%o beat herself up with an RS8."
	MaleSuicide="%o beat himself up with an RS8."
	KDamageImpulse=1000.0000000
	VehicleDamageScaling=0.3000000
}
