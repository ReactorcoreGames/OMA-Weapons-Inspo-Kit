class DTR9A1RifleHead extends DT_BWBullet
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
	DeathStrings[0]="%k shot %o's head out of the way with %kh R9A1."
	DeathStrings[1]="%k levelled %kh rifle at %o and blew %vh head off."
	DeathStrings[2]="%o caught a round from %k's R9A1."
	DeathStrings[3]="%k found %o's head with %kh ranger rifle."
	DeathStrings[4]="%o's head received a round from %k's R9A1."
	bHeaddie=true
	DamageIdent="Sniper"
	WeaponClass=Class'BWBP_OP_Pro.R9A1RangerRifle'
	DeathString="%k shot %o's head out of the way with %kh R9A1."
	FemaleSuicide="%o R9A1ed off her own head."
	MaleSuicide="%o R9A1ed off his own head."
	bAlwaysSevers=true
	bSpecial=true
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.BulletImpacts.Headshot'
	KDamageImpulse=2000.0000000
}
