class DTZX98RifleHead extends DT_BWBullet
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
	DeathStrings[0]="The soul and brains in %o's head was freed thanks to %k."
	DeathStrings[1]="%o put two bullets in %k's eyes, %ke had no drachma to pay the ferryman."
	DeathStrings[2]="%k's gray matter was reaped due to %o's Reaper."
	DeathStrings[3]="%o's Reaper took %k's head off with a couple of bullets."
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
