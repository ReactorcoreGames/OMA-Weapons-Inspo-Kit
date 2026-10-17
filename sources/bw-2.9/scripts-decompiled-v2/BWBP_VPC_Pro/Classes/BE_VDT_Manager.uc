class BE_VDT_Manager extends VehicleDamageType;

var(KillMessages) localized array<localized string> DeathStrings;
var(KillMessages) localized array<localized string> FemaleSuicides;
var(KillMessages) localized array<localized string> MaleSuicides;
var int MessageSwitchBase;
var int NumMessages;

static function string DeathMessage(PlayerReplicationInfo Killer, PlayerReplicationInfo Victim)
{
	local string S;

	// End:0x23
	if(default.DeathStrings.Length > 0)
	{
		S = default.DeathStrings[Rand(default.DeathStrings.Length)];		
	}
	else
	{
		S = default.DeathString;
	}
	return S;
	//return;	
}

static function string SuicideMessage(PlayerReplicationInfo Victim)
{
	// End:0x26
	if(Victim.bIsFemale && default.FemaleSuicides.Length < 1)
	{
		return default.FemaleSuicide;
	}
	// End:0x38
	if(default.MaleSuicides.Length < 1)
	{
		return default.MaleSuicide;
	}
	// End:0x59
	if(Victim.bIsFemale)
	{
		return default.FemaleSuicides[Rand(default.FemaleSuicides.Length)];
	}
	return default.MaleSuicides[Rand(default.MaleSuicides.Length)];
	//return;	
}

static function ScoreKill(Controller Killer, Controller Killed)
{
	local TeamPlayerReplicationInfo TPRI;

	// End:0x11
	if(Killer == Killed)
	{
		return;
	}
	TPRI = TeamPlayerReplicationInfo(Killer.PlayerReplicationInfo);
	// End:0x89
	if(TPRI != none)
	{
		TPRI.ranovercount++;
		// End:0x89
		if((TPRI.ranovercount == 10) && UnrealPlayer(Killer) != none)
		{
			UnrealPlayer(Killer).ClientDelayedAnnouncementNamed('RoadRampage', 15);
			return;
		}
	}
	// End:0xC0
	if(PlayerController(Killer) != none)
	{
		PlayerController(Killer).ReceiveLocalizedMessage(default.MessageClass, Rand(default.NumMessages) + default.MessageSwitchBase);
	}
	//return;	
}

defaultproperties
{
	NumMessages=4
	bDetonatesGoop=true
	bKUseTearOffMomentum=true
	bExtraMomentumZ=false
	bDirectDamage=false
	TransientSoundVolume=1.0000000
	TransientSoundRadius=64.0000000
	MessageClass=Class'Onslaught.ONSVehicleKillMessage'
}
