class DTRS8Pistol extends DT_BWBullet
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o was suppressed by %k's 10mm RS8."
	DeathStrings[1]="%o got clipped by %k's RS8 rounds."
	DeathStrings[2]="%k snapped a few RS8 rounds into %o."
	EffectChance=0.5000000
	TagMultiplier=0.7000000
	TagDuration=0.1000000
	DamageIdent="Pistol"
	WeaponClass=Class'BallisticProV55.RS8Pistol'
	DeathString="%o was suppressed by %k's 10mm RS8."
	FemaleSuicide="%o silenced herself."
	MaleSuicide="%o silenced himself."
	bFastInstantHit=true
	VehicleDamageScaling=0.1000000
}
