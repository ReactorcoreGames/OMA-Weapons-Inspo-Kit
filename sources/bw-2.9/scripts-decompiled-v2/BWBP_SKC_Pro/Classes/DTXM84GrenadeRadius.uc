class DTXM84GrenadeRadius extends DT_BWExplode
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o's fragile brain was fried by %k's XM84."
	DeathStrings[1]="%k's XM84 hemorrhaged %o's fragile brain."
	DeathStrings[2]="%o succumbed to %k's XM84 psionic blast."
	MinMotionBlurDamage=1.0000000
	MotionBlurDamageRange=20.0000000
	MotionBlurFactor=9.0000000
	bUseMotionBlur=true
	FlashThreshold=0
	FlashV=(X=2500.0000000,Y=2500.0000000,Z=2500.0000000)
	FlashF=-5.0000000
	AltFlashV=(X=100.0000000,Y=100.0000000,Z=1200.0000000)
	AltFlashF=-5.0000000
	InvasionDamageScaling=3.0000000
	DamageIdent="Grenade"
	WeaponClass=Class'BWBP_SKC_Pro.XM84Flashbang'
	DeathString="%o was fatally corrupted by %k's tech grenade."
	FemaleSuicide="%o had a tactical error with her tactical grenade."
	MaleSuicide="%o had a tactical error with his tactical grenade."
	bArmorStops=false
	bCauseConvulsions=true
	bDelayedDamage=true
	bNeverSevers=true
	PawnDamageSounds[0]=Sound'BWBP_SKC_Sounds.Misc.XM84-StunEffect'
	DamageOverlayMaterial=Shader'XGameShaders.PlayerShaders.LightningHit'
	DamageOverlayTime=0.9000000
	VehicleMomentumScaling=0.5000000
}
