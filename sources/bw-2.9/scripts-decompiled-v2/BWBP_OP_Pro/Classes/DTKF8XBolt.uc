class DTKF8XBolt extends DT_BWBullet
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o was assassinated from the shadows by %k's KF8X bolt."
	DeathStrings[1]="%k planted a crossbow bolt into %o."
	DeathStrings[2]="%o was discreetly decommissioned by %k's silent bolt."
	SimpleKillString="KF8X Crossbow Bolt"
	DamageIdent="Sniper"
	WeaponClass=Class'BWBP_OP_Pro.KF8XCrossbow'
	DeathString="%%o was assassinated from the shadows by %k's KF8X bolt."
	FemaleSuicide="%o dropped her own crossbow."
	MaleSuicide="%o dropped his own crossbow."
	bFastInstantHit=true
	bDelayedDamage=true
	GibPerterbation=0.1000000
	KDamageImpulse=10000.0000000
}
