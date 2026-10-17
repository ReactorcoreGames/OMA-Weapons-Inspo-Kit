class DTMD24Melee extends DT_BWBlunt
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o was beaten like an egg by %k and %kh MD24."
	DeathStrings[1]="%k used %kh MD24 pistol to tenderise %o."
	DisplacementType=1
	AimDisplacementDuration=0.3000000
	DamageIdent="Melee"
	WeaponClass=Class'BallisticProV55.MD24Pistol'
	DeathString="%o was beaten like an egg by %k's MD24."
	FemaleSuicide="%o beat herself up with an MD24."
	MaleSuicide="%o beat himself up with an MD24."
	KDamageImpulse=1000.0000000
	VehicleDamageScaling=0.3000000
}
