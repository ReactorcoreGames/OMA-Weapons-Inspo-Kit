class DTAM67LaserHead extends DT_BWMiscDamage
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
	DeathStrings[0]="%o's head was illuminated off by %k's AM67 beam."
	DeathStrings[1]="%k burned %o's eye out with %kh laser."
	DeathStrings[2]="%k carved a smile on %o's face with %kh AM67 laser."
	BloodManagerName="BallisticProV55.BloodMan_GRS9Laser"
	MinMotionBlurDamage=5.0000000
	MotionBlurDamageRange=20.0000000
	MotionBlurFactor=3.0000000
	bUseMotionBlur=true
	FlashV=(X=2000.0000000,Y=700.0000000,Z=700.0000000)
	FlashF=0.3000000
	bIgniteFires=true
	WeaponClass=Class'BallisticProV55.AM67Pistol'
	DeathString="%k burned %o's eye out with %kh laser."
	FemaleSuicide="%o put her eye out with an AM67."
	MaleSuicide="%o put his eye out with an AM67."
	bInstantHit=true
	GibModifier=3.0000000
	GibPerterbation=0.2000000
	KDamageImpulse=1000.0000000
}
