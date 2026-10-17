class GameInfo extends Info
	native
	config
	notplaceable
	hidedropdown
	cacheexempt
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

const GIPROPNUM = 15;
const COLOR_CODE_TAG = 27;

struct native export KeyValuePair
{
	var() string Key;
	var() string Value;
};

struct native export PlayerResponseLine
{
	var() int PlayerNum;
	var() string PlayerName;
	var() int Ping;
	var() int Score;
	var() int StatsID;
};

struct native export ServerResponseLine
{
	var() int ServerID;
	var() string IP;
	var() int Port;
	var() int QueryPort;
	var() string ServerName;
	var() string MapName;
	var() string GameType;
	var() int CurrentPlayers;
	var() int MaxPlayers;
	var() int Ping;
	var() int Flags;
	var() string SkillLevel;
	var() array<KeyValuePair> ServerInfo;
	var() array<PlayerResponseLine> PlayerInfo;
};

var bool bRestartLevel;
var bool bPauseable;
var config bool bWeaponStay;
var bool bCanChangeSkin;
var cache bool bTeamGame;
var bool bGameEnded;
var bool bOverTime;
var localized bool bAlternateMode;
var bool bCanViewOthers;
var bool bDelayedStart;
var bool bWaitingToStartMatch;
var globalconfig bool bChangeLevels;
var bool bAlreadyChanged;
var bool bLoggingGame;
var globalconfig bool bEnableStatLogging;
var config bool bAllowWeaponThrowing;
var globalconfig bool bAllowBehindView;
var globalconfig bool bAdminCanPause;
var bool bGameRestarted;
var globalconfig bool bWeaponShouldViewShake;
var bool bModViewShake;
var bool bForceClassicView;
var globalconfig bool bLowGore;
var bool bWelcomePending;
var bool bAttractCam;
var bool bMustJoinBeforeStart;
var bool bTestMode;
var bool bAllowVehicles;
var bool bAllowMPGameSpeed;
var bool bIsSaveGame;
var bool bLiberalVehiclePaths;
var globalconfig bool bLargeGameVOIP;
var globalconfig int GoreLevel;
var globalconfig float GameDifficulty;
var float AutoAim;
var globalconfig float GameSpeed;
var float StartTime;
var string DefaultPlayerClassName;
var string ScoreBoardType;
var string BotMenuType;
var cache string RulesMenuType;
var string SettingsMenuType;
var string GameUMenuType;
var string MultiplayerUMenuType;
var string GameOptionsMenuType;
var cache string HUDSettingsMenu;
var string HUDType;
var cache string MapListType;
var cache string MapPrefix;
var string BeaconName;
var localized string GoreLevelText[3];
var() int ResetCountDown;
var() config int ResetTimeDelay;
var globalconfig int MaxSpectators;
var int NumSpectators;
var globalconfig int MaxPlayers;
var int NumPlayers;
var int NumBots;
var int CurrentID;
var localized string DefaultPlayerName;
var float FearCostFallOff;
var config int GoalScore;
var config int MaxLives;
var config int TimeLimit;
var Class<LocalMessage> DeathMessageClass;
var Class<GameMessage> GameMessageClass;
var name OtherMesgGroup;
var string MutatorClass;
var Mutator BaseMutator;
var() globalconfig string AccessControlClass;
var AccessControl AccessControl;
var GameRules GameRulesModifiers;
var() string BroadcastHandlerClass;
var() Class<BroadcastHandler> BroadcastClass;
var BroadcastHandler BroadcastHandler;
var Class<PlayerController> PlayerControllerClass;
var string PlayerControllerClassName;
var() Class<GameReplicationInfo> GameReplicationInfoClass;
var GameReplicationInfo GameReplicationInfo;
var() Class<VoiceChatReplicationInfo> VoiceReplicationInfoClass;
var VoiceChatReplicationInfo VoiceReplicationInfo;
var globalconfig string MaplistHandlerType;
var Class<MaplistManagerBase> MaplistHandlerClass;
var transient MaplistManagerBase MaplistHandler;
var GameStats GameStats;
var globalconfig string GameStatsClass;
var transient string DemoCommand;
var globalconfig string SecurityClass;
var() localized cache string GameName;
var() localized cache string Description;
var() cache string ScreenShotName;
var() cache string DecoTextName;
var() cache string Acronym;
var globalconfig string VotingHandlerType;
var Class<VotingHandler> VotingHandlerClass;
var transient VotingHandler VotingHandler;
var() transient GameProfile CurrentGameProfile;
var() private const transient Manifest SaveGameManifest;
var localized string GIPropsDisplayText[15];
var localized string GIPropDescText[15];
var localized string GIPropsExtras[2];
var Vehicle VehicleList;
var string CallSigns[15];
var globalconfig string ServerSkillLevel;
var globalconfig float MaxIdleTime;
var localized string NoBindString;
var Color BindColor;

// Export UGameInfo::execGetSavedGames(FFrame&, void* const)
native final function Manifest GetSavedGames();

// Export UGameInfo::execCreateDataObject(FFrame&, void* const)
native final function Object CreateDataObject(Class objClass, string objName, string PackageName);

// Export UGameInfo::execDeleteDataObject(FFrame&, void* const)
native final function bool DeleteDataObject(Class objClass, string objName, string PackageName);

// Export UGameInfo::execLoadDataObject(FFrame&, void* const)
native final function Object LoadDataObject(Class objClass, string objName, string PackageName);

// Export UGameInfo::execAllDataObjects(FFrame&, void* const)
native final iterator function AllDataObjects(Class objClass, out Object obj, string PackageName);

// Export UGameInfo::execSavePackage(FFrame&, void* const)
native final function bool SavePackage(string PackageName);

// Export UGameInfo::execDeletePackage(FFrame&, void* const)
native final function bool DeletePackage(string PackageName);

// Export UGameInfo::execLoadMapList(FFrame&, void* const)
native static final function LoadMapList(string MapPrefix, out array<string> Maps);

// Export UGameInfo::execStripColor(FFrame&, void* const)
native static final function string StripColor(string S);

// Export UGameInfo::execMakeColorCode(FFrame&, void* const)
native static final function string MakeColorCode(Color NewColor);

// Export UGameInfo::execFromINIFormat(FFrame&, void* const)
native static final function string FromINIFormat(string S);

// Export UGameInfo::execGetCurrentTickRate(FFrame&, void* const)
native final function float GetCurrentTickRate();

// Export UGameInfo::execGetConfiguredTickRate(FFrame&, void* const)
native final function int GetConfiguredTickRate();

function PreBeginPlay()
{
	StartTime = 0.0000000;
	GameReplicationInfo = Spawn(GameReplicationInfoClass);
	Level.GRI = GameReplicationInfo;
	InitGameReplicationInfo();
	InitVoiceReplicationInfo();
	InitLogging();
	//return;	
}

function Destroyed()
{
	CurrentGameProfile = none;
	super(Actor).Destroyed();
	//return;	
}

function UpdatePrecacheMaterials()
{
	PrecacheGameTextures(Level);
	//return;	
}

function UpdatePrecacheStaticMeshes()
{
	PrecacheGameStaticMeshes(Level);
	//return;	
}

static function PrecacheGameTextures(LevelInfo MyLevel)
{
	//return;	
}

static function PrecacheGameStaticMeshes(LevelInfo MyLevel)
{
	//return;	
}

static function PrecacheGameAnnouncements(AnnouncerVoice V, bool bRewardSounds)
{
	//return;	
}

function string FindPlayerByID(int PlayerID)
{
	local PlayerReplicationInfo PRI;

	PRI = GameReplicationInfo.FindPlayerByID(PlayerID);
	// End:0x34
	if(PRI != none)
	{
		return PRI.PlayerName;
	}
	return "";
	//return;	
}

function ChangeMap(int ContextID)
{
	local MapList MyList;
	local Class<MapList> ML;
	local string MapString;

	ML = Class<MapList>(DynamicLoadObject(MapListType, Class'Core.Class'));
	MyList = Spawn(ML);
	MapString = MyList.GetMap(ContextID);
	MyList.Destroy();
	// End:0x5D
	if(MapString == "")
	{
		return;
	}
	Level.ServerTravel(MapString, false);
	//return;	
}

static function bool UseLowGore()
{
	return (default.bAlternateMode || default.bLowGore) || default.GoreLevel < 2;
	//return;	
}

static function bool NoBlood()
{
	return default.GoreLevel == 0;
	//return;	
}

function PostBeginPlay()
{
	// End:0x1F
	if(MaxIdleTime > float(0))
	{
		MaxIdleTime = FMax(MaxIdleTime, 30.0000000);
	}
	// End:0x48
	if(GameStats != none)
	{
		GameStats.NewGame();
		GameStats.ServerInfo();
	}
	// End:0x6C
	if(DemoCommand != "")
	{
		ConsoleCommand("demorec" @ DemoCommand, true);
	}
	//return;	
}

function Reset()
{
	super(Actor).Reset();
	bGameEnded = false;
	bOverTime = false;
	bWaitingToStartMatch = true;
	InitGameReplicationInfo();
	InitVoiceReplicationInfo();
	//return;	
}

function InitLogging()
{
	local Class<GameStats> MyGameStatsClass;

	// End:0x50
	if(((!bEnableStatLogging || !bLoggingGame) || int(Level.NetMode) == int(NM_Standalone)) || int(Level.NetMode) == int(NM_ListenServer))
	{
		return;
	}
	MyGameStatsClass = Class<GameStats>(DynamicLoadObject(GameStatsClass, Class'Core.Class'));
	// End:0xB2
	if(MyGameStatsClass != none)
	{
		GameStats = Spawn(MyGameStatsClass);
		// End:0xAF
		if(GameStats == none)
		{
			Log("Could to create Stats Object");
		}		
	}
	else
	{
		Log(("Error loading GameStats [" $ GameStatsClass) $ "]");
	}
	//return;	
}

function Timer()
{
	local NavigationPoint N;
	local int i;

	// End:0x11A
	if(bWelcomePending)
	{
		bWelcomePending = false;
		// End:0x11A
		if(int(Level.NetMode) != int(NM_Standalone))
		{
			i = 0;
			J0x31:

			// End:0x11A [Loop If]
			if(i < GameReplicationInfo.PRIArray.Length)
			{
				// End:0x110
				if((GameReplicationInfo.PRIArray[i] != none) && !GameReplicationInfo.PRIArray[i].bWelcomed)
				{
					GameReplicationInfo.PRIArray[i].bWelcomed = true;
					// End:0xEF
					if(!GameReplicationInfo.PRIArray[i].bOnlySpectator)
					{
						BroadcastLocalizedMessage(GameMessageClass, 1, GameReplicationInfo.PRIArray[i]);
						// [Explicit Continue]
						goto J0x110;
					}
					BroadcastLocalizedMessage(GameMessageClass, 16, GameReplicationInfo.PRIArray[i]);
				}
				J0x110:

				i++;
				// [Loop Continue]
				goto J0x31;
			}
		}
	}
	BroadcastHandler.UpdateSentText();
	N = Level.NavigationPointList;
	J0x13D:

	// End:0x174 [Loop If]
	if(N != none)
	{
		N.FearCost *= FearCostFallOff;
		N = N.nextNavigationPoint;
		// [Loop Continue]
		goto J0x13D;
	}
	//return;	
}

event GameEnding()
{
	EndLogging("serverquit");
	//return;	
}

event KickIdler(PlayerController PC)
{
	Log("Kicking idle player " $ PC.PlayerReplicationInfo.PlayerName);
	AccessControl.DefaultKickReason = AccessControl.IdleKickReason;
	AccessControl.KickPlayer(PC);
	AccessControl.DefaultKickReason = AccessControl.default.DefaultKickReason;
	//return;	
}

function InitGameReplicationInfo()
{
	GameReplicationInfo.bTeamGame = bTeamGame;
	GameReplicationInfo.GameName = GameName;
	GameReplicationInfo.GameClass = string(Class);
	GameReplicationInfo.MaxLives = MaxLives;
	//return;	
}

function InitVoiceReplicationInfo()
{
	Log((string(Name) @ "VoiceReplicationInfo created:") @ string(VoiceReplicationInfo), 'VoiceChat');
	//return;	
}

function InitMaplistHandler()
{
	//return;	
}

// Export UGameInfo::execGetNetworkNumber(FFrame&, void* const)
native function string GetNetworkNumber();

function GetServerInfo(out ServerResponseLine ServerState)
{
	local int RealSkillLevel;

	ServerState.ServerName = FromINIFormat(GameReplicationInfo.ServerName);
	ServerState.MapName = Left(string(Level), InStr(string(Level), "."));
	ServerState.GameType = Mid(string(Class), InStr(string(Class), ".") + 1);
	ServerState.CurrentPlayers = GetNumPlayers();
	ServerState.MaxPlayers = MaxPlayers;
	ServerState.IP = "";
	ServerState.Port = GetServerPort();
	RealSkillLevel = Clamp(int(ServerSkillLevel), 0, 2);
	ServerState.SkillLevel = string(RealSkillLevel);
	ServerState.ServerInfo.Length = 0;
	ServerState.PlayerInfo.Length = 0;
	//return;	
}

function int GetNumPlayers()
{
	return NumPlayers;
	//return;	
}

function GetServerDetails(out ServerResponseLine ServerState)
{
	local Mutator M;
	local GameRules G;

	AddServerDetail(ServerState, "ServerMode", Eval(int(Level.NetMode) == int(NM_ListenServer), "non-dedicated", "dedicated"));
	AddServerDetail(ServerState, "AdminName", GameReplicationInfo.AdminName);
	AddServerDetail(ServerState, "AdminEmail", GameReplicationInfo.AdminEmail);
	// End:0xC6
	if(GameReplicationInfo.FQDN != "")
	{
		AddServerDetail(ServerState, "FQDN", GameReplicationInfo.FQDN);
	}
	AddServerDetail(ServerState, "ServerVersion", Level.EngineVersion);
	AddServerDetail(ServerState, "TickRate", (string(GetCurrentTickRate()) @ "/") @ string(GetConfiguredTickRate()));
	// End:0x158
	if((AccessControl != none) && AccessControl.RequiresPassword())
	{
		AddServerDetail(ServerState, "GamePassword", "True");
	}
	AddServerDetail(ServerState, "GameStats", string(GameStats != none));
	// End:0x1C0
	if((AllowGameSpeedChange()) && GameSpeed != 1.0000000)
	{
		AddServerDetail(ServerState, "GameSpeed", string(float(int(GameSpeed * float(100))) / 100.0000000));
	}
	AddServerDetail(ServerState, "MaxSpectators", string(MaxSpectators));
	// End:0x200
	if(VotingHandler != none)
	{
		VotingHandler.GetServerDetails(ServerState);
	}
	M = BaseMutator;
	J0x20B:

	// End:0x241 [Loop If]
	if(M != none)
	{
		M.GetServerDetails(ServerState);
		M = M.NextMutator;
		// [Loop Continue]
		goto J0x20B;
	}
	G = GameRulesModifiers;
	J0x24C:

	// End:0x282 [Loop If]
	if(G != none)
	{
		G.GetServerDetails(ServerState);
		G = G.NextGameRules;
		// [Loop Continue]
		goto J0x24C;
	}
	//return;	
}

function GetServerPlayers(out ServerResponseLine ServerState)
{
	local Mutator M;
	local Controller C;
	local PlayerReplicationInfo PRI;
	local int i, TeamFlag[2];

	i = ServerState.PlayerInfo.Length;
	TeamFlag[0] = 1 << 29;
	TeamFlag[1] = TeamFlag[0] << 1;
	// End:0x1A4
	foreach __NFUN_325__(Class'Engine.Controller', C)
	{
		PRI = C.PlayerReplicationInfo;
		// End:0x1A3
		if(((PRI != none) && !PRI.bBot) && MessagingSpectator(C) == none)
		{
			ServerState.PlayerInfo.Length = i + 1;
			ServerState.PlayerInfo[i].PlayerNum = C.PlayerNum;
			ServerState.PlayerInfo[i].PlayerName = PRI.PlayerName;
			ServerState.PlayerInfo[i].Score = int(PRI.Score);
			ServerState.PlayerInfo[i].Ping = 4 * int(PRI.Ping);
			// End:0x19C
			if(bTeamGame && PRI.Team != none)
			{
				ServerState.PlayerInfo[i].StatsID = ServerState.PlayerInfo[i].StatsID | TeamFlag[PRI.Team.TeamIndex];
			}
			i++;
		}		
	}	
	M = BaseMutator.NextMutator;
	J0x1B9:

	// End:0x1EF [Loop If]
	if(M != none)
	{
		M.GetServerPlayers(ServerState);
		M = M.NextMutator;
		// [Loop Continue]
		goto J0x1B9;
	}
	//return;	
}

function int GetServerPort()
{
	local string S;
	local int i;

	S = Level.GetAddressURL();
	i = InStr(S, ":");
	assert(i >= 0);
	return int(Mid(S, i + 1));
	//return;	
}

function bool SetPause(bool bPause, PlayerController P)
{
	// End:0xA0
	if((bPauseable || bAdminCanPause && P.IsA('Admin') || P.PlayerReplicationInfo.bAdmin) || int(Level.NetMode) == int(NM_Standalone))
	{
		// End:0x8B
		if(bPause)
		{
			Level.Pauser = P.PlayerReplicationInfo;			
		}
		else
		{
			Level.Pauser = none;
		}
		return true;		
	}
	else
	{
		return false;
	}
	//return;	
}

function bool AllowGameSpeedChange()
{
	// End:0x1E
	if(int(Level.NetMode) == int(NM_Standalone))
	{
		return true;		
	}
	else
	{
		return bAllowMPGameSpeed;
	}
	//return;	
}

function SetGameSpeed(float t)
{
	local float OldSpeed;

	// End:0x38
	if(!AllowGameSpeedChange())
	{
		Level.TimeDilation = 1.1000000;
		GameSpeed = 1.0000000;
		default.GameSpeed = GameSpeed;		
	}
	else
	{
		OldSpeed = GameSpeed;
		GameSpeed = FMax(t, 0.1000000);
		Level.TimeDilation = 1.1000000 * GameSpeed;
		// End:0x99
		if(GameSpeed != OldSpeed)
		{
			default.GameSpeed = GameSpeed;
			Class'Engine.GameInfo'.static.StaticSaveConfig();
		}
	}
	SetTimer(Level.TimeDilation, true);
	//return;	
}

event DetailChange()
{
	local Actor A;
	local ZoneInfo Z;

	// End:0x76
	if(int(Level.DetailMode) == int(0))
	{
		// End:0x72
		foreach DynamicActors(Class'Engine.Actor', A)
		{
			// End:0x71
			if((A.bHighDetail || A.bSuperHighDetail) && !A.bGameRelevant)
			{
				A.Destroy();
			}			
		}				
	}
	else
	{
		// End:0xD5
		if(int(Level.DetailMode) == int(1))
		{
			// End:0xD4
			foreach DynamicActors(Class'Engine.Actor', A)
			{
				// End:0xD3
				if(A.bSuperHighDetail && !A.bGameRelevant)
				{
					A.Destroy();
				}				
			}			
		}
	}
	// End:0xF5
	foreach AllActors(Class'Engine.ZoneInfo', Z)
	{
		Z.LinkToSkybox();		
	}	
	//return;	
}

static function bool GrabOption(out string Options, out string Result)
{
	// End:0x8A
	if(Left(Options, 1) == "?")
	{
		Result = Mid(Options, 1);
		// End:0x45
		if(InStr(Result, "?") >= 0)
		{
			Result = Left(Result, InStr(Result, "?"));
		}
		Options = Mid(Options, 1);
		// End:0x7D
		if(InStr(Options, "?") >= 0)
		{
			Options = Mid(Options, InStr(Options, "?"));			
		}
		else
		{
			Options = "";
		}
		return true;		
	}
	else
	{
		return false;
	}
	//return;	
}

static function GetKeyValue(string Pair, out string Key, out string Value)
{
	// End:0x44
	if(InStr(Pair, "=") >= 0)
	{
		Key = Left(Pair, InStr(Pair, "="));
		Value = Mid(Pair, InStr(Pair, "=") + 1);		
	}
	else
	{
		Key = Pair;
		Value = "";
	}
	//return;	
}

static function string ParseOption(string Options, string InKey)
{
	local string Pair, Key, Value;

	J0x00:
	// End:0x40 [Loop If]
	if(GrabOption(Options, Pair))
	{
		GetKeyValue(Pair, Key, Value);
		// End:0x3D
		if(Key ~= InKey)
		{
			return Value;
		}
		// [Loop Continue]
		goto J0x00;
	}
	return "";
	//return;	
}

static function bool HasOption(string Options, string InKey)
{
	local string Pair, Key, Value;

	J0x00:
	// End:0x3C [Loop If]
	if(GrabOption(Options, Pair))
	{
		GetKeyValue(Pair, Key, Value);
		// End:0x39
		if(Key ~= InKey)
		{
			return true;
		}
		// [Loop Continue]
		goto J0x00;
	}
	return false;
	//return;	
}

event InitGame(string Options, out string Error)
{
	local string InOpt, LeftOpt;
	local int pos;
	local Class<AccessControl> ACClass;
	local Class<GameRules> GRClass;
	local bool bIsTutorial;

	InOpt = ParseOption(Options, "SaveGame");
	// End:0xDA
	if((InOpt != "") && CurrentGameProfile == none)
	{
		CurrentGameProfile = LoadDataObject(Class'Engine.GameProfile', "GameProfile", InOpt);
		// End:0x7A
		if(CurrentGameProfile != none)
		{
			CurrentGameProfile.Initialize(self, InOpt);			
		}
		else
		{
			Log("SINGLEPLAYER GameInfo::InitGame failed to find GameProfile" @ InOpt);
		}
		// End:0xDA
		if(!CurrentGameProfile.bInLadderGame)
		{
			CurrentGameProfile = none;
		}
	}
	// End:0x104
	if((CurrentGameProfile == none) && Left(string(Level), 3) ~= "TUT")
	{
		bIsTutorial = true;
	}
	MaxPlayers = Clamp(GetIntOption(Options, "MaxPlayers", MaxPlayers), 0, 256);
	MaxSpectators = Clamp(GetIntOption(Options, "MaxSpectators", MaxSpectators), 0, 256);
	GameDifficulty = FMax(0.0000000, float(GetIntOption(Options, "Difficulty", int(GameDifficulty))));
	// End:0x1C8
	if((CurrentGameProfile != none) || bIsTutorial)
	{
		// End:0x1BD
		if(CurrentGameProfile != none)
		{
			GameDifficulty = CurrentGameProfile.Difficulty;
		}
		SetGameSpeed(1.0000000);
	}
	AddMutator(MutatorClass);
	BroadcastClass = Class<BroadcastHandler>(DynamicLoadObject(BroadcastHandlerClass, Class'Core.Class'));
	default.BroadcastClass = BroadcastClass;
	BroadcastHandler = Spawn(BroadcastClass);
	InOpt = ParseOption(Options, "AccessControl");
	// End:0x24E
	if(InOpt != "")
	{
		ACClass = Class<AccessControl>(DynamicLoadObject(InOpt, Class'Core.Class'));
	}
	// End:0x28A
	if(ACClass == none)
	{
		ACClass = Class<AccessControl>(DynamicLoadObject(AccessControlClass, Class'Core.Class'));
		// End:0x28A
		if(ACClass == none)
		{
			ACClass = Class'Engine.AccessControl';
		}
	}
	LeftOpt = ParseOption(Options, "AdminName");
	InOpt = ParseOption(Options, "AdminPassword");
	// End:0x2F1
	if((LeftOpt != "") && InOpt != "")
	{
		ACClass.default.bDontAddDefaultAdmin = true;
	}
	// End:0x373
	if((int(Level.NetMode) == int(NM_ListenServer)) || int(Level.NetMode) == int(NM_DedicatedServer))
	{
		AccessControl = Spawn(ACClass);
		// End:0x373
		if(((AccessControl != none) && LeftOpt != "") && InOpt != "")
		{
			AccessControl.SetAdminFromURL(LeftOpt, InOpt);
		}
	}
	SetGameSpeed(1.0000000);
	InOpt = ParseOption(Options, "GameRules");
	// End:0x49E
	if(InOpt != "")
	{
		Log("Game Rules" @ InOpt);
		J0x3BB:

		// End:0x49E [Loop If]
		if(InOpt != "")
		{
			pos = InStr(InOpt, ",");
			// End:0x415
			if(pos > 0)
			{
				LeftOpt = Left(InOpt, pos);
				InOpt = Right(InOpt, (Len(InOpt) - pos) - 1);				
			}
			else
			{
				LeftOpt = InOpt;
				InOpt = "";
			}
			Log("Add game rules " $ LeftOpt);
			GRClass = Class<GameRules>(DynamicLoadObject(LeftOpt, Class'Core.Class'));
			// End:0x49B
			if(GRClass != none)
			{
				// End:0x484
				if(GameRulesModifiers == none)
				{
					GameRulesModifiers = Spawn(GRClass);					
				}
				else
				{
					GameRulesModifiers.AddGameRules(Spawn(GRClass));
				}
			}
			// [Loop Continue]
			goto J0x3BB;
		}
	}
	InOpt = ParseOption(Options, "Mutator");
	// End:0x553
	if(InOpt != "")
	{
		Log("Mutators" @ InOpt);
		J0x4D7:

		// End:0x553 [Loop If]
		if(InOpt != "")
		{
			pos = InStr(InOpt, ",");
			// End:0x531
			if(pos > 0)
			{
				LeftOpt = Left(InOpt, pos);
				InOpt = Right(InOpt, (Len(InOpt) - pos) - 1);				
			}
			else
			{
				LeftOpt = InOpt;
				InOpt = "";
			}
			AddMutator(LeftOpt, true);
			// [Loop Continue]
			goto J0x4D7;
		}
	}
	// End:0x5B4
	if((CurrentGameProfile == none) && !bIsTutorial)
	{
		InOpt = ParseOption(Options, "GameSpeed");
		// End:0x5B4
		if(InOpt != "")
		{
			Log("GameSpeed" @ InOpt);
			SetGameSpeed(float(InOpt));
		}
	}
	InOpt = ParseOption(Options, "GamePassword");
	// End:0x617
	if((InOpt != "") && AccessControl != none)
	{
		AccessControl.SetGamePassword(InOpt);
		Log("GamePassword" @ InOpt);
	}
	InOpt = ParseOption(Options, "AllowThrowing");
	// End:0x651
	if(InOpt != "")
	{
		bAllowWeaponThrowing = bool(InOpt);
	}
	InOpt = ParseOption(Options, "AllowBehindview");
	// End:0x68D
	if(InOpt != "")
	{
		bAllowBehindView = bool(InOpt);
	}
	InOpt = ParseOption(Options, "GameStats");
	// End:0x6C3
	if(InOpt != "")
	{
		bEnableStatLogging = bool(InOpt);
	}
	Log("GameInfo::InitGame : bEnableStatLogging" @ string(bEnableStatLogging));
	// End:0x729
	if(HasOption(Options, "DemoRec"))
	{
		DemoCommand = ParseOption(Options, "DemoRec");
	}
	// End:0x74B
	if(HasOption(Options, "AttractCam"))
	{
		bAttractCam = true;
	}
	InitMaplistHandler();
	InOpt = ParseOption(Options, "VotingHandler");
	// End:0x798
	if(InOpt != "")
	{
		VotingHandlerClass = Class<VotingHandler>(DynamicLoadObject(InOpt, Class'Core.Class'));
	}
	// End:0x7F9
	if(VotingHandlerClass == none)
	{
		// End:0x7CD
		if(VotingHandlerType != "")
		{
			VotingHandlerClass = Class<VotingHandler>(DynamicLoadObject(VotingHandlerType, Class'Core.Class'));			
		}
		else
		{
			VotingHandlerClass = Class<VotingHandler>(DynamicLoadObject("Engine.VotingHandler", Class'Core.Class'));
		}
	}
	Class'Engine.GameInfo'.default.VotingHandlerClass = VotingHandlerClass;
	// End:0x88A
	if(((int(Level.NetMode) != int(NM_Standalone)) && VotingHandlerClass != none) && VotingHandlerClass.static.IsEnabled())
	{
		VotingHandler = Spawn(VotingHandlerClass);
		// End:0x88A
		if(VotingHandler == none)
		{
			Log("WARNING: Failed to spawn VotingHandler");
		}
	}
	bTestMode = HasOption(Options, "CheckErrors");
	//return;	
}

function AddMutator(string mutname, optional bool bUserAdded)
{
	local Class<Mutator> mutClass;
	local Mutator mut;

	// End:0x12
	if(!AllowMutator(mutname))
	{
		return;
	}
	mutClass = Class<Mutator>(DynamicLoadObject(mutname, Class'Core.Class'));
	// End:0x3A
	if(mutClass == none)
	{
		return;
	}
	// End:0x105
	if((mutClass.default.GroupName != "") && BaseMutator != none)
	{
		mut = BaseMutator;
		J0x67:

		// End:0x105 [Loop If]
		if(mut != none)
		{
			// End:0xEE
			if(mut.GroupName == mutClass.default.GroupName)
			{
				Log((("Not adding " $ string(mutClass)) $ " because already have a mutator in the same group - ") $ string(mut));
				return;
			}
			mut = mut.NextMutator;
			// [Loop Continue]
			goto J0x67;
		}
	}
	mut = BaseMutator;
	J0x110:

	// End:0x19A [Loop If]
	if(mut != none)
	{
		// End:0x183
		if(mut.Class == mutClass)
		{
			Log((("Not adding " $ string(mutClass)) $ " because this mutator is already added - ") $ string(mut));
			return;
		}
		mut = mut.NextMutator;
		// [Loop Continue]
		goto J0x110;
	}
	mut = Spawn(mutClass);
	// End:0x1B5
	if(mut == none)
	{
		return;
	}
	mut.bUserAdded = bUserAdded;
	// End:0x1E4
	if(BaseMutator == none)
	{
		BaseMutator = mut;		
	}
	else
	{
		BaseMutator.AddMutator(mut);
	}
	//return;	
}

function AddGameModifier(GameRules NewRule)
{
	// End:0x0D
	if(NewRule == none)
	{
		return;
	}
	// End:0x2F
	if(GameRulesModifiers != none)
	{
		GameRulesModifiers.AddGameRules(NewRule);		
	}
	else
	{
		GameRulesModifiers = NewRule;
	}
	//return;	
}

event string GetBeaconText()
{
	return (((((((Level.ComputerName $ " ") $ Left(Level.Title, 24)) $ "\\t") $ BeaconName) $ "\\t") $ string(GetNumPlayers())) $ "/") $ string(MaxPlayers);
	//return;	
}

function ProcessServerTravel(string URL, bool bItems)
{
	local PlayerController P, LocalPlayer;

	BaseMutator.ServerTraveling(URL, bItems);
	EndLogging("mapchange");
	Log("ProcessServerTravel:" @ URL);
	// End:0xCD
	foreach DynamicActors(Class'Engine.PlayerController', P)
	{
		// End:0xB2
		if(NetConnection(P.Player) != none)
		{
			P.ClientTravel(Eval(InStr(URL, "?") > 0, Left(URL, InStr(URL, "?")), URL), 2, bItems);
			// End:0xCC
			continue;
		}
		LocalPlayer = P;
		P.PreClientTravel();		
	}	
	// End:0x1A1
	if((int(Level.NetMode) == int(NM_ListenServer)) && LocalPlayer != none)
	{
		Level.NextURL = (((((((Level.NextURL $ "?Team=") $ LocalPlayer.GetDefaultURL("Team")) $ "?Name=") $ LocalPlayer.GetDefaultURL("Name")) $ "?Class=") $ LocalPlayer.GetDefaultURL("Class")) $ "?Character=") $ LocalPlayer.GetDefaultURL("Character");
	}
	// End:0x1E9
	if((int(Level.NetMode) != int(NM_DedicatedServer)) && int(Level.NetMode) != int(NM_ListenServer))
	{
		Level.NextSwitchCountdown = 0.0000000;
	}
	//return;	
}

event PreLogin(string Options, string Address, string PlayerID, out string Error, out string FailCode)
{
	local bool bSpectator;

	bSpectator = (ParseOption(Options, "SpectatorOnly")) ~= "1";
	// End:0x5F
	if(AccessControl != none)
	{
		AccessControl.PreLogin(Options, Address, PlayerID, Error, FailCode, bSpectator);
	}
	//return;	
}

function int GetIntOption(string Options, string ParseString, int CurrentValue)
{
	local string InOpt;

	InOpt = ParseOption(Options, ParseString);
	// End:0x2A
	if(InOpt != "")
	{
		return int(InOpt);
	}
	return CurrentValue;
	//return;	
}

function bool BecomeSpectator(PlayerController P)
{
	// End:0x9C
	if((((((P.PlayerReplicationInfo == none) || !GameReplicationInfo.bMatchHasBegun) || NumSpectators >= MaxSpectators) || P.IsInState('GameEnded')) || P.IsInState('RoundEnded')) || P.PlayerReplicationInfo.bOnlySpectator)
	{
		P.ReceiveLocalizedMessage(GameMessageClass, 12);
		return false;
	}
	// End:0xC4
	if(GameStats != none)
	{
		GameStats.DisconnectEvent(P.PlayerReplicationInfo);
	}
	P.PlayerReplicationInfo.bOnlySpectator = true;
	NumSpectators++;
	NumPlayers--;
	return true;
	//return;	
}

function bool AllowBecomeActivePlayer(PlayerController P)
{
	// End:0xCA
	if(((((((((P.PlayerReplicationInfo == none) || !GameReplicationInfo.bMatchHasBegun) || bMustJoinBeforeStart) || NumPlayers >= MaxPlayers) || MaxLives > 0) || P.IsInState('GameEnded')) || P.IsInState('RoundEnded')) || P.bTempSpec) || !P.PlayerReplicationInfo.bOnlySpectator)
	{
		P.ReceiveLocalizedMessage(GameMessageClass, 13);
		return false;
	}
	return true;
	//return;	
}

function bool AtCapacity(bool bSpectator)
{
	// End:0x1B
	if(int(Level.NetMode) == int(NM_Standalone))
	{
		return false;
	}
	// End:0x5C
	if(bSpectator)
	{
		return (NumSpectators >= MaxSpectators) && (int(Level.NetMode) != int(NM_ListenServer)) || NumPlayers > 0;		
	}
	else
	{
		return (MaxPlayers > 0) && NumPlayers >= MaxPlayers;
	}
	//return;	
}

function InitSavedLevel()
{
	// End:0x28
	if(Level.GRI == none)
	{
		Level.GRI = GameReplicationInfo;
	}
	// End:0x58
	if(Level.ObjectPool == none)
	{
		Level.ObjectPool = new (XLevel) Class'Engine.ObjectPool';
	}
	//return;	
}

event PlayerController Login(string Portal, string Options, out string Error)
{
	local NavigationPoint StartSpot;
	local PlayerController NewPlayer, TestPlayer;
	local string InName, InAdminName, InPassword, InChecksum, InCharacter, InSex;

	local byte InTeam;
	local bool bSpectator, bAdmin;
	local Class<Security> MySecurityClass;
	local Pawn TestPawn;

	Options = StripColor(Options);
	BaseMutator.ModifyLogin(Portal, Options);
	InName = Left(ParseOption(Options, "Name"), 20);
	InTeam = byte(GetIntOption(Options, "Team", 255));
	InAdminName = ParseOption(Options, "AdminName");
	InPassword = ParseOption(Options, "Password");
	InChecksum = ParseOption(Options, "Checksum");
	// End:0x19D
	if(HasOption(Options, "Load"))
	{
		Log("Loading Savegame");
		InitSavedLevel();
		bIsSaveGame = true;
		// End:0x19C
		foreach DynamicActors(Class'Engine.PlayerController', TestPlayer)
		{
			// End:0x19B
			if((TestPlayer.Player == none) && TestPlayer.PlayerOwnerName ~= InName)
			{
				TestPawn = TestPlayer.Pawn;
				// End:0x168
				if(TestPawn != none)
				{
					TestPawn.SetRotation(TestPawn.Controller.Rotation);
				}
				Log(("FOUND " $ string(TestPlayer)) @ TestPlayer.PlayerReplicationInfo.PlayerName);				
				return TestPlayer;
			}			
		}		
	}
	bSpectator = (ParseOption(Options, "SpectatorOnly")) ~= "1";
	// End:0x1E9
	if(AccessControl != none)
	{
		bAdmin = AccessControl.CheckOptionsAdmin(Options);
	}
	// End:0x21B
	if(!bAdmin && AtCapacity(bSpectator))
	{
		Error = GameMessageClass.default.MaxedOutMessage;
		return none;
	}
	// End:0x238
	if(bAdmin && AtCapacity(false))
	{
		bSpectator = true;
	}
	InTeam = PickTeam(InTeam, none);
	StartSpot = FindPlayerStart(none, InTeam, Portal);
	// End:0x282
	if(StartSpot == none)
	{
		Error = GameMessageClass.default.FailedPlaceMessage;
		return none;
	}
	// End:0x2A8
	if(PlayerControllerClass == none)
	{
		PlayerControllerClass = Class<PlayerController>(DynamicLoadObject(PlayerControllerClassName, Class'Core.Class'));
	}
	NewPlayer = Spawn(PlayerControllerClass,,, StartSpot.Location, StartSpot.Rotation);
	// End:0x32C
	if(NewPlayer == none)
	{
		Log("Couldn't spawn player controller of class " $ string(PlayerControllerClass));
		Error = GameMessageClass.default.FailedSpawnMessage;
		return none;
	}
	NewPlayer.StartSpot = StartSpot;
	NewPlayer.GameReplicationInfo = GameReplicationInfo;
	MySecurityClass = Class<Security>(DynamicLoadObject(SecurityClass, Class'Core.Class'));
	// End:0x3E3
	if(MySecurityClass != none)
	{
		NewPlayer.PlayerSecurity = Spawn(MySecurityClass, NewPlayer);
		// End:0x3E0
		if(NewPlayer.PlayerSecurity == none)
		{
			Log("Could not spawn security for player " $ string(NewPlayer), 'Security');
		}		
	}
	else
	{
		// End:0x43E
		if(SecurityClass == "")
		{
			Log("No value for Engine.GameInfo.SecurityClass -- System is not secure.", 'Security');			
		}
		else
		{
			Log(("Unknown security class [" $ SecurityClass) $ "] -- System is not secure.", 'Security');
		}
	}
	// End:0x4A0
	if(bAttractCam)
	{
		NewPlayer.GotoState('AttractMode');		
	}
	else
	{
		NewPlayer.GotoState('Spectating');
	}
	// End:0x4C7
	if(InName == "")
	{
		InName = DefaultPlayerName;
	}
	// End:0x514
	if((int(Level.NetMode) != int(NM_Standalone)) || NewPlayer.PlayerReplicationInfo.PlayerName == DefaultPlayerName)
	{
		ChangeName(NewPlayer, InName, false);
	}
	NewPlayer.PlayerReplicationInfo.VoiceTypeName = ParseOption(Options, "Voice");
	InCharacter = ParseOption(Options, "Character");
	NewPlayer.SetPawnClass(DefaultPlayerClassName, InCharacter);
	InSex = ParseOption(Options, "Sex");
	// End:0x5A9
	if(Left(InSex, 3) ~= "F")
	{
		NewPlayer.SetPawnFemale();
	}
	NewPlayer.PlayerReplicationInfo.PlayerID = CurrentID++;
	// End:0x663
	if((bSpectator || NewPlayer.PlayerReplicationInfo.bOnlySpectator) || !ChangeTeam(NewPlayer, int(InTeam), false))
	{
		NewPlayer.PlayerReplicationInfo.bOnlySpectator = true;
		NewPlayer.PlayerReplicationInfo.bIsSpectator = true;
		NewPlayer.PlayerReplicationInfo.bOutOfLives = true;
		NumSpectators++;
		return NewPlayer;
	}
	NewPlayer.StartSpot = StartSpot;
	// End:0x6BE
	if((AccessControl != none) && AccessControl.AdminLogin(NewPlayer, InAdminName, InPassword))
	{
		AccessControl.AdminEntered(NewPlayer, InAdminName);
	}
	NumPlayers++;
	// End:0x6D9
	if(NumPlayers > 20)
	{
		bLargeGameVOIP = true;
	}
	bWelcomePending = true;
	// End:0x6F0
	if(bTestMode)
	{
		TestLevel();
	}
	// End:0x70F
	if(bDelayedStart)
	{
		NewPlayer.GotoState('PlayerWaiting');
		return NewPlayer;
	}
	return NewPlayer;
	//return;	
}

function TestLevel()
{
	local Actor A, Found;
	local bool bFoundErrors;

	// End:0x53
	foreach AllActors(Class'Engine.Actor', A)
	{
		bFoundErrors = bFoundErrors || A.CheckForErrors();
		// End:0x52
		if(bFoundErrors && Found == none)
		{
			Found = A;
		}		
	}	
	// End:0x6C
	if(bFoundErrors)
	{
		Found.Crash();
	}
	//return;	
}

function StartMatch()
{
	local Controller P;
	local PlayerController PC;
	local Actor A;

	// End:0x1A
	if(GameStats != none)
	{
		GameStats.StartGame();
	}
	// End:0x3A
	foreach AllActors(Class'Engine.Actor', A)
	{
		A.MatchStarting();		
	}	
	// End:0x8C
	foreach __NFUN_325__(Class'Engine.PlayerController', PC)
	{
		// End:0x8B
		if(PC.Pawn == none)
		{
			// End:0x6E
			if(bGameEnded)
			{				
				return;
				// End:0x8B
				continue;
			}
			// End:0x8B
			if(PC.CanRestartPlayer())
			{
				RestartPlayer(PC);
			}
		}		
	}	
	// End:0x104
	foreach __NFUN_325__(Class'Engine.Controller', P)
	{
		// End:0x103
		if(P.bIsPlayer && !P.IsA('PlayerController'))
		{
			// End:0xEE
			if(int(Level.NetMode) == int(NM_Standalone))
			{
				RestartPlayer(P);
				// End:0x103
				continue;
			}
			P.GotoState('Dead', 'MPStart');
		}		
	}	
	bWaitingToStartMatch = false;
	GameReplicationInfo.bMatchHasBegun = true;
	//return;	
}

function bool PlayerCanRestart(PlayerController aPlayer)
{
	return true;
	//return;	
}

function bool PlayerCanRestartGame(PlayerController aPlayer)
{
	return true;
	//return;	
}

function RestartPlayer(Controller aPlayer)
{
	local NavigationPoint StartSpot;
	local int TeamNum;
	local Class<Pawn> DefaultPlayerClass;
	local Vehicle V, Best;
	local Vector ViewDir;
	local float BestDist, Dist;

	// End:0x41
	if((bRestartLevel && int(Level.NetMode) != int(NM_DedicatedServer)) && int(Level.NetMode) != int(NM_ListenServer))
	{
		return;
	}
	// End:0x7F
	if((aPlayer.PlayerReplicationInfo == none) || aPlayer.PlayerReplicationInfo.Team == none)
	{
		TeamNum = 255;		
	}
	else
	{
		TeamNum = aPlayer.PlayerReplicationInfo.Team.TeamIndex;
	}
	StartSpot = FindPlayerStart(aPlayer, byte(TeamNum));
	// End:0xE8
	if(StartSpot == none)
	{
		Log(" Player start not found!!!");
		return;
	}
	// End:0x133
	if((aPlayer.PreviousPawnClass != none) && aPlayer.PawnClass != aPlayer.PreviousPawnClass)
	{
		BaseMutator.PlayerChangedClass(aPlayer);
	}
	// End:0x185
	if(aPlayer.PawnClass != none)
	{
		aPlayer.Pawn = Spawn(aPlayer.PawnClass,,, StartSpot.Location, StartSpot.Rotation);
	}
	// End:0x1DF
	if(aPlayer.Pawn == none)
	{
		DefaultPlayerClass = GetDefaultPlayerClass(aPlayer);
		aPlayer.Pawn = Spawn(DefaultPlayerClass,,, StartSpot.Location, StartSpot.Rotation);
	}
	// End:0x278
	if(aPlayer.Pawn == none)
	{
		Log((("Couldn't spawn player of type " $ string(aPlayer.PawnClass)) $ " at ") $ string(StartSpot));
		aPlayer.GotoState('Dead');
		// End:0x276
		if(PlayerController(aPlayer) != none)
		{
			PlayerController(aPlayer).ClientGotoState('Dead', 'Begin');
		}
		return;
	}
	// End:0x2A1
	if(PlayerController(aPlayer) != none)
	{
		PlayerController(aPlayer).TimeMargin = -0.1000000;
	}
	aPlayer.Pawn.Anchor = StartSpot;
	aPlayer.Pawn.LastStartSpot = PlayerStart(StartSpot);
	aPlayer.Pawn.LastStartTime = Level.TimeSeconds;
	aPlayer.PreviousPawnClass = aPlayer.Pawn.Class;
	aPlayer.Possess(aPlayer.Pawn);
	aPlayer.PawnClass = aPlayer.Pawn.Class;
	aPlayer.Pawn.PlayTeleportEffect(true, true);
	aPlayer.ClientSetRotation(aPlayer.Pawn.Rotation);
	AddDefaultInventory(aPlayer.Pawn);
	TriggerEvent(StartSpot.Event, StartSpot, aPlayer.Pawn);
	// End:0x572
	if((bAllowVehicles && int(Level.NetMode) == int(NM_Standalone)) && PlayerController(aPlayer) != none)
	{
		BestDist = 2000.0000000;
		ViewDir = Vector(aPlayer.Pawn.Rotation);
		V = VehicleList;
		J0x455:

		// End:0x544 [Loop If]
		if(V != none)
		{
			// End:0x52D
			if(V.bTeamLocked && aPlayer.GetTeamNum() == int(V.Team))
			{
				Dist = VSize(V.Location - aPlayer.Pawn.Location);
				// End:0x508
				if((ViewDir Dot (V.Location - aPlayer.Pawn.Location)) < float(0))
				{
					Dist *= float(2);
				}
				// End:0x52D
				if(Dist < BestDist)
				{
					Best = V;
					BestDist = Dist;
				}
			}
			V = V.NextVehicle;
			// [Loop Continue]
			goto J0x455;
		}
		// End:0x572
		if(Best != none)
		{
			Best.PlayerStartTime = Level.TimeSeconds + float(8);
		}
	}
	//return;	
}

function Class<Pawn> GetDefaultPlayerClass(Controller C)
{
	local string PawnClassName;
	local Class<Pawn> PawnClass;

	// End:0x4D
	if(C != none)
	{
		PawnClassName = string(C.default.PawnClass);
		PawnClass = Class<Pawn>(DynamicLoadObject(PawnClassName, Class'Core.Class'));
		// End:0x4D
		if(PawnClass != none)
		{
			return PawnClass;
		}
	}
	return Class<Pawn>(DynamicLoadObject(DefaultPlayerClassName, Class'Core.Class'));
	//return;	
}

event PostLogin(PlayerController NewPlayer)
{
	local Class<HUD> HudClass;
	local Class<ScoreBoard> ScoreboardClass;

	// End:0xB0
	if(!bIsSaveGame)
	{
		// End:0x73
		if(GameStats != none)
		{
			GameStats.ConnectEvent(NewPlayer.PlayerReplicationInfo);
			GameStats.GameEvent("NameChange", NewPlayer.PlayerReplicationInfo.PlayerName, NewPlayer.PlayerReplicationInfo);
		}
		// End:0xB0
		if(!bDelayedStart)
		{
			bRestartLevel = false;
			// End:0x98
			if(bWaitingToStartMatch)
			{
				StartMatch();				
			}
			else
			{
				RestartPlayer(NewPlayer);
			}
			bRestartLevel = default.bRestartLevel;
		}
	}
	// End:0xE8
	if(HUDType == "")
	{
		Log("No HUDType specified in GameInfo", 'Log');		
	}
	else
	{
		HudClass = Class<HUD>(DynamicLoadObject(HUDType, Class'Core.Class'));
		// End:0x133
		if(HudClass == none)
		{
			Log("Can't find HUD class " $ HUDType, 'Error');
		}
	}
	// End:0x191
	if(ScoreBoardType != "")
	{
		ScoreboardClass = Class<ScoreBoard>(DynamicLoadObject(ScoreBoardType, Class'Core.Class'));
		// End:0x191
		if(ScoreboardClass == none)
		{
			Log("Can't find ScoreBoard class " $ ScoreBoardType, 'Error');
		}
	}
	NewPlayer.ClientSetHUD(HudClass, ScoreboardClass);
	SetWeaponViewShake(NewPlayer);
	// End:0x1C0
	if(bIsSaveGame)
	{
		return;
	}
	// End:0x203
	if(NewPlayer.Pawn != none)
	{
		NewPlayer.Pawn.ClientSetRotation(NewPlayer.Pawn.Rotation);
	}
	// End:0x222
	if(VotingHandler != none)
	{
		VotingHandler.PlayerJoin(NewPlayer);
	}
	// End:0x24A
	if(AccessControl != none)
	{
		NewPlayer.LoginDelay = AccessControl.LoginDelaySeconds;
	}
	NewPlayer.ClientCapBandwidth(NewPlayer.Player.CurrentNetSpeed);
	NotifyLogin(NewPlayer.PlayerReplicationInfo.PlayerID);
	Log((("New Player" @ NewPlayer.PlayerReplicationInfo.PlayerName) @ "id=") $ NewPlayer.GetPlayerIDHash());
	//return;	
}

function SetWeaponViewShake(PlayerController P)
{
	P.ClientSetWeaponViewShake(bWeaponShouldViewShake && bModViewShake);
	//return;	
}

function Logout(Controller Exiting)
{
	local bool bMessage;

	bMessage = true;
	// End:0x93
	if(PlayerController(Exiting) != none)
	{
		// End:0x5A
		if((AccessControl != none) && AccessControl.AdminLogout(PlayerController(Exiting)))
		{
			AccessControl.AdminExited(PlayerController(Exiting));
		}
		// End:0x8C
		if(PlayerController(Exiting).PlayerReplicationInfo.bOnlySpectator)
		{
			bMessage = false;
			NumSpectators--;			
		}
		else
		{
			NumPlayers--;
		}
	}
	// End:0xED
	if(bMessage && (int(Level.NetMode) == int(NM_DedicatedServer)) || int(Level.NetMode) == int(NM_ListenServer))
	{
		BroadcastLocalizedMessage(GameMessageClass, 4, Exiting.PlayerReplicationInfo);
	}
	// End:0x10C
	if(VotingHandler != none)
	{
		VotingHandler.PlayerExit(Exiting);
	}
	// End:0x134
	if(GameStats != none)
	{
		GameStats.DisconnectEvent(Exiting.PlayerReplicationInfo);
	}
	NotifyLogout(Exiting);
	//return;	
}

function NotifyLogin(int NewPlayerID)
{
	local PlayerController C;

	// End:0x82
	foreach __NFUN_325__(Class'Engine.PlayerController', C)
	{
		// End:0x81
		if(((C.bIsPlayer && C.PlayerReplicationInfo != none) && !C.PlayerReplicationInfo.bOnlySpectator) && C.Player != none)
		{
			C.ServerRequestBanInfo(NewPlayerID);
		}		
	}	
	//return;	
}

function NotifyLogout(Controller Exiting)
{
	local PlayerController PC;

	BaseMutator.NotifyLogout(Exiting);
	// End:0x8F
	if((PlayerController(Exiting) != none) && Exiting.PlayerReplicationInfo != none)
	{
		// End:0x8E
		foreach __NFUN_325__(Class'Engine.PlayerController', PC)
		{
			// End:0x8D
			if(PC.ChatManager != none)
			{
				PC.ChatManager.UnTrackPlayer(Exiting.PlayerReplicationInfo.PlayerID);
			}			
		}		
	}
	//return;	
}

event AcceptInventory(Pawn PlayerPawn)
{
	//return;	
}

function AddGameSpecificInventory(Pawn P)
{
	local Weapon newWeapon;
	local Class<Weapon> WeapClass;

	WeapClass = BaseMutator.GetDefaultWeapon();
	// End:0x8A
	if((WeapClass != none) && P.FindInventoryType(WeapClass) == none)
	{
		newWeapon = Spawn(WeapClass,,, P.Location);
		// End:0x8A
		if(newWeapon != none)
		{
			newWeapon.GiveTo(P);
			newWeapon.bCanThrow = false;
		}
	}
	//return;	
}

function AddDefaultInventory(Pawn PlayerPawn)
{
	local Weapon newWeapon;
	local Class<Weapon> WeapClass;

	WeapClass = BaseMutator.GetDefaultWeapon();
	// End:0x8A
	if((WeapClass != none) && PlayerPawn.FindInventoryType(WeapClass) == none)
	{
		newWeapon = Spawn(WeapClass,,, PlayerPawn.Location);
		// End:0x8A
		if(newWeapon != none)
		{
			newWeapon.GiveTo(PlayerPawn);
			newWeapon.bCanThrow = false;
		}
	}
	SetPlayerDefaults(PlayerPawn);
	//return;	
}

function SetPlayerDefaults(Pawn PlayerPawn)
{
	PlayerPawn.AirControl = PlayerPawn.default.AirControl;
	PlayerPawn.GroundSpeed = PlayerPawn.default.GroundSpeed;
	PlayerPawn.WaterSpeed = PlayerPawn.default.WaterSpeed;
	PlayerPawn.AirSpeed = PlayerPawn.default.AirSpeed;
	PlayerPawn.Acceleration = PlayerPawn.default.Acceleration;
	PlayerPawn.JumpZ = PlayerPawn.default.JumpZ;
	BaseMutator.ModifyPlayer(PlayerPawn);
	//return;	
}

function NotifyKilled(Controller Killer, Controller Killed, Pawn KilledPawn)
{
	local Controller C;

	// End:0x2F
	foreach __NFUN_325__(Class'Engine.Controller', C)
	{
		C.NotifyKilled(Killer, Killed, KilledPawn);		
	}	
	//return;	
}

function KillEvent(string KillType, PlayerReplicationInfo Killer, PlayerReplicationInfo Victim, Class<DamageType> Damage)
{
	// End:0x2E
	if(GameStats != none)
	{
		GameStats.KillEvent(KillType, Killer, Victim, Damage);
	}
	//return;	
}

function Killed(Controller Killer, Controller Killed, Pawn KilledPawn, Class<DamageType> DamageType)
{
	local Vehicle V;

	// End:0x1BA
	if((Killed != none) && Killed.bIsPlayer)
	{
		Killed.PlayerReplicationInfo.Deaths += float(1);
		Killed.PlayerReplicationInfo.NetUpdateTime = FMin(Killed.PlayerReplicationInfo.NetUpdateTime, Level.TimeSeconds + (0.3000000 * FRand()));
		BroadcastDeathMessage(Killer, Killed, DamageType);
		// End:0x10E
		if((Killer == Killed) || Killer == none)
		{
			// End:0xE1
			if(Killer == none)
			{
				KillEvent("K", none, Killed.PlayerReplicationInfo, DamageType);				
			}
			else
			{
				KillEvent("K", Killer.PlayerReplicationInfo, Killed.PlayerReplicationInfo, DamageType);
			}			
		}
		else
		{
			// End:0x190
			if((bTeamGame && Killer.PlayerReplicationInfo != none) && Killer.PlayerReplicationInfo.Team == Killed.PlayerReplicationInfo.Team)
			{
				KillEvent("TK", Killer.PlayerReplicationInfo, Killed.PlayerReplicationInfo, DamageType);				
			}
			else
			{
				KillEvent("K", Killer.PlayerReplicationInfo, Killed.PlayerReplicationInfo, DamageType);
			}
		}
	}
	// End:0x1D5
	if(Killed != none)
	{
		ScoreKill(Killer, Killed);
	}
	DiscardInventory(KilledPawn);
	NotifyKilled(Killer, Killed, KilledPawn);
	// End:0x290
	if((bAllowVehicles && int(Level.NetMode) == int(NM_Standalone)) && PlayerController(Killed) != none)
	{
		V = VehicleList;
		J0x236:

		// End:0x290 [Loop If]
		if(V != none)
		{
			// End:0x279
			if(Killed.GetTeamNum() == int(V.Team))
			{
				V.PlayerStartTime = 0.0000000;
			}
			V = V.NextVehicle;
			// [Loop Continue]
			goto J0x236;
		}
	}
	//return;	
}

function bool PreventDeath(Pawn Killed, Controller Killer, Class<DamageType> DamageType, Vector HitLocation)
{
	// End:0x0D
	if(GameRulesModifiers == none)
	{
		return false;
	}
	return GameRulesModifiers.PreventDeath(Killed, Killer, DamageType, HitLocation);
	//return;	
}

function bool PreventSever(Pawn Killed, name BoneName, int Damage, Class<DamageType> DamageType)
{
	// End:0x0D
	if(GameRulesModifiers == none)
	{
		return false;
	}
	return GameRulesModifiers.PreventSever(Killed, BoneName, Damage, DamageType);
	//return;	
}

function BroadcastDeathMessage(Controller Killer, Controller Other, Class<DamageType> DamageType)
{
	// End:0x40
	if((Killer == Other) || Killer == none)
	{
		BroadcastLocalized(self, DeathMessageClass, 1, none, Other.PlayerReplicationInfo, DamageType);		
	}
	else
	{
		BroadcastLocalized(self, DeathMessageClass, 0, Killer.PlayerReplicationInfo, Other.PlayerReplicationInfo, DamageType);
	}
	//return;	
}

// Export UGameInfo::execParseKillMessage(FFrame&, void* const)
native static function string ParseKillMessage(string KillerName, string VictimName, string DeathMessage);

function Kick(string S)
{
	// End:0x1F
	if(AccessControl != none)
	{
		AccessControl.Kick(S);
	}
	//return;	
}

function SessionKickBan(string S)
{
	// End:0x1F
	if(AccessControl != none)
	{
		AccessControl.SessionKickBan(S);
	}
	//return;	
}

function KickBan(string S)
{
	// End:0x1F
	if(AccessControl != none)
	{
		AccessControl.KickBan(S);
	}
	//return;	
}

function bool IsOnTeam(Controller Other, int TeamNum)
{
	local int OtherTeam;

	// End:0x46
	if(bTeamGame && Other != none)
	{
		OtherTeam = Other.GetTeamNum();
		// End:0x39
		if(OtherTeam == 255)
		{
			return false;
		}
		return OtherTeam == TeamNum;
	}
	return false;
	//return;	
}

function bool CanSpectate(PlayerController Viewer, bool bOnlySpectator, Actor ViewTarget)
{
	return true;
	//return;	
}

function int ReduceDamage(int Damage, Pawn injured, Pawn instigatedBy, Vector HitLocation, out Vector Momentum, Class<DamageType> DamageType)
{
	local int OriginalDamage;
	local Armor FirstArmor, NextArmor;

	OriginalDamage = Damage;
	// End:0x30
	if(injured.PhysicsVolume.bNeutralZone)
	{
		Damage = 0;		
	}
	else
	{
		// End:0x47
		if(injured.InGodMode())
		{
			return 0;			
		}
		else
		{
			// End:0xF3
			if((injured.Inventory != none) && Damage > 0)
			{
				FirstArmor = injured.Inventory.PrioritizeArmor(Damage, DamageType, HitLocation);
				J0x95:

				// End:0xF3 [Loop If]
				if((FirstArmor != none) && Damage > 0)
				{
					NextArmor = FirstArmor.NextArmor;
					Damage = FirstArmor.ArmorAbsorbDamage(Damage, DamageType, HitLocation);
					FirstArmor = NextArmor;
					// [Loop Continue]
					goto J0x95;
				}
			}
		}
	}
	// End:0x131
	if(GameRulesModifiers != none)
	{
		return GameRulesModifiers.NetDamage(OriginalDamage, Damage, injured, instigatedBy, HitLocation, Momentum, DamageType);
	}
	return Damage;
	//return;	
}

function bool ShouldRespawn(Pickup Other)
{
	// End:0x1B
	if(int(Level.NetMode) == int(NM_Standalone))
	{
		return false;
	}
	return Other.RespawnTime != 0.0000000;
	//return;	
}

function bool PickupQuery(Pawn Other, Pickup Item)
{
	local byte bAllowPickup;

	// End:0x39
	if((GameRulesModifiers != none) && GameRulesModifiers.OverridePickupQuery(Other, Item, bAllowPickup))
	{
		return int(bAllowPickup) == 1;
	}
	// End:0x52
	if(Other.Inventory == none)
	{
		return true;		
	}
	else
	{
		return !Other.Inventory.HandlePickupQuery(Item);
	}
	//return;	
}

function DiscardInventory(Pawn Other)
{
	Other.Weapon = none;
	Other.SelectedItem = none;
	J0x20:

	// End:0x4C [Loop If]
	if(Other.Inventory != none)
	{
		Other.Inventory.Destroy();
		// [Loop Continue]
		goto J0x20;
	}
	//return;	
}

function ChangeName(Controller Other, coerce string S, bool bNameChange)
{
	local PlayerController C;

	// End:0x0E
	if(S == "")
	{
		return;
	}
	S = StripColor(S);
	Other.PlayerReplicationInfo.SetPlayerName(S);
	// End:0xA4
	if(bNameChange && int(Level.NetMode) != int(NM_DedicatedServer))
	{
		C = Level.GetLocalPlayerController();
		// End:0xA4
		if(C != none)
		{
			C.ReceiveLocalizedMessage(Class'Engine.GameMessage', 2, Other.PlayerReplicationInfo);
		}
	}
	//return;	
}

function bool ChangeTeam(Controller Other, int N, bool bNewTeam)
{
	return true;
	//return;	
}

function byte PickTeam(byte Current, Controller C)
{
	return Current;
	//return;	
}

function SendPlayer(PlayerController aPlayer, string URL)
{
	aPlayer.ClientTravel(URL, 2, true);
	//return;	
}

function RestartGame()
{
	local string NextMap;
	local MapList MyList;

	// End:0x21
	if((GameRulesModifiers != none) && GameRulesModifiers.HandleRestartGame())
	{
		return;
	}
	// End:0x2C
	if(bGameRestarted)
	{
		return;
	}
	bGameRestarted = true;
	// End:0x57
	if((VotingHandler != none) && !VotingHandler.HandleRestartGame())
	{
		return;
	}
	// End:0x103
	if((bChangeLevels && !bAlreadyChanged) && MapListType != "")
	{
		bAlreadyChanged = true;
		MyList = GetMapList(MapListType);
		// End:0xC0
		if(MyList != none)
		{
			NextMap = MyList.GetNextMap();
			MyList.Destroy();
		}
		// End:0xE0
		if(NextMap == "")
		{
			NextMap = GetMapName(MapPrefix, NextMap, 1);
		}
		// End:0x103
		if(NextMap != "")
		{
			Level.ServerTravel(NextMap, false);
			return;
		}
	}
	Level.ServerTravel("?Restart", false);
	//return;	
}

function array<string> GetMapRotation()
{
	// End:0x1B
	if(MaplistHandler != none)
	{
		return MaplistHandler.GetCurrentMapRotation();
	}
	//return;	
}

function MapList GetMapList(string MapListClassType)
{
	local Class<MapList> MapListClass;

	// End:0x3B
	if(MapListClassType != "")
	{
		MapListClass = Class<MapList>(DynamicLoadObject(MapListClassType, Class'Core.Class'));
		// End:0x3B
		if(MapListClass != none)
		{
			return Spawn(MapListClass);
		}
	}
	return none;
	//return;	
}

function ChangeVoiceChannel(PlayerReplicationInfo PRI, int NewChannelIndex, int OldChannelIndex)
{
	//return;	
}

event Broadcast(Actor Sender, coerce string Msg, optional name Type)
{
	BroadcastHandler.Broadcast(Sender, Msg, Type);
	//return;	
}

function BroadcastTeam(Controller Sender, coerce string Msg, optional name Type)
{
	BroadcastHandler.BroadcastTeam(Sender, Msg, Type);
	//return;	
}

event BroadcastLocalized(Actor Sender, Class<LocalMessage> Message, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
	BroadcastHandler.AllowBroadcastLocalized(Sender, Message, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
	//return;	
}

function bool CheckEndGame(PlayerReplicationInfo Winner, string Reason)
{
	local Controller P;

	// End:0x2D
	if((GameRulesModifiers != none) && !GameRulesModifiers.CheckEndGame(Winner, Reason))
	{
		return false;
	}
	// End:0x5C
	foreach __NFUN_325__(Class'Engine.Controller', P)
	{
		P.ClientGameEnded();
		P.GameHasEnded();		
	}	
	return true;
	//return;	
}

function EndGame(PlayerReplicationInfo Winner, string Reason)
{
	// End:0x1F
	if(!CheckEndGame(Winner, Reason))
	{
		bOverTime = true;
		return;
	}
	bGameEnded = true;
	TriggerEvent('EndGame', self, none);
	EndLogging(Reason);
	//return;	
}

function EndLogging(string Reason)
{
	// End:0x0D
	if(GameStats == none)
	{
		return;
	}
	GameStats.EndGame(Reason);
	GameStats.Destroy();
	GameStats = none;
	//return;	
}

function NavigationPoint FindPlayerStart(Controller Player, optional byte InTeam, optional string incomingName)
{
	local NavigationPoint N, BestStart;
	local Teleporter Tel;
	local float BestRating, NewRating;
	local byte Team;

	// End:0x89
	if((((Player != none) && Player.StartSpot != none) && int(Level.NetMode) == int(NM_Standalone)) && bWaitingToStartMatch || (Player.PlayerReplicationInfo != none) && Player.PlayerReplicationInfo.bWaitingPlayer)
	{
		return Player.StartSpot;
	}
	// End:0xC9
	if(GameRulesModifiers != none)
	{
		N = GameRulesModifiers.FindPlayerStart(Player, InTeam, incomingName);
		// End:0xC9
		if(N != none)
		{
			return N;
		}
	}
	// End:0x108
	if(incomingName != "")
	{
		// End:0x107
		foreach AllActors(Class'Engine.Teleporter', Tel)
		{
			// End:0x106
			if(string(Tel.Tag) ~= incomingName)
			{				
				return Tel;
			}			
		}		
	}
	// End:0x17F
	if((Player != none) && Player.PlayerReplicationInfo != none)
	{
		// End:0x171
		if(Player.PlayerReplicationInfo.Team != none)
		{
			Team = byte(Player.PlayerReplicationInfo.Team.TeamIndex);			
		}
		else
		{
			Team = InTeam;
		}		
	}
	else
	{
		Team = InTeam;
	}
	N = Level.NavigationPointList;
	J0x19E:

	// End:0x200 [Loop If]
	if(N != none)
	{
		NewRating = RatePlayerStart(N, Team, Player);
		// End:0x1E9
		if(NewRating > BestRating)
		{
			BestRating = NewRating;
			BestStart = N;
		}
		N = N.nextNavigationPoint;
		// [Loop Continue]
		goto J0x19E;
	}
	// End:0x308
	if((BestStart == none) || ((PlayerStart(BestStart) == none) && Player != none) && Player.bIsPlayer)
	{
		Log("Warning - PATHS NOT DEFINED or NO PLAYERSTART with positive rating");
		BestRating = -100000000.0000000;
		// End:0x307
		foreach AllActors(Class'Engine.NavigationPoint', N)
		{
			NewRating = RatePlayerStart(N, 0, Player);
			// End:0x2D2
			if(InventorySpot(N) != none)
			{
				NewRating -= float(50);
			}
			NewRating += (float(20) * FRand());
			// End:0x306
			if(NewRating > BestRating)
			{
				BestRating = NewRating;
				BestStart = N;
			}			
		}		
	}
	return BestStart;
	//return;	
}

function float RatePlayerStart(NavigationPoint N, byte Team, Controller Player)
{
	local PlayerStart P;

	P = PlayerStart(N);
	// End:0x51
	if(P != none)
	{
		// End:0x4B
		if(P.bSinglePlayerStart)
		{
			// End:0x45
			if(P.bEnabled)
			{
				return 1000.0000000;
			}
			return 20.0000000;
		}
		return 10.0000000;
	}
	return 0.0000000;
	//return;	
}

function ScoreObjective(PlayerReplicationInfo Scorer, float Score)
{
	// End:0x20
	if(Scorer != none)
	{
		Scorer.Score += Score;
	}
	// End:0x46
	if(GameRulesModifiers != none)
	{
		GameRulesModifiers.ScoreObjective(Scorer, int(Score));
	}
	CheckScore(Scorer);
	//return;	
}

function CheckScore(PlayerReplicationInfo Scorer)
{
	// End:0x26
	if((GameRulesModifiers != none) && GameRulesModifiers.CheckScore(Scorer))
	{
		return;
	}
	//return;	
}

function ScoreEvent(PlayerReplicationInfo Who, float Points, string Desc)
{
	// End:0x29
	if(GameStats != none)
	{
		GameStats.ScoreEvent(Who, Points, Desc);
	}
	//return;	
}

function TeamScoreEvent(int Team, float Points, string Desc)
{
	// End:0x29
	if(GameStats != none)
	{
		GameStats.TeamScoreEvent(Team, Points, Desc);
	}
	//return;	
}

function ScoreKill(Controller Killer, Controller Other)
{
	// End:0xAB
	if((Killer == Other) || Killer == none)
	{
		// End:0xA8
		if((Other != none) && Other.PlayerReplicationInfo != none)
		{
			Other.PlayerReplicationInfo.Score -= float(1);
			Other.PlayerReplicationInfo.NetUpdateTime = Level.TimeSeconds - float(1);
			ScoreEvent(Other.PlayerReplicationInfo, -1.0000000, "self_frag");
		}		
	}
	else
	{
		// End:0x13E
		if(Killer.PlayerReplicationInfo != none)
		{
			Killer.PlayerReplicationInfo.Score += float(1);
			Killer.PlayerReplicationInfo.NetUpdateTime = Level.TimeSeconds - float(1);
			Killer.PlayerReplicationInfo.Kills++;
			ScoreEvent(Killer.PlayerReplicationInfo, 1.0000000, "frag");
		}
	}
	// End:0x162
	if(GameRulesModifiers != none)
	{
		GameRulesModifiers.ScoreKill(Killer, Other);
	}
	// End:0x18E
	if((Killer != none) || MaxLives > 0)
	{
		CheckScore(Killer.PlayerReplicationInfo);
	}
	//return;	
}

function bool TooManyBots(Controller botToRemove)
{
	return false;
	//return;	
}

static function Texture GetRandomTeamSymbol(int Base)
{
	return none;
	//return;	
}

static function string FindTeamDesignation(GameReplicationInfo GRI, Actor A)
{
	return "";
	//return;	
}

static function string ParseChatPercVar(Mutator BaseMutator, Controller Who, string Cmd)
{
	// End:0x2A
	if(BaseMutator != none)
	{
		Cmd = BaseMutator.ParseChatPercVar(Who, Cmd);
	}
	// End:0x4F
	if(Who != none)
	{
		Cmd = Who.ParseChatPercVar(Cmd);
	}
	return Cmd;
	//return;	
}

static function string ParseMessageString(Mutator BaseMutator, Controller Who, string Message)
{
	return Message;
	//return;	
}

static function FillPlayInfo(PlayInfo PlayInfo)
{
	super.FillPlayInfo(PlayInfo);
	PlayInfo.AddSetting(default.BotsGroup, "GameDifficulty", GetDisplayText("GameDifficulty"), 0, 2, "Select", default.GIPropsExtras[0], "Xb");
	PlayInfo.AddSetting(default.GameGroup, "GoalScore", GetDisplayText("GoalScore"), 0, 0, "Text", "3;0:999");
	PlayInfo.AddSetting(default.GameGroup, "TimeLimit", GetDisplayText("TimeLimit"), 0, 0, "Text", "3;0:999");
	PlayInfo.AddSetting(default.GameGroup, "MaxLives", GetDisplayText("MaxLives"), 0, 0, "Text", "3;0:999");
	PlayInfo.AddSetting(default.GameGroup, "bWeaponStay", GetDisplayText("bWeaponStay"), 1, 0, "Check",,,, true);
	PlayInfo.AddSetting(default.RulesGroup, "bAllowWeaponThrowing", GetDisplayText("bAllowWeaponThrowing"), 1, 0, "Check",,,, true);
	PlayInfo.AddSetting(default.RulesGroup, "bAllowBehindView", GetDisplayText("bAllowBehindview"), 1, 0, "Check",,, true, true);
	PlayInfo.AddSetting(default.RulesGroup, "bWeaponShouldViewShake", GetDisplayText("bWeaponShouldViewShake"), 1, 0, "Check",,,, true);
	PlayInfo.AddSetting(default.ServerGroup, "bEnableStatLogging", GetDisplayText("bEnableStatLogging"), 0, 1, "Check",,, true);
	PlayInfo.AddSetting(default.ServerGroup, "bAdminCanPause", GetDisplayText("bAdminCanPause"), 1, 1, "Check",,, true, true);
	PlayInfo.AddSetting(default.ServerGroup, "MaxSpectators", GetDisplayText("MaxSpectators"), 1, 1, "Text", "3;0:256",, true, true);
	PlayInfo.AddSetting(default.ServerGroup, "MaxPlayers", GetDisplayText("MaxPlayers"), 0, 1, "Text", "3;0:256",, true);
	PlayInfo.AddSetting(default.ServerGroup, "MaxIdleTime", GetDisplayText("MaxIdleTime"), 0, 1, "Text", "3;0:300",, true, true);
	// End:0x3DD
	if(default.GameReplicationInfoClass != none)
	{
		default.GameReplicationInfoClass.static.FillPlayInfo(PlayInfo);
		PlayInfo.PopClass();
	}
	// End:0x408
	if(default.VoiceReplicationInfoClass != none)
	{
		default.VoiceReplicationInfoClass.static.FillPlayInfo(PlayInfo);
		PlayInfo.PopClass();
	}
	// End:0x42A
	if(default.BroadcastClass != none)
	{
		default.BroadcastClass.static.FillPlayInfo(PlayInfo);		
	}
	else
	{
		Class'Engine.BroadcastHandler'.static.FillPlayInfo(PlayInfo);
	}
	PlayInfo.PopClass();
	// End:0x48A
	if(Class'Engine.GameInfo'.default.VotingHandlerClass != none)
	{
		Class'Engine.GameInfo'.default.VotingHandlerClass.FillPlayInfo(PlayInfo);
		PlayInfo.PopClass();		
	}
	else
	{
		Log("GameInfo::FillPlayInfo class'Engine.GameInfo'.default.VotingHandlerClass = None");
	}
	//return;	
}

static function string GetDisplayText(string PropName)
{
	switch(PropName)
	{
		// End:0x22
		case "GameDifficulty":
			return default.GIPropsDisplayText[0];
		// End:0x3A
		case "bWeaponStay":
			return default.GIPropsDisplayText[1];
		// End:0x55
		case "MaxSpectators":
			return default.GIPropsDisplayText[4];
		// End:0x6D
		case "MaxPlayers":
			return default.GIPropsDisplayText[5];
		// End:0x84
		case "GoalScore":
			return default.GIPropsDisplayText[6];
		// End:0x9A
		case "MaxLives":
			return default.GIPropsDisplayText[7];
		// End:0xB1
		case "TimeLimit":
			return default.GIPropsDisplayText[8];
		// End:0xD1
		case "bEnableStatLogging":
			return default.GIPropsDisplayText[9];
		// End:0xF3
		case "bAllowWeaponThrowing":
			return default.GIPropsDisplayText[10];
		// End:0x111
		case "bAllowBehindview":
			return default.GIPropsDisplayText[11];
		// End:0x12D
		case "bAdminCanPause":
			return default.GIPropsDisplayText[12];
		// End:0x146
		case "MaxIdleTime":
			return default.GIPropsDisplayText[13];
		// End:0x16A
		case "bWeaponShouldViewShake":
			return default.GIPropsDisplayText[14];
		// End:0xFFFF
		default:
			return "";
			break;
	}
	//return;	
}

static function string GetDescriptionText(string PropName)
{
	switch(PropName)
	{
		// End:0x22
		case "GameDifficulty":
			return default.GIPropDescText[0];
		// End:0x3A
		case "bWeaponStay":
			return default.GIPropDescText[1];
		// End:0x55
		case "MaxSpectators":
			return default.GIPropDescText[4];
		// End:0x6D
		case "MaxPlayers":
			return default.GIPropDescText[5];
		// End:0x84
		case "GoalScore":
			return default.GIPropDescText[6];
		// End:0x9A
		case "MaxLives":
			return default.GIPropDescText[7];
		// End:0xB1
		case "TimeLimit":
			return default.GIPropDescText[8];
		// End:0xD1
		case "bEnableStatLogging":
			return default.GIPropDescText[9];
		// End:0xF3
		case "bAllowWeaponThrowing":
			return default.GIPropDescText[10];
		// End:0x111
		case "bAllowBehindview":
			return default.GIPropDescText[11];
		// End:0x12D
		case "bAdminCanPause":
			return default.GIPropDescText[12];
		// End:0x146
		case "MaxIdleTime":
			return default.GIPropDescText[13];
		// End:0x16A
		case "bWeaponShouldViewShake":
			return default.GIPropDescText[14];
		// End:0xFFFF
		default:
			return super.GetDescriptionText(PropName);
			break;
	}
	//return;	
}

static event bool AcceptPlayInfoProperty(string PropName)
{
	// End:0x16
	if(PropName == "MaxLives")
	{
		return false;
	}
	return super.AcceptPlayInfoProperty(PropName);
	//return;	
}

static function int OrderToIndex(int Order)
{
	return Order;
	//return;	
}

function ReviewJumpSpots(name TestLabel)
{
	//return;	
}

function string RecommendCombo(string ComboName)
{
	return ComboName;
	//return;	
}

function string NewRecommendCombo(string ComboName, AIController C)
{
	local string NewComboName;

	NewComboName = RecommendCombo(ComboName);
	// End:0x26
	if(NewComboName != ComboName)
	{
		return NewComboName;
	}
	return BaseMutator.NewRecommendCombo(ComboName, C);
	//return;	
}

function bool CanEnterVehicle(Vehicle V, Pawn P)
{
	return BaseMutator.CanEnterVehicle(V, P);
	//return;	
}

function DriverEnteredVehicle(Vehicle V, Pawn P)
{
	BaseMutator.DriverEnteredVehicle(V, P);
	//return;	
}

function bool CanLeaveVehicle(Vehicle V, Pawn P)
{
	return BaseMutator.CanLeaveVehicle(V, P);
	//return;	
}

function DriverLeftVehicle(Vehicle V, Pawn P)
{
	BaseMutator.DriverLeftVehicle(V, P);
	//return;	
}

function TeamInfo OtherTeam(TeamInfo Requester)
{
	return none;
	//return;	
}

exec function KillBots(int Num)
{
	//return;	
}

exec function AdminSay(string Msg)
{
	local PlayerController C;

	// End:0x78
	foreach __NFUN_325__(Class'Engine.PlayerController', C)
	{
		// End:0x77
		if(C.Player != none)
		{
			C.ClearProgressMessages();
			C.SetProgressTime(6.0000000);
			C.SetProgressMessage(0, Msg, Class'Engine.Canvas'.static.MakeColor(byte(255), byte(255), byte(255)));
		}		
	}	
	//return;	
}

function RegisterVehicle(Vehicle V)
{
	V.NextVehicle = VehicleList;
	VehicleList = V;
	//return;	
}

function Actor FindSpecGoalFor(PlayerReplicationInfo PRI, int TeamIndex)
{
	return none;
	//return;	
}

function int GetDefenderNum()
{
	return 255;
	//return;	
}

event SetGrammar()
{
	// End:0x17
	if(BeaconName != "")
	{
		LoadSRGrammar(BeaconName);
	}
	//return;	
}

// Export UGameInfo::execLoadSRGrammar(FFrame&, void* const)
native function LoadSRGrammar(string Grammar);

function GetPlayerControllerList(out array<PlayerController> ControllerArray)
{
	local PlayerController PC;

	// End:0x19
	if(ControllerArray.Length > 0)
	{
		ControllerArray.Remove(0, ControllerArray.Length);
	}
	// End:0x99
	foreach __NFUN_325__(Class'Engine.PlayerController', PC)
	{
		// End:0x98
		if(((PC.bIsPlayer && PC.PlayerReplicationInfo != none) && !PC.PlayerReplicationInfo.bOnlySpectator) && PC.Player != none)
		{
			ControllerArray[ControllerArray.Length] = PC;
		}		
	}	
	//return;	
}

function ParseVoiceCommand(PlayerController Sender, string RecognizedString)
{
	//return;	
}

static function AdjustBotInterface(bool bSinglePlayer)
{
	//return;	
}

event SceneStarted(SceneManager SM, Actor Other)
{
	//return;	
}

event SceneEnded(SceneManager SM, Actor Other)
{
	//return;	
}

event SceneAbort()
{
	//return;	
}

event NoTranslocatorKeyPressed(PlayerController PC)
{
	//return;	
}

static function array<string> GetAllLoadHints(optional bool bThisClassOnly)
{
	//return;	
}

static function string GetLoadingHint(PlayerController Ref, string MapName, Color HintColor)
{
	local string Hint;
	local int Attempt;

	// End:0x0E
	if(Ref == none)
	{
		return "";
	}
	J0x0E:

	// End:0x4E [Loop If]
	if((Hint == "") && ++Attempt < 10)
	{
		Hint = ParseLoadingHint(GetNextLoadHint(MapName), Ref, HintColor);
		// [Loop Continue]
		goto J0x0E;
	}
	return Hint;
	//return;	
}

static function string ParseLoadingHint(string Hint, PlayerController Ref, Color HintColor)
{
	local string CurrentHint, Cmd, Result;
	local int pos;

	pos = InStr(Hint, "%");
	// End:0x25
	if(pos == -1)
	{
		return Hint;
	}
	J0x25:

	Cmd = "";
	Result = "";
	CurrentHint $= Left(Hint, pos);
	Hint = Mid(Hint, pos + 1);
	pos = InStr(Hint, "%");
	// End:0x81
	if(pos == -1)
	{		
	}
	else
	{
		Cmd = Left(Hint, pos);
		Hint = Mid(Hint, pos + 1);
		Result = GetKeyBindName(Cmd, Ref);
		// End:0xDE
		if((Result == Cmd) || Result == "")
		{			
		}
		else
		{
			CurrentHint $= ((MakeColorCode(default.BindColor) $ Result) $ MakeColorCode(HintColor));
			pos = InStr(Hint, "%");
			// End:0x25
			if(!((Hint == "") || pos == -1))
				goto J0x25;
		}
	}
	// End:0x15D
	if((Result != "") && Result != Cmd)
	{
		return CurrentHint $ Hint;
	}
	return "";
	//return;	
}

static function string GetKeyBindName(string Cmd, PlayerController Ref)
{
	local string BindStr;
	local array<string> Bindings;
	local int i, idx, BestIdx, Weight, BestWeight;

	// End:0x1F
	if((Ref == none) || Cmd == "")
	{
		return Cmd;
	}
	BestIdx = -1;
	BindStr = Ref.ConsoleCommand((("BINDINGTOKEY" @ "\"") $ Cmd) $ "\"");
	// End:0x156
	if(BindStr != "")
	{
		Split(BindStr, ",", Bindings);
		// End:0x156
		if(Bindings.Length > 0)
		{
			i = 0;
			J0x8C:

			// End:0x11C [Loop If]
			if(i < Bindings.Length)
			{
				idx = int(Ref.ConsoleCommand("KEYNUMBER" @ Bindings[i]));
				// End:0x112
				if(idx != -1)
				{
					Weight = GetBindWeight(byte(idx));
					// End:0x112
					if(Weight > BestWeight)
					{
						BestWeight = Weight;
						BestIdx = idx;
					}
				}
				i++;
				// [Loop Continue]
				goto J0x8C;
			}
			// End:0x156
			if(BestIdx != -1)
			{
				return Ref.ConsoleCommand("LOCALIZEDKEYNAME" @ string(BestIdx));
			}
		}
	}
	return Cmd;
	//return;	
}

static function string GetNextLoadHint(string MapName)
{
	return "";
	//return;	
}

static function int GetBindWeight(byte KeyNumber)
{
	// End:0x20
	if((int(KeyNumber) == 1) || int(KeyNumber) == 2)
	{
		return 100;
	}
	// End:0x41
	if((int(KeyNumber) >= 48) && int(KeyNumber) <= 90)
	{
		return 75;
	}
	// End:0x72
	if((int(KeyNumber) == 32) || (int(KeyNumber) >= 16) && int(KeyNumber) <= 18)
	{
		return 50;
	}
	// End:0x93
	if((int(KeyNumber) >= 37) && int(KeyNumber) <= 40)
	{
		return 45;
	}
	// End:0xA4
	if(int(KeyNumber) == 4)
	{
		return 40;
	}
	// End:0xC5
	if((int(KeyNumber) == 236) || int(KeyNumber) == 237)
	{
		return 35;
	}
	// End:0xF6
	if((int(KeyNumber) == 8) || (int(KeyNumber) >= 33) && int(KeyNumber) <= 40)
	{
		return 30;
	}
	// End:0x117
	if((int(KeyNumber) >= 96) && int(KeyNumber) <= 111)
	{
		return 25;
	}
	return 20;
	//return;	
}

static function bool IsVehicleMutator(string MutatorClassName)
{
	// End:0x24
	if(MutatorClassName ~= "Onslaught.MutBigWheels")
	{
		return true;
	}
	// End:0x53
	if(MutatorClassName ~= "Onslaught.MutWheeledVehicleStunts")
	{
		return true;
	}
	// End:0x81
	if(MutatorClassName ~= "Onslaught.MutLightweightVehicles")
	{
		return true;
	}
	// End:0xAC
	if(MutatorClassName ~= "OnslaughtFull.MutVehicleArena")
	{
		return true;
	}
	return false;
	//return;	
}

static function bool AllowMutator(string MutatorClassName)
{
	// End:0x11
	if(MutatorClassName == default.MutatorClass)
	{
		return true;
	}
	// End:0x2E
	if(!default.bAllowVehicles && IsVehicleMutator(MutatorClassName))
	{
		return false;
	}
	return !Class'Engine.LevelInfo'.static.IsDemoBuild();
	//return;	
}

static function AddServerDetail(out ServerResponseLine ServerState, string RuleName, coerce string RuleValue)
{
	local int i;

	i = ServerState.ServerInfo.Length;
	ServerState.ServerInfo.Length = i + 1;
	ServerState.ServerInfo[i].Key = RuleName;
	ServerState.ServerInfo[i].Value = RuleValue;
	//return;	
}

function bool JustStarted(float t)
{
	return Level.TimeSeconds < t;
	//return;	
}

function int MultiMinPlayers()
{
	return 0;
	//return;	
}

function WeakObjectives()
{
	//return;	
}

function DisableNextObjective()
{
	//return;	
}

function DeadUse(PlayerController PC)
{
	//return;	
}

defaultproperties
{
	bRestartLevel=true
	bPauseable=true
	bCanChangeSkin=true
	bCanViewOthers=true
	bDelayedStart=true
	bChangeLevels=true
	bAllowWeaponThrowing=true
	bWeaponShouldViewShake=true
	bModViewShake=true
	GoreLevel=2
	GameDifficulty=1.0000000
	AutoAim=0.9300000
	GameSpeed=1.0000000
	HUDType="Engine.HUD"
	GoreLevelText[0]="No Gore"
	GoreLevelText[1]="Reduced Gore"
	GoreLevelText[2]="Full Gore"
	MaxSpectators=2
	MaxPlayers=16
	CurrentID=1
	DefaultPlayerName="Player"
	FearCostFallOff=0.9500000
	DeathMessageClass=Class'Engine.LocalMessage'
	GameMessageClass=Class'Engine.GameMessage'
	MutatorClass="Engine.Mutator"
	AccessControlClass="Engine.AccessControl"
	BroadcastHandlerClass="Engine.BroadcastHandler"
	PlayerControllerClassName="Engine.PlayerController"
	GameReplicationInfoClass=Class'Engine.GameReplicationInfo'
	VoiceReplicationInfoClass=Class'Engine.VoiceChatReplicationInfo'
	MaplistHandlerClass=Class'Engine.MaplistManager'
	GameName="Game"
	Acronym="???"
	VotingHandlerType="xVoting.xVotingHandler"
	GIPropsDisplayText[0]="Bot Skill"
	GIPropsDisplayText[1]="Weapons Stay"
	GIPropsDisplayText[2]="Reduce Gore Level"
	GIPropsDisplayText[3]="Game Speed"
	GIPropsDisplayText[4]="Max Spectators"
	GIPropsDisplayText[5]="Max Players"
	GIPropsDisplayText[6]="Goal Score"
	GIPropsDisplayText[7]="Max Lives"
	GIPropsDisplayText[8]="Time Limit"
	GIPropsDisplayText[9]="World Stats Logging"
	GIPropsDisplayText[10]="Allow Weapon Throwing"
	GIPropsDisplayText[11]="Allow Behind View"
	GIPropsDisplayText[12]="Allow Admin Pausing"
	GIPropsDisplayText[13]="Kick Idlers Time"
	GIPropsDisplayText[14]="Weapons shake view"
	GIPropDescText[0]="Set the skill of your bot opponents."
	GIPropDescText[1]="When enabled, weapons will always be available for pickup."
	GIPropDescText[2]="Enable this option to reduce the amount of blood and guts you see."
	GIPropDescText[3]="Controls how fast time passes in the game."
	GIPropDescText[4]="Sets the maximum number of spectators that can watch the game."
	GIPropDescText[5]="Sets the maximum number of players that can join this server."
	GIPropDescText[6]="The game ends when someone reaches this score."
	GIPropDescText[7]="Limits how many times players can respawn after dying."
	GIPropDescText[8]="The game ends after this many minutes of play."
	GIPropDescText[9]="Enable this option to send game statistics to the UT2004 global stats server"
	GIPropDescText[10]="When enabled, players can throw their current weapon out."
	GIPropDescText[11]="Controls whether players can switch to a third person view."
	GIPropDescText[12]="Controls whether administrators can pause the game."
	GIPropDescText[13]="Specifies how long to wait before kicking idle player from server."
	GIPropDescText[14]="When enabled, some weapons cause view shaking while firing."
	GIPropsExtras="0.000000;Novice;1.000000;Average;2.000000;Experienced;3.000000;Skilled;4.000000;Adept;5.000000;Masterful;6.000000;Inhuman;7.000000;Godlike"
	CallSigns[0]="ALPHA"
	CallSigns[1]="BRAVO"
	CallSigns[2]="CHARLIE"
	CallSigns[3]="DELTA"
	CallSigns[4]="ECHO"
	CallSigns[5]="FOXTROT"
	CallSigns[6]="GOLF"
	CallSigns[7]="HOTEL"
	CallSigns[8]="INDIA"
	CallSigns[9]="JULIET"
	CallSigns[10]="KILO"
	CallSigns[11]="LIMA"
	CallSigns[12]="MIKE"
	CallSigns[13]="NOVEMBER"
	CallSigns[14]="OSCAR"
	NoBindString="[None]"
	BindColor=(R=128,G=128,B=0,A=255)
}
