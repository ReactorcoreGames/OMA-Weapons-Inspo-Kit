class DTSX45PistolHead_Cryo extends DT_BWBullet
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
	DeathStrings[0]="%k gave %o the deadliest brain freeze known to man."
	DeathStrings[1]="%o's nose fell off thanks to frostbite courtesy of %k."
	DeathStrings[2]="%k shot a lethal snowball into %o's head."
	DeathStrings[3]="%o took a lick of %k's ice bullet, it didn't stick to the bullet, just shattered his tongue."
	TagMultiplier=0.4000000
	TagDuration=0.4000000
	bHeaddie=true
	WeaponClass=Class'BWBP_SKC_Pro.SX45Pistol'
	DeathString="%o was force fed %k's SX45K bullets."
	FemaleSuicide="%o somehow shot herself."
	MaleSuicide="%o managed to shoot himself."
	bAlwaysSevers=true
	bSpecial=true
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.BulletImpacts.Headshot'
}
