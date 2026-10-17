class DT_RCS715FragRadius extends DT_BWShell
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k blasted %o apart with an RCS barrage."
	DeathStrings[1]="%o was massacred by %k's explosive auto shotgun."
	DeathStrings[2]="%k fragged %o with %kh RCS."
	DeathStrings[3]="%k slugged %o out with %kh RCS explosive shell."
	SimpleKillString="RCS715 FRAG"
	InvasionDamageScaling=2.0000000
	DamageIdent="Ordnance, Shotgun"
	WeaponClass=Class'BWBP_OP_Pro.RCS715Shotgun'
	DeathString="%k blasted %o apart with an RCS barrage."
	FemaleSuicide="%o forgot she loaded frag rounds."
	MaleSuicide="%o forgot he loaded frag rounds."
	bDelayedDamage=true
}
