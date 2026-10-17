class DT_MP40Head_Incendiary extends DT_BWBullet
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
	DeathStrings[0]="%o wasn't just lobotomized by %k's FMP bullets, %ve was decapitated."
	DeathStrings[1]="%k executed the %o from the old guard with a fiery bullet to the back of the head."
	DeathStrings[2]="%o's brains were reduced to nothing after losing the war to %k."
	bIgniteFires=true
	bHeaddie=true
	WeaponClass=Class'BWBP_SKC_Pro.FMPMachinePistol'
	DeathString="%o was lobotomized by %k's FMP bullets."
	FemaleSuicide="%o shot herself in the face."
	MaleSuicide="%o shot himself in the face."
	bFastInstantHit=true
	bAlwaysSevers=true
	bSpecial=true
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.BulletImpacts.Headshot'
	GibPerterbation=0.2000000
	KDamageImpulse=1000.0000000
	VehicleDamageScaling=0.6500000
}
