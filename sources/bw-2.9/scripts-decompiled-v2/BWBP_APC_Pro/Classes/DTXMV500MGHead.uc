class DTXMV500MGHead extends DT_BWBullet
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
	DeathStrings[0]="%k's smart minigun blew %o's brain."
	DeathStrings[1]="%o's head was replaced with %k's XMB-500 bullets."
	DeathStrings[2]="%o lost %vh head in a fight with %k's XMB-500."
	DeathStrings[3]="%k's XMB-500 smashed rounds through %o's cranium."
	bIgniteFires=true
	bHeaddie=true
	DamageDescription=",Flame,Bullet,"
	WeaponClass=Class'BWBP_APC_Pro.XMV500Minigun'
	DeathString="%k's smart minigun blew %o's brain."
	FemaleSuicide="%o minigunned her own head off."
	MaleSuicide="%o minigunned his own head off."
	bFastInstantHit=true
	bAlwaysSevers=true
	bSpecial=true
}
