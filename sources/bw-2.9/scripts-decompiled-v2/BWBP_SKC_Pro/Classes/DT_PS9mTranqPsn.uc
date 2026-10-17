class DT_PS9mTranqPsn extends DT_BWMiscDamage
	config(BallisticProV55);

var float FlashF1;
var Vector FlashV1;

static function Class<Effects> GetPawnDamageEffect(Vector HitLocation, float Damage, Vector Momentum, Pawn Victim, bool bLowDetail)
{
	// End:0x40
	if(PlayerController(Victim.Controller) != none)
	{
		PlayerController(Victim.Controller).ClientFlash(default.FlashF1, default.FlashV1);
	}
	return super(BallisticDamageType).GetPawnDamageEffect(HitLocation, Damage, Momentum, Victim, bLowDetail);
	//return;	
}

defaultproperties
{
	FlashF1=0.4000000
	FlashV1=(X=0.0000000,Y=2000.0000000,Z=0.0000000)
	DeathStrings[0]="%o was fatally poisoned by %k's PS9m."
	DeathStrings[1]="%k's PS9m made %o take a dirt nap."
	DeathStrings[2]="%o was overdosed by %k's toxin dart."
	DeathStrings[3]="%k's neurotoxin dart put %o under."
	MinMotionBlurDamage=1.0000000
	MotionBlurDamageRange=20.0000000
	MotionBlurFactor=3.0000000
	bUseMotionBlur=true
	bDetonatesBombs=false
	DamageDescription=",Gas,GearSafe,Hazard,"
	WeaponClass=Class'BWBP_SKC_Pro.PS9mPistol'
	DeathString="%o was knocked out by %k's PS9m."
	FemaleSuicide="%o knocked herself out."
	MaleSuicide="%o knocked himself out."
	bArmorStops=false
	bInstantHit=true
	bCausesBlood=false
	bDelayedDamage=true
	bNeverSevers=true
	PawnDamageSounds[0]=Sound'BWBP_SKC_Sounds.VSK.VSK-Poison'
	DamageOverlayMaterial=Shader'XGameShaders.PlayerShaders.LinkHit'
	DamageOverlayTime=0.9000000
	GibPerterbation=0.0010000
	KDamageImpulse=90000.0000000
	VehicleDamageScaling=0.0010000
	VehicleMomentumScaling=0.0010000
}
