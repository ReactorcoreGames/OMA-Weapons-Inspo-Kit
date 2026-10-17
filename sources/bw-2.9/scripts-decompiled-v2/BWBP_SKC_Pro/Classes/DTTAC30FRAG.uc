class DTTAC30FRAG extends DT_BWExplode
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k launched a FRAG-12 at hapless %o ."
	DeathStrings[1]="%o was the lucky recipient of %k's FRAG-12."
	DeathStrings[2]="%k's FRAG-12 whizzed right into %o's face."
	SimpleKillString="TAC-30 FRAG-12"
	DisplacementType=1
	AimDisplacementDuration=0.4000000
	InvasionDamageScaling=2.0000000
	DamageIdent="Ordnance"
	WeaponClass=Class'BWBP_SKC_Pro.TAC30Cannon'
	DeathString="%o was the lucky recipient of %k's FRAG-12."
	FemaleSuicide="%o launched a FRAG-12 and ran screaming after it."
	MaleSuicide="%o ran screaming into the path of his own FRAG-12."
	bDelayedDamage=true
}
