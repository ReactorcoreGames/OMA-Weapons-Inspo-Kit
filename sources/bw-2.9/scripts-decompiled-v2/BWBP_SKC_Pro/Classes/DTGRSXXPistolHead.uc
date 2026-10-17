class DTGRSXXPistolHead extends DT_BWBullet
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
	DeathStrings[0]="%o's head was objected to by %k's GRS-9."
	DeathStrings[1]="%k's GRS-9 liquidated %o's head."
	DeathStrings[2]="%o's head was struck off the role by %k's GRS-9."
	DeathStrings[3]="%k litigated %o's head off."
	bHeaddie=true
	InvasionDamageScaling=1.5000000
	DamageIdent="Pistol"
	WeaponClass=Class'BWBP_SKC_Pro.GRSXXPistol'
	DeathString="%k litigated %o's head off."
	FemaleSuicide="%o litigated her own head off."
	MaleSuicide="%o litigated his own head off."
	bAlwaysSevers=true
	bSpecial=true
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.BulletImpacts.Headshot'
}
