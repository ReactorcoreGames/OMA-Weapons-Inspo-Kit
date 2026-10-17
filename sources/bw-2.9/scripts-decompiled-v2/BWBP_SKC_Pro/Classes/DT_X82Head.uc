class DT_X82Head extends DT_BWBullet
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
	DeathStrings[0]="%k blew %o's skull away with a .50 Cal bullet."
	DeathStrings[1]="%o was decapitated by %k's anti-materiel round."
	DeathStrings[2]="%k scored a .50 Cal headshot on hapless %o."
	HipString="Luck"
	AimedString="Scoped"
	AimDisplacementDuration=0.7500000
	TagMultiplier=0.5000000
	TagDuration=0.2500000
	bSnipingDamage=true
	bHeaddie=true
	InvasionDamageScaling=2.0000000
	DamageIdent="Sniper"
	WeaponClass=Class'BWBP_SKC_Pro.X82Rifle'
	DeathString="%k blew %o's skull away with a .50 Cal bullet."
	FemaleSuicide="%o shot herself in the head while cleaning her gun."
	MaleSuicide="%o shot himself in the head while cleaning his gun."
	bFastInstantHit=true
	bAlwaysSevers=true
	bSpecial=true
	bExtraMomentumZ=true
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.BulletImpacts.Headshot'
	GibPerterbation=0.2000000
	KDamageImpulse=10000.0000000
	VehicleDamageScaling=0.6500000
}
