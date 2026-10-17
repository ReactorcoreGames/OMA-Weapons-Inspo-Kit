class DT_LonghornBigRadius extends DT_BWExplode
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o messed with %k's Longhorn and got fragged."
	DeathStrings[1]="%k's Longhorn reduced %o to chile con carne."
	DeathStrings[2]="%k's Longhorn blasted %o into beef jerky."
	SimpleKillString="Longhorn Grenade"
	AimDisplacementDamageThreshold=120
	AimDisplacementDuration=0.7500000
	bIgnoredOnLifts=true
	InvasionDamageScaling=2.0000000
	DamageIdent="Ordnance"
	WeaponClass=Class'BWBP_SKC_Pro.LonghornLauncher'
	DeathString="%o messed with %k's Longhorn and got fragged."
	FemaleSuicide="%o got bucked by her own Longhorn."
	MaleSuicide="%o got bucked by his own Longhorn."
	bDelayedDamage=true
	bExtraMomentumZ=true
}
