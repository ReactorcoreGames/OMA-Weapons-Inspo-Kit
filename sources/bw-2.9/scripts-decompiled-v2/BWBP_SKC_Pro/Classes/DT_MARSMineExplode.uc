class DT_MARSMineExplode extends DT_BWExplode
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o was loitering near %k's MARS shockwave grenade."
	FemaleSuicides[0]="%o found out what happens when you stand near a dying MARS grenade."
	MaleSuicides[0]="%o found out what happens when you stand near a dying MARS grenade."
	SimpleKillString="MARS Grenade Explosion"
	DamageIdent="Assault"
	WeaponClass=Class'BWBP_SKC_Pro.MARSAssaultRifle'
	DeathString="%o was loitering near %k's MARS shockwave grenade."
	FemaleSuicide="%o found out what happens when you stand near a dying MARS grenade."
	MaleSuicide="%o found out what happens when you stand near a dying MARS grenade."
	bDelayedDamage=true
	VehicleDamageScaling=1.5000000
	VehicleMomentumScaling=0.8000000
}
