class DTGRS9Melee extends DT_BWBlunt
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o got a good pistol whipping from %k and %kh GRS9."
	DeathStrings[1]="%k used %kh GRS9 pistol to pacify %o."
	DisplacementType=1
	AimDisplacementDuration=0.3000000
	DamageIdent="Melee"
	WeaponClass=Class'BallisticProV55.GRS9Pistol'
	DeathString="%o got a good pistol whipping from %k and %kh GRS9."
	FemaleSuicide="%o beat herself up with an GRS9."
	MaleSuicide="%o beat himself up with an GRS9."
	KDamageImpulse=1000.0000000
	VehicleDamageScaling=0.3000000
}
