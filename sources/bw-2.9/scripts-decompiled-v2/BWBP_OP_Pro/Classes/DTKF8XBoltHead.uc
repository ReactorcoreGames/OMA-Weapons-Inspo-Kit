class DTKF8XBoltHead extends DT_BWBullet
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
	DeathStrings[0]="%o was assassinated from the shadows by %k's KF-8X bolt."
	DeathStrings[1]="%k planted a crossbow bolt into %o head."
	DeathStrings[2]="%o was discreetly decommissioned by %k's silent bolt."
	DeathStrings[3]="%k planted a crossbow dart between %o's eyes."
	SimpleKillString="KF-8X Crossbow Bolt"
	bHeaddie=true
	InvasionDamageScaling=2.0000000
	DamageIdent="Sniper"
	WeaponClass=Class'BWBP_OP_Pro.KF8XCrossbow'
	DeathString="%o was assassinated from the shadows by %k's KF-8X bolt."
	FemaleSuicide="%o dropped her own crossbow."
	MaleSuicide="%o dropped his own crossbow."
	bFastInstantHit=true
	bDelayedDamage=true
	GibPerterbation=0.1000000
	KDamageImpulse=10000.0000000
}
