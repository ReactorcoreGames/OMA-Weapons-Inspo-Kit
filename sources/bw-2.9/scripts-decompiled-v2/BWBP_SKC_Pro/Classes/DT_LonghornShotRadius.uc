class DT_LonghornShotRadius extends DT_BWExplode
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k peppered %o with %kh Longhorn like a bloody steak."
	DeathStrings[1]="%o  was shook up by %k's 6 bomb barrage."
	DeathStrings[2]="%k's Longhorn cluster bombs tripped up %o."
	DeathStrings[3]="%k rocked %o's world with Longhorn cluster bombs."
	SimpleKillString="Longhorn Clusters"
	InvasionDamageScaling=2.0000000
	DamageIdent="Ordnance"
	WeaponClass=Class'BWBP_SKC_Pro.LonghornLauncher'
	DeathString="%k peppered %o with %kh Longhorn like a bloody steak."
	FemaleSuicide="%o's Longhorn trampled him to the ground."
	MaleSuicide="%o's Longhorn trampled him to the ground."
	bDelayedDamage=true
}
