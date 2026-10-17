class DTZX98GaussHead extends DT_BWBullet
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
	DeathStrings[0]="%o went dark on %k due to having %vh mind blown by the Reaper."
	DeathStrings[1]="%k's Reaper punched a fist-sized hole into %o's tiny head."
	DeathStrings[2]="%o's mind couldn't handle the gauss tech used by %k's Reaper."
	DeathStrings[3]="%k popped off on %o, taking his head off %vh shoulders."
	EffectChance=0.5000000
	bHeaddie=true
	DamageIdent="Assault"
	WeaponClass=Class'BWBP_APC_Pro.ZX98AssaultRifle'
	DeathString="%k badgered %o's head off."
	FemaleSuicide="%o routed herself."
	MaleSuicide="%o routed himself."
	bFastInstantHit=true
	bAlwaysSevers=true
	bSpecial=true
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.BulletImpacts.Headshot'
	GibPerterbation=0.2000000
	KDamageImpulse=1000.0000000
}
