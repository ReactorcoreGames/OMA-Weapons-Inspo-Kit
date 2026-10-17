class DTCYLOFirestormHotHead extends DT_BWMiscDamage
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k's flaming Firestorm roasted %o's head off."
	DeathStrings[1]="%k headshotted %o with his torching Firestorm."
	DeathStrings[2]="%k scalded %o's brain with his melting Firestorm."
	EffectChance=1.0000000
	BloodManagerName="BallisticProV55.BloodMan_GRS9Laser"
	MinMotionBlurDamage=5.0000000
	MotionBlurDamageRange=20.0000000
	MotionBlurFactor=3.0000000
	bUseMotionBlur=true
	bIgniteFires=true
	bHeaddie=true
	InvasionDamageScaling=1.2500000
	DamageIdent="Assault"
	DamageDescription=",Bullet,Flame,Hazard,"
	WeaponClass=Class'BWBP_SKC_Pro.CYLOUAW'
	DeathString="%k's overheating Firestorm roasted %o's head off."
	FemaleSuicide="%o routed herself."
	MaleSuicide="%o routed himself."
	bFastInstantHit=true
	bAlwaysSevers=true
	bFlaming=true
	GibModifier=1.2000000
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.BulletImpacts.Headshot'
	GibPerterbation=0.2000000
	KDamageImpulse=1000.0000000
}
