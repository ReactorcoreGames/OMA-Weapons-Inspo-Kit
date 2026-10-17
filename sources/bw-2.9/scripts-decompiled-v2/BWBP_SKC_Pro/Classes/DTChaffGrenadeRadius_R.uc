class DTChaffGrenadeRadius_R extends DT_BWExplode
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o choked on %k's chaff grenade."
	DeathStrings[1]="%k's smokescreen covered %o's death."
	DeathStrings[2]="%o got killed by %k's lil baby smoke grenade."
	WeaponClass=Class'BWBP_SKC_Pro.G51Carbine'
	DeathString="%o choked on %k's chaff grenade."
	FemaleSuicide="%o's smoke grenade hid her 'tactical' suicide."
	MaleSuicide="%o's smoke grenade hid his 'tactical' suicide."
	bDelayedDamage=true
	VehicleDamageScaling=0.1000000
}
