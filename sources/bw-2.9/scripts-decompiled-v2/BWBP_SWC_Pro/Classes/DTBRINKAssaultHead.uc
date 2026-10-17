class DTBRINKAssaultHead extends DT_BWBullet
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
	DeathStrings[0]="%o's head was ripped of by %k's Brink rifle."
	DeathStrings[1]="%k pulled out %kh Brink and %o's head fell off in terror."
	DeathStrings[2]="%o got %vh head blown clean off by %k's BR1NK assault rifle."
	bHeaddie=true
	DamageIdent="Assault"
	WeaponClass=Class'BWBP_SWC_Pro.BRINKAssaultRifle'
	DeathString="%o's head was ripped of by %k's Brink rifle."
	FemaleSuicide="%o looked down the mouth of her Brink."
	MaleSuicide="%o looked down the mouth of his Brink."
	bFastInstantHit=true
	bAlwaysSevers=true
	bSpecial=true
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.BulletImpacts.Headshot'
	GibPerterbation=0.2000000
	KDamageImpulse=1000.0000000
}
