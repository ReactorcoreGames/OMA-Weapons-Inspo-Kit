class DTSRACFRAG extends DT_BWExplode
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k's SRAC terminated %o with extreme prejudice."
	DeathStrings[1]="%o erroneously stepped in front of %k's SRAC."
	DeathStrings[2]="%k's SRAC blasted an explosive round into %o."
	DeathStrings[3]="%o was pulverized by %k's explosive barrage."
	SimpleKillString="SKAS FRAG-12"
	DisplacementType=1
	AimDisplacementDuration=0.4000000
	InvasionDamageScaling=2.0000000
	DamageIdent="Ordnance"
	WeaponClass=Class'BWBP_SKC_Pro.SKASShotgun'
	DeathString="%k's SRAC terminated %o with extreme prejudice."
	FemaleSuicide="%o launched a FRAG-12 and ran screaming after it."
	MaleSuicide="%o ran screaming into the path of his own FRAG-12."
	bDelayedDamage=true
	VehicleDamageScaling=0.9000000
}
