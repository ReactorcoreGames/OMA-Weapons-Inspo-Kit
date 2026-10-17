class DTSARRifleHead extends DT_BWBullet
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o's head was hallowed by %k's compact carbine."
	DeathStrings[1]="%k trounced %o's head with %kh sub-assault rifle."
	DeathStrings[2]="%k's S-AR 12 rounds snaked their way into %o's skull."
	DeathStrings[3]="%o got %vh head routed by %k's S-AR 12."
	DeathStrings[4]="%o's head was taken out by %k's sub-assault rifle."
	EffectChance=0.5000000
	bHeaddie=true
	DamageIdent="Assault"
	WeaponClass=Class'BallisticProV55.SARAssaultRifle'
	DeathString="%o's head was hallowed by %k's SAR12."
	FemaleSuicide="%o routed herself."
	MaleSuicide="%o routed himself."
	bFastInstantHit=true
	bAlwaysSevers=true
	bSpecial=true
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.BulletImpacts.Headshot'
}
