class DTNEXSlashHead extends DT_BWBlade
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
	DeathStrings[0]="%k lopped %o's head with a clean sweep of the NEX."
	DeathStrings[1]="%o's head made a good stone for %k's sword."
	DeathStrings[2]="%k rammed the tip of %kh Plas-Edge into %o's neck."
	DeathStrings[3]="%k stuck %kh sword in between %o's ears."
	DeathStrings[4]="%o had %vh eyes poked out by %k."
	BloodManagerName="BWBP_SKC_Pro.BloodMan_HMCLaser"
	MinMotionBlurDamage=5.0000000
	MotionBlurDamageRange=20.0000000
	bUseMotionBlur=true
	FlashV=(X=2000.0000000,Y=700.0000000,Z=700.0000000)
	FlashF=0.8000000
	ShieldDamage=3
	bIgniteFires=true
	WeaponClass=Class'BWBP_SKC_Pro.N3XPlaz'
	DeathString="%k lopped %o's head with a clean sweep of the NEX."
	FemaleSuicide="%o burnt her head off..."
	MaleSuicide="%o burnt his head off..."
	bArmorStops=false
	bAlwaysSevers=true
	GibModifier=3.0000000
	PawnDamageSounds[0]=SoundGroup'BWBP_SKC_Sounds.NEX.Nex-HitBod'
	GibPerterbation=0.2000000
	KDamageImpulse=1000.0000000
}
