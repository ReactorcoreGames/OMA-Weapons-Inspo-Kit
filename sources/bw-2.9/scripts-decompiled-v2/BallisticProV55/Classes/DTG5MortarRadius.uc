class DTG5MortarRadius extends DT_BWExplode
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o was bombarded by %k's G5."
	DeathStrings[1]="%o flung %vs into the path of %k's G5 mortar."
	FemaleSuicides[0]="%o forgot where she left one of her mortar rockets."
	MaleSuicides[0]="%o forgot where he left one of his mortar rockets."
	AimedString="Scoped"
	InvasionDamageScaling=3.0000000
	DamageIdent="Ordnance"
	WeaponClass=Class'BallisticProV55.G5Bazooka'
	DeathString="%o was bombarded by %k's G5."
	FemaleSuicide="%o forgot where she left one of her mortar rockets."
	MaleSuicide="%o forgot where he left one of his mortar rockets."
	bDelayedDamage=true
	VehicleDamageScaling=1.5000000
	VehicleMomentumScaling=1.5000000
}
