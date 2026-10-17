class DTPugCannonHead extends DT_BWBullet
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
	DeathStrings[0]="%k crushed %o's neck with a slug."
	DeathStrings[1]="%k made %o choke with a huge slug."
	DeathStrings[2]="%o's objections were silenced by %k's suppression cannon."
	DeathStrings[3]="%o can't cry out after taking %k's slug to the jaw."
	bHeaddie=true
	WeaponClass=Class'BWBP_SKC_Pro.PugAssaultCannon'
	DeathString="%o's head got eaten by %k's PUG."
	FemaleSuicide="%o is tactically inept with a PUG."
	MaleSuicide="%o is tactically inept with a PUG."
	bAlwaysSevers=true
	bSpecial=true
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.BulletImpacts.Headshot'
}
