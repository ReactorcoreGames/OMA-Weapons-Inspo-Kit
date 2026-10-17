class DTM353MGHead extends DT_BWBullet
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k furiously machinegunned %o's head off."
	DeathStrings[1]="%o bit the bullet from %k's M353."
	DeathStrings[2]="%o's head was destroyed by %k's M353."
	HipString="HIP SPAM"
	bHeaddie=true
	DamageIdent="Machinegun"
	WeaponClass=Class'BallisticProV55.M353Machinegun'
	DeathString="%k furiously machinegunned %o's head off."
	FemaleSuicide="%o shot herself in the head with the M353."
	MaleSuicide="%o shot himself in the head with the M353."
	bFastInstantHit=true
	bAlwaysSevers=true
	bSpecial=true
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.BulletImpacts.Headshot'
}
