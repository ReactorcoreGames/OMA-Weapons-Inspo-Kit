class DTE5LaserHead extends DT_BWMiscDamage
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o had %vh head decapitated by %k's miniature beam of death."
	DeathStrings[1]="%k gave %o a plasma power tracheostomy, still was fatal though."
	DeathStrings[2]="%o didn't read the fine print before getting lethal eye laser surgery by Dr. %k."
	DeathStrings[3]="%k drew a smiley face on %o before dying, %ve didnâ€™t appreciate it."
	SimpleKillString="E-5 'ViPeR' Laser"
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
	WeaponClass=Class'BWBP_APC_Pro.E5PlasmaRifle'
	DeathString="%k swept %kh ViPeR laser across %o's stunned face."
	FemaleSuicide="%o scorched her own head off with an E-5."
	MaleSuicide="%o scorched his own head off with an E-5."
	bInstantHit=true
	GibModifier=3.0000000
	GibPerterbation=0.2000000
	KDamageImpulse=1000.0000000
	VehicleDamageScaling=0.7500000
}
