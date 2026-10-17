class DTHKMKSpecPistolHead extends DT_BWBullet
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
	DeathStrings[0]="%o's helmet and gray matter has a shiny new hole thanks to %k."
	DeathStrings[1]="%k managed to stop %o with a headshot before they did something highly illegal."
	DeathStrings[2]="%o couldn't catch %k's speeding bullet coming right towards their gray matter."
	DeathStrings[3]="%k ripped right through %o's ears even though there was a helmet protecting them."
	DeathStrings[4]="%o was stopped from doing bad things by taking %k's armor piercing bullet to the dome."
	DeathStrings[5]="%k broke through thick glass and %oâ€™s nose with a single bullet."
	bHeaddie=true
	WeaponClass=Class'BWBP_APC_Pro.HKMKSpecPistol'
	DeathString="%k put %kh HKM-26 to %o's temple and fired."
	FemaleSuicide="%o litigated her own head off."
	MaleSuicide="%o litigated his own head off."
	bAlwaysSevers=true
	bSpecial=true
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.BulletImpacts.Headshot'
}
