class DTCYLOFirestormRifleHead extends DT_BWBullet
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k CYLO IV'd %o's head right off."
	DeathStrings[1]="%k put a fiery bullet in %o's head with his pyro CYLO."
	DeathStrings[2]="%k's incendiary CYLO rounds melted %o's face."
	DeathStrings[3]="%k put a incendiary round through %o's head."
	EffectChance=0.5000000
	BloodManagerName="BallisticProV55.BloodMan_GRS9Laser"
	bIgniteFires=true
	bHeaddie=true
	InvasionDamageScaling=1.2500000
	DamageIdent="Assault"
	DamageDescription=",Bullet,Flame,"
	WeaponClass=Class'BWBP_SKC_Pro.CYLOUAW'
	DeathString="%k CYLO IV'd %o's head right off."
	FemaleSuicide="%o routed herself."
	MaleSuicide="%o routed himself."
	bFastInstantHit=true
	bAlwaysGibs=true
	bSpecial=true
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.BulletImpacts.Headshot'
	GibPerterbation=0.2000000
	KDamageImpulse=1000.0000000
}
