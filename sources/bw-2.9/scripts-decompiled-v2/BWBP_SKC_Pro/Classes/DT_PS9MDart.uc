class DT_PS9MDart extends DT_BWMiscDamage
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o was dissolved by %k's PS9m neurotoxin."
	DeathStrings[1]="%k's PS9m neurotoxin ate away at %o ."
	DeathStrings[2]="%o got a dose of neurotoxin from %k's PS9m."
	DeathStrings[3]="%k fulfilled %kh contract on %o."
	DeathStrings[4]="%k assassinated %o with a PS9m."
	MinMotionBlurDamage=1.0000000
	MotionBlurDamageRange=20.0000000
	MotionBlurFactor=2.0000000
	bUseMotionBlur=true
	FlashThreshold=0
	FlashV=(X=0.0000000,Y=2000.0000000,Z=0.0000000)
	FlashF=0.3000000
	bDetonatesBombs=false
	DamageIdent="Sidearm"
	DamageDescription=",Gas,GearSafe,Hazard,"
	WeaponClass=Class'BWBP_SKC_Pro.PS9mPistol'
	DeathString="%o was dissolved by %k's PS9m neurotoxin."
	FemaleSuicide="%o took some of her own medicine."
	MaleSuicide="%o took some of his own medicine."
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
