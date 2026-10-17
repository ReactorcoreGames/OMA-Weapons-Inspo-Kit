class DTRS8PistolHead extends DT_BWBullet
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k shut down %o's head with %kh RS8."
	DeathStrings[1]="%o found %vh head being obliterated by %k's 10mm RS8."
	DeathStrings[2]="%o's head was assassinated off by %k's RS8."
	EffectChance=0.5000000
	bHeaddie=true
	DamageIdent="Pistol"
	WeaponClass=Class'BallisticProV55.RS8Pistol'
	DeathString="%k shut down %o's head with %kh RS8."
	FemaleSuicide="%o silenced herself."
	MaleSuicide="%o silenced himself."
	bFastInstantHit=true
	bAlwaysSevers=true
	bSpecial=true
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.BulletImpacts.Headshot'
	VehicleDamageScaling=0.0000000
}
