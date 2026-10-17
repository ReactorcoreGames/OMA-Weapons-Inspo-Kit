class DT_LonghornArtilleryDirect extends DT_BWExplode
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k's random Longhorn shot landed on %o."
	DeathStrings[1]="%o was in the wrong place at the wrong time."
	InvasionDamageScaling=2.0000000
	DamageIdent="Ordnance"
	WeaponClass=Class'BWBP_SKC_Pro.LonghornLauncher'
	DeathString="%k's random Longhorn shot landed on %o."
	FemaleSuicide="%o caught her Longhorn bomb on the way down."
	MaleSuicide="%o caught his Longhorn bomb on the way down."
	bDelayedDamage=true
}
