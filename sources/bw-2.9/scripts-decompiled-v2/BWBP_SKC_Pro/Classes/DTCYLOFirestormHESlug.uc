class DTCYLOFirestormHESlug extends DT_BWExplode
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o got blasted by %k's CYLO Firestorm HE shell."
	DeathStrings[1]="%o had various bits of him blown off by %k's CYLO Firestorm explosive shell."
	InvasionDamageScaling=2.0000000
	DamageIdent="Assault"
	DamageDescription=",Flame,"
	WeaponClass=Class'BWBP_SKC_Pro.CYLOUAW'
	DeathString="%o got blasted by %k's HE shell."
	FemaleSuicide="%o blasted herself with a HE shell."
	MaleSuicide="%o blasted himself with a HE shell."
	bDelayedDamage=true
	bExtraMomentumZ=true
	GibPerterbation=2.0000000
	KDamageImpulse=3000.0000000
	VehicleDamageScaling=0.6000000
}
