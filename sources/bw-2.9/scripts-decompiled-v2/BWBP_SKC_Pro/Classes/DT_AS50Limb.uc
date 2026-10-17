class DT_AS50Limb extends DT_BWBullet
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k's FSSG-50 round ripped an arm off %o."
	DeathStrings[1]="%k missed %o's head, but %kh FSSG still got an arm."
	DeathStrings[2]="%k's FSSG-50 made %o's legs a little more stumpy."
	DeathStrings[3]="%k crippled %o with an accurate FSSG-50 shot."
	AimedString="Scoped"
	TagMultiplier=0.5000000
	TagDuration=0.2500000
	bIgniteFires=true
	InvasionDamageScaling=1.5000000
	DamageIdent="Sniper"
	DamageDescription=",Bullet,Flame,"
	WeaponClass=Class'BWBP_SKC_Pro.AS50Rifle'
	DeathString="%k's FSSG-50 round ripped an arm off %o."
	FemaleSuicide="%o did some self amputation with an FSSG-50."
	MaleSuicide="%o did some self amputation with an FSSG-50."
	bFastInstantHit=true
	bExtraMomentumZ=true
	GibModifier=1.5000000
	GibPerterbation=0.2000000
	KDamageImpulse=3500.0000000
	VehicleDamageScaling=0.5000000
}
