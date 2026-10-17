class DTM806PistolHead extends DT_BWBullet
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o was decapitated by %k with the M806."
	DeathStrings[1]="%k beheaded %o with %kh M806."
	bHeaddie=true
	WeaponClass=Class'BallisticProV55.M806Pistol'
	DeathString="%o was decapitated by %k with the M806."
	FemaleSuicide="%o peered down the barrel of her M806."
	MaleSuicide="%o peered down the barrel of his M806."
	bAlwaysSevers=true
	bSpecial=true
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.BulletImpacts.Headshot'
}
