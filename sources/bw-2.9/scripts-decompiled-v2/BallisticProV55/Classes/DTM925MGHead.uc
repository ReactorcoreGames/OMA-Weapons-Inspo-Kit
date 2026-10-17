class DTM925MGHead extends DT_BWBullet
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
	DeathStrings[0]="%k's M925 turned %o's head into mist."
	DeathStrings[1]="%k put a 50 cal through %o's idiotic face."
	DeathStrings[2]="%o's head was completely ruined by %k's speeding M925 rounds."
	DeathStrings[3]="%o's head was sanctified by %k's M925."
	HipString="HIP SPAM"
	bHeaddie=true
	DamageIdent="Machinegun"
	WeaponClass=Class'BallisticProV55.M925Machinegun'
	DeathString="%k's M925 turned %o's head into mist."
	FemaleSuicide="%o caught her face in the belt feed of her M925."
	MaleSuicide="%o caught his face in the belt feed of his M925."
	bFastInstantHit=true
	bAlwaysSevers=true
	bSpecial=true
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.BulletImpacts.Headshot'
}
