class DTG5Mortar extends DT_BWExplode
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o caught %k's G5 mortar."
	DeathStrings[1]="%k's G5 mortar took %o to heaven."
	DeathStrings[2]="%o took an express trip to hell thanks to %k's G5 mortar."
	SimpleKillString="G5 Bazooka Mortar"
	AimedString="Scoped"
	InvasionDamageScaling=3.0000000
	DamageIdent="Ordnance"
	WeaponClass=Class'BallisticProV55.G5Bazooka'
	DeathString="%o caught %k's G5 mortar."
	FemaleSuicide="%o caught one of her own G5 mortars."
	MaleSuicide="%o caught one of his own G5 mortars."
	bDelayedDamage=true
	GibPerterbation=0.8000000
	VehicleDamageScaling=1.5000000
	VehicleMomentumScaling=1.5000000
}
