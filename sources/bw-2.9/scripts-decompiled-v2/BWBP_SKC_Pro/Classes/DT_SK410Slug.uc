class DT_SK410Slug extends DT_BWExplode
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o blasted off like a rocket courtesy of %k's SK-410 slug."
	DeathStrings[1]="%o caught %k's SK-410 slug right in the chops."
	bNegatesMomentum=true
	InvasionDamageScaling=1.5000000
	DamageIdent="Shotgun"
	DamageDescription=",Bullet,Flame,"
	WeaponClass=Class'BWBP_SKC_Pro.SK410Shotgun'
	DeathString="%o blasted off like a rocket courtesy of %k's SK-410 slug."
	FemaleSuicide="%o amputated a foot with the SK410"
	MaleSuicide="%o removed some toes with his SK410."
	bDelayedDamage=true
	bExtraMomentumZ=true
	GibPerterbation=2.0000000
	KDamageImpulse=3000.0000000
	VehicleDamageScaling=0.6000000
}
