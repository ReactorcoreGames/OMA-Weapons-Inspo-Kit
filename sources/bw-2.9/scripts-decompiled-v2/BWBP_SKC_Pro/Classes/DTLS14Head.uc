class DTLS14Head extends DT_BWMiscDamage
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o was lasered right between the eyes by %k's carbine."
	DeathStrings[1]="%k's LS-14 decapitated %o and cauterized the stump."
	DeathStrings[2]="%k accurately melted %o's retinas with a blue LS-14 laser."
	DeathStrings[3]="%o's teeth were precisely disintegrated by %k's LS-14."
	SimpleKillString="LS-14 Single Barrel"
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
	DamageIdent="Sniper"
	DamageDescription=",Laser,"
	WeaponClass=Class'BWBP_SKC_Pro.LS14Carbine'
	DeathString="%o was lasered right between the eyes by %k's carbine."
	FemaleSuicide="%o blasted her eyes out."
	MaleSuicide="%o blasted himself in the eye."
	bInstantHit=true
	bAlwaysSevers=true
	GibModifier=2.0000000
	GibPerterbation=0.2000000
	KDamageImpulse=1000.0000000
}
