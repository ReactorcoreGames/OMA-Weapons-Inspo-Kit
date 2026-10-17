class DTBulldogHead extends DT_BWBullet
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
	DeathStrings[0]="%k's Bulldog tore %o's head clean off."
	DeathStrings[1]="%k blasted a huge chunk out of %o's head with a BOLT."
	DeathStrings[2]="%o's head was eaten up by %k's Bulldog."
	DeathStrings[3]="%k blew %o's head into a wall with one BOLT round."
	TagMultiplier=0.5000000
	TagDuration=0.2500000
	bHeaddie=true
	InvasionDamageScaling=2.0000000
	DamageIdent="Ordnance"
	WeaponClass=Class'BWBP_SKC_Pro.BulldogAssaultCannon'
	DeathString="%o's head got eaten by %k's Bulldog."
	FemaleSuicide="%o is tactically inept with a Bulldog."
	MaleSuicide="%o is tactically inept with a Bulldog."
	bAlwaysSevers=true
	bSpecial=true
	bExtraMomentumZ=true
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.BulletImpacts.Headshot'
	VehicleDamageScaling=1.0000000
}
