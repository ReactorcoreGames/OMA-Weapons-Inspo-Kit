class DT_M2020HeadOff extends DT_BWBullet
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
	DeathStrings[0]="%o's head got in the way of %k's M2020 round."
	DeathStrings[1]="%k's M2020 opened %o's cranium"
	DeathStrings[2]="%k's M2020 wiped the smile clean off %o's face."
	HipString="Luck"
	AimedString="Scoped"
	bHeaddie=true
	DamageIdent="Sniper"
	WeaponClass=Class'BWBP_SKC_Pro.M2020GaussDMR'
	DeathString="%o's head got in the way of %k's M2020 round."
	FemaleSuicide="%o looked down her M2020 barrel."
	MaleSuicide="%o looked down his M2020 barrel."
	bAlwaysSevers=true
	bSpecial=true
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.BulletImpacts.Headshot'
	KDamageImpulse=1000.0000000
}
