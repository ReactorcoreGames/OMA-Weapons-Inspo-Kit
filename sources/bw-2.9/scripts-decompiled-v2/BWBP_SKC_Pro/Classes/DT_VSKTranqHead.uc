class DT_VSKTranqHead extends DT_BWMiscDamage
	config(BallisticProV55);

var float FlashF2;
var Vector FlashV2;

static function Class<Effects> GetPawnDamageEffect(Vector HitLocation, float Damage, Vector Momentum, Pawn Victim, bool bLowDetail)
{
	// End:0x40
	if(PlayerController(Victim.Controller) != none)
	{
		PlayerController(Victim.Controller).ClientFlash(default.FlashF2, default.FlashV2);
	}
	return super(BallisticDamageType).GetPawnDamageEffect(HitLocation, Damage, Momentum, Victim, bLowDetail);
	//return;	
}

defaultproperties
{
	FlashF2=0.3000000
	FlashV2=(X=0.0000000,Y=2000.0000000,Z=0.0000000)
	DeathStrings[0]="%o took %k's tranquilizer dart in the face."
	DeathStrings[1]="%k subdued %o with a VSK-42 dart to the face."
	DeathStrings[2]="%k's VSK-42 nonlethally pincushioned %o's head."
	DeathStrings[3]="%k's tranq dart lodged itself in %o's eye."
	MinMotionBlurDamage=1.0000000
	MotionBlurDamageRange=20.0000000
	MotionBlurFactor=12.0000000
	bUseMotionBlur=true
	bDetonatesBombs=false
	DamageDescription=",Gas,GearSafe,Hazard,"
	WeaponClass=Class'BWBP_SKC_Pro.VSKTranqRifle'
	DeathString="%o took %k's tranquilizer dart in the face."
	FemaleSuicide="%o knocked herself out."
	MaleSuicide="%o knocked himself out."
	bInstantHit=true
	bCausesBlood=false
	bDelayedDamage=true
	bNeverSevers=true
	PawnDamageSounds[0]=Sound'BWBP_SKC_Sounds.VSK.VSK-ImpactFlesh'
	DamageOverlayMaterial=Shader'XGameShaders.PlayerShaders.LinkHit'
	DamageOverlayTime=0.9000000
	GibPerterbation=0.0010000
	KDamageImpulse=90000.0000000
	VehicleDamageScaling=0.0010000
	VehicleMomentumScaling=0.0010000
}
