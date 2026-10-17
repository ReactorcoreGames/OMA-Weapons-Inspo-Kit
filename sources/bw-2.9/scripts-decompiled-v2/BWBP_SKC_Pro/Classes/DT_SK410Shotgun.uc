class DT_SK410Shotgun extends DT_BWBullet
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o only wishes that %k's SK-410 was capable of jamming."
	DeathStrings[1]="%k 8-Gauge SK-410 exiled pieces of %o."
	DeathStrings[2]="%k's SK-410 blasted %o out of the Eastern Bloc."
	DeathStrings[3]="%k gave %o an iron curtain of explosive shotgun shells."
	DeathStrings[4]="%k redistributed %kh wealth of HE shotshells to %o."
	bIgniteFires=true
	InvasionDamageScaling=2.0000000
	DamageIdent="Shotgun"
	DamageDescription=",Bullet,Flame,"
	WeaponClass=Class'BWBP_SKC_Pro.SK410Shotgun'
	DeathString="%o's only wishes that %k's SK-410 was capable of jamming."
	FemaleSuicide="%o amputated a foot with the SK410"
	MaleSuicide="%o removed some toes with his SK410."
	bFastInstantHit=true
	bExtraMomentumZ=true
	GibPerterbation=2.0000000
	KDamageImpulse=3000.0000000
	VehicleDamageScaling=0.6000000
}
