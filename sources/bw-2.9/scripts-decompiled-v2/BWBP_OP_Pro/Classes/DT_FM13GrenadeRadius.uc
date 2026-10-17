class DT_FM13GrenadeRadius extends DT_BWExplode
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o couldn't escape %k's explosive FM13 slug."
	DeathStrings[1]="%k's HE slug took chunks out of %o."
	DeathStrings[2]="%o realized %k's FM13 slugs explode."
	SimpleKillString="FM13 HE Slug"
	InvasionDamageScaling=2.0000000
	WeaponClass=Class'BWBP_OP_Pro.FM13Shotgun'
	DeathString="%o couldn't escape %k's explosive FM13 slug."
	FemaleSuicide="%o found out her FM13 slugs explode."
	MaleSuicide="%o found out his FM13 slugs explode."
	bDelayedDamage=true
}
