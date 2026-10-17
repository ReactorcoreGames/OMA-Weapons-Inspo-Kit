class DTZ250Grenade extends DT_BWExplode
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="It's not the flames that killed %o, but %k's gas grenade."
	DeathStrings[1]="%k managed to bonk %o in the head with a gas grenade, somehow that killed %vm."
	SimpleKillString="Z250 Grenade"
	InvasionDamageScaling=2.0000000
	DamageIdent="Grenade"
	WeaponClass=Class'BWBP_OP_Pro.Z250Minigun'
	DeathString="%o was tagged by %k's M900 Gas grenade."
	FemaleSuicide="%o tagged herself with her own grenade."
	MaleSuicide="%o tagged himself with his own grenade."
	bDelayedDamage=true
}
