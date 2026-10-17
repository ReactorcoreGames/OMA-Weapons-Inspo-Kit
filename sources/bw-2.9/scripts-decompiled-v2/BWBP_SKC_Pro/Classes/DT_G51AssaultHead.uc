class DT_G51AssaultHead extends DT_BWBullet
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
	DeathStrings[0]="%o got %vh brain shredded by %k's G51."
	DeathStrings[1]="%o lost his head thanks to %k's G51."
	DeathStrings[2]="%k's G51 lifted %o's head off %vh shoulders."
	bHeaddie=true
	WeaponClass=Class'BWBP_SKC_Pro.G51Carbine'
	DeathString="%o got %vh brain shredded by %k's G51."
	FemaleSuicide="%o saw a bullet coming up the barrel of her G51."
	MaleSuicide="%o saw a bullet coming up the barrel of his G51."
	bFastInstantHit=true
	bAlwaysSevers=true
	bSpecial=true
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.BulletImpacts.Headshot'
	GibPerterbation=0.2000000
	KDamageImpulse=1000.0000000
	VehicleDamageScaling=0.6500000
}
