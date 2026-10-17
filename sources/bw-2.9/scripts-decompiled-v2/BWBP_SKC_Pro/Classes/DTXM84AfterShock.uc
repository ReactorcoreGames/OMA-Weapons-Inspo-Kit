class DTXM84AfterShock extends DT_BWMiscDamage
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o's brain was reduced to goo by %k's XM84."
	DeathStrings[1]="%k's XM84 slowly liquidized %o's fragile brain."
	DeathStrings[2]="%o painfully succumbed to %k's XM84 aftershock."
	MinMotionBlurDamage=1.0000000
	MotionBlurDamageRange=20.0000000
	MotionBlurFactor=3.0000000
	bUseMotionBlur=true
	FlashThreshold=0
	FlashV=(X=1900.0000000,Y=1900.0000000,Z=2000.0000000)
	FlashF=-1.2500000
	AltFlashV=(X=1.0000000,Y=1.0000000,Z=1200.0000000)
	AltFlashF=-4.0000000
	bDetonatesBombs=false
	InvasionDamageScaling=3.0000000
	DamageIdent="Grenade"
	DamageDescription=",Gas,GearSafe,Hazard,"
	WeaponClass=Class'BWBP_SKC_Pro.XM84Flashbang'
	DeathString="%o's brain was reduced to goo by %k's XM84."
	FemaleSuicide="%o succumbed to her own tech grenade."
	MaleSuicide="%o succumbed to his own tech grenade."
	bArmorStops=false
	bInstantHit=true
	bCausesBlood=false
	bDelayedDamage=true
	bNeverSevers=true
	DamageOverlayMaterial=Shader'XGameShaders.PlayerShaders.LightningHit'
	DamageOverlayTime=0.9000000
	GibPerterbation=0.0010000
	KDamageImpulse=90000.0000000
	VehicleMomentumScaling=0.0000000
}
