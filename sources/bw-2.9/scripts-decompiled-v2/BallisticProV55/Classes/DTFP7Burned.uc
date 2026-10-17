class DTFP7Burned extends DT_BWFire
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o went out in a blaze of %k's glory."
	DeathStrings[1]="%k cauterized %o's head off with the FP7."
	DeathStrings[2]="%o stopped, dropped and rolled around in %k's inferno."
	DeathStrings[3]="%o was roasted to a cinder by %k's FP7."
	bIgnoredOnLifts=true
	InvasionDamageScaling=3.0000000
	DamageIdent="Grenade"
	WeaponClass=Class'BallisticProV55.FP7Grenade'
	DeathString="%o went out in a blaze of %k's glory."
	FemaleSuicide="%o went out in a blaze of her own glory."
	MaleSuicide="%o went out in a blaze of his own glory."
	bDelayedDamage=true
	PawnDamageSounds[0]=Sound'BW_Core_WeaponSound.FP7.FP7BurnFlesh'
	KDamageImpulse=20000.0000000
}
