class DTM46GrenadeStuck extends DT_BWExplode
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k's sticky M46 grenade got stuck to %o."
	DeathStrings[1]="%o became intertwined with %k's proximity grenade."
	DeathStrings[2]="%k's proximity grenade latched onto %o's flapping ear."
	SimpleKillString="M46 Proximity Mine Direct"
	bDetonatesBombs=false
	InvasionDamageScaling=2.0000000
	DamageIdent="Grenade"
	WeaponClass=Class'BallisticProV55.M46AssaultRifle'
	DeathString="%k's sticky M46 grenade got stuck to %o."
	FemaleSuicide="%o failed to remove her own M46 prox grenade from her clothes."
	MaleSuicide="%o failed to remove his own M46 prox grenade from his clothes."
	bDelayedDamage=true
}
