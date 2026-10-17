class DTMJ51AssaultHead extends DT_BWBullet
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
	bHeaddie=true
	WeaponClass=Class'BWBP_APC_Pro.MJ51Carbine'
	DeathString="%o got %vh brain shredded by %k's MJ51."
	FemaleSuicide="%o saw a bullet coming up the barrel of her MJ51."
	MaleSuicide="%o saw a bullet coming up the barrel of his MJ51."
	bFastInstantHit=true
	bAlwaysSevers=true
	bSpecial=true
	GibPerterbation=0.2000000
	KDamageImpulse=1000.0000000
	VehicleDamageScaling=0.6500000
}
