class DamTypeRoadkill extends VehicleDamageType
	abstract;

var int MessageSwitchBase;
var int NumMessages;

static function string DeathMessage(PlayerReplicationInfo Killer, PlayerReplicationInfo Victim)
{
	// End:0x29
	if(default.VehicleClass != none)
	{
		return (default.DeathString @ default.VehicleClass.default.VehiclePositionString) $ ".";		
	}
	else
	{
		return default.DeathString $ ".";
	}
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
	DeathString="%k ran over %o"
	FemaleSuicide="%o ran over herself."
	MaleSuicide="%o ran over himself."
	ThemSuicide="%o ran over themself."
	bLocationalHit=false
	bKUseTearOffMomentum=true
	bNeverSevers=true
	bExtraMomentumZ=false
	bVehicleHit=true
	GibModifier=2.0000000
	GibPerterbation=0.5000000
	MessageClass=Class'Onslaught.ONSVehicleKillMessage'
}
