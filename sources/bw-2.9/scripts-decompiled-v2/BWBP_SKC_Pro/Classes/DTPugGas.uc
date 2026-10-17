class DTPugGas extends DT_BWMiscDamage
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o's riot was put down by %k's tear gas."
	DeathStrings[1]="%k subdued %o with a PUG tear gas shell."
	DeathStrings[2]="%o protested into %k's PUG tear gas grenade."
	DeathStrings[3]="%k's tear gas shell ended %o's protests."
	DeathStrings[4]="%o huffed too much of %k's teargas."
	FemaleSuicides[0]="%o teargassed herself."
	FemaleSuicides[1]="%o foolishly ran into her own tear gas."
	FemaleSuicides[2]="%o caught a whiff of her own fumes."
	FemaleSuicides[3]="%o huffed too much teargas."
	MaleSuicides[0]="%o teargassed herself."
	MaleSuicides[1]="%o foolishly ran into his own tear gas."
	MaleSuicides[2]="%o caught a whiff of his own fumes."
	MaleSuicides[3]="%o huffed too much teargas."
	MinMotionBlurDamage=1.0000000
	MotionBlurDamageRange=20.0000000
	MotionBlurFactor=6.0000000
	bUseMotionBlur=true
	FlashThreshold=0
	FlashV=(X=0.0000000,Y=2000.0000000,Z=0.0000000)
	FlashF=0.3000000
	bDetonatesBombs=false
	bIgnoredOnLifts=true
	DamageIdent="Grenade"
	DamageDescription=",Gas,GearSafe,Hazard,"
	WeaponClass=Class'BWBP_SKC_Pro.PugAssaultCannon'
	DeathString="%o's riot was put down by %k's tear gas."
	FemaleSuicide="%o teargassed herself."
	MaleSuicide="%o teargassed himself."
	bArmorStops=false
	bLocationalHit=false
	bCausesBlood=false
	bDelayedDamage=true
	bNeverSevers=true
	GibPerterbation=0.5000000
	KDamageImpulse=20000.0000000
	VehicleDamageScaling=0.0000000
}
