class DTR9000ERifleRadHead extends DT_BWBullet
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
	DeathStrings[0]="%o received brain cancer from %k's Chimera."
	DeathStrings[1]="%k found that radioactive magnum bullets are good for melting the flesh off of %o's face."
	DeathStrings[2]="%o's cranium was splattered and scattered by %k and their irradiated Chimera."
	DeathStrings[3]="%k made radioactive soup out of %o, using radiation and gray matter respectively."
	DeathStrings[4]="%o had %vh atoms and head separated from %vh shoulder by %k."
	DeathStrings[5]="%k's Chimera slurped %o's brains down like a milkshake."
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
