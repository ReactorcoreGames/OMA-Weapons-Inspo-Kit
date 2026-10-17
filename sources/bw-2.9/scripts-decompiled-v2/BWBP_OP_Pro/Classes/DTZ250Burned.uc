class DTZ250Burned extends DT_BWFire
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k swallowed %o in a sea of fire."
	DeathStrings[1]="%o helped %k brought fire to the world by turning to ashes."
	DeathStrings[2]="%k's Z250 learned a new magic trick, cremating %o, it's super effective."
	DeathStrings[3]="%o got cooked alive by %k's Z250, perfectly well-done."
	DeathStrings[4]="%k purged %o in holy fire, for the emperor."
	SimpleKillString="Z250 Burn"
	InvasionDamageScaling=1.5000000
	DamageIdent="Machinegun"
	WeaponClass=Class'BWBP_OP_Pro.Z250Minigun'
	DeathString="%k sprayed %o with fire."
	FemaleSuicide="%o burned herself."
	MaleSuicide="%o burned himself."
	bDelayedDamage=true
	KDamageImpulse=2000.0000000
}
