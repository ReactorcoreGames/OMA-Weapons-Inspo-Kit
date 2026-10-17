class DTLAW extends DT_BWExplode
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o wandered into %k's flying mini-nuke."
	DeathStrings[1]="%o unwittingly caught %k's firey mini-nuke."
	DeathStrings[2]="%k launched a mini-nuke at %o, who successfully caught it."
	SimpleKillString="LAW Rocket"
	DisplacementType=1
	AimDisplacementDuration=1.0000000
	InvasionDamageScaling=3.0000000
	DamageIdent="Killstreak"
	WeaponClass=Class'BWBP_SKC_Pro.LAWLauncher'
	DeathString="%o was disintegrated by %k's mini-nuke."
	FemaleSuicide="%o ran in front of her own mini-nuke."
	MaleSuicide="%o ran in front of his own mini-nuke."
	bAlwaysGibs=true
	bAlwaysSevers=true
	bDelayedDamage=true
	GibPerterbation=4.0000000
	VehicleDamageScaling=7.0000000
}
