class DTSRKSmgHead extends DT_BWBullet
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
	DeathStrings[0]="%k used %kh super 205 to remove %o's head clean off."
	DeathStrings[1]="%o's brains were entombed in %k's 10mm lead casket."
	DeathStrings[2]="%k got backsplattered from headshotting %o in CQC."
	DeathStrings[3]="%o had some dental work by %k, having %vh teeth replaced by 10mm bullets."
	DeathStrings[4]="%k put two bullets in %o's eyes to blind %vm before dying."
	bHeaddie=true
	WeaponClass=Class'BWBP_APC_Pro.SRKSubMachinegun'
	DeathString="%o got %vh brain shredded by %k's SRK-205."
	FemaleSuicide="%o saw a bullet coming up the barrel of her SRK-205."
	MaleSuicide="%o saw a bullet coming up the barrel of his SRK-205."
	bFastInstantHit=true
	bAlwaysSevers=true
	bSpecial=true
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.BulletImpacts.Headshot'
	GibPerterbation=0.2000000
	KDamageImpulse=1000.0000000
	VehicleDamageScaling=0.6500000
}
