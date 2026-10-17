class DT_RCS715Immolation extends DT_BWFire
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o was set ablaze by %k's RCS-715 grenade."
	DeathStrings[1]="%o was immolated by %k's RCS-715 grenade."
	DeathStrings[2]="%k demonstrated their firebending skills on %o with their RCS-715 grenade."
	SimpleKillString="RCS-715 Grenade Immolation"
	bIgnoredOnLifts=true
	InvasionDamageScaling=2.0000000
	DamageIdent="Grenade"
	WeaponClass=Class'BWBP_OP_Pro.RCS715Shotgun'
	DeathString="%o was set ablaze by %k's RCS-715 grenade."
	FemaleSuicide="%o ran around like a maniac in a ball of fire."
	MaleSuicide="%o ran around like a maniac in a ball of fire."
	bSkeletize=true
	bDelayedDamage=true
	GibPerterbation=0.1000000
	KDamageImpulse=200.0000000
}
