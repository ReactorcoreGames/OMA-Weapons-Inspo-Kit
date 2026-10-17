class DT_XM20_Head extends DT_BWMiscDamage
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o looked directly into %k's laser carbine."
	DeathStrings[1]="%k disintegrated %o's face with a laser assault rife."
	DeathStrings[2]="%k's XM-20 burned a neat hole directly through %o's forehead."
	DeathStrings[3]="%o should not have stared into %k's laser."
	SimpleKillString="XM20 Laser Carbine Head"
	BloodManagerName="BloodMan_HMCLaser"
	MinMotionBlurDamage=5.0000000
	MotionBlurDamageRange=20.0000000
	bUseMotionBlur=true
	FlashThreshold=0
	FlashV=(X=700.0000000,Y=700.0000000,Z=2000.0000000)
	FlashF=0.3000000
	ShieldDamage=5
	bIgniteFires=true
	bHeaddie=true
	DamageIdent="Energy"
	DamageDescription=",Laser,"
	WeaponClass=Class'BWBP_SKC_Pro.XM20Carbine'
	DeathString="%o looked directly into %k's laser carbine."
	FemaleSuicide="%o blasted her eyes out."
	MaleSuicide="%o blasted himself in the eye."
	bInstantHit=true
	bAlwaysSevers=true
	GibModifier=2.0000000
	GibPerterbation=0.2000000
	KDamageImpulse=1000.0000000
}
