class GameReplicationInfo extends ReplicationInfo
	native
	nativereplication
	config
	exportstructs
	notplaceable
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

const PROPNUM = 5;

var string GameName;
var string GameClass;
var bool bTeamGame;
var bool bStopCountDown;
var bool bMatchHasBegun;
var bool bTeamSymbolsUpdated;
var bool bNoTeamSkins;
var bool bForceTeamSkins;
var bool bForceNoPlayerLights;
var bool bAllowPlayerLights;
var bool bFastWeaponSwitching;
var bool bNoTeamChanges;
var int RemainingTime;
var int ElapsedTime;
var int RemainingMinute;
var float SecondCount;
var int GoalScore;
var int TimeLimit;
var int MaxLives;
var int MinNetPlayers;
var float WeaponBerserk;
var TeamInfo Teams[2];
var() globalconfig string ServerName;
var() globalconfig string ShortName;
var() globalconfig string AdminName;
var() globalconfig string AdminEmail;
var() globalconfig int ServerRegion;
var() globalconfig string FQDN;
var() globalconfig string MessageOfTheDay;
var() deprecated string MOTDLine1;
var() deprecated string MOTDLine2;
var() deprecated string MOTDLine3;
var() deprecated string MOTDLine4;
var Actor Winner;
var VoiceChatReplicationInfo VoiceReplicationInfo;
var() Texture TeamSymbols[2];
var() array<PlayerReplicationInfo> PRIArray;
var localized string GRIPropsDisplayText[5];
var localized string GRIPropDescText[5];
var Vector FlagPos;
var Actor.EFlagState FlagState[2];
var PlayerReplicationInfo FlagHolder[2];
var PlayerReplicationInfo FlagTarget;
var int MatchID;
var int BotDifficulty;

replication
{
	// Pos:0x000
	reliable if(bNetDirty && int(Role) == int(ROLE_Authority))
		FlagPos, FlagState, 
		FlagTarget, MatchID, 
		Teams, Winner, 
		bMatchHasBegun, bStopCountDown;

	// Pos:0x018
	reliable if((!bNetInitial && bNetDirty) && int(Role) == int(ROLE_Authority))
		RemainingMinute;

	// Pos:0x03D
	reliable if(bNetInitial && int(Role) == int(ROLE_Authority))
		AdminEmail, AdminName, 
		BotDifficulty, ElapsedTime, 
		FQDN, GameClass, 
		GameName, GoalScore, 
		MaxLives, MessageOfTheDay, 
		MinNetPlayers, RemainingTime, 
		ServerName, ServerRegion, 
		ShortName, TeamSymbols, 
		TimeLimit, VoiceReplicationInfo, 
		WeaponBerserk, bAllowPlayerLights, 
		bFastWeaponSwitching, bForceNoPlayerLights, 
		bForceTeamSkins, bNoTeamChanges, 
		bNoTeamSkins, bTeamGame;
}

simulated function PostNetBeginPlay()
{
	local PlayerReplicationInfo PRI;

	Level.GRI = self;
	// End:0x30
	if(VoiceReplicationInfo == none)
	{
		// End:0x2F
		foreach DynamicActors(Class'Engine.VoiceChatReplicationInfo', VoiceReplicationInfo)
		{
			// End:0x2F
			break;			
		}		
	}
	// End:0x4C
	foreach DynamicActors(Class'Engine.PlayerReplicationInfo', PRI)
	{
		AddPRI(PRI);		
	}	
	// End:0x6C
	if(int(Level.NetMode) == int(NM_Client))
	{
		TeamSymbolNotify();
	}
	//return;	
}

simulated function TeamSymbolNotify()
{
	local Actor A;

	// End:0x0F
	if(TeamSymbols[0] == none)
	{
		return;
	}
	bTeamSymbolsUpdated = true;
	// End:0x38
	foreach AllActors(Class'Engine.Actor', A)
	{
		A.SetGRI(self);		
	}	
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(TeamSymbols[0]);
	Level.AddPrecacheMaterial(TeamSymbols[1]);
	//return;	
}

simulated function PostBeginPlay()
{
	super(Actor).PostBeginPlay();
	MessageOfTheDay = Repl(MessageOfTheDay, Chr(160), " ");
	// End:0x5B
	if(int(Level.NetMode) == int(NM_Client))
	{
		ServerName = "";
		AdminName = "";
		AdminEmail = "";
		FQDN = "";
		MessageOfTheDay = "";
	}
	SecondCount = Level.TimeSeconds;
	SetTimer(Level.TimeDilation, true);
	//return;	
}

function Reset()
{
	super(Actor).Reset();
	Winner = none;
	//return;	
}

simulated function Timer()
{
	local int i;
	local PlayerReplicationInfo OldHolder[2];
	local PlayerController C;

	// End:0x82
	if(int(Level.NetMode) == int(NM_Client))
	{
		ElapsedTime++;
		// End:0x3D
		if(RemainingMinute != 0)
		{
			RemainingTime = RemainingMinute;
			RemainingMinute = 0;
		}
		// End:0x5C
		if((RemainingTime > 0) && !bStopCountDown)
		{
			RemainingTime--;
		}
		// End:0x6D
		if(!bTeamSymbolsUpdated)
		{
			TeamSymbolNotify();
		}
		SetTimer(Level.TimeDilation, true);		
	}
	else
	{
		// End:0x1BA
		if(int(Level.NetMode) != int(NM_Standalone))
		{
			OldHolder[0] = FlagHolder[0];
			OldHolder[1] = FlagHolder[1];
			FlagHolder[0] = none;
			FlagHolder[1] = none;
			i = 0;
			J0xD2:

			// End:0x151 [Loop If]
			if(i < PRIArray.Length)
			{
				// End:0x147
				if((PRIArray[i].HasFlag != none) && PRIArray[i].Team != none)
				{
					FlagHolder[PRIArray[i].Team.TeamIndex] = PRIArray[i];
				}
				i++;
				// [Loop Continue]
				goto J0xD2;
			}
			i = 0;
			J0x158:

			// End:0x1BA [Loop If]
			if(i < 2)
			{
				// End:0x1B0
				if(OldHolder[i] != FlagHolder[i])
				{
					// End:0x1AF
					foreach __NFUN_325__(Class'Engine.PlayerController', C)
					{
						C.ClientUpdateFlagHolder(FlagHolder[i], i);						
					}					
				}
				i++;
				// [Loop Continue]
				goto J0x158;
			}
		}
	}
	//return;	
}

simulated function PlayerReplicationInfo FindPlayerByID(int PlayerID)
{
	local int i;

	i = 0;
	J0x07:

	// End:0x4B [Loop If]
	if(i < PRIArray.Length)
	{
		// End:0x41
		if(PRIArray[i].PlayerID == PlayerID)
		{
			return PRIArray[i];
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	return none;
	//return;	
}

simulated function AddPRI(PlayerReplicationInfo PRI)
{
	local byte NewVoiceID;
	local int i;

	// End:0xA0
	if((int(Level.NetMode) == int(NM_ListenServer)) || int(Level.NetMode) == int(NM_DedicatedServer))
	{
		i = 0;
		J0x3B:

		// End:0x8C [Loop If]
		if(i < PRIArray.Length)
		{
			// End:0x82
			if(int(PRIArray[i].VoiceID) == int(NewVoiceID))
			{
				i = -1;
				NewVoiceID++;
				// [Explicit Continue]
			}
			i++;
			// [Loop Continue]
			goto J0x3B;
		}
		PRI.VoiceID = NewVoiceID;
	}
	PRIArray[PRIArray.Length] = PRI;
	//return;	
}

simulated function RemovePRI(PlayerReplicationInfo PRI)
{
	local int i;

	i = 0;
	J0x07:

	// End:0x44 [Loop If]
	if(i < PRIArray.Length)
	{
		// End:0x3A
		if(PRIArray[i] == PRI)
		{
			PRIArray.Remove(i, 1);
			return;
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	Log(("GameReplicationInfo::RemovePRI() pri=" $ string(PRI)) $ " not found.", 'Error');
	//return;	
}

simulated function GetPRIArray(out array<PlayerReplicationInfo> pris)
{
	local int i, Num;

	pris.Remove(0, pris.Length);
	i = 0;
	J0x14:

	// End:0x58 [Loop If]
	if(i < PRIArray.Length)
	{
		// End:0x4E
		if(PRIArray[i] != none)
		{
			pris[Num++] = PRIArray[i];
		}
		i++;
		// [Loop Continue]
		goto J0x14;
	}
	//return;	
}

static function FillPlayInfo(PlayInfo PlayInfo)
{
	local int i;

	super(Info).FillPlayInfo(PlayInfo);
	PlayInfo.AddSetting(default.ServerGroup, "ServerName", default.GRIPropsDisplayText[i++], byte(255), 1, "Text", "60",, true);
	PlayInfo.AddSetting(default.ServerGroup, "AdminName", default.GRIPropsDisplayText[i++], byte(255), 1, "Text", "40",, true, true);
	PlayInfo.AddSetting(default.ServerGroup, "AdminEmail", default.GRIPropsDisplayText[i++], byte(255), 1, "Text", "60",, true, true);
	PlayInfo.AddSetting(default.ServerGroup, "MessageOfTheDay", default.GRIPropsDisplayText[i++], 251, 1, "Custom", "255;;GUI2K4.MOTDConfigPage",, true, true);
	PlayInfo.AddSetting(default.ServerGroup, "FQDN", default.GRIPropsDisplayText[i++], byte(255), 1, "Text", "100",, true, true);
	//return;	
}

static event string GetDescriptionText(string PropName)
{
	switch(PropName)
	{
		// End:0x1E
		case "ServerName":
			return default.GRIPropDescText[0];
		// End:0x34
		case "AdminName":
			return default.GRIPropDescText[1];
		// End:0x4C
		case "AdminEmail":
			return default.GRIPropDescText[2];
		// End:0x69
		case "MessageOfTheDay":
			return default.GRIPropDescText[3];
		// End:0x7B
		case "FQDN":
			return default.GRIPropDescText[4];
		// End:0xFFFF
		default:
			return super(Info).GetDescriptionText(PropName);
			break;
	}
	//return;	
}

defaultproperties
{
	bStopCountDown=true
	WeaponBerserk=1.0000000
	ServerName="UT2004 Server"
	ShortName="Server"
	AdminEmail="Non-disclosed"
	GRIPropsDisplayText[0]="Server Name"
	GRIPropsDisplayText[1]="Admin Name"
	GRIPropsDisplayText[2]="Admin E-Mail"
	GRIPropsDisplayText[3]="MOTD"
	GRIPropsDisplayText[4]="FQDN"
	GRIPropDescText[0]="Server name shown on server browser."
	GRIPropDescText[1]="Server administrator's name"
	GRIPropDescText[2]="Server administrator's email address."
	GRIPropDescText[3]="Message of the Day"
	GRIPropDescText[4]="Fully Qualified Domain name (if not using static IPv4)"
	BotDifficulty=-1
}
