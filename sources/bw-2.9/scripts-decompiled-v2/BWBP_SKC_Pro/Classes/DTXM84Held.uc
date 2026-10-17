class DTXM84Held extends DT_BWExplode
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k blew off %kh hand and parts of %o."
	DeathStrings[1]="%o joined %k in %kh tactical suicide."
	DeathStrings[2]="%k decided to share his XM84 with %o."
	FemaleSuicides[0]="%o didn't realize her XM84 was on."
	FemaleSuicides[1]="%o threw the pin and not the grenade."
	MaleSuicides[0]="%o didn't realize his XM84 was on."
	MaleSuicides[1]="%o threw the pin and not the grenade."
	MinMotionBlurDamage=1.0000000
	MotionBlurDamageRange=20.0000000
	MotionBlurFactor=9.0000000
	bUseMotionBlur=true
	FlashThreshold=0
	FlashV=(X=2500.0000000,Y=2500.0000000,Z=2500.0000000)
	FlashF=-5.0000000
	DamageIdent="Grenade"
	WeaponClass=Class'BWBP_SKC_Pro.XM84Flashbang'
	DeathString="%k blew off %kh hand and parts of %o."
	FemaleSuicide="%o held her XM84 to the bitter end."
	MaleSuicide="%o refused to drop his XM84."
	bArmorStops=false
	bCauseConvulsions=true
	bNeverSevers=true
	GibModifier=0.5000000
	GibPerterbation=0.9000000
}
