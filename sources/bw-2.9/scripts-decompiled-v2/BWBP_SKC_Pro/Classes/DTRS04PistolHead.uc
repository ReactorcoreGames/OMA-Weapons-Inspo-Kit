class DTRS04PistolHead extends DT_BWBullet
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
	DeathStrings[0]="%o was force fed %k's RS04 bullets."
	DeathStrings[1]="%k's lodged some RS04 bullets in %o's head."
	DeathStrings[2]="%o took %k's RS04 round right in the eye."
	DeathStrings[3]="%k removed %o's head with a .45 RS04 bullet."
	bHeaddie=true
	WeaponClass=Class'BWBP_SKC_Pro.RS04Pistol'
	DeathString="%o was force fed %k's RS04 bullets."
	FemaleSuicide="%o somehow shot herself."
	MaleSuicide="%o managed to shoot himself."
	bAlwaysSevers=true
	bSpecial=true
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.BulletImpacts.Headshot'
}
