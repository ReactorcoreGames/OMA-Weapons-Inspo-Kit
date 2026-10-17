class DTR9A1RifleHead_Freeze extends DT_BWBullet
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
	DeathStrings[0]="%k sent a supersonic icicle through %o's head."
	DeathStrings[1]="%k leveled %kh R9 at %o and chilled %vm down."
	DeathStrings[2]="%o caught frostbite from %k's R9A1."
	DeathStrings[3]="%k sent %o's head to the freezer."
	DeathStrings[4]="%o's brainfreeze wasn't helped by %k's R9A1."
	SimpleKillString="R9A1 Freeze Head"
	bHeaddie=true
	DamageIdent="Sniper"
	WeaponClass=Class'BWBP_OP_Pro.R9A1RangerRifle'
	DeathString="%k sent a supersonic icicle through %o's head."
	FemaleSuicide="%o iced herself."
	MaleSuicide="%o iced himself."
	bAlwaysSevers=true
	bSpecial=true
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.BulletImpacts.Headshot'
	KDamageImpulse=2000.0000000
}
