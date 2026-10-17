class DTG5Bazooka extends DT_BWExplode
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o was blown to pieces by %k's G5."
	DeathStrings[1]="%o caught %k's G5 rocket."
	DeathStrings[2]="%k launched %kh G5 rocket into %o's face."
	AimedString="Scoped"
	DisplacementType=1
	AimDisplacementDamageThreshold=100
	InvasionDamageScaling=3.0000000
	DamageIdent="Ordnance"
	WeaponClass=Class'BallisticProV55.G5Bazooka'
	DeathString="%o was blown to pieces by %k's G5."
	FemaleSuicide="%o splattered the walls with her gibs using a G5."
	MaleSuicide="%o splattered the walls with his gibs using a G5."
	bDelayedDamage=true
	VehicleDamageScaling=1.5000000
	VehicleMomentumScaling=1.5000000
}
