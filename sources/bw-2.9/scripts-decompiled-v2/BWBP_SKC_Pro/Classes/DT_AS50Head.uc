class DT_AS50Head extends DT_BWBullet
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
	DeathStrings[0]="%k's FSSG-50 assassinated %o with a headshot."
	DeathStrings[1]="%k sent a FSSG-50 round clean through %o's skull."
	DeathStrings[2]="%k terminated %o with an accurate FSSG-50 headshot."
	DeathStrings[3]="%o unfortunately took %k's FSSG-50 round right to the face."
	HipString="Luck"
	AimedString="Scoped"
	FlashThreshold=90
	DisplacementType=1
	AimDisplacementDamageThreshold=100
	AimDisplacementDuration=0.7500000
	TagMultiplier=0.5000000
	TagDuration=0.2500000
	bIgniteFires=true
	bHeaddie=true
	InvasionDamageScaling=1.5000000
	DamageIdent="Sniper"
	DamageDescription=",Bullet,Flame,"
	WeaponClass=Class'BWBP_SKC_Pro.AS50Rifle'
	DeathString="%k's FSSG-50 assassinated %o with a headshot."
	FemaleSuicide="%o's FSSG-50 took her head off."
	MaleSuicide="%o's FSSG-50 took his head off."
	bFastInstantHit=true
	bAlwaysSevers=true
	bExtraMomentumZ=true
	GibModifier=1.2000000
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.BulletImpacts.Headshot'
	GibPerterbation=0.2000000
	KDamageImpulse=1000.0000000
	VehicleDamageScaling=0.5000000
}
