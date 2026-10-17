class DTXMV850MGHead extends DT_BWBullet
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k's monster gun tore %o's head off."
	DeathStrings[1]="%o's head was turned to red dust by %k's minigun."
	DeathStrings[2]="%o found %vh cranium being vaporised by %k's XMV-850."
	DeathStrings[3]="%k pumped XMV-850 lead into %o's twitchy head."
	HipString="HIP SPAM"
	bHeaddie=true
	DamageIdent="Machinegun"
	WeaponClass=Class'BallisticProV55.XMV850Minigun'
	DeathString="%k's monster gun tore %o's head off."
	FemaleSuicide="%o minigunned her own head off."
	MaleSuicide="%o minigunned his own head off."
	bFastInstantHit=true
	bAlwaysSevers=true
	bSpecial=true
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.BulletImpacts.Headshot'
	VehicleDamageScaling=0.6000000
}
