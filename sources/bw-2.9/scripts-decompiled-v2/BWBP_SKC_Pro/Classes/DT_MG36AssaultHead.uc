class DT_MG36AssaultHead extends DT_BWBullet
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
	DeathStrings[0]="%k spotted %o. with night vision and put a bullet through his skull."
	DeathStrings[1]="%o's skull became the next target for %k's MG36."
	DeathStrings[2]="%k quietly turned %o's skull into mincemeat."
	DeathStrings[3]="%o head is now a trophy for %k's collection."
	bHeaddie=true
	DamageIdent="Assault"
	WeaponClass=Class'BWBP_SKC_Pro.MG36Machinegun'
	DeathString="%k spotted %o. with night vision and put a bullet through his skull."
	FemaleSuicide="%o took the easy way out."
	MaleSuicide="%o took the easy way out."
	bFastInstantHit=true
	bAlwaysSevers=true
	bSpecial=true
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.BulletImpacts.Headshot'
	GibPerterbation=0.2000000
	KDamageImpulse=1000.0000000
	VehicleDamageScaling=1.0000000
}
