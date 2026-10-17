class DTSX45PistolHead extends DT_BWBullet
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
	DeathStrings[0]="%k relieved %o's cranial pressure with a well placed .45."
	DeathStrings[1]="%o had his third eye opened by %k's .45 round."
	DeathStrings[2]="%k's SX45 rhinoplasty turned %o into a beautiful corpse."
	DeathStrings[3]="%o's cataracts and eyeballs cleared up due to %k's SX45."
	bHeaddie=true
	WeaponClass=Class'BWBP_SKC_Pro.SX45Pistol'
	DeathString="%k relieved %o's cranial pressure with a well placed .45."
	FemaleSuicide="%o somehow shot herself."
	MaleSuicide="%o managed to shoot himself."
	bAlwaysSevers=true
	bSpecial=true
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.BulletImpacts.Headshot'
}
