class DTD49RevolverHead extends DT_BWBullet
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k took %o's head out with a shot from %kh D49."
	DeathStrings[1]="%k angled a shot through %o's head with %kh six shooter."
	DeathStrings[2]="%k put a magnum round through %o's face."
	DeathStrings[3]="%o's head was blown apart by %k's magnum."
	DeathStrings[4]="%o lost a showdown with %k's magnum."
	DeathStrings[5]="%o fumbled for %vh gun before %k blew %vh head off."
	bHeaddie=true
	DamageIdent="Pistol"
	WeaponClass=Class'BallisticProV55.D49Revolver'
	DeathString="%k took %o's head out with a shot from %kh D49."
	FemaleSuicide="%o shot herself in the face."
	MaleSuicide="%o shot himself in the face."
	bAlwaysSevers=true
	bSpecial=true
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.BulletImpacts.Headshot'
}
