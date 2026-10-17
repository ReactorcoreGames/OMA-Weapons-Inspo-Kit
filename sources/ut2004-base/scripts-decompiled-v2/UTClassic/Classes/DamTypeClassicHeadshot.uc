class DamTypeClassicHeadshot extends WeaponDamageType
	abstract;

var Class<LocalMessage> KillerMessage;
var Sound Headhunter;

static function IncrementKills(Controller Killer)
{
	local xPlayerReplicationInfo xPRI;

	// End:0x12
	if(PlayerController(Killer) == none)
	{
		return;
	}
	PlayerController(Killer).ReceiveLocalizedMessage(default.KillerMessage, 0, Killer.PlayerReplicationInfo, none, none);
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
	KillerMessage=Class'XGame.SpecialKillMessage'
	WeaponClass=Class'UTClassic.ClassicSniperRifle'
	DeathString="%k put a bullet in %o's skull."
	FemaleSuicide="%o shot herself in the head."
	MaleSuicide="%o shot himself in the head."
	ThemSuicide="%o shot themself in the head."
	bAlwaysSevers=true
	bSpecial=true
	VehicleDamageScaling=0.6500000
}
