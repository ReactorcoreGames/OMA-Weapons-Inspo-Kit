class DTAM67PistolHead extends DT_BWBullet
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
	DeathStrings[0]="%o's skull was shattered by %k's AM67."
	DeathStrings[1]="%k denounced %o's head with AM67 rounds."
	DeathStrings[2]="%o's head was negotiated off by %k's AM67."
	bHeaddie=true
	DamageIdent="Pistol"
	WeaponClass=Class'BallisticProV55.AM67Pistol'
	DeathString="%k blew %o's head off with %kh AM67."
	FemaleSuicide="%o blew her head off with the AM67."
	MaleSuicide="%o blew his head off with the AM67."
	bAlwaysSevers=true
	bSpecial=true
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.BulletImpacts.Headshot'
}
