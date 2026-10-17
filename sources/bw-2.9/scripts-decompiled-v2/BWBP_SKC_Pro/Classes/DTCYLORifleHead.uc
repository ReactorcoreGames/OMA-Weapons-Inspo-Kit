class DTCYLORifleHead extends DT_BWBullet
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k badgered %o's head off."
	DeathStrings[1]="%k put a bullet in %o's head with his CYLO."
	DeathStrings[2]="%k's CYLO rounds badgered their way into %o's skull."
	DeathStrings[3]="%o got %vh head routed by %k's CYLO."
	DeathStrings[4]="%o's head was taken out by %k's CYLO."
	DeathStrings[5]="%k put a round through %o's head."
	EffectChance=0.5000000
	bHeaddie=true
	DamageIdent="Assault"
	WeaponClass=Class'BWBP_SKC_Pro.CYLOUAW'
	DeathString="%k badgered %o's head off."
	FemaleSuicide="%o routed herself."
	MaleSuicide="%o routed himself."
	bFastInstantHit=true
	bAlwaysSevers=true
	bSpecial=true
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.BulletImpacts.Headshot'
	GibPerterbation=0.2000000
	KDamageImpulse=1000.0000000
}
