class DT_LonghornBigDirect extends DT_BWExplode
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o grabbed %k's Longhorn by the horns."
	DeathStrings[1]="%o came face-to-face with %k's Longhorn."
	DeathStrings[2]="%k gored %o with %kh explosive Longhorn."
	DeathStrings[3]="%o got rammed by %k's lethal Longhorn."
	SimpleKillString="Longhorn Grenade Impact"
	DisplacementType=1
	AimDisplacementDamageThreshold=120
	AimDisplacementDuration=0.7500000
	InvasionDamageScaling=2.0000000
	DamageIdent="Ordnance"
	WeaponClass=Class'BWBP_SKC_Pro.LonghornLauncher'
	DeathString="%o grabbed %k's Longhorn by the horns."
	FemaleSuicide="%o tripped on her Longhorn charge."
	MaleSuicide="%o tripped on his Longhorn charge."
	bDelayedDamage=true
	bExtraMomentumZ=true
}
