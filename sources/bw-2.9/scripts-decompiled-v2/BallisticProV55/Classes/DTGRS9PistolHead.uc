class DTGRS9PistolHead extends DT_BWBullet
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o's head was objected to by %k's GRS-9."
	DeathStrings[1]="%k's GRS-9 liquidated %o's head."
	DeathStrings[2]="%o's head was struck off the role by %k's GRS-9."
	DeathStrings[3]="%k litigated %o's head off."
	bHeaddie=true
	InvasionDamageScaling=1.5000000
	DamageIdent="Pistol"
	WeaponClass=Class'BallisticProV55.GRS9Pistol'
	DeathString="%k litigated %o's head off."
	FemaleSuicide="%o litigated her own head off."
	MaleSuicide="%o litigated his own head off."
	bAlwaysSevers=true
	bSpecial=true
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.BulletImpacts.Headshot'
}
