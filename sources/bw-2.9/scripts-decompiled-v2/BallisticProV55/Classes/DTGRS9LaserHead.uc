class DTGRS9LaserHead extends DT_BWMiscDamage
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o's head was illuminated off by %k's GRS-9 beam."
	DeathStrings[1]="%k scorched a hole through %o's cranium."
	DeathStrings[2]="%k sentenced %o's head to death with a GRS-9 laser."
	SimpleKillString="GRS-9 Laser"
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
	WeaponClass=Class'BallisticProV55.GRS9Pistol'
	DeathString="%o's head was illuminated off by %k's GRS-9 beam."
	FemaleSuicide="%o burned her own head off with a GRS-9."
	MaleSuicide="%o burned his own head off with a GRS-9."
	bInstantHit=true
	GibModifier=3.0000000
	GibPerterbation=0.2000000
	KDamageImpulse=1000.0000000
	VehicleDamageScaling=0.3500000
}
