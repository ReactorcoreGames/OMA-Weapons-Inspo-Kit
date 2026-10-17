class DTM75RailgunHead extends DT_BWBullet
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

defaultproperties
{
	DeathStrings[0]="%o's mad-eyed head got caught in %k's corkscrew."
	DeathStrings[1]="%k's rail slug stumped %o's already stumpy head."
	DeathStrings[2]="%o lost %vh head in a fight with %k's M75."
	HipString="Complete Luck"
	AimedString="Scoped"
	FlashThreshold=140
	FlashV=(X=0.0000000,Y=0.0000000,Z=250.0000000)
	FlashF=0.1000000
	DisplacementType=1
	AimDisplacementDamageThreshold=150
	AimDisplacementDuration=0.6500000
	TagMultiplier=0.4000000
	TagDuration=0.4000000
	bSnipingDamage=true
	bHeaddie=true
	InvasionDamageScaling=1.5000000
	DamageIdent="Sniper"
	WeaponClass=Class'BallisticProV55.M75Railgun'
	DeathString="%o's mad eyed head got caught in %k's corkscrew."
	FemaleSuicide="%o derailed herself."
	MaleSuicide="%o derailed himself."
	bAlwaysSevers=true
	bSpecial=true
	bExtraMomentumZ=true
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.BulletImpacts.Headshot'
}
