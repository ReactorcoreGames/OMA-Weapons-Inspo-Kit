class DT_FG50Controlled extends DT_BWBullet
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
	DeathStrings[0]="%k's FG50 sent a huge round through %o's head."
	DeathStrings[1]="%k's FG50 popped %o's head like a little grape."
	DeathStrings[2]="%o lost more than half %vh head to %k's FG50 round."
	DeathStrings[3]="%o's brains were sauteed by %k's FG50 incendiary ammo."
	SimpleKillString="FG50 Machinegun Controlled"
	TagMultiplier=0.5000000
	TagDuration=0.2500000
	bIgniteFires=true
	bHeaddie=true
	DamageIdent="Machinegun"
	DamageDescription=",Bullet,Flame,"
	WeaponClass=Class'BWBP_SKC_Pro.FG50MachineGun'
	DeathString="%k's FG50 sent a huge round through %o's head."
	FemaleSuicide="%o's FG50 took her head off."
	MaleSuicide="%o's FG50 took his head off."
	bFastInstantHit=true
	bAlwaysSevers=true
	GibModifier=1.2000000
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.BulletImpacts.Headshot'
	GibPerterbation=0.2000000
	KDamageImpulse=1000.0000000
	VehicleDamageScaling=0.5000000
}
