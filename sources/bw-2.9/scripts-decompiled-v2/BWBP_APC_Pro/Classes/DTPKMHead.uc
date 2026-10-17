class DTPKMHead extends DT_BWBullet
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
	DeathStrings[0]="%o's head was cleaned out of any political thoughts by %k's PKMA."
	DeathStrings[1]="%k purged %o's mind of negative feelings and gray matter."
	DeathStrings[2]="%o got %vh skull shattered by %k's heavy PKMA boolets."
	DeathStrings[3]="%k's PKMA cleared %k's pores and brains."
	bHeaddie=true
	DamageIdent="Machinegun"
	WeaponClass=Class'BWBP_APC_Pro.PKMMachinegun'
	DeathString="%k furiously machinegunned %o's head off."
	FemaleSuicide="%o shot herself in the head with the PKM."
	MaleSuicide="%o shot himself in the head with the PKM."
	bFastInstantHit=true
	bAlwaysSevers=true
	bSpecial=true
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.BulletImpacts.Headshot'
}
