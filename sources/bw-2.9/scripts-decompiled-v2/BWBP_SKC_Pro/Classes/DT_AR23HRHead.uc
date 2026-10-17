class DT_AR23HRHead extends DT_BWBullet
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
	DeathStrings[0]="%k broke %o's helmet and skull with a well placed Beowulf right between the eyes."
	DeathStrings[1]="%o was deemed guilty and was sentenced to death by %k's .50 through the nostrils."
	DeathStrings[2]="%k made %o pay for his misdeeds by decimating their skull with an AR23."
	DeathStrings[3]="%o had their boarish squeals silenced by %k."
	DeathStrings[4]="%k popped %o's skull like a metaphor for popping someoneâ€™s head off."
	DeathStrings[5]="%o was the perpetrator for having %k's Beowulf round illegally possessed in their gray matter."
	TagDuration=0.2000000
	bHeaddie=true
	DamageIdent="HeavyRifle"
	WeaponClass=Class'BWBP_SKC_Pro.AR23HeavyRifle'
	DeathString="%k's AR23 turned %o's head into mist."
	FemaleSuicide="%o caught her face in the belt feed of her AR23."
	MaleSuicide="%o caught his face in the belt feed of his AR23."
	bFastInstantHit=true
	bAlwaysSevers=true
	bSpecial=true
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.BulletImpacts.Headshot'
}
