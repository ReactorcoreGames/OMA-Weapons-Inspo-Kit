class DTM7A3RifleHead extends DT_BWBullet
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
	DeathStrings[0]="%o's melon was popped by %k's M7A3."
	DeathStrings[1]="%k exploded %o's head with %kh M7A3 AR."
	DeathStrings[2]="%k's M7A3 dismantled poor %o's head."
	DeathStrings[3]="%o got %vh head removed by %k's M7A3."
	DeathStrings[4]="%k put a round through %o's head."
	EffectChance=0.5000000
	bHeaddie=true
	WeaponClass=Class'BWBP_JCF_Pro.M7A3AssaultRifle'
	DeathString="%o's melon was popped by %k's M7A3."
	FemaleSuicide="%o headshottificated herself."
	MaleSuicide="%o headshottified himself."
	bFastInstantHit=true
	bAlwaysSevers=true
	bSpecial=true
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.BulletImpacts.Headshot'
	VehicleDamageScaling=0.6000000
}
