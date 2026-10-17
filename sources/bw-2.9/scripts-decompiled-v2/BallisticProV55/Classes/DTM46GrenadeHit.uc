class DTM46GrenadeHit extends DT_BWBlunt
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o was approximated to death by %k's M46 grenade."
	DeathStrings[1]="%k re-evaluated %o's life with %kh sharp proximity grenade."
	DeathStrings[2]="%o dived into %k's M46 prox grenade."
	SimpleKillString="M46 Proximity Mine Impact"
	bDetonatesBombs=false
	InvasionDamageScaling=2.0000000
	DamageIdent="Grenade"
	WeaponClass=Class'BallisticProV55.M46AssaultRifle'
	DeathString="%o was approximated to death by %k's M46 grenade."
	FemaleSuicide="%o jabbed herself with her pointy proximity grenade."
	MaleSuicide="%o jabbed himself with his pointy proximity grenade."
	bDelayedDamage=true
}
