class DTSMATSuicide extends DT_BWExplode
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
	DeathStrings[0]="%o played with a suicide bomber."
	DeathStrings[1]="%o was a little too close to detonator-crazy %k."
	DeathStrings[2]="%k blew %kh gun and %o to hell."
	FlashV=(X=2000.0000000,Y=600.0000000,Z=600.0000000)
	FlashF=0.1000000
	WeaponClass=Class'BWBP_SKC_Pro.SMATLauncher'
	DeathString="%o played with a suicide bomber."
	FemaleSuicide="%o activated the self-destruct."
	MaleSuicide="%o activated the self-destruct."
	bDelayedDamage=true
}
