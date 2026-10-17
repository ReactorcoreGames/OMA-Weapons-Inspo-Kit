class DTR9A1RifleHead_Laser extends DT_BWBullet
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
	DeathStrings[0]="%k's tech R9A1 gave %o eye surgery."
	DeathStrings[1]="%k leveled %kh R9A1 at %o's head and blasted."
	DeathStrings[2]="%o got lobotomized by %k's R9A1 laser."
	SimpleKillString="R9A1 Laser Head"
	bHeaddie=true
	DamageIdent="Sniper"
	WeaponClass=Class'BWBP_OP_Pro.R9A1RangerRifle'
	DeathString="%k's tech R9A1 gave %o eye surgery."
	FemaleSuicide="%o lasered herself."
	MaleSuicide="%o lasered himself."
	bAlwaysSevers=true
	bSpecial=true
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.BulletImpacts.Headshot'
	KDamageImpulse=2000.0000000
}
