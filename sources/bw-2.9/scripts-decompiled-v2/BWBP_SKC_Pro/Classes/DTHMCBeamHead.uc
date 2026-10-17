class DTHMCBeamHead extends DT_BWMiscDamage
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
	DeathStrings[0]="%o's head was partially melted by %k's HMC beam."
	DeathStrings[1]="%k welded %o's mouth shut."
	DeathStrings[2]="%k blinded %o with %kh giant HMC laser."
	BloodManagerName="BWBP_SKC_Pro.BloodMan_HMCLaser"
	MinMotionBlurDamage=5.0000000
	MotionBlurDamageRange=20.0000000
	MotionBlurFactor=3.0000000
	bUseMotionBlur=true
	FlashV=(X=2000.0000000,Y=700.0000000,Z=700.0000000)
	FlashF=0.3000000
	ShieldDamage=3
	bIgniteFires=true
	bPowerPush=true
	bHeaddie=true
	DamageIdent="Energy"
	WeaponClass=Class'BWBP_SKC_Pro.HMCBeamCannon'
	DeathString="%o's head was partially melted by %k's HMC beam."
	FemaleSuicide="%o showed truly exemplary marksmanship with her HMC laser."
	MaleSuicide="%o ate his own laser."
	bInstantHit=true
	bAlwaysSevers=true
	GibModifier=3.0000000
	GibPerterbation=0.2000000
	KDamageImpulse=1000.0000000
}
