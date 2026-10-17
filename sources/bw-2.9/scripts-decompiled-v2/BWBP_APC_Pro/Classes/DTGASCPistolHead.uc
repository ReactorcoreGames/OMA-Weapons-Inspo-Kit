class DTGASCPistolHead extends DT_BWBullet
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
	DeathStrings[0]="%o's head was whisked away by %k's GASC round."
	DeathStrings[1]="%k whipped %o's head off with %kh GASC pistol."
	DeathStrings[2]="%k's GASC round cleared away %o's cranium."
	bHeaddie=true
	DamageIdent="Pistol"
	WeaponClass=Class'BWBP_APC_Pro.GASCPistol'
	DeathString="%o's head was whisked away by %k's GASC round."
	FemaleSuicide="%o blew her ugly face off with an GASC."
	MaleSuicide="%o blew his ugly face off with an GASC."
	bAlwaysSevers=true
	bSpecial=true
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.BulletImpacts.Headshot'
	VehicleDamageScaling=0.0000000
}
