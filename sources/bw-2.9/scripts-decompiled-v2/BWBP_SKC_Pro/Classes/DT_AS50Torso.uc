class DT_AS50Torso extends DT_BWBullet
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o noticed %k's FSSG-50 scope glint a second too late."
	DeathStrings[1]="%k stopped %o's heart with an accurate FSSG-50 round."
	DeathStrings[2]="%k took %o out with a FSSG-50 round to center of mass."
	DeathStrings[3]="%k introduced %o to the business end of %kh FSSG-50."
	AimedString="Scoped"
	TagMultiplier=0.5000000
	TagDuration=0.2500000
	bIgniteFires=true
	InvasionDamageScaling=1.5000000
	DamageIdent="Sniper"
	DamageDescription=",Bullet,Flame,"
	WeaponClass=Class'BWBP_SKC_Pro.AS50Rifle'
	DeathString="%o noticed %k's FSSG-50 scope glint a second too late."
	FemaleSuicide="%o's FSSG-50 didn't like the look of its owner."
	MaleSuicide="%o's FSSG-50 didn't like the look of its owner."
	bFastInstantHit=true
	bExtraMomentumZ=true
	GibModifier=1.5000000
	GibPerterbation=0.2000000
	KDamageImpulse=3500.0000000
	VehicleDamageScaling=0.5000000
}
