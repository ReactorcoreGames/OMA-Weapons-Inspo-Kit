class DTR9000ERifleHead extends DT_BWBullet
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
	DeathStrings[0]="%o got some unwanted tracheotomy from %k's sniper rifle."
	DeathStrings[1]="%k adapted to the situation and sniped off %o's head."
	DeathStrings[2]="%o failed to see the glint of %k's Chimera and got a bullet to the eye."
	DeathStrings[3]="%k's Chimera was a carnivore and took a bite out of %o's brains."
	DeathStrings[4]="%o took %k's .338 to the teeth, shattering the cavities to pieces."
	DeathStrings[5]="%k had no reason to amp %kh rifle to nail %o right between the eyes."
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
