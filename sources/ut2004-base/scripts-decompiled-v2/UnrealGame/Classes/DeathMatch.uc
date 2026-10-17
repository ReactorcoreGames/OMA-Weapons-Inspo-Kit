class DeathMatch extends UnrealMPGameInfo
	config
	hidedropdown
	cacheexempt
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

const DMPROPNUM = 14;

var config int NetWait;
var globalconfig int MinNetPlayers;
var globalconfig int RestartWait;
var globalconfig bool bTournament;
var globalconfig bool bAutoNumBots;
var globalconfig bool bColoredDMSkins;
var globalconfig bool bPlayersMustBeReady;
var config bool bForceRespawn;
var config bool bAdjustSkill;
var config bool bAllowTaunts;
var config bool bAllowTrans;
var config bool bTeamBotsAsEpicIntended;
var bool bDefaultTranslocator;
var bool bOverrideTranslocator;
var globalconfig bool bWaitForNetPlayers;
var bool bFirstBlood;
var bool bQuickStart;
var bool bSkipPlaySound;
var bool bStartedCountDown;
var bool bFinalStartup;
var bool bOverTimeBroadcast;
var bool bEpicNames;
var bool bKillBots;
var bool bCustomBots;
var bool bReviewingJumpSpots;
var globalconfig bool bAllowPlayerLights;
var bool bForceNoPlayerLights;
var(Menu) bool bAlwaysShowLoginMenu;
var globalconfig bool bForceDefaultCharacter;
var bool bPlayerBecameActive;
var bool bMustHaveMultiplePlayers;
var byte StartupStage;
var int NumRounds;
var config float SpawnProtectionTime;
var int DefaultMaxLives;
var config int LateEntryLives;
var int RemainingTime;
var int ElapsedTime;
var int CountDown;
var float AdjustedDifficulty;
var int PlayerKills;
var int PlayerDeaths;
var Class<SquadAI> DMSquadClass;
var Class<LevelGameRules> LevelRulesClass;
var LevelGameRules LevelRules;
var UnrealTeamInfo EnemyRoster;
var string EnemyRosterName;
var string DefaultEnemyRosterClass;
var int RemainingBots;
var int InitialBots;
var NavigationPoint LastPlayerStartSpot;
var NavigationPoint LastStartSpot;
var int NameNumber;
var int EndMessageWait;
var transient int EndMessageCounter;
var name EndGameSoundName[2];
var name AltEndGameSoundName[2];
var int SinglePlayerWait;
var globalconfig string NamePrefixes[10];
var globalconfig string NameSuffixes[10];
var Actor EndGameFocus;
var PlayerController StandalonePlayer;
var localized string DMPropsDisplayText[14];
var localized string DMPropDescText[14];
var localized string YouDestroyed;
var localized string YouDestroyedTrailer;
var() float ADR_Kill;
var() float ADR_MajorKill;
var() float ADR_MinorError;
var() float ADR_MinorBonus;
var() float ADR_KillTeamMate;
var string EpicNames[21];
var string MaleBackupNames[32];
var string FemaleBackupNames[32];
var int EpicOffset;
var int TotalEpic;
var int MaleBackupNameOffset;
var int FemaleBackupNameOffset;
var int MaleBackupNameOffsetStart;
var int FemaleBackupNameOffsetStart;
var(Menu) config string LoginMenuClass;
var(LoadingHints) private localized array<localized string> DMHints;

function PostBeginPlay()
{
	NameNumber = Rand(10);
	EpicOffset = Rand(10);
	MaleBackupNameOffsetStart = Rand(32);
	FemaleBackupNameOffsetStart = Rand(32);
	super(GameInfo).PostBeginPlay();
	GameReplicationInfo.RemainingTime = RemainingTime;
	GameReplicationInfo.bForceTeamSkins = !bTeamGame && bColoredDMSkins;
	GameReplicationInfo.bForceNoPlayerLights = bForceNoPlayerLights;
	// End:0xA2
	if(bPlayersVsBots || CurrentGameProfile != none)
	{
		GameReplicationInfo.bNoTeamChanges = true;
	}
	// End:0xD9
	if(!bForceNoPlayerLights && bTeamGame || bColoredDMSkins)
	{
		GameReplicationInfo.bAllowPlayerLights = default.bAllowPlayerLights;
	}
	InitTeamSymbols();
	GetBotTeam(InitialBots);
	// End:0x114
	if((CurrentGameProfile == none) || bCustomBots && (GetBotTeam()) != none)
	{
		OverrideInitialBots();
	}
	// End:0x133
	if(bPlayersVsBots)
	{
		GameReplicationInfo.BotDifficulty = int(GameDifficulty);
	}
	//return;	
}

function OverrideInitialBots()
{
	InitialBots = GetBotTeam().OverrideInitialBots(InitialBots, none);
	//return;	
}

function Reset()
{
	super(GameInfo).Reset();
	ElapsedTime = NetWait - 3;
	bWaitForNetPlayers = int(Level.NetMode) != int(NM_Standalone);
	bStartedCountDown = false;
	bFinalStartup = false;
	CountDown = default.CountDown;
	RemainingTime = 60 * TimeLimit;
	GotoState('PendingMatch');
	//return;	
}

function bool JustStarted(float t)
{
	// End:0x20
	if(TimeLimit > 0)
	{
		return RemainingTime > ((60 * TimeLimit) - 20);
	}
	return Level.TimeSeconds < t;
	//return;	
}

function CheckReady()
{
	// End:0x2F
	if((GoalScore == 0) && TimeLimit == 0)
	{
		TimeLimit = 20;
		RemainingTime = 60 * TimeLimit;
	}
	//return;	
}

function Killed(Controller Killer, Controller Killed, Pawn KilledPawn, Class<DamageType> DamageType)
{
	local bool bEnemyKill;
	local int Score;
	local string KillInfo;

	bEnemyKill = !bTeamGame || (((((Killer != none) && Killer != Killed) && Killed != none) && Killer.PlayerReplicationInfo != none) && Killed.PlayerReplicationInfo != none) && Killer.PlayerReplicationInfo.Team != Killed.PlayerReplicationInfo.Team;
	// End:0xF8
	if((KilledPawn != none) && KilledPawn.GetSpree() > 4)
	{
		// End:0xE8
		if(bEnemyKill && Killer != none)
		{
			Killer.AwardAdrenaline(ADR_MajorKill);
		}
		EndSpree(Killer, Killed);
	}
	// End:0x33C
	if((((Killer != none) && Killer.bIsPlayer) && Killed != none) && Killed.bIsPlayer)
	{
		// End:0x167
		if(UnrealPlayer(Killer) != none)
		{
			UnrealPlayer(Killer).LogMultiKills(ADR_MajorKill, bEnemyKill);
		}
		// End:0x189
		if(bEnemyKill)
		{
			DamageType.static.ScoreKill(Killer, Killed);
		}
		// End:0x23F
		if((!bFirstBlood && Killer != Killed) && bEnemyKill)
		{
			Killer.AwardAdrenaline(ADR_MajorKill);
			bFirstBlood = true;
			// End:0x204
			if(TeamPlayerReplicationInfo(Killer.PlayerReplicationInfo) != none)
			{
				TeamPlayerReplicationInfo(Killer.PlayerReplicationInfo).bFirstBlood = true;
			}
			BroadcastLocalizedMessage(Class'UnrealGame.FirstBloodMessage', 0, Killer.PlayerReplicationInfo);
			SpecialEvent(Killer.PlayerReplicationInfo, "first_blood");
		}
		// End:0x265
		if(Killer == Killed)
		{
			Killer.AwardAdrenaline(ADR_MinorError);			
		}
		else
		{
			// End:0x2BA
			if(bTeamGame && Killed.PlayerReplicationInfo.Team == Killer.PlayerReplicationInfo.Team)
			{
				Killer.AwardAdrenaline(ADR_KillTeamMate);				
			}
			else
			{
				Killer.AwardAdrenaline(ADR_Kill);
				// End:0x33C
				if(Killer.Pawn != none)
				{
					Killer.Pawn.IncrementSpree();
					// End:0x33C
					if(Killer.Pawn.GetSpree() > 4)
					{
						NotifySpree(Killer, Killer.Pawn.GetSpree());
					}
				}
			}
		}
	}
	// End:0x4B9
	if((((((Killer != none) && Killer.bIsPlayer) && Killer.PlayerReplicationInfo != none) && Vehicle(KilledPawn) != none) && (Killed != none) || Vehicle(KilledPawn).bEjectDriver) && Vehicle(KilledPawn).IndependentVehicle())
	{
		Score = VehicleScoreKill(Killer, Killed, Vehicle(KilledPawn), KillInfo);
		// End:0x4B9
		if(Score > 0)
		{
			// End:0x443
			if(Killed != none)
			{
				// End:0x443
				if(!bEnemyKill && Killed.PlayerReplicationInfo != none)
				{
					Score = -Score;
					KillInfo = "TeamKill_" $ KillInfo;
				}
			}
			// End:0x4B9
			if(Score != 0)
			{
				Killer.PlayerReplicationInfo.Score += float(Score);
				Killer.PlayerReplicationInfo.NetUpdateTime = Level.TimeSeconds - float(1);
				ScoreEvent(Killer.PlayerReplicationInfo, float(Score), KillInfo);
			}
		}
	}
	super(GameInfo).Killed(Killer, Killed, KilledPawn, DamageType);
	//return;	
}

function int VehicleScoreKill(Controller Killer, Controller Killed, Vehicle DestroyedVehicle, out string KillInfo)
{
	// End:0x60
	if((Killed == none) && PlayerController(Killer) != none)
	{
		PlayerController(Killer).TeamMessage(Killer.PlayerReplicationInfo, (YouDestroyed @ DestroyedVehicle.VehicleNameString) @ YouDestroyedTrailer, 'CriticalEvent');
	}
	// End:0xB2
	if(KillInfo == "")
	{
		// End:0xB2
		if(DestroyedVehicle.bKeyVehicle || DestroyedVehicle.bHighScoreKill)
		{
			KillInfo = "destroyed_key_vehicle";
			return 5;
		}
	}
	return 0;
	//return;	
}

function InitLogging()
{
	super(GameInfo).InitLogging();
	//return;	
}

static function bool NeverAllowTransloc()
{
	return false;
	//return;	
}

function bool AllowTransloc()
{
	return bAllowTrans || bOverrideTranslocator;
	//return;	
}

function AddGameSpecificInventory(Pawn P)
{
	// End:0x30
	if(AllowTransloc())
	{
		P.CreateInventory("XWeapons.TransLauncher");
	}
	super(GameInfo).AddGameSpecificInventory(P);
	//return;	
}

event InitGame(string Options, out string Error)
{
	local string InOpt;
	local int LevelMinPlayers;

	super(GameInfo).InitGame(Options, Error);
	// End:0x24
	foreach AllActors(Class'UnrealGame.LevelGameRules', LevelRules)
	{
		// End:0x24
		break;		
	}	
	// End:0x40
	if(LevelRules != none)
	{
		LevelRules.UpdateGame(self);
	}
	// End:0xBE
	if((CurrentGameProfile == none) && Left(string(Level), 3) ~= "TUT")
	{
		// End:0x7C
		if(GoalScore != 0)
		{
			GoalScore = Max(GoalScore, 3);
		}
		// End:0x9D
		if((TimeLimit != 0) && TimeLimit < 10)
		{
			TimeLimit = 10;
		}
		RemainingTime = 60 * TimeLimit;
		bTournament = false;
		bQuickStart = true;
		return;
	}
	SetGameSpeed(GameSpeed);
	MaxLives = Max(0, GetIntOption(Options, "MaxLives", MaxLives));
	// End:0x102
	if(MaxLives > 0)
	{
		bForceRespawn = true;		
	}
	else
	{
		// End:0x120
		if(DefaultMaxLives > 0)
		{
			bForceRespawn = true;
			MaxLives = DefaultMaxLives;
		}
	}
	GoalScore = Max(0, GetIntOption(Options, "GoalScore", GoalScore));
	TimeLimit = Max(0, GetIntOption(Options, "TimeLimit", TimeLimit));
	// End:0x17A
	if(DefaultMaxLives > 0)
	{
		TimeLimit = 0;
	}
	InOpt = ParseOption(Options, "Translocator");
	// End:0x1D1
	if(InOpt != "")
	{
		Log("Translocators: " $ string(bool(InOpt)));
		bAllowTrans = bool(InOpt);
	}
	InOpt = ParseOption(Options, "bAutoNumBots");
	// End:0x227
	if(InOpt != "")
	{
		Log("bAutoNumBots: " $ string(bool(InOpt)));
		bAutoNumBots = bool(InOpt);
	}
	// End:0x2AE
	if(bTeamGame && int(Level.NetMode) != int(NM_Standalone))
	{
		InOpt = ParseOption(Options, "VsBots");
		// End:0x29D
		if(InOpt != "")
		{
			Log("bPlayersVsBots: " $ string(bool(InOpt)));
			bPlayersVsBots = bool(InOpt);
		}
		// End:0x2AE
		if(bPlayersVsBots)
		{
			bAutoNumBots = false;
		}
	}
	InOpt = ParseOption(Options, "AutoAdjust");
	// End:0x30D
	if(InOpt != "")
	{
		bAdjustSkill = !bTeamGame && bool(InOpt);
		Log("Adjust skill " $ string(bAdjustSkill));
	}
	InOpt = ParseOption(Options, "PlayersMustBeReady");
	// End:0x36E
	if(InOpt != "")
	{
		Log("PlayerMustBeReady: " $ string(bool(InOpt)));
		bPlayersMustBeReady = bool(InOpt);
	}
	EnemyRosterName = ParseOption(Options, "DMTeam");
	// End:0x39B
	if(EnemyRosterName != "")
	{
		bCustomBots = true;
	}
	// End:0x3C2
	if(CurrentGameProfile != none)
	{
		MaxLives = 0;
		bAllowTrans = default.bDefaultTranslocator;
		bAdjustSkill = false;
	}
	// End:0x3E1
	if(HasOption(Options, "NumBots"))
	{
		bAutoNumBots = false;
	}
	// End:0x47C
	if(bAutoNumBots && int(Level.NetMode) == int(NM_Standalone))
	{
		LevelMinPlayers = GetMinPlayers();
		// End:0x454
		if(bTeamGame && bMustHaveMultiplePlayers)
		{
			// End:0x43C
			if(LevelMinPlayers < 4)
			{
				LevelMinPlayers = 4;				
			}
			else
			{
				// End:0x451
				if((LevelMinPlayers & 1) == 1)
				{
					LevelMinPlayers++;
				}
			}			
		}
		else
		{
			// End:0x468
			if(LevelMinPlayers < 2)
			{
				LevelMinPlayers = 2;
			}
		}
		InitialBots = Max(0, LevelMinPlayers - 1);		
	}
	else
	{
		MinPlayers = Clamp(GetIntOption(Options, "MinPlayers", MinPlayers), 0, 255);
		InitialBots = Clamp(GetIntOption(Options, "NumBots", InitialBots), 0, 255);
		// End:0x4D8
		if(bPlayersVsBots)
		{
			MinPlayers = 2;
		}
	}
	RemainingTime = 60 * TimeLimit;
	InOpt = ParseOption(Options, "WeaponStay");
	// End:0x539
	if(InOpt != "")
	{
		Log("WeaponStay: " $ string(bool(InOpt)));
		bWeaponStay = bool(InOpt);
	}
	// End:0x567
	if(bTournament)
	{
		bTournament = (GetIntOption(Options, "Tournament", 1)) > 0;		
	}
	else
	{
		bTournament = (GetIntOption(Options, "Tournament", 0)) > 0;
	}
	// End:0x598
	if(bTournament)
	{
		CheckReady();
	}
	bWaitForNetPlayers = int(Level.NetMode) != int(NM_Standalone);
	InOpt = ParseOption(Options, "QuickStart");
	// End:0x5E6
	if(InOpt != "")
	{
		bQuickStart = true;
	}
	AdjustedDifficulty = GameDifficulty;
	//return;	
}

function TweakSkill(Bot B)
{
	// End:0x38
	if((!bTeamGame || int(Level.NetMode) != int(NM_Standalone)) || CurrentGameProfile == none)
	{
		return;		
	}
	else
	{
		// End:0xAD
		if((Level.GetLocalPlayerController().PlayerReplicationInfo.Team != B.PlayerReplicationInfo.Team) || !bTeamBotsAsEpicIntended)
		{
			B.Skill = FMax(B.Skill, AdjustedDifficulty + 0.2000000);
		}
	}
	//return;	
}

function int GetMinPlayers()
{
	// End:0x32
	if(CurrentGameProfile == none)
	{
		return Min(12, (Level.IdealPlayerCountMax + Level.IdealPlayerCountMin) / 2);
	}
	return Level.SinglePlayerTeamSize * 2;
	//return;	
}

function AcceptInventory(Pawn PlayerPawn)
{
	J0x00:
	// End:0x2C [Loop If]
	if(PlayerPawn.Inventory != none)
	{
		PlayerPawn.Inventory.Destroy();
		// [Loop Continue]
		goto J0x00;
	}
	PlayerPawn.Weapon = none;
	PlayerPawn.SelectedItem = none;
	AddDefaultInventory(PlayerPawn);
	//return;	
}

function bool CheckEndGame(PlayerReplicationInfo Winner, string Reason)
{
	local Controller P;
	local PlayerController Player;
	local bool bLastMan;

	// End:0x80
	if(bOverTime)
	{
		// End:0x1D
		if((NumBots + NumPlayers) == 0)
		{
			return true;
		}
		bLastMan = true;
		// End:0x74
		foreach __NFUN_325__(Class'Engine.Controller', P)
		{
			// End:0x73
			if((P.PlayerReplicationInfo != none) && !P.PlayerReplicationInfo.bOutOfLives)
			{
				bLastMan = false;
				// End:0x74
				break;
			}			
		}		
		// End:0x80
		if(bLastMan)
		{
			return true;
		}
	}
	bLastMan = Reason ~= "LastMan";
	// End:0xD1
	if((!bLastMan && GameRulesModifiers != none) && !GameRulesModifiers.CheckEndGame(Winner, Reason))
	{
		return false;
	}
	// End:0x182
	if(Winner == none)
	{
		// End:0x181
		foreach __NFUN_325__(Class'Engine.Controller', P)
		{
			// End:0x180
			if(((P.bIsPlayer && P.PlayerReplicationInfo != none) && !P.PlayerReplicationInfo.bOutOfLives) && (Winner == none) || P.PlayerReplicationInfo.Score >= Winner.Score)
			{
				Winner = P.PlayerReplicationInfo;
			}			
		}		
	}
	// End:0x250
	if(!bLastMan)
	{
		// End:0x24F
		foreach __NFUN_325__(Class'Engine.Controller', P)
		{
			// End:0x24E
			if((((P.bIsPlayer && P.PlayerReplicationInfo != none) && Winner != P.PlayerReplicationInfo) && P.PlayerReplicationInfo.Score == Winner.Score) && !P.PlayerReplicationInfo.bOutOfLives)
			{
				// End:0x24B
				if(!bOverTimeBroadcast)
				{
					StartupStage = 7;
					PlayStartupMessage();
					bOverTimeBroadcast = true;
				}				
				return false;
			}			
		}		
	}
	EndTime = Level.TimeSeconds + EndTimeDelay;
	GameReplicationInfo.Winner = Winner;
	// End:0x2B0
	if(CurrentGameProfile != none)
	{
		CurrentGameProfile.bWonMatch = PlayerController(Winner.Owner) != none;
	}
	EndGameFocus = Controller(Winner.Owner).Pawn;
	// End:0x2EE
	if(EndGameFocus != none)
	{
		EndGameFocus.bAlwaysRelevant = true;
	}
	// End:0x3B8
	foreach __NFUN_325__(Class'Engine.Controller', P)
	{
		P.GameHasEnded();
		Player = PlayerController(P);
		// End:0x3B7
		if(Player != none)
		{
			// End:0x365
			if(!Player.PlayerReplicationInfo.bOnlySpectator)
			{
				PlayWinMessage(Player, Player.PlayerReplicationInfo == Winner);
			}
			Player.ClientSetBehindView(true);
			// End:0x3A8
			if(EndGameFocus != none)
			{
				Player.ClientSetViewTarget(EndGameFocus);
				Player.SetViewTarget(EndGameFocus);
			}
			Player.ClientGameEnded();
		}		
	}	
	return true;
	//return;	
}

function PlayWinMessage(PlayerController Player, bool bWinner)
{
	// End:0x2A
	if(UnrealPlayer(Player) != none)
	{
		UnrealPlayer(Player).PlayWinMessage(bWinner);
	}
	//return;	
}

function bool AtCapacity(bool bSpectator)
{
	local Controller C;
	local bool bForcedSpectator;

	// End:0x1B
	if(int(Level.NetMode) == int(NM_Standalone))
	{
		return false;
	}
	// End:0x33
	if(bPlayersVsBots)
	{
		MaxPlayers = Min(MaxPlayers, 128);
	}
	// End:0x4B
	if(MaxLives <= 0)
	{
		return super(GameInfo).AtCapacity(bSpectator);
	}
	// End:0x9E
	foreach __NFUN_325__(Class'Engine.Controller', C)
	{
		// End:0x9D
		if((C.PlayerReplicationInfo != none) && C.PlayerReplicationInfo.NumLives > LateEntryLives)
		{
			bForcedSpectator = true;
			// End:0x9E
			break;
		}		
	}	
	// End:0xB7
	if(!bForcedSpectator)
	{
		return super(GameInfo).AtCapacity(bSpectator);
	}
	return (NumPlayers + NumSpectators) >= (MaxPlayers + MaxSpectators);
	//return;	
}

event PlayerController Login(string Portal, string Options, out string Error)
{
	local PlayerController NewPlayer;
	local Controller C;

	// End:0x76
	if(MaxLives > 0)
	{
		// End:0x75
		foreach __NFUN_325__(Class'Engine.Controller', C)
		{
			// End:0x74
			if((C.PlayerReplicationInfo != none) && C.PlayerReplicationInfo.NumLives > LateEntryLives)
			{
				Options = "?SpectatorOnly=1" $ Options;
				// End:0x75
				break;
			}			
		}		
	}
	NewPlayer = super.Login(Portal, Options, Error);
	// End:0xC4
	if(bMustJoinBeforeStart && GameReplicationInfo.bMatchHasBegun)
	{
		UnrealPlayer(NewPlayer).bLatecomer = true;
	}
	// End:0x145
	if(int(Level.NetMode) == int(NM_Standalone))
	{
		// End:0x13A
		if(NewPlayer.PlayerReplicationInfo.bOnlySpectator)
		{
			// End:0x137
			if(!bCustomBots && bAutoNumBots || bTeamGame && (float(InitialBots) % float(2)) == float(1))
			{
				InitialBots++;
			}			
		}
		else
		{
			StandalonePlayer = NewPlayer;
		}
	}
	return NewPlayer;
	//return;	
}

event PostLogin(PlayerController NewPlayer)
{
	super(GameInfo).PostLogin(NewPlayer);
	// End:0x53
	if(UnrealPlayer(NewPlayer) != none)
	{
		UnrealPlayer(NewPlayer).ClientReceiveLoginMenu(LoginMenuClass, bAlwaysShowLoginMenu);
		UnrealPlayer(NewPlayer).PlayStartupMessage(StartupStage);
	}
	//return;	
}

function ChangeLoadOut(PlayerController P, string LoadoutName)
{
	//return;	
}

function RestartPlayer(Controller aPlayer)
{
	// End:0x36
	if((bMustJoinBeforeStart && UnrealPlayer(aPlayer) != none) && UnrealPlayer(aPlayer).bLatecomer)
	{
		return;
	}
	// End:0x53
	if(aPlayer.PlayerReplicationInfo.bOutOfLives)
	{
		return;
	}
	// End:0x85
	if(aPlayer.IsA('Bot') && TooManyBots(aPlayer))
	{
		aPlayer.Destroy();
		return;
	}
	super(GameInfo).RestartPlayer(aPlayer);
	//return;	
}

function bool TooManyBots(Controller botToRemove)
{
	// End:0x40
	if((int(Level.NetMode) != int(NM_Standalone)) && bPlayersVsBots)
	{
		return NumBots > Min(16, int(BotRatio * float(NumPlayers)));
	}
	// End:0x53
	if(bPlayerBecameActive)
	{
		bPlayerBecameActive = false;
		return true;
	}
	return super.TooManyBots(botToRemove);
	//return;	
}

function ForceAddBot()
{
	// End:0x38
	if(int(Level.NetMode) != int(NM_Standalone))
	{
		MinPlayers = Max(MinPlayers + 1, (NumPlayers + NumBots) + 1);
	}
	AddBot();
	//return;	
}

function bool AddBot(optional string botname)
{
	local Bot NewBot;

	NewBot = SpawnBot(botname);
	// End:0x36
	if(NewBot == none)
	{
		Warn("Failed to spawn bot.");
		return false;
	}
	BroadcastLocalizedMessage(GameMessageClass, 1, NewBot.PlayerReplicationInfo);
	NewBot.PlayerReplicationInfo.PlayerID = CurrentID++;
	NumBots++;
	// End:0x9D
	if(int(Level.NetMode) == int(NM_Standalone))
	{
		RestartPlayer(NewBot);		
	}
	else
	{
		NewBot.GotoState('Dead', 'MPStart');
	}
	return true;
	//return;	
}

function AddDefaultInventory(Pawn PlayerPawn)
{
	// End:0x24
	if(UnrealPawn(PlayerPawn) != none)
	{
		UnrealPawn(PlayerPawn).AddDefaultInventory();
	}
	SetPlayerDefaults(PlayerPawn);
	//return;	
}

function bool CanSpectate(PlayerController Viewer, bool bOnlySpectator, Actor ViewTarget)
{
	// End:0x0D
	if(ViewTarget == none)
	{
		return false;
	}
	// End:0x58
	if(Controller(ViewTarget) != none)
	{
		return (Controller(ViewTarget).PlayerReplicationInfo != none) && !Controller(ViewTarget).PlayerReplicationInfo.bOnlySpectator;
	}
	return (int(Level.NetMode) == int(NM_Standalone)) || bOnlySpectator;
	//return;	
}

function bool ShouldRespawn(Pickup Other)
{
	return Other.RespawnTime != 0.0000000;
	//return;	
}

function ChangeName(Controller Other, string S, bool bNameChange)
{
	local Controller C;
	local PlayerController PC;
	local int baseIndex, pairIndex;

	// End:0x0E
	if(S == "")
	{
		return;
	}
	S = StripColor(S);
	// End:0x42
	if(Other.PlayerReplicationInfo.PlayerName ~= S)
	{
		return;
	}
	S = Left(S, 20);
	ReplaceText(S, " ", "_");
	ReplaceText(S, "|", "I");
	// End:0x10A
	if(bEpicNames && Bot(Other) != none)
	{
		// End:0xC6
		if(TotalEpic < 21)
		{
			S = EpicNames[int(float(EpicOffset) % float(21))];
			EpicOffset++;
			TotalEpic++;			
		}
		else
		{
			S = (NamePrefixes[int(float(NameNumber) % float(10))] $ "CliffyB") $ NameSuffixes[int(float(NameNumber) % float(10))];
			NameNumber++;
		}
	}
	// End:0x2C6
	foreach __NFUN_325__(Class'Engine.Controller', C)
	{
		// End:0x2C5
		if((C.bIsPlayer && C.PlayerReplicationInfo != none) && C.PlayerReplicationInfo.PlayerName ~= S)
		{
			// End:0x19A
			if(Other.IsA('PlayerController'))
			{
				PlayerController(Other).ReceiveLocalizedMessage(GameMessageClass, 8);				
				return;
				// End:0x2C5
				continue;
			}
			// End:0x23D
			if(Other.PlayerReplicationInfo.bIsFemale)
			{
				baseIndex = int(float(FemaleBackupNameOffsetStart + FemaleBackupNameOffset) % float(32));
				S = FemaleBackupNames[baseIndex];
				// End:0x233
				if(FemaleBackupNameOffset >= 32)
				{
					pairIndex = int(float((FemaleBackupNameOffset / 32) + baseIndex) % float(10));
					S = (NamePrefixes[pairIndex] $ S) $ NameSuffixes[pairIndex];
				}
				FemaleBackupNameOffset++;				
			}
			else
			{
				baseIndex = int(float(MaleBackupNameOffsetStart + MaleBackupNameOffset) % float(32));
				S = MaleBackupNames[baseIndex];
				// End:0x2BB
				if(MaleBackupNameOffset >= 32)
				{
					pairIndex = int(float((MaleBackupNameOffset / 32) + baseIndex) % float(10));
					S = (NamePrefixes[pairIndex] $ S) $ NameSuffixes[pairIndex];
				}
				MaleBackupNameOffset++;
			}
			// End:0x2C6
			break;
		}		
	}	
	// End:0x2F5
	if(bNameChange)
	{
		GameEvent("NameChange", S, Other.PlayerReplicationInfo);
	}
	// End:0x310
	if(S ~= "CliffyB")
	{
		bEpicNames = true;
	}
	Other.PlayerReplicationInfo.SetPlayerName(S);
	// End:0x395
	if(bNameChange && int(Level.NetMode) != int(NM_DedicatedServer))
	{
		PC = Level.GetLocalPlayerController();
		// End:0x395
		if(PC != none)
		{
			PC.ReceiveLocalizedMessage(Class'Engine.GameMessage', 2, Other.PlayerReplicationInfo);
		}
	}
	//return;	
}

function bool BecomeSpectator(PlayerController P)
{
	// End:0x12
	if(!super(GameInfo).BecomeSpectator(P))
	{
		return false;
	}
	// End:0x24
	if(!bKillBots)
	{
		RemainingBots++;
	}
	// End:0x41
	if(!NeedPlayers() || AddBot())
	{
		RemainingBots--;
	}
	return true;
	//return;	
}

function bool AllowBecomeActivePlayer(PlayerController P)
{
	// End:0x49
	if(super(GameInfo).AllowBecomeActivePlayer(P))
	{
		// End:0x47
		if((int(Level.NetMode) == int(NM_Standalone)) && NumBots > InitialBots)
		{
			RemainingBots--;
			bPlayerBecameActive = true;
		}
		return true;
	}
	return false;
	//return;	
}

function Logout(Controller Exiting)
{
	super(GameInfo).Logout(Exiting);
	// End:0x26
	if(Exiting.IsA('Bot'))
	{
		NumBots--;
	}
	// End:0x38
	if(!bKillBots)
	{
		RemainingBots++;
	}
	// End:0x55
	if(!NeedPlayers() || AddBot())
	{
		RemainingBots--;
	}
	// End:0x67
	if(MaxLives > 0)
	{
		CheckMaxLives(none);
	}
	//return;	
}

function bool NeedPlayers()
{
	// End:0x22
	if(int(Level.NetMode) == int(NM_Standalone))
	{
		return RemainingBots > 0;
	}
	// End:0x2D
	if(bMustJoinBeforeStart)
	{
		return false;
	}
	// End:0x52
	if(bPlayersVsBots)
	{
		return NumBots < Min(16, int(BotRatio * float(NumPlayers)));
	}
	return (NumPlayers + NumBots) < MinPlayers;
	//return;	
}

function GetServerDetails(out ServerResponseLine ServerState)
{
	super.GetServerDetails(ServerState);
	AddServerDetail(ServerState, "GoalScore", string(GoalScore));
	AddServerDetail(ServerState, "TimeLimit", string(TimeLimit));
	AddServerDetail(ServerState, "Translocator", string(bAllowTrans));
	AddServerDetail(ServerState, "WeaponStay", string(bWeaponStay));
	AddServerDetail(ServerState, "ForceRespawn", string(bForceRespawn));
	//return;	
}

function InitGameReplicationInfo()
{
	super(GameInfo).InitGameReplicationInfo();
	GameReplicationInfo.GoalScore = GoalScore;
	GameReplicationInfo.TimeLimit = TimeLimit;
	GameReplicationInfo.MinNetPlayers = MinNetPlayers;
	//return;	
}

function InitTeamSymbols()
{
	local array<string> Group_Text_TeamSymbol;
	local int Count_TeamSymbols, Index_TeamSymbol[2];
	local Texture Texture_TeamSymbol;

	// End:0x3F
	if((GameReplicationInfo.TeamSymbols[0] != none) && GameReplicationInfo.TeamSymbols[1] != none)
	{
		GameReplicationInfo.TeamSymbolNotify();
		return;
	}
	Class'Engine.CacheManager'.static.GetTeamSymbolList(Group_Text_TeamSymbol, true);
	Count_TeamSymbols = Group_Text_TeamSymbol.Length;
	Index_TeamSymbol[0] = Rand(Count_TeamSymbols);
	Index_TeamSymbol[1] = Rand(Count_TeamSymbols);
	// End:0xB1
	if(Index_TeamSymbol[0] == Index_TeamSymbol[1])
	{
		++Index_TeamSymbol[1];
		// End:0xB1
		if(Index_TeamSymbol[1] >= Count_TeamSymbols)
		{
			Index_TeamSymbol[1] = 0;
		}
	}
	Texture_TeamSymbol = Texture(DynamicLoadObject(Group_Text_TeamSymbol[Index_TeamSymbol[0]], Class'Engine.Texture'));
	// End:0xF8
	if(Texture_TeamSymbol != none)
	{
		GameReplicationInfo.TeamSymbols[0] = Texture_TeamSymbol;		
	}
	else
	{
		Warn("(Texture_TeamSymbol[0] == None)" @ Group_Text_TeamSymbol[Index_TeamSymbol[0]]);
	}
	Texture_TeamSymbol = Texture(DynamicLoadObject(Group_Text_TeamSymbol[Index_TeamSymbol[1]], Class'Engine.Texture'));
	// End:0x171
	if(Texture_TeamSymbol != none)
	{
		GameReplicationInfo.TeamSymbols[1] = Texture_TeamSymbol;		
	}
	else
	{
		Warn("(Texture_TeamSymbol[1] == None)" @ Group_Text_TeamSymbol[Index_TeamSymbol[1]]);
	}
	GameReplicationInfo.TeamSymbolNotify();
	//return;	
}

function UnrealTeamInfo GetBotTeam(optional int TeamBots)
{
	local Class<UnrealTeamInfo> RosterClass;

	// End:0x11
	if(EnemyRoster != none)
	{
		return EnemyRoster;
	}
	// End:0x108
	if(CurrentGameProfile != none)
	{
		// End:0xC9
		if(CurrentGameProfile.EnemyTeam != "")
		{
			RosterClass = Class<UnrealTeamInfo>(DynamicLoadObject(CurrentGameProfile.EnemyTeam, Class'Core.Class'));
			// End:0xB8
			if(RosterClass == none)
			{
				Warn(("Invalid EnemyTeam class:" @ CurrentGameProfile.EnemyTeam) @ " Expecting subclass of UnrealTeamInfo");				
			}
			else
			{
				EnemyRoster = Spawn(RosterClass);
			}			
		}
		else
		{
			Log("No EnemyTeam set in CurrentGameProfile, is this correct?");
		}		
	}
	else
	{
		// End:0x148
		if(EnemyRosterName != "")
		{
			RosterClass = Class<UnrealTeamInfo>(DynamicLoadObject(EnemyRosterName, Class'Core.Class'));
			// End:0x148
			if(RosterClass != none)
			{
				EnemyRoster = Spawn(RosterClass);
			}
		}
	}
	// End:0x187
	if(EnemyRoster == none)
	{
		RosterClass = Class<UnrealTeamInfo>(DynamicLoadObject(DefaultEnemyRosterClass, Class'Core.Class'));
		// End:0x187
		if(RosterClass != none)
		{
			EnemyRoster = Spawn(RosterClass);
		}
	}
	EnemyRoster.Initialize(TeamBots);
	return EnemyRoster;
	//return;	
}

function PreLoadNamedBot(string botname)
{
	EnemyRoster.AddNamedBot(botname);
	//return;	
}

function PreLoadBot()
{
	EnemyRoster.AddRandomPlayer();
	//return;	
}

function Bot SpawnBot(optional string botname)
{
	local Bot NewBot;
	local RosterEntry Chosen;
	local UnrealTeamInfo BotTeam;

	BotTeam = GetBotTeam();
	Chosen = BotTeam.ChooseBotClass(botname);
	// End:0x49
	if(Chosen.PawnClass == none)
	{
		Chosen.Init();
	}
	NewBot = Bot(Spawn(Chosen.PawnClass.default.ControllerClass));
	// End:0x8E
	if(NewBot != none)
	{
		InitializeBot(NewBot, BotTeam, Chosen);
	}
	return NewBot;
	//return;	
}

function InitializeBot(Bot NewBot, UnrealTeamInfo BotTeam, RosterEntry Chosen)
{
	NewBot.InitializeSkill(AdjustedDifficulty);
	Chosen.InitBot(NewBot);
	BotTeam.AddToTeam(NewBot);
	// End:0x6E
	if(Chosen.ModifiedPlayerName != "")
	{
		ChangeName(NewBot, Chosen.ModifiedPlayerName, false);		
	}
	else
	{
		ChangeName(NewBot, Chosen.PlayerName, false);
	}
	// End:0x111
	if(bEpicNames && NewBot.PlayerReplicationInfo.PlayerName ~= "The_Reaper")
	{
		NewBot.Accuracy = 1.0000000;
		NewBot.StrafingAbility = 1.0000000;
		NewBot.Tactics = 1.0000000;
		NewBot.InitializeSkill(AdjustedDifficulty + float(2));
	}
	BotTeam.SetBotOrders(NewBot, Chosen);
	//return;	
}

function InitPlacedBot(Controller C, RosterEntry R)
{
	local UnrealTeamInfo BotTeam;

	Log("Init placed bot " $ string(C));
	BotTeam = FindTeamFor(C);
	// End:0x7B
	if(Bot(C) != none)
	{
		Bot(C).InitializeSkill(AdjustedDifficulty);
		// End:0x7B
		if(R != none)
		{
			R.InitBot(Bot(C));
		}
	}
	BotTeam.AddToTeam(C);
	// End:0xB4
	if(R != none)
	{
		ChangeName(C, R.PlayerName, false);
	}
	//return;	
}

function UnrealTeamInfo FindTeamFor(Controller C)
{
	return GetBotTeam();
	//return;	
}

function StartMatch()
{
	local bool bTemp;
	local int Num;

	GotoState('MatchInProgress');
	// End:0x2E
	if(int(Level.NetMode) == int(NM_Standalone))
	{
		RemainingBots = InitialBots;		
	}
	else
	{
		RemainingBots = 0;
	}
	GameReplicationInfo.RemainingMinute = RemainingTime;
	super(GameInfo).StartMatch();
	bTemp = bMustJoinBeforeStart;
	bMustJoinBeforeStart = false;
	J0x64:

	// End:0x95 [Loop If]
	if((NeedPlayers()) && Num < 16)
	{
		// End:0x8B
		if(AddBot())
		{
			RemainingBots--;
		}
		Num++;
		// [Loop Continue]
		goto J0x64;
	}
	bMustJoinBeforeStart = bTemp;
	Log("START MATCH");
	//return;	
}

function EndGame(PlayerReplicationInfo Winner, string Reason)
{
	// End:0x94
	if(((((Reason ~= "triggered") || Reason ~= "LastMan") || Reason ~= "TimeLimit") || Reason ~= "FragLimit") || Reason ~= "TeamScoreLimit")
	{
		super(GameInfo).EndGame(Winner, Reason);
		// End:0x94
		if(bGameEnded)
		{
			GotoState('MatchOver');
		}
	}
	//return;	
}

function NavigationPoint FindPlayerStart(Controller Player, optional byte InTeam, optional string incomingName)
{
	local NavigationPoint Best;

	// End:0x35
	if((Player != none) && Player.StartSpot != none)
	{
		LastPlayerStartSpot = Player.StartSpot;
	}
	Best = super(GameInfo).FindPlayerStart(Player, InTeam, incomingName);
	// End:0x66
	if(Best != none)
	{
		LastStartSpot = Best;
	}
	return Best;
	//return;	
}

function PlayEndOfMatchMessage()
{
	local PlayerController C;

	// End:0xE7
	if((PlayerReplicationInfo(GameReplicationInfo.Winner).Deaths == float(0)) && PlayerReplicationInfo(GameReplicationInfo.Winner).Score >= float(5))
	{
		// End:0xE3
		foreach __NFUN_325__(Class'Engine.PlayerController', C)
		{
			// End:0xE2
			if(C.Player != none)
			{
				// End:0xC9
				if((C.PlayerReplicationInfo == GameReplicationInfo.Winner) || C.PlayerReplicationInfo.bOnlySpectator)
				{
					C.PlayStatusAnnouncement(AltEndGameSoundName[0], 1, true);
					// End:0xE2
					continue;
				}
				C.PlayStatusAnnouncement(AltEndGameSoundName[1], 1, true);
			}			
		}				
	}
	else
	{
		// End:0x162
		foreach __NFUN_325__(Class'Engine.PlayerController', C)
		{
			// End:0x161
			if(C.Player != none)
			{
				// End:0x148
				if(C.PlayerReplicationInfo == GameReplicationInfo.Winner)
				{
					C.PlayStatusAnnouncement(EndGameSoundName[0], 1, true);
					// End:0x161
					continue;
				}
				C.PlayStatusAnnouncement(EndGameSoundName[1], 1, true);
			}			
		}		
	}
	//return;	
}

function PlayStartupMessage()
{
	local UnrealPlayer P;

	// End:0x39
	foreach __NFUN_325__(Class'UnrealGame.UnrealPlayer', P)
	{
		// End:0x38
		if(P.Player != none)
		{
			P.PlayStartupMessage(StartupStage);
		}		
	}	
	//return;	
}

function float RatePlayerStart(NavigationPoint N, byte Team, Controller Player)
{
	local PlayerStart P;
	local float Score, NextDist;
	local Controller OtherPlayer;

	P = PlayerStart(N);
	// End:0x54
	if(((P == none) || !P.bEnabled) || P.PhysicsVolume.bWaterVolume)
	{
		return -10000000.0000000;
	}
	// End:0x74
	if(P.bPrimaryStart)
	{
		Score = 10000000.0000000;		
	}
	else
	{
		Score = 5000000.0000000;
	}
	// End:0xAE
	if((N == LastStartSpot) || N == LastPlayerStartSpot)
	{
		Score -= 10000.0000000;		
	}
	else
	{
		Score += (float(3000) * FRand());
	}
	// End:0x289
	foreach __NFUN_325__(Class'Engine.Controller', OtherPlayer)
	{
		// End:0x288
		if(OtherPlayer.bIsPlayer && OtherPlayer.Pawn != none)
		{
			// End:0x13A
			if(OtherPlayer.Pawn.Region.Zone == N.Region.Zone)
			{
				Score -= float(1500);
			}
			NextDist = VSize(OtherPlayer.Pawn.Location - N.Location);
			// End:0x1B2
			if(NextDist < (OtherPlayer.Pawn.CollisionRadius + OtherPlayer.Pawn.CollisionHeight))
			{
				Score -= 1000000.0000000;
				// End:0x288
				continue;
			}
			// End:0x206
			if((NextDist < float(3000)) && FastTrace(N.Location, OtherPlayer.Pawn.Location))
			{
				Score -= (10000.0000000 - NextDist);
				// End:0x288
				continue;
			}
			// End:0x288
			if((NumPlayers + NumBots) == 2)
			{
				Score += (float(2) * VSize(OtherPlayer.Pawn.Location - N.Location));
				// End:0x288
				if(FastTrace(N.Location, OtherPlayer.Pawn.Location))
				{
					Score -= float(10000);
				}
			}
		}		
	}	
	return FMax(Score, 5.0000000);
	//return;	
}

function bool CheckMaxLives(PlayerReplicationInfo Scorer)
{
	local Controller C;
	local PlayerReplicationInfo Living;
	local bool bNoneLeft;

	// End:0x13D
	if(MaxLives > 0)
	{
		// End:0x37
		if((Scorer != none) && !Scorer.bOutOfLives)
		{
			Living = Scorer;
		}
		bNoneLeft = true;
		// End:0xFB
		foreach __NFUN_325__(Class'Engine.Controller', C)
		{
			// End:0xFA
			if((((C.PlayerReplicationInfo != none) && C.bIsPlayer) && !C.PlayerReplicationInfo.bOutOfLives) && !C.PlayerReplicationInfo.bOnlySpectator)
			{
				// End:0xD7
				if(Living == none)
				{
					Living = C.PlayerReplicationInfo;
					// End:0xFA
					continue;
				}
				// End:0xFA
				if(C.PlayerReplicationInfo != Living)
				{
					bNoneLeft = false;
					// End:0xFB
					break;
				}
			}			
		}		
		// End:0x13D
		if(bNoneLeft)
		{
			// End:0x127
			if(Living != none)
			{
				EndGame(Living, "LastMan");				
			}
			else
			{
				EndGame(Scorer, "LastMan");
			}
			return true;
		}
	}
	return false;
	//return;	
}

function CheckScore(PlayerReplicationInfo Scorer)
{
	local Controller C;

	// End:0x10
	if(CheckMaxLives(Scorer))
	{
		return;
	}
	// End:0x36
	if((GameRulesModifiers != none) && GameRulesModifiers.CheckScore(Scorer))
	{
		return;
	}
	// End:0x10F
	if(Scorer != none)
	{
		// End:0x81
		if((GoalScore > 0) && Scorer.Score >= float(GoalScore))
		{
			EndGame(Scorer, "fraglimit");			
		}
		else
		{
			// End:0x10F
			if(bOverTime)
			{
				// End:0xF8
				foreach __NFUN_325__(Class'Engine.Controller', C)
				{
					// End:0xF7
					if(((C.PlayerReplicationInfo != none) && C.PlayerReplicationInfo != Scorer) && C.PlayerReplicationInfo.Score >= Scorer.Score)
					{						
						return;
					}					
				}				
				EndGame(Scorer, "fraglimit");
			}
		}
	}
	//return;	
}

function ScoreObjective(PlayerReplicationInfo Scorer, float Score)
{
	// End:0x40
	if(Scorer != none)
	{
		Scorer.Score += Score;
		ScoreEvent(Scorer, Score, "ObjectiveScore");
	}
	// End:0x66
	if(GameRulesModifiers != none)
	{
		GameRulesModifiers.ScoreObjective(Scorer, int(Score));
	}
	CheckScore(Scorer);
	//return;	
}

function ScoreKill(Controller Killer, Controller Other)
{
	local PlayerReplicationInfo OtherPRI;

	OtherPRI = Other.PlayerReplicationInfo;
	// End:0x65
	if(OtherPRI != none)
	{
		OtherPRI.NumLives++;
		// End:0x65
		if((MaxLives > 0) && OtherPRI.NumLives >= MaxLives)
		{
			OtherPRI.bOutOfLives = true;
		}
	}
	// End:0x186
	if(((((bAllowTaunts && Killer != none) && Killer != Other) && Killer.AutoTaunt()) && Killer.PlayerReplicationInfo != none) && Killer.PlayerReplicationInfo.VoiceType != none)
	{
		// End:0x139
		if(Killer.IsA('PlayerController'))
		{
			Killer.SendMessage(OtherPRI, 'AutoTaunt', byte(Killer.PlayerReplicationInfo.VoiceType.static.PickRandomTauntFor(Killer, false, false)), 10.0000000, 'Global');			
		}
		else
		{
			Killer.SendMessage(OtherPRI, 'AutoTaunt', byte(Killer.PlayerReplicationInfo.VoiceType.static.PickRandomTauntFor(Killer, false, true)), 10.0000000, 'Global');
		}
	}
	super(GameInfo).ScoreKill(Killer, Other);
	// End:0x1B0
	if((Killer == none) || Other == none)
	{
		return;
	}
	// End:0x243
	if(bAdjustSkill && Killer.IsA('PlayerController') || Other.IsA('PlayerController'))
	{
		// End:0x214
		if(Killer.IsA('AIController'))
		{
			AdjustSkill(AIController(Killer), PlayerController(Other), true);
		}
		// End:0x243
		if(Other.IsA('AIController'))
		{
			AdjustSkill(AIController(Other), PlayerController(Killer), false);
		}
	}
	//return;	
}

function AdjustSkill(AIController B, PlayerController P, bool bWinner)
{
	// End:0x7D
	if(bWinner)
	{
		PlayerKills += 1;
		AdjustedDifficulty = FMax(0.0000000, AdjustedDifficulty - (2.0000000 / FMin(float(PlayerKills), 10.0000000)));
		// End:0x7A
		if(B.Skill > AdjustedDifficulty)
		{
			B.Skill = AdjustedDifficulty;
			Bot(B).ResetSkill();
		}		
	}
	else
	{
		PlayerDeaths += 1;
		AdjustedDifficulty = FMin(7.0000000, AdjustedDifficulty + (2.0000000 / FMin(float(PlayerDeaths), 10.0000000)));
		// End:0xDA
		if(B.Skill < AdjustedDifficulty)
		{
			B.Skill = AdjustedDifficulty;
		}
	}
	// End:0xFE
	if(Abs(AdjustedDifficulty - GameDifficulty) >= float(1))
	{
		GameDifficulty = AdjustedDifficulty;
		SaveConfig();
	}
	//return;	
}

function int ReduceDamage(int Damage, Pawn injured, Pawn instigatedBy, Vector HitLocation, out Vector Momentum, Class<DamageType> DamageType)
{
	local float InstigatorSkill;

	// End:0x6C
	if((((instigatedBy != none) && instigatedBy != injured) && (Level.TimeSeconds - injured.SpawnTime) < SpawnProtectionTime) && (Class<WeaponDamageType>(DamageType) != none) || Class<VehicleDamageType>(DamageType) != none)
	{
		return 0;
	}
	Damage = super(GameInfo).ReduceDamage(Damage, injured, instigatedBy, HitLocation, Momentum, DamageType);
	// End:0xA7
	if(instigatedBy == none)
	{
		return Damage;
	}
	// End:0x281
	if(Level.Game.GameDifficulty <= float(3))
	{
		// End:0x111
		if((injured.IsPlayerPawn() && injured == instigatedBy) && int(Level.NetMode) == int(NM_Standalone))
		{
			Damage *= 0.5000000;
		}
		// End:0x281
		if((AIController(instigatedBy.Controller) != none) && (int(Level.NetMode) == int(NM_Standalone)) || TurretController(instigatedBy.Controller) != none)
		{
			InstigatorSkill = AIController(instigatedBy.Controller).Skill;
			// End:0x281
			if((InstigatorSkill <= float(3)) && injured.IsHumanControlled())
			{
				// End:0x25D
				if(((instigatedBy.Weapon != none) && instigatedBy.Weapon.bMeleeWeapon) || ((injured.Weapon != none) && injured.Weapon.bMeleeWeapon) && VSize(injured.Location - instigatedBy.Location) < float(600))
				{
					Damage = int(float(Damage) * (0.7600000 + (0.0800000 * InstigatorSkill)));					
				}
				else
				{
					Damage = int(float(Damage) * (0.2500000 + (0.1500000 * InstigatorSkill)));
				}
			}
		}
	}
	return int(float(Damage) * instigatedBy.DamageScaling);
	//return;	
}

exec function AddNamedBot(string botname)
{
	// End:0x38
	if(int(Level.NetMode) != int(NM_Standalone))
	{
		MinPlayers = Max(MinPlayers + 1, (NumPlayers + NumBots) + 1);
	}
	AddBot(botname);
	//return;	
}

exec function AddBots(int Num)
{
	Num = Clamp(Num, 0, 256 - (NumPlayers + NumBots));
	J0x21:

	// End:0x6F [Loop If]
	if(--Num >= 0)
	{
		// End:0x66
		if(int(Level.NetMode) != int(NM_Standalone))
		{
			MinPlayers = Max(MinPlayers + 1, (NumPlayers + NumBots) + 1);
		}
		AddBot();
		// [Loop Continue]
		goto J0x21;
	}
	//return;	
}

exec function KillBots(int Num)
{
	local Bot C;

	bPlayersVsBots = false;
	// End:0x1E
	if(Num == 0)
	{
		Num = NumBots;
	}
	// End:0x3E
	if(int(Level.NetMode) != int(NM_Standalone))
	{
		MinPlayers = 0;
	}
	bKillBots = true;
	// End:0x83
	if(Num > 0)
	{
		// End:0x82
		foreach __NFUN_325__(Class'UnrealGame.Bot', C)
		{
			// End:0x81
			if((KillBot(C)) && --Num == 0)
			{
				// End:0x82
				break;
			}			
		}		
	}
	bKillBots = false;
	//return;	
}

function bool KillBot(Controller C)
{
	local Bot B;

	B = Bot(C);
	// End:0x128
	if(B != none)
	{
		// End:0x53
		if(int(Level.NetMode) != int(NM_Standalone))
		{
			MinPlayers = Max(MinPlayers - 1, (NumPlayers + NumBots) - 1);
		}
		// End:0xD5
		if((Vehicle(B.Pawn) != none) && Vehicle(B.Pawn).Driver != none)
		{
			Vehicle(B.Pawn).Driver.KilledBy(Vehicle(B.Pawn).Driver);			
		}
		else
		{
			// End:0x10F
			if(B.Pawn != none)
			{
				B.Pawn.KilledBy(B.Pawn);
			}
		}
		// End:0x126
		if(B != none)
		{
			B.Destroy();
		}
		return true;
	}
	return false;
	//return;	
}

function ReviewJumpSpots(name TestLabel)
{
	local NavigationPoint StartSpot;
	local PlayerController C;
	local Pawn P;
	local Bot B;
	local Class<Pawn> PawnClass;

	bReviewingJumpSpots = true;
	B = Spawn(Class'UnrealGame.Bot');
	B.Squad = Spawn(Class'UnrealGame.DMSquad');
	StartSpot = FindPlayerStart(B, 0);
	PawnClass = Class<Pawn>(DynamicLoadObject(DefaultPlayerClassName, Class'Core.Class'));
	P = Spawn(PawnClass,,, StartSpot.Location, StartSpot.Rotation);
	// End:0xBF
	if(P == none)
	{
		Log("Failed to spawn pawn to reviewjumpspots");
		return;
	}
	B.Possess(P);
	B.GoalString = "TRANSLOCATING";
	// End:0x162
	foreach __NFUN_325__(Class'Engine.PlayerController', C)
	{
		// End:0x161
		if(C.Player != none)
		{
			C.bBehindView = true;
			C.SetViewTarget(P);
			// End:0x15E
			if(UnrealPlayer(C) != none)
			{
				UnrealPlayer(C).ShowAI();
			}
			// End:0x162
			break;
		}		
	}	
	P.GiveWeapon("XWeapons.TransLauncher");
	// End:0x1A7
	if(TestLabel == 'None')
	{
		TestLabel = 'Begin';		
	}
	else
	{
		B.bSingleTestSection = true;
	}
	B.GotoState('Testing', TestLabel);
	//return;	
}

static event bool AcceptPlayInfoProperty(string PropertyName)
{
	// End:0x30
	if((default.MaxLives <= 0) && InStr(PropertyName, "LateEntryLives") != -1)
	{
		return false;
	}
	// End:0x7C
	if(((!default.bColoredDMSkins && !default.bTeamGame) || default.bForceNoPlayerLights) && InStr(PropertyName, "bAllowPlayerLights") != -1)
	{
		return false;
	}
	return super(GameInfo).AcceptPlayInfoProperty(PropertyName);
	//return;	
}

static function FillPlayInfo(PlayInfo PlayInfo)
{
	super.FillPlayInfo(PlayInfo);
	// End:0x58
	if(!default.bTeamGame)
	{
		PlayInfo.AddSetting(default.BotsGroup, "bAdjustSkill", GetDisplayText("bAdjustSkill"), 0, 2, "Check",,,, true);
	}
	PlayInfo.AddSetting(default.GameGroup, "SpawnProtectionTime", GetDisplayText("SpawnProtectionTime"), 2, 1, "Text", "8;0.0:30.0",,, true);
	PlayInfo.AddSetting(default.GameGroup, "LateEntryLives", GetDisplayText("LateEntryLives"), 50, 1, "Text", "3",, true, true);
	PlayInfo.AddSetting(default.GameGroup, "bColoredDMSkins", GetDisplayText("bColoredDMSkins"), 1, 1, "Check",,,, true);
	PlayInfo.AddSetting(default.GameGroup, "bAllowPlayerLights", GetDisplayText("bAllowPlayerLights"), 1, 1, "Check",,,, true);
	PlayInfo.AddSetting(default.RulesGroup, "bAllowTrans", GetDisplayText("bAllowTrans"), 0, 1, "Check",,,, true);
	PlayInfo.AddSetting(default.RulesGroup, "bAllowTaunts", GetDisplayText("bAllowTaunts"), 1, 1, "Check",,,, true);
	PlayInfo.AddSetting(default.RulesGroup, "bForceRespawn", GetDisplayText("bForceRespawn"), 0, 1, "Check",,, true, true);
	PlayInfo.AddSetting(default.RulesGroup, "bPlayersMustBeReady", GetDisplayText("bPlayersMustBeReady"), 1, 1, "Check",,, true, true);
	PlayInfo.AddSetting(default.ServerGroup, "MinNetPlayers", GetDisplayText("MinNetPlayers"), 100, 1, "Text", "3;0:256",, true, true);
	PlayInfo.AddSetting(default.ServerGroup, "NetWait", GetDisplayText("NetWait"), 200, 1, "Text", "3;0:60",, true, true);
	PlayInfo.AddSetting(default.ServerGroup, "RestartWait", GetDisplayText("RestartWait"), 200, 1, "Text", "3;0:60",, true, true);
	Class'IpDrv.MasterServerUplink'.static.FillPlayInfo(PlayInfo);
	PlayInfo.PopClass();
	//return;	
}

static function string GetDisplayText(string PropName)
{
	switch(PropName)
	{
		// End:0x1B
		case "NetWait":
			return default.DMPropsDisplayText[0];
		// End:0x35
		case "MinNetPlayers":
			return default.DMPropsDisplayText[1];
		// End:0x4E
		case "RestartWait":
			return default.DMPropsDisplayText[2];
		// End:0x67
		case "bTournament":
			return default.DMPropsDisplayText[3];
		// End:0x88
		case "bPlayersMustBeReady":
			return default.DMPropsDisplayText[4];
		// End:0xA3
		case "bForceRespawn":
			return default.DMPropsDisplayText[5];
		// End:0xBD
		case "bAdjustSkill":
			return default.DMPropsDisplayText[6];
		// End:0xD7
		case "bAllowTaunts":
			return default.DMPropsDisplayText[7];
		// End:0xF8
		case "SpawnProtectionTime":
			return default.DMPropsDisplayText[8];
		// End:0x111
		case "bAllowTrans":
			return default.DMPropsDisplayText[9];
		// End:0x12E
		case "bColoredDMSkins":
			return default.DMPropsDisplayText[10];
		// End:0x14A
		case "LateEntryLives":
			return default.DMPropsDisplayText[12];
		// End:0x16A
		case "bAllowPlayerLights":
			return default.DMPropsDisplayText[13];
		// End:0xFFFF
		default:
			return super(GameInfo).GetDisplayText(PropName);
			break;
	}
	//return;	
}

static event string GetDescriptionText(string PropName)
{
	switch(PropName)
	{
		// End:0x1B
		case "NetWait":
			return default.DMPropDescText[0];
		// End:0x35
		case "MinNetPlayers":
			return default.DMPropDescText[1];
		// End:0x4E
		case "RestartWait":
			return default.DMPropDescText[2];
		// End:0x67
		case "bTournament":
			return default.DMPropDescText[3];
		// End:0x88
		case "bPlayersMustBeReady":
			return default.DMPropDescText[4];
		// End:0xA3
		case "bForceRespawn":
			return default.DMPropDescText[5];
		// End:0xBD
		case "bAdjustSkill":
			return default.DMPropDescText[6];
		// End:0xD7
		case "bAllowTaunts":
			return default.DMPropDescText[7];
		// End:0xF8
		case "SpawnProtectionTime":
			return default.DMPropDescText[8];
		// End:0x111
		case "bAllowTrans":
			return default.DMPropDescText[9];
		// End:0x12E
		case "bColoredDMSkins":
			return default.DMPropDescText[10];
		// End:0x148
		case "bAutoNumBots":
			return default.DMPropDescText[11];
		// End:0x164
		case "LateEntryLives":
			return default.DMPropDescText[12];
		// End:0x184
		case "bAllowPlayerLights":
			return default.DMPropDescText[13];
		// End:0xFFFF
		default:
			return super.GetDescriptionText(PropName);
			break;
	}
	//return;	
}

function NotifySpree(Controller Other, int Num)
{
	local PlayerController C;

	// End:0x16
	if(Num == 5)
	{
		Num = 0;		
	}
	else
	{
		// End:0x2C
		if(Num == 10)
		{
			Num = 1;			
		}
		else
		{
			// End:0x43
			if(Num == 15)
			{
				Num = 2;				
			}
			else
			{
				// End:0x5A
				if(Num == 20)
				{
					Num = 3;					
				}
				else
				{
					// End:0x71
					if(Num == 25)
					{
						Num = 4;						
					}
					else
					{
						// End:0x88
						if(Num == 30)
						{
							Num = 5;							
						}
						else
						{
							return;
						}
					}
				}
			}
		}
	}
	SpecialEvent(Other.PlayerReplicationInfo, "spree_" $ string(Num + 1));
	// End:0x127
	if(TeamPlayerReplicationInfo(Other.PlayerReplicationInfo) != none)
	{
		TeamPlayerReplicationInfo(Other.PlayerReplicationInfo).Spree[Num] += byte(1);
		// End:0x127
		if(Num > 0)
		{
			TeamPlayerReplicationInfo(Other.PlayerReplicationInfo).Spree[Num - 1] -= byte(1);
		}
	}
	Other.AwardAdrenaline(ADR_MajorKill);
	// End:0x173
	foreach __NFUN_325__(Class'Engine.PlayerController', C)
	{
		C.ReceiveLocalizedMessage(Class'UnrealGame.KillingSpreeMessage', Num, Other.PlayerReplicationInfo);		
	}	
	//return;	
}

function EndSpree(Controller Killer, Controller Other)
{
	local PlayerController C;

	// End:0x23
	if((Other == none) || !Other.bIsPlayer)
	{
		return;
	}
	// End:0xBE
	foreach __NFUN_325__(Class'Engine.PlayerController', C)
	{
		// End:0x8C
		if(((Killer == Other) || Killer == none) || !Killer.bIsPlayer)
		{
			C.ReceiveLocalizedMessage(Class'UnrealGame.KillingSpreeMessage', 1, none, Other.PlayerReplicationInfo);
			// End:0xBD
			continue;
		}
		C.ReceiveLocalizedMessage(Class'UnrealGame.KillingSpreeMessage', 0, Other.PlayerReplicationInfo, Killer.PlayerReplicationInfo);		
	}	
	//return;	
}

function bool WantsPickups(Bot B)
{
	return true;
	//return;	
}

static function PrecacheGameAnnouncements(AnnouncerVoice V, bool bRewardSounds)
{
	super(GameInfo).PrecacheGameAnnouncements(V, bRewardSounds);
	// End:0x9C
	if(!bRewardSounds)
	{
		V.PrecacheSound(default.EndGameSoundName[0]);
		V.PrecacheSound(default.EndGameSoundName[1]);
		V.PrecacheSound(default.AltEndGameSoundName[0]);
		V.PrecacheSound(default.AltEndGameSoundName[1]);
		V.PrecacheSound('Last_Second_Save');
		V.PrecacheSound('Play');
	}
	//return;	
}

event SetGrammar()
{
	//return;	
}

static function string GetNextLoadHint(string MapName)
{
	local array<string> Hints;

	// End:0x1B
	if(Rand(100) < 75)
	{
		Hints = GetAllLoadHints(true);		
	}
	else
	{
		Hints = GetAllLoadHints();
	}
	// End:0x42
	if(Hints.Length > 0)
	{
		return Hints[Rand(Hints.Length)];
	}
	return "";
	//return;	
}

static function array<string> GetAllLoadHints(optional bool bThisClassOnly)
{
	local int i;
	local array<string> Hints;

	// End:0x25
	if(!bThisClassOnly || default.DMHints.Length == 0)
	{
		Hints = super(GameInfo).GetAllLoadHints();
	}
	i = 0;
	J0x2C:

	// End:0x5E [Loop If]
	if(i < default.DMHints.Length)
	{
		Hints[Hints.Length] = default.DMHints[i];
		i++;
		// [Loop Continue]
		goto J0x2C;
	}
	return Hints;
	//return;	
}

auto state PendingMatch
{
	function RestartPlayer(Controller aPlayer)
	{
		// End:0x16
		if(CountDown <= 0)
		{
			super(GameInfo).RestartPlayer(aPlayer);
		}
		//return;		
	}

	function bool AddBot(optional string botname)
	{
		// End:0x20
		if(int(Level.NetMode) == int(NM_Standalone))
		{
			InitialBots++;
		}
		// End:0x3A
		if(botname != "")
		{
			PreLoadNamedBot(botname);			
		}
		else
		{
			PreLoadBot();
		}
		return true;
		//return;		
	}

	function Timer()
	{
		local PlayerController P;
		local bool bReady;

		global.Timer();
		// End:0x19
		if(NumPlayers == 0)
		{
			bWaitForNetPlayers = true;
		}
		// End:0x90
		if(bWaitForNetPlayers && int(Level.NetMode) != int(NM_Standalone))
		{
			// End:0x56
			if(NumPlayers >= MinNetPlayers)
			{
				ElapsedTime++;				
			}
			else
			{
				ElapsedTime = 0;
			}
			// End:0x90
			if((NumPlayers == MaxPlayers) || ElapsedTime > NetWait)
			{
				bWaitForNetPlayers = false;
				CountDown = default.CountDown;
			}
		}
		// End:0xD8
		if((int(Level.NetMode) != int(NM_Standalone)) && bWaitForNetPlayers || bTournament && NumPlayers < MaxPlayers)
		{
			PlayStartupMessage();
			return;
		}
		bReady = true;
		StartupStage = 1;
		// End:0x1A2
		if(!bStartedCountDown && (bTournament || bPlayersMustBeReady) || int(Level.NetMode) == int(NM_Standalone))
		{
			// End:0x1A1
			foreach __NFUN_325__(Class'Engine.PlayerController', P)
			{
				// End:0x1A0
				if((((P.PlayerReplicationInfo != none) && P.bIsPlayer) && P.PlayerReplicationInfo.bWaitingPlayer) && !P.PlayerReplicationInfo.bReadyToPlay)
				{
					bReady = false;
				}				
			}			
		}
		// End:0x1EE
		if(bReady && !bReviewingJumpSpots)
		{
			bStartedCountDown = true;
			CountDown--;
			// End:0x1DB
			if(CountDown <= 0)
			{
				StartMatch();				
			}
			else
			{
				StartupStage = byte(int(5) - CountDown);
			}
		}
		PlayStartupMessage();
		//return;		
	}

	function BeginState()
	{
		bWaitingToStartMatch = true;
		StartupStage = 0;
		// End:0x2A
		if(IsA('xLastManStandingGame'))
		{
			NetWait = Max(NetWait, 10);
		}
		//return;		
	}
Begin:

	// End:0x0F
	if(bQuickStart)
	{
		StartMatch();
	}
	stop;					
}

state MatchInProgress
{
	function Timer()
	{
		local PlayerController P;

		global.Timer();
		// End:0x1F
		if(!bFinalStartup)
		{
			bFinalStartup = true;
			PlayStartupMessage();
		}
		// End:0x7C
		if(bForceRespawn)
		{
			// End:0x7B
			foreach __NFUN_325__(Class'Engine.PlayerController', P)
			{
				// End:0x7A
				if((P.Pawn == none) && !P.PlayerReplicationInfo.bOnlySpectator)
				{
					P.ServerReStartPlayer();
				}				
			}			
		}
		// End:0xA4
		if(((NeedPlayers()) && AddBot()) && RemainingBots > 0)
		{
			RemainingBots--;
		}
		// End:0xC2
		if(bOverTime)
		{
			EndGame(none, "TimeLimit");			
		}
		else
		{
			// End:0x142
			if(TimeLimit > 0)
			{
				GameReplicationInfo.bStopCountDown = false;
				RemainingTime--;
				GameReplicationInfo.RemainingTime = RemainingTime;
				// End:0x122
				if((float(RemainingTime) % float(60)) == float(0))
				{
					GameReplicationInfo.RemainingMinute = RemainingTime;
				}
				// End:0x13F
				if(RemainingTime <= 0)
				{
					EndGame(none, "TimeLimit");
				}				
			}
			else
			{
				// End:0x168
				if((MaxLives > 0) && (NumPlayers + NumBots) != 1)
				{
					CheckMaxLives(none);
				}
			}
		}
		ElapsedTime++;
		GameReplicationInfo.ElapsedTime = ElapsedTime;
		//return;		
	}

	function BeginState()
	{
		local PlayerReplicationInfo PRI;

		// End:0x21
		foreach DynamicActors(Class'Engine.PlayerReplicationInfo', PRI)
		{
			PRI.StartTime = 0;			
		}		
		ElapsedTime = 0;
		bWaitingToStartMatch = false;
		StartupStage = 5;
		PlayStartupMessage();
		StartupStage = 6;
		//return;		
	}
	stop;	
}

state MatchOver
{
	function RestartPlayer(Controller aPlayer)
	{
		//return;		
	}

	function ScoreKill(Controller Killer, Controller Other)
	{
		//return;		
	}

	function int ReduceDamage(int Damage, Pawn injured, Pawn instigatedBy, Vector HitLocation, out Vector Momentum, Class<DamageType> DamageType)
	{
		return 0;
		//return;		
	}

	function bool ChangeTeam(Controller Other, int Num, bool bNewTeam)
	{
		return false;
		//return;		
	}

	function Timer()
	{
		local PlayerController P;

		global.Timer();
		// End:0x3A
		if(!bGameRestarted && Level.TimeSeconds > (EndTime + float(RestartWait)))
		{
			RestartGame();
		}
		// End:0x90
		if(EndGameFocus != none)
		{
			EndGameFocus.bAlwaysRelevant = true;
			// End:0x8F
			foreach __NFUN_325__(Class'Engine.PlayerController', P)
			{
				// End:0x8E
				if(P.Player != none)
				{
					P.ClientSetViewTarget(EndGameFocus);
				}				
			}			
		}
		EndMessageCounter++;
		// End:0xAC
		if(EndMessageCounter == EndMessageWait)
		{
			PlayEndOfMatchMessage();
		}
		// End:0x11E
		if((Level.TimeSeconds > (EndTime + float(RestartWait / 2))) && CurrentGameProfile != none)
		{
			// End:0x11D
			foreach __NFUN_325__(Class'Engine.PlayerController', P)
			{
				// End:0x11C
				if(P.myHUD != none)
				{
					P.myHUD.bShowLocalStats = true;
				}				
			}			
		}
		//return;		
	}

	function bool NeedPlayers()
	{
		return false;
		//return;		
	}

	function BeginState()
	{
		local PlayerController P;

		GameReplicationInfo.bStopCountDown = true;
		// End:0xAE
		if(CurrentGameProfile != none)
		{
			EndTime = Level.TimeSeconds + float(SinglePlayerWait);
			// End:0xAD
			foreach __NFUN_325__(Class'Engine.PlayerController', P)
			{
				// End:0xAC
				if(P.myHUD != none)
				{
					P.myHUD.bShowScoreBoard = true;
					CurrentGameProfile.RegisterGame(self, P.PlayerReplicationInfo);
					SavePackage(CurrentGameProfile.PackageName);
					// End:0xAD
					break;
				}				
			}			
		}
		//return;		
	}
	stop;	
}

defaultproperties
{
	NetWait=5
	MinNetPlayers=1
	RestartWait=30
	bAutoNumBots=true
	bAllowTaunts=true
	bWaitForNetPlayers=true
	NumRounds=1
	SpawnProtectionTime=2.0000000
	LateEntryLives=1
	CountDown=4
	DMSquadClass=Class'UnrealGame.DMSquad'
	EndMessageWait=2
	EndGameSoundName[0]="You_Have_Won_the_Match"
	EndGameSoundName[1]="You_Have_Lost_the_Match"
	AltEndGameSoundName[0]="Flawless_victory"
	AltEndGameSoundName[1]="Humiliating_defeat"
	NamePrefixes[0]="Slaying_"
	NamePrefixes[2]="The_Real_"
	NamePrefixes[3]="Evil_"
	NamePrefixes[5]="Owning_"
	NamePrefixes[7]="Evil_"
	NameSuffixes[1]="_is_lame"
	NameSuffixes[4]="_sucks"
	NameSuffixes[6]="_OwnsYou"
	NameSuffixes[8]="_jr"
	NameSuffixes[9]="'s_clone"
	DMPropsDisplayText[0]="Net Start Delay"
	DMPropsDisplayText[1]="Min. Net Players"
	DMPropsDisplayText[2]="Restart Delay"
	DMPropsDisplayText[3]="Tournament Game"
	DMPropsDisplayText[4]="Players Must Be Ready"
	DMPropsDisplayText[5]="Force Respawn"
	DMPropsDisplayText[6]="Auto Adjust Bots Skill"
	DMPropsDisplayText[7]="Allow Taunts"
	DMPropsDisplayText[8]="Spawn Protection Time"
	DMPropsDisplayText[9]="Allow Translocator"
	DMPropsDisplayText[10]="Use Team Skins"
	DMPropsDisplayText[11]="Use Map Defaults"
	DMPropsDisplayText[12]="Late Entry Cutoff"
	DMPropsDisplayText[13]="Enable Player Highlighting"
	DMPropDescText[0]="Delay before game starts to allow other players to join."
	DMPropDescText[1]="How many players must join before net game will start."
	DMPropDescText[2]="How long the server waits after the end of a game before loading the next map."
	DMPropDescText[3]="Tournament Game"
	DMPropDescText[4]="If enabled, players must click ready before the game starts."
	DMPropDescText[5]="Players are forced to respawn immediately after dying."
	DMPropDescText[6]="Bot skill adjusts automatically based on how they are doing against you."
	DMPropDescText[7]="Enables players to use the recorded taunts."
	DMPropDescText[8]="Specifies how long players are invulnerable after they spawn (unless they fire)."
	DMPropDescText[9]="If enabled, players will start with a translocator."
	DMPropDescText[10]="If checked, players will have brighter red or blue skins."
	DMPropDescText[11]="Use default number of bots specified by the map."
	DMPropDescText[12]="Specifies the maximum number of lives a player can have lost before new players can no longer enter the game."
	DMPropDescText[13]="At a distance, players have a team colored glow."
	YouDestroyed="You destroyed a"
	ADR_Kill=5.0000000
	ADR_MajorKill=10.0000000
	ADR_MinorError=-2.0000000
	ADR_MinorBonus=5.0000000
	ADR_KillTeamMate=-5.0000000
	EpicNames[0]="Eepers"
	EpicNames[1]="Bellheimer"
	EpicNames[2]="Shanesta"
	EpicNames[3]="EpicBoy"
	EpicNames[4]="Turtle"
	EpicNames[5]="Talisman"
	EpicNames[6]="BigSquid"
	EpicNames[7]="Ced"
	EpicNames[8]="Andrew"
	EpicNames[9]="DrSin"
	EpicNames[10]="The_Reaper"
	EpicNames[11]="ProfessorDeath"
	EpicNames[12]="DarkByte"
	EpicNames[13]="Jack"
	EpicNames[14]="Lankii"
	EpicNames[15]="MarkRein"
	EpicNames[16]="Perninator"
	EpicNames[17]="SteveG"
	EpicNames[18]="Cpt.Pinhead"
	EpicNames[19]="Christoph"
	EpicNames[20]="Tim"
	MaleBackupNames[0]="Shiva"
	MaleBackupNames[1]="Ares"
	MaleBackupNames[2]="Reaper"
	MaleBackupNames[3]="Samurai"
	MaleBackupNames[4]="Loki"
	MaleBackupNames[5]="Cuchulain"
	MaleBackupNames[6]="Thor"
	MaleBackupNames[7]="Talisman"
	MaleBackupNames[8]="Paladin"
	MaleBackupNames[9]="Scythe"
	MaleBackupNames[10]="Jugular"
	MaleBackupNames[11]="Slash"
	MaleBackupNames[12]="Chisel"
	MaleBackupNames[13]="Chief"
	MaleBackupNames[14]="Prime"
	MaleBackupNames[15]="Oligarch"
	MaleBackupNames[16]="Caliph"
	MaleBackupNames[17]="Duce"
	MaleBackupNames[18]="Kruger"
	MaleBackupNames[19]="Saladin"
	MaleBackupNames[20]="Patriarch"
	MaleBackupNames[21]="Wyrm"
	MaleBackupNames[22]="Praetorian"
	MaleBackupNames[23]="Moghul"
	MaleBackupNames[24]="Assassin"
	MaleBackupNames[25]="Bane"
	MaleBackupNames[26]="Svengali"
	MaleBackupNames[27]="Oblivion"
	MaleBackupNames[28]="Magnate"
	MaleBackupNames[29]="Hadrian"
	MaleBackupNames[30]="Dirge"
	MaleBackupNames[31]="Rajah"
	FemaleBackupNames[0]="Shonna"
	FemaleBackupNames[1]="Athena"
	FemaleBackupNames[2]="Charm"
	FemaleBackupNames[3]="Voodoo"
	FemaleBackupNames[4]="Noranna"
	FemaleBackupNames[5]="Ranu"
	FemaleBackupNames[6]="Chasm"
	FemaleBackupNames[7]="Lynx"
	FemaleBackupNames[8]="Elyss"
	FemaleBackupNames[9]="Malice"
	FemaleBackupNames[10]="Verdict"
	FemaleBackupNames[11]="Kismet"
	FemaleBackupNames[12]="Wyrd"
	FemaleBackupNames[13]="Qira"
	FemaleBackupNames[14]="Exodus"
	FemaleBackupNames[15]="Grimm"
	FemaleBackupNames[16]="Brutality"
	FemaleBackupNames[17]="Adamant"
	FemaleBackupNames[18]="Ruin"
	FemaleBackupNames[19]="Moshica"
	FemaleBackupNames[20]="Demise"
	FemaleBackupNames[21]="Shara"
	FemaleBackupNames[22]="Pestilence"
	FemaleBackupNames[23]="Quark"
	FemaleBackupNames[24]="Fiona"
	FemaleBackupNames[25]="Ulanna"
	FemaleBackupNames[26]="Kara"
	FemaleBackupNames[27]="Scourge"
	FemaleBackupNames[28]="Minerva"
	FemaleBackupNames[29]="Woe"
	FemaleBackupNames[30]="Coral"
	FemaleBackupNames[31]="Torment"
	LoginMenuClass="GUI2K4.UT2K4PlayerLoginMenu"
	DMHints[0]="Every weapon has two firing modes, a regular fire mode when you press %FIRE% and an alternate fire mode when you press %ALTFIRE%."
	DMHints[1]="Press jump again at the peak of a jump to get an extra boost."
	DMHints[2]="Pressing a movement key twice in rapid succession will make your character dodge in that direction."
	DMHints[3]="You can also dodge off walls while in the air."
	DMHints[4]="You can change weapons by pressing the associated weapon number, or scroll through your weapons using %NEXTWEAPON% and %PREVWEAPON%."
	DMHints[5]="The shock combo is a powerful explosion created with a shock rifle by shooting a shock ball with a shock beam."
	DMHints[6]="When loading up rockets using the rocket launcher alt fire, press the regular fire button before releasing the rockets to fire them in a tight spiral."
	DMHints[7]="You can toggle the scoreboard display on or off at any time by pressing %SHOWSCORES%."
	DMHints[8]="You receive adrenaline for killing enemies and other accomplishments.  Once your adrenaline reaches 100, you can start an adrenaline combo by using the correct movement key combination."
	DMHints[9]="%SHOWSTATS% will bring up a personal stats display."
	DMHints[10]="You can shoot down enemy Redeemer missiles with a well placed shot."
	DMHints[11]="Press %TALK% and type your message to send text messages to other players."
	DMHints[12]="You can play taunts or other voice messages through the voice menu by pressing %SPEECHMENUTOGGLE%."
	DMHints[13]="While crouching (by holding down %DUCK%), you cannot fall off a ledge."
	bRestartLevel=false
	bPauseable=false
	bWeaponStay=true
	bLoggingGame=true
	AutoAim=1.0000000
	DefaultPlayerClassName="XGame.xPawn"
	ScoreBoardType="XInterface.ScoreBoardDeathMatch"
	HUDType="XInterface.HudCDeathMatch"
	MapListType="XInterface.MapListDeathMatch"
	MapPrefix="DM"
	BeaconName="DM"
	MaxPlayers=32
	GoalScore=25
	TimeLimit=20
	MutatorClass="UnrealGame.DMMutator"
	PlayerControllerClassName="XGame.XPlayer"
	Description="Free-for-all kill or be killed.  The player with the most frags wins."
}
