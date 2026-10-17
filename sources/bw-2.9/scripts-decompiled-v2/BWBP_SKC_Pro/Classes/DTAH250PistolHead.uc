class DTAH250PistolHead extends DT_BWBullet
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
	DeathStrings[0]="%k blasted away at %o's skull with %kh AH250."
	DeathStrings[1]="%k shot out %o's eye with %kh AH250."
	DeathStrings[2]="%o swallowed %k's AH250 Eagle round whole."
	DeathStrings[3]="%k gave a new meaning of 'Eagle Eye' to %o."
	bHeaddie=true
	WeaponClass=Class'BWBP_SKC_Pro.AH250Pistol'
	DeathString="%k blasted away at %o's skull with %kh AH250."
	FemaleSuicide="%o killed herself with the AH250."
	MaleSuicide="%o killed himself with the AH250."
	bAlwaysSevers=true
	bSpecial=true
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.BulletImpacts.Headshot'
	VehicleDamageScaling=0.1500000
}
