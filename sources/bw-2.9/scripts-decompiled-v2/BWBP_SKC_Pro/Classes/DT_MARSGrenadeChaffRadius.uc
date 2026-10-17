class DT_MARSGrenadeChaffRadius extends DT_BWExplode
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o unexpectedly died to %k's MARS chaff grenade."
	DeathStrings[1]="%k got excited and shot a smoke grenade at %o ."
	DeathStrings[2]="%k whipped a MARS grenade to the wind and smoked out %o."
	SimpleKillString="MARS Chaff Grenade Radius"
	WeaponClass=Class'BWBP_SKC_Pro.MARSAssaultRifle'
	DeathString="%o unexpectedly died to %k's MARS chaff grenade."
	FemaleSuicide="%o underestimated the strength of a smoke grenade."
	MaleSuicide="%o carelessly dropped a live grenade at his feet."
	bDelayedDamage=true
	bExtraMomentumZ=true
	VehicleDamageScaling=0.5000000
}
