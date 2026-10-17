class DT_FC01PhotonHead extends DT_BWBullet
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
	DeathStrings[0]="%o had their nervous system fried to the point where they couldn't reboot thanks to %k."
	DeathStrings[1]="%k scorched %o's memories with a photon burst until they went blank."
	DeathStrings[2]="%o became the guinea pig to %k's experimental photon burst, it was a success."
	DeathStrings[3]="%k got the results they wanted after subject %o to some mind altering photon tech."
	bHeaddie=true
	WeaponClass=Class'BWBP_OP_Pro.FC01SmartGun'
	DeathString="%o was torn to shreds by %k's FC01-B."
	FemaleSuicide="%o shot herself in the foot with the FC01-B."
	MaleSuicide="%o shot himself in the foot with the FC01-B."
	bFastInstantHit=true
	bAlwaysSevers=true
	bSpecial=true
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.BulletImpacts.Headshot'
}
