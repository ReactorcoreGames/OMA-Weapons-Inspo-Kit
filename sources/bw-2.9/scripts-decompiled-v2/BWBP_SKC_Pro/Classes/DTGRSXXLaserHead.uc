class DTGRSXXLaserHead extends DT_BWMiscDamage
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o's head was illuminated off by %k's GRS-XX beam."
	DeathStrings[1]="%k scorched a hole through %o's cranium."
	DeathStrings[2]="%k sentenced %o's head to death with a GRS-XX laser."
	SimpleKillString="GRS-XX Laser"
	BloodManagerName="BallisticProV55.BloodMan_GRS9Laser"
	MinMotionBlurDamage=5.0000000
	MotionBlurDamageRange=20.0000000
	MotionBlurFactor=3.0000000
	bUseMotionBlur=true
	FlashThreshold=0
	FlashV=(X=2000.0000000,Y=700.0000000,Z=700.0000000)
	FlashF=0.3000000
	bIgniteFires=true
	bHeaddie=true
	DamageIdent="Sidearm"
	DamageDescription=",Laser,"
	WeaponClass=Class'BWBP_SKC_Pro.GRSXXPistol'
	DeathString="%o's head was illuminated off by %k's GRS-XX beam."
	FemaleSuicide="%o burned her own head off with a GRS-XX."
	MaleSuicide="%o burned his own head off with a GRS-XX."
	bInstantHit=true
	GibModifier=3.0000000
	GibPerterbation=0.2000000
	KDamageImpulse=1000.0000000
	VehicleDamageScaling=0.3500000
}
