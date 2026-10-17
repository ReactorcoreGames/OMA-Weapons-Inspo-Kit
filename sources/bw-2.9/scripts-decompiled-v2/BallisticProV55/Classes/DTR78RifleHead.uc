class DTR78RifleHead extends DT_BWBullet
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
	DeathStrings[0]="%k's precision sniping sent %o's head spiralling into the distance."
	DeathStrings[1]="%k's R78 bullet turned %o's face into hamburger."
	DeathStrings[2]="%o's head was preyed upon by %k's Raven."
	DeathStrings[3]="%k's expert marksmanship brought an end to %o's paltry attempts at stealth."
	HipString="Luck"
	AimedString="Scoped"
	DisplacementType=1
	AimDisplacementDamageThreshold=150
	TagDuration=0.2000000
	bSnipingDamage=true
	bHeaddie=true
	InvasionDamageScaling=2.0000000
	DamageIdent="Sniper"
	WeaponClass=Class'BallisticProV55.R78Rifle'
	DeathString="%o's head was removed from the scene by %k's R78."
	FemaleSuicide="%o sniped off her own head."
	MaleSuicide="%o sniped off his own head."
	bAlwaysSevers=true
	bSpecial=true
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.BulletImpacts.Headshot'
	KDamageImpulse=2000.0000000
	VehicleDamageScaling=0.1500000
}
