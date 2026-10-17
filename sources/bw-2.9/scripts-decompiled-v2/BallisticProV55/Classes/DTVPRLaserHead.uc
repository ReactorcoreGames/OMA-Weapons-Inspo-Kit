class DTVPRLaserHead extends DT_BWMiscDamage
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k swept %kh ViPeR laser across %o's stunned face."
	DeathStrings[1]="%o's head was caught up in %k's E-23 laser beam."
	DeathStrings[2]="%k's E-23 beam cauterized %o's head in half."
	SimpleKillString="E-23 'ViPeR' Laser"
	AimedString="Scoped"
	BloodManagerName="BallisticProV55.BloodMan_GRS9Laser"
	MinMotionBlurDamage=5.0000000
	MotionBlurDamageRange=20.0000000
	MotionBlurFactor=3.0000000
	bUseMotionBlur=true
	FlashThreshold=0
	FlashV=(X=2000.0000000,Y=2000.0000000,Z=1500.0000000)
	FlashF=0.3000000
	bIgniteFires=true
	bHeaddie=true
	DamageIdent="Energy"
	DamageDescription=",Laser,"
	WeaponClass=Class'BallisticProV55.E23PlasmaRifle'
	DeathString="%k swept %kh ViPeR laser across %o's stunned face."
	FemaleSuicide="%o scorched her own head off with an E-23."
	MaleSuicide="%o scorched his own head off with an E-23."
	bInstantHit=true
	GibModifier=3.0000000
	GibPerterbation=0.2000000
	KDamageImpulse=1000.0000000
	VehicleDamageScaling=0.7500000
}
