class DTSX45PistolHead_RAD extends DT_BWBullet
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
	DeathStrings[0]="%k melted %o's potato head using the power of radiation."
	DeathStrings[1]="%o licked the end of %k's bullet and got mouth cancer from it."
	DeathStrings[2]="%k made an art exhibit out of %o's brains and radium."
	DeathStrings[3]="%o's gray matter is now green thanks to %k."
	FlashV=(X=1500.0000000,Y=1500.0000000,Z=0.0000000)
	FlashF=0.2000000
	bHeaddie=true
	WeaponClass=Class'BWBP_SKC_Pro.SX45Pistol'
	DeathString="%o was force fed %k's SX45K bullets."
	FemaleSuicide="%o somehow shot herself."
	MaleSuicide="%o managed to shoot himself."
	bAlwaysSevers=true
	bSpecial=true
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.BulletImpacts.Headshot'
}
