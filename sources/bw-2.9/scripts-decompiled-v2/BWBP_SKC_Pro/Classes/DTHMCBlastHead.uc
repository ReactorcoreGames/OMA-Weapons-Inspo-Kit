class DTHMCBlastHead extends DT_BWMiscDamage
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

static function IncrementKills(Controller Killer)
{
	local xPlayerReplicationInfo xPRI;

	// End:0x12
	if(PlayerController(Killer) == none)
	{
		return;
	}
	PlayerController(Killer).ReceiveLocalizedMessage(Class'XGame.SpecialKillMessage', 0, Killer.PlayerReplicationInfo, none, none);
	xPRI = xPlayerReplicationInfo(Killer.PlayerReplicationInfo);
	// End:0xB2
	if(xPRI != none)
	{
		xPRI.headcount++;
		// End:0xB2
		if((xPRI.headcount == 15) && UnrealPlayer(Killer) != none)
		{
			UnrealPlayer(Killer).ClientDelayedAnnouncementNamed('Headhunter', 15);
		}
	}
	//return;	
}

defaultproperties
{
	DeathStrings[0]="%o was blinded during %k's HMC pulse test."
	DeathStrings[1]="%k's HMC tested the heat shields of %o's face."
	DeathStrings[2]="%k overcharged %o's face with an HMC pulse."
	BloodManagerName="BWBP_SKC_Pro.BloodMan_HMCLaser"
	MinMotionBlurDamage=5.0000000
	MotionBlurDamageRange=20.0000000
	bUseMotionBlur=true
	FlashV=(X=2000.0000000,Y=700.0000000,Z=700.0000000)
	FlashF=0.3000000
	ShieldDamage=5
	bIgniteFires=true
	bHeaddie=true
	InvasionDamageScaling=2.5000000
	DamageIdent="Energy"
	WeaponClass=Class'BWBP_SKC_Pro.HMCBeamCannon'
	DeathString="%o was blinded during %k's HMC pulse test."
	FemaleSuicide="%o self tested her own HMC laser blast."
	MaleSuicide="%o self tested his own HMC laser blast."
	bInstantHit=true
	bAlwaysSevers=true
	GibModifier=3.0000000
	GibPerterbation=0.2000000
	KDamageImpulse=1000.0000000
}
