class DTM99RifleHead extends DT_BWBullet
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
	DeathStrings[0]="%o's head was completely destroyed by %k's M99-ECS."
	DeathStrings[1]="%k's M99 popped %o's juicy, watermelon-like head."
	DeathStrings[2]="%k blasted %o's head right off %vh shoulders with a M99-ECS round."
	bHeaddie=true
	WeaponClass=Class'BWBP_JCF_Pro.M99Rifle'
	DeathString="%o's head was completely destroyed by %k's M99-ECS."
	FemaleSuicide="%o sniped off her own head."
	MaleSuicide="%o sniped off his own head."
	bArmorStops=false
	bAlwaysSevers=true
	bSpecial=true
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.BulletImpacts.Headshot'
	KDamageImpulse=2000.0000000
}
