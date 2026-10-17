class DTMD24PistolHead extends DT_BWBullet
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o's head was whisked away by %k's MD24 round."
	DeathStrings[1]="%k whipped %o's head off with %kh MD24 pistol."
	DeathStrings[2]="%k's MD24 round cleared away %o's cranium."
	bHeaddie=true
	DamageIdent="Pistol"
	WeaponClass=Class'BallisticProV55.MD24Pistol'
	DeathString="%o's head was whisked away by %k's MD24 round."
	FemaleSuicide="%o blew her ugly face off with an MD24."
	MaleSuicide="%o blew his ugly face off with an MD24."
	bAlwaysSevers=true
	bSpecial=true
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.BulletImpacts.Headshot'
	VehicleDamageScaling=0.0000000
}
