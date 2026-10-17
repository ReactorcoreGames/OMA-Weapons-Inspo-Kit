class DTSARLaserHead extends DT_BWMiscDamage
	config(BallisticProV55);

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
	DeathStrings[0]="%o was struck blind by %k's SAR beam."
	DeathStrings[1]="%k shone %kh SAR laser through %o's ears."
	DeathStrings[2]="%k enlightened %o's mind %kh SAR laser."
	BloodManagerName="BallisticProV55.BloodMan_GRS9Laser"
	MinMotionBlurDamage=5.0000000
	MotionBlurDamageRange=20.0000000
	MotionBlurFactor=3.0000000
	bUseMotionBlur=true
	FlashV=(X=2000.0000000,Y=700.0000000,Z=700.0000000)
	FlashF=0.3000000
	bIgniteFires=true
	WeaponClass=Class'BallisticProV55.SARAssaultRifle'
	DeathString="%k burned %o's eye out with %kh laser."
	FemaleSuicide="%o thought it was just a laser-sight."
	MaleSuicide="%o thought it was just a laser-sight."
	bInstantHit=true
	GibModifier=3.0000000
	GibPerterbation=0.2000000
	KDamageImpulse=1000.0000000
}
