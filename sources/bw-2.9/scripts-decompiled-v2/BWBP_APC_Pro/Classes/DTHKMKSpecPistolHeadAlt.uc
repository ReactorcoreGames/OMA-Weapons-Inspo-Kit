class DTHKMKSpecPistolHeadAlt extends DT_BWBullet
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
	DeathStrings[0]="%o had their mugshot taken by %k, giving them a literal mug shot."
	DeathStrings[1]="%k destroyed %o's face so viciously that it doesnâ€™t match their wanted poster."
	DeathStrings[2]="%o didn't feel so lucky when they assumed that %k's mag was empty. Boom, headshot."
	DeathStrings[3]="%k's HKM took a bite out of crime and %o's face with a small shottie."
	DeathStrings[4]="%o found out the hard way that staring down %k's shotgun would leave them blind and dead."
	bHeaddie=true
	WeaponClass=Class'BWBP_APC_Pro.HKMKSpecPistol'
	DeathString="%k put %kh HKM-26 to %o's temple and fired."
	FemaleSuicide="%o litigated her own head off."
	MaleSuicide="%o litigated his own head off."
	bAlwaysSevers=true
	bSpecial=true
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.BulletImpacts.Headshot'
}
