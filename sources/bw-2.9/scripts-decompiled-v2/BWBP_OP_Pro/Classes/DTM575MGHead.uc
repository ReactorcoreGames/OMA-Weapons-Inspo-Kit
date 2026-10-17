class DTM575MGHead extends DT_BWBullet
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
	DeathStrings[0]="%k gave an eye for an eye a whole new meaning when he shot %o's head off."
	DeathStrings[1]="%o lost more than his sight when %k's M575 saw him."
	DeathStrings[2]="%k blinded %o with his M575, and decapitated him for good measure."
	DeathStrings[3]="%o couldnâ€™t see %k putting several holes into his head."
	DeathStrings[4]="%k took %o's vision and his life at the same time."
	DeathStrings[5]="%o's skull was hollowed out by %k's hybrid beast."
	bHeaddie=true
	DamageIdent="Machinegun"
	WeaponClass=Class'BWBP_OP_Pro.M575Machinegun'
	DeathString="%k furiously machinegunned %o's head off."
	FemaleSuicide="%o shot herself in the head with the M575."
	MaleSuicide="%o shot himself in the head with the M575."
	bFastInstantHit=true
	bAlwaysSevers=true
	bSpecial=true
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.BulletImpacts.Headshot'
}
