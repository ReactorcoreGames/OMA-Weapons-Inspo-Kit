class DT_FC01Head extends DT_BWBullet
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
	DeathStrings[0]="%k filled %o's mind with the truth and about 30 bullets."
	DeathStrings[1]="%o's gray matter didn't need photon tech to scramble %vh gray matter, %k's 5.7mm lead works."
	DeathStrings[2]="%k reduced %o's skull into bony shrapnel without them ever noticing."
	DeathStrings[3]="One by one, %o got shot in the head by %k's experimental PDW until they died."
	bHeaddie=true
	WeaponClass=Class'BWBP_OP_Pro.FC01SmartGun'
	DeathString="%k furiously machinegunned %o's head off."
	FemaleSuicide="%o shot herself in the head with the FC01-B."
	MaleSuicide="%o shot himself in the head with the FC01-B."
	bFastInstantHit=true
	bAlwaysSevers=true
	bSpecial=true
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.BulletImpacts.Headshot'
}
