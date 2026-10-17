class DT_RCS715Shotgun extends DT_BWBullet
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o was tactically busted by %k's RCS-715."
	DeathStrings[1]="%k shredded %o to pieces with their RCS-715 shells."
	DeathStrings[2]="%k emptied their RCS-715 drum magazine all over %o."
	DeathStrings[3]="%o was met with a barrage of RCS-715 shotgun shells from %k."
	DeathStrings[4]="%o had their nuts busted by %k's RCS-715."
	bIgniteFires=true
	InvasionDamageScaling=2.0000000
	DamageIdent="Shotgun"
	WeaponClass=Class'BWBP_OP_Pro.RCS715Shotgun'
	DeathString="%o was tactically busted by %k's RCS-715."
	FemaleSuicide="%o pointed her RCS-715 the wrong way round."
	MaleSuicide="%o pointed his RCS-715 the wrong way round."
	bFastInstantHit=true
	bExtraMomentumZ=true
	GibPerterbation=2.0000000
	KDamageImpulse=3000.0000000
	VehicleDamageScaling=0.6000000
}
