class TeamInfo extends ReplicationInfo
	native
	nativereplication
	notplaceable
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var localized string TeamName;
var int Size;
var float Score;
var int TeamIndex;
var Color TeamColor;
var Color AltTeamColor;
var Actor HomeBase;
var() Class<Pawn> DefaultPlayerClass;
var localized string ColorNames[4];

replication
{
	// Pos:0x000
	reliable if(bNetDirty && int(Role) == int(ROLE_Authority))
		HomeBase, Score;

	// Pos:0x018
	reliable if(bNetInitial && int(Role) == int(ROLE_Authority))
		AltTeamColor, TeamColor, 
		TeamIndex, TeamName;
}

function bool BelongsOnTeam(Class<Pawn> PawnClass)
{
	return true;
	//return;	
}

simulated function string GetHumanReadableName()
{
	// End:0x36
	if(TeamName == default.TeamName)
	{
		// End:0x27
		if(TeamIndex < 4)
		{
			return ColorNames[TeamIndex];
		}
		return TeamName @ string(TeamIndex);
	}
	return TeamName;
	//return;	
}

function bool AddToTeam(Controller Other)
{
	local Controller P;
	local bool bSuccess;

	// End:0x26
	if(Other == none)
	{
		Log("Added none to team!!!");
		return false;
	}
	// End:0x67
	if(MessagingSpectator(Other) != none)
	{
		Log("Messaging spectator so returning false", 'VoiceChat');
		return false;
	}
	Size++;
	Other.PlayerReplicationInfo.Team = self;
	Other.PlayerReplicationInfo.NetUpdateTime = Level.TimeSeconds - float(1);
	bSuccess = false;
	// End:0xEA
	if(Other.IsA('PlayerController'))
	{
		Other.PlayerReplicationInfo.TeamID = 0;		
	}
	else
	{
		Other.PlayerReplicationInfo.TeamID = 1;
	}
	J0x103:

	// End:0x213 [Loop If]
	if(!bSuccess)
	{
		bSuccess = true;
		// End:0x1D2
		foreach __NFUN_325__(Class'Engine.Controller', P)
		{
			// End:0x1D1
			if((((P.bIsPlayer && P != Other) && P.PlayerReplicationInfo != none) && P.PlayerReplicationInfo.Team == Other.PlayerReplicationInfo.Team) && P.PlayerReplicationInfo.TeamID == Other.PlayerReplicationInfo.TeamID)
			{
				bSuccess = false;
			}			
		}		
		// End:0x210
		if(!bSuccess)
		{
			Other.PlayerReplicationInfo.TeamID = Other.PlayerReplicationInfo.TeamID + 1;
		}
		// [Loop Continue]
		goto J0x103;
	}
	// End:0x276
	if((PlayerController(Other) != none) && Level.Game.VoiceReplicationInfo != none)
	{
		Level.Game.VoiceReplicationInfo.NotifyTeamChange(Other.PlayerReplicationInfo, TeamIndex);
	}
	return true;
	//return;	
}

function RemoveFromTeam(Controller Other)
{
	Size--;
	//return;	
}

static function SetCharacters(array<string> Chars)
{
	//return;	
}

static function GetAllCharacters(out array<string> Chars)
{
	//return;	
}

defaultproperties
{
	TeamName="Team"
	TeamColor=(R=255,G=0,B=0,A=255)
	AltTeamColor=(R=200,G=0,B=0,A=255)
	ColorNames[0]="Red"
	ColorNames[1]="Blue"
	ColorNames[2]="Green"
	ColorNames[3]="Gold"
	NetUpdateFrequency=2.0000000
}
