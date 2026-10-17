class DT_LS440Head extends DT_BWMiscDamage
	config(BallisticProV55);

static function Class<Effects> GetPawnDamageEffect(Vector HitLocation, float Damage, Vector Momentum, Pawn Victim, bool bLowDetail)
{
	// End:0x40
	if(PlayerController(Victim.Controller) != none)
	{
		PlayerController(Victim.Controller).ClientFlash(default.FlashF, default.FlashV);
	}
	return super(BallisticDamageType).GetPawnDamageEffect(HitLocation, Damage, Momentum, Victim, bLowDetail);
	//return;	
}

defaultproperties
{
	DeathStrings[0]="%o's face was doctored up by %k's lethal LS-440."
	DeathStrings[1]="%k's laser eye surgery on %o went horribly wrong."
	DeathStrings[2]="%k submitted %o to LS-440 cranial surgery."
	DeathStrings[3]="%o's head is incompatible with %k's LS-440 wavelengths."
	BloodManagerName="BWBP_SKC_Pro.BloodMan_HMCLaser"
	MinMotionBlurDamage=5.0000000
	MotionBlurDamageRange=20.0000000
	bUseMotionBlur=true
	FlashV=(X=2000.0000000,Y=700.0000000,Z=700.0000000)
	FlashF=0.3000000
	ShieldDamage=5
	bIgniteFires=true
	DamageDescription=",Laser,"
	WeaponClass=Class'BWBP_SKC_Pro.LS14Carbine'
	DeathString="%o's face was doctored up by %k's lethal LS-440."
	FemaleSuicide="%o blasted her eyes out."
	MaleSuicide="%o blasted himself in the eye."
	bInstantHit=true
	bAlwaysSevers=true
	GibModifier=3.0000000
	GibPerterbation=1.2000000
	KDamageImpulse=1000.0000000
}
