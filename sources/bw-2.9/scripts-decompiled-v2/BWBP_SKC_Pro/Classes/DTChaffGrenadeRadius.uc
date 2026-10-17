class DTChaffGrenadeRadius extends DT_BWExplode
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o unexpectedly died to %k's MOA-C chaff grenade."
	DeathStrings[1]="%k got excited and tossed a smoke grenade at %o ."
	DeathStrings[2]="%k whipped an MOA-C to the wind and smoked out %o."
	WeaponClass=Class'BWBP_SKC_Pro.ChaffGrenadeWeapon'
	DeathString="%o unexpectedly died to %k's MOA-C chaff grenade."
	FemaleSuicide="%o underestimated the strength of a smoke grenade."
	MaleSuicide="%o carelessly dropped a live grenade at his feet."
	bDelayedDamage=true
	bExtraMomentumZ=true
	VehicleDamageScaling=0.5000000
}
