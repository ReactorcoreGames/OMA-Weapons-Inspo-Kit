class DTMarlinRifleHead_Gauss extends DT_BWBullet
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
	DeathStrings[0]="%k accelerated a Redwood round into %o's head."
	DeathStrings[1]="%k popped %o's head with %kh upgraded hunting rifle."
	DeathStrings[2]="%o's skull was ruptured by %k's gauss Deermaster."
	DeathStrings[3]="%k hunted out %o's head with %kh custom gauss Redwood."
	SimpleKillString="Redwood Gauss Head"
	TagDuration=0.2000000
	bSnipingDamage=true
	bHeaddie=true
	InvasionDamageScaling=2.0000000
	DamageIdent="Sniper"
	WeaponClass=Class'BallisticProV55.MarlinRifle'
	DeathString="%k accelerated a Redwood round into %o's head."
	FemaleSuicide="%o plucked her head off with a Deermaster."
	MaleSuicide="%o plucked his head off with a Deermaster."
	bAlwaysSevers=true
	bSpecial=true
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.BulletImpacts.Headshot'
	KDamageImpulse=2000.0000000
	VehicleDamageScaling=0.2500000
}
