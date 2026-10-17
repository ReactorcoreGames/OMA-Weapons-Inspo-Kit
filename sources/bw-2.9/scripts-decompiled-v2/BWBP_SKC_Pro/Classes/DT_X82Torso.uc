class DT_X82Torso extends DT_BWBullet
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k tore up %o with a .50 BMG sniper round."
	DeathStrings[1]="%o lost %vh life to %k's X-83 A1."
	DeathStrings[2]="%o was shattered by %k's .50 Cal sniper."
	AimedString="Scoped"
	DisplacementType=1
	AimDisplacementDuration=0.3000000
	TagMultiplier=0.5000000
	TagDuration=0.2500000
	bIgniteFires=true
	bSnipingDamage=true
	InvasionDamageScaling=2.0000000
	DamageIdent="Sniper"
	WeaponClass=Class'BWBP_SKC_Pro.X82Rifle'
	DeathString="%k ripped up %o with a .50 BMG sniper round."
	FemaleSuicide="%o shot herself in the foot."
	MaleSuicide="%o shot himself in the foot."
	bFastInstantHit=true
	bExtraMomentumZ=true
	GibPerterbation=0.1000000
	KDamageImpulse=30000.0000000
	VehicleDamageScaling=1.0000000
}
