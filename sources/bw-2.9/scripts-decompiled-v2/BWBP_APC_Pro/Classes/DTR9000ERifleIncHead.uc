class DTR9000ERifleIncHead extends DT_BWBullet
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
	DeathStrings[0]="%o had %vh brains sizzling by %k's incendiary magnum bullet to the head."
	DeathStrings[1]="%k roasted %o so much that %vh head exploded in a fiery ball."
	DeathStrings[2]="%o's gray matter was the primary ingredient of %k's crispy brains recipe."
	DeathStrings[3]="%k singed %o's tongue after force feeding %vm a very hot bullet down their throat."
	DeathStrings[4]="%o's cheeks were bright red after %k shot %vm with an incendiary amped Chimera."
	DeathStrings[5]="%k turned %o's head into a beacon after igniting %vh cranium."
	HipString="Luck"
	AimedString="Scoped"
	DisplacementType=1
	AimDisplacementDamageThreshold=150
	bSnipingDamage=true
	bHeaddie=true
	InvasionDamageScaling=2.0000000
	DamageIdent="Sniper"
	WeaponClass=Class'BWBP_APC_Pro.R9000ERifle'
	DeathString="%o's head was removed from the scene by %k's R9000-E."
	FemaleSuicide="%o sniped off her own head."
	MaleSuicide="%o sniped off his own head."
	bAlwaysSevers=true
	bSpecial=true
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.BulletImpacts.Headshot'
	KDamageImpulse=2000.0000000
	VehicleDamageScaling=0.1500000
}
