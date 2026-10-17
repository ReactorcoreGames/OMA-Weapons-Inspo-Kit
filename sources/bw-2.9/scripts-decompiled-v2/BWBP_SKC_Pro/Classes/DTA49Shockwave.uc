class DTA49Shockwave extends DT_BWMiscDamage
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k sent a shockwave through %o with %kh A49."
	DeathStrings[1]="%o was blown away by %k's A49 shockwave."
	DeathStrings[2]="%o was sent flying by %k's A49."
	DeathStrings[3]="%k ruptured %o's insides with an A49 shockwave."
	DeathStrings[4]="%o was pulsed by %k."
	MinMotionBlurDamage=1.0000000
	MotionBlurDamageRange=20.0000000
	MotionBlurFactor=1.0000000
	FlashThreshold=0
	FlashV=(X=800.0000000,Y=800.0000000,Z=2000.0000000)
	FlashF=0.3000000
	bPowerPush=true
	InvasionDamageScaling=1.5000000
	DamageIdent="SMG"
	WeaponClass=Class'BWBP_SKC_Pro.A49SkrithBlaster'
	DeathString="%k sent a shockwave through %o with %kh A49."
	FemaleSuicide="%o shockwaved her face off."
	MaleSuicide="%o shockwaved his face off."
	bExtraMomentumZ=true
	GibPerterbation=0.4000000
	KDamageImpulse=15000.0000000
	VehicleMomentumScaling=3.0000000
}
