class DT_ICISWithdrawal extends DT_BWFire
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k's special stash gave %o a bad trip."
	DeathStrings[1]="%o should have known better than to take drugs from %k."
	FemaleSuicides[0]="%o had a bad trip."
	FemaleSuicides[1]="%o got addicted to some heavy stuff."
	FemaleSuicides[2]="%o overdosed on experimental military drugs."
	FemaleSuicides[3]="%o couldn't let go of the needle."
	MaleSuicides[0]="%o had a bad trip."
	MaleSuicides[1]="%o got addicted to some heavy stuff."
	MaleSuicides[2]="%o overdosed on experimental military drugs."
	MaleSuicides[3]="%o couldn't let go of the needle."
	SimpleKillString="ICIS Overdose"
	MinMotionBlurDamage=1.0000000
	MotionBlurDamageRange=20.0000000
	MotionBlurFactor=3.0000000
	bUseMotionBlur=true
	FlashV=(X=1500.0000000,Y=1500.0000000,Z=0.0000000)
	FlashF=0.2000000
	bDetonatesBombs=false
	DamageDescription=",Gas,GearSafe,Hazard,"
	WeaponClass=Class'BWBP_SKC_Pro.ICISStimpack'
	DeathString="%o should have known better than to take drugs from %k."
	FemaleSuicide="%o had a bad trip."
	MaleSuicide="%o had a bad trip."
	bArmorStops=false
	bInstantHit=true
	bDelayedDamage=true
	GibPerterbation=0.1000000
	KDamageImpulse=200.0000000
}
