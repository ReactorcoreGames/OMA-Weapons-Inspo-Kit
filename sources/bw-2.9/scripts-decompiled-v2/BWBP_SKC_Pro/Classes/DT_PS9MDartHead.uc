class DT_PS9MDartHead extends DT_BWMiscDamage
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o's brain had a bad trip on %k's neurotoxin."
	DeathStrings[1]="%k gave %o an oral dose of PS9m neurotoxin."
	DeathStrings[2]="%k's PS9m toxin went to work on %o's brain."
	MinMotionBlurDamage=1.0000000
	MotionBlurDamageRange=20.0000000
	MotionBlurFactor=12.0000000
	bUseMotionBlur=true
	FlashThreshold=0
	FlashV=(X=0.0000000,Y=2000.0000000,Z=0.0000000)
	FlashF=0.3000000
	bDetonatesBombs=false
	DamageIdent="Sidearm"
	DamageDescription=",Gas,GearSafe,Hazard,"
	WeaponClass=Class'BWBP_SKC_Pro.PS9mPistol'
	DeathString="%o's brain had a bad trip on %k's neurotoxin."
	FemaleSuicide="%o had a bad trip."
	MaleSuicide="%o had a bad trip."
	bInstantHit=true
	bCausesBlood=false
	bDelayedDamage=true
	bNeverSevers=true
	PawnDamageSounds[0]=Sound'BWBP_SKC_Sounds.VSK.VSK-ImpactFlesh'
	DamageOverlayMaterial=Shader'XGameShaders.PlayerShaders.LinkHit'
	DamageOverlayTime=0.9000000
	GibPerterbation=0.0010000
	KDamageImpulse=90000.0000000
	VehicleDamageScaling=0.0000000
	VehicleMomentumScaling=0.0000000
}
