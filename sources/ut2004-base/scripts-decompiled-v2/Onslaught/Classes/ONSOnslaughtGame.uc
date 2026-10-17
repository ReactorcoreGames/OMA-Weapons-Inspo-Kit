class ONSOnslaughtGame extends xTeamGame
	config
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

const ONSPROPNUM = 3;

struct PowerLinkSetup
{
	var name BaseNode;
	var array<name> LinkedNodes;
};

var array<ONSPowerCore> PowerCores;
var int FinalCore[2];
var array<ONSPowerLinkOfficialSetup> OfficialPowerLinkSetups;
var array<ONSPowerLinkCustomSetup> CustomPowerLinkSetups;
var array<PowerLink> PowerLinks;
var config int OvertimeCoreDrainPerSec;
var config bool bRandSetupAfterReset;
var config bool bSwapSidesAfterReset;
var bool bSidesAreSwitched;
var bool bCurrentSetupIsOfficial;
var string CurrentSetupName;
var localized string ONSPropsDisplayText[3];
var localized string ONSPropDescText[3];
var(LoadingHints) private localized array<localized string> ONSHints;

function bool AllowTransloc()
{
	return false;
	//return;	
}

static function bool NeverAllowTransloc()
{
	return true;
	//return;	
}

static function bool AllowMutator(string MutatorClassName)
{
	// End:0x0E
	if(MutatorClassName == "")
	{
		return false;
	}
	// End:0x2D
	if(MutatorClassName ~= "xGame.MutInstagib")
	{
		return false;
	}
	// End:0x50
	if(MutatorClassName ~= "xGame.MutZoomInstagib")
	{
		return false;
	}
	return super(GameInfo).AllowMutator(MutatorClassName);
	//return;	
}

event SetGrammar()
{
	LoadSRGrammar("ONS");
	//return;	
}

function bool ApplyOrder(PlayerController Sender, int RecipientID, int OrderID)
{
	local Bot P;

	// End:0xE9
	if(OrderID == 299)
	{
		// End:0xE6
		foreach __NFUN_325__(Class'UnrealGame.Bot', P)
		{
			// End:0xE5
			if((((P.Pawn != none) && P.PlayerReplicationInfo != none) && P.PlayerReplicationInfo.Team == Sender.PlayerReplicationInfo.Team) && (RecipientID == -1) || RecipientID == P.PlayerReplicationInfo.TeamID)
			{
				P.GetOutOfVehicle();
				// End:0xE5
				if(RecipientID == P.PlayerReplicationInfo.TeamID)
				{
					// End:0xE6
					break;
				}
			}			
		}		
		return true;
	}
	return super(TeamGame).ApplyOrder(Sender, RecipientID, OrderID);
	//return;	
}

function int ParseOrder(string OrderString)
{
	// End:0x19
	if(OrderString == "GET OUT")
	{
		return 299;
	}
	return super(TeamGame).ParseOrder(OrderString);
	//return;	
}

static function PrecacheGameAnnouncements(AnnouncerVoice V, bool bRewardSounds)
{
	super(TeamGame).PrecacheGameAnnouncements(V, bRewardSounds);
	// End:0x170
	if(!bRewardSounds)
	{
		V.PrecacheSound('Red_powernode_destroyed');
		V.PrecacheSound('Blue_powernode_destroyed');
		V.PrecacheSound('Red_Powercore_under_attack');
		V.PrecacheSound('Blue_Powercore_under_attack');
		V.PrecacheSound('NewRoundIn');
		V.PrecacheSound('Red_Powercore_destroyed');
		V.PrecacheSound('Blue_Powercore_destroyed');
		V.PrecacheSound('Red_Powercore_critical');
		V.PrecacheSound('Blue_Powercore_critical');
		V.PrecacheSound('Red_PowerCore_vulnerable');
		V.PrecacheSound('Blue_Powercore_vulnerable');
		V.PrecacheSound('Red_powernode_under_construction');
		V.PrecacheSound('Blue_powernode_under_construction');
		V.PrecacheSound('Red_Powercore_damaged');
		V.PrecacheSound('Blue_Powercore_damaged');
		V.PrecacheSound('Red_powernode_isolated');
		V.PrecacheSound('Blue_powernode_isolated');
	}
	//return;	
}

function SetInitialState()
{
	super(Actor).SetInitialState();
	SetCoreDistance(PowerCores[FinalCore[0]], 0, 0);
	SetCoreDistance(PowerCores[FinalCore[1]], 1, 0);
	UpdateLinks();
	//return;	
}

event InitGame(string Options, out string Error)
{
	local string InOpt, MapName;
	local ONSPowerLinkOfficialSetup P;
	local int X;
	local NavigationPoint N;
	local array<string> CustomPowerLinkSetupNames;

	super(TeamGame).InitGame(Options, Error);
	X = 0;
	N = Level.NavigationPointList;
	J0x2B:

	// End:0x116 [Loop If]
	if(N != none)
	{
		// End:0x60
		if(N.IsA('PlayerStart'))
		{
			PlayerStart(N).bEnabled = false;
		}
		// End:0xFF
		if(N.IsA('ONSPowerCore'))
		{
			PowerCores[X] = ONSPowerCore(N);
			PowerCores[X].__NotifyUpdateLinks__Delegate = UpdateLinks;
			PowerCores[X].__OnCoreDestroyed__Delegate = MainCoreDestroyed;
			// End:0xF8
			if(PowerCores[X].bFinalCore)
			{
				FinalCore[int(PowerCores[X].DefenderTeamIndex)] = X;
			}
			X++;
		}
		N = N.nextNavigationPoint;
		// [Loop Continue]
		goto J0x2B;
	}
	// End:0x15A
	if(PowerCores.Length == 0)
	{
		Log("Onslaught: Level doesn't have any PowerCores!", 'Error');
		return;
	}
	MapName = Left(string(Level), InStr(string(Level), "."));
	OfficialPowerLinkSetups.Length = 0;
	// End:0x1A0
	foreach AllActors(Class'Onslaught.ONSPowerLinkOfficialSetup', P)
	{
		OfficialPowerLinkSetups[OfficialPowerLinkSetups.Length] = P;		
	}	
	CustomPowerLinkSetupNames = Class'Onslaught.ONSPowerLinkCustomSetup'.static.GetPerObjectNames(MapName);
	X = 0;
	J0x1C2:

	// End:0x200 [Loop If]
	if(X < CustomPowerLinkSetupNames.Length)
	{
		CustomPowerLinkSetups[CustomPowerLinkSetups.Length] = new (Level, CustomPowerLinkSetupNames[X]) Class'Onslaught.ONSPowerLinkCustomSetup';
		X++;
		// [Loop Continue]
		goto J0x1C2;
	}
	InOpt = ParseOption(Options, "bRandSetupAfterReset");
	// End:0x241
	if(InOpt != "")
	{
		bRandSetupAfterReset = bool(InOpt);
	}
	InOpt = ParseOption(Options, "LinkSetup");
	// End:0x277
	if(InOpt ~= "Random")
	{
		FindLinkSetup();
		return;
	}
	// End:0x2B1
	if((InOpt == "") || !SetPowerLinkSetup(InOpt, none))
	{
		// End:0x2B1
		if(!SetPowerLinkSetup("Default", none))
		{
			FindLinkSetup();
		}
	}
	InOpt = ParseOption(Options, "BonusVehicles");
	// End:0x2FF
	if(bool(InOpt))
	{
		AddMutator("OnslaughtBP.MutBonusVehicles");
	}
	//return;	
}

event PostBeginPlay()
{
	SetupLinks();
	super(TeamGame).PostBeginPlay();
	//return;	
}

function bool SetupExists(string SetupName)
{
	local int X;

	X = 0;
	J0x07:

	// End:0x41 [Loop If]
	if(X < OfficialPowerLinkSetups.Length)
	{
		// End:0x37
		if(OfficialPowerLinkSetups[X].SetupName ~= SetupName)
		{
			return true;
		}
		X++;
		// [Loop Continue]
		goto J0x07;
	}
	X = 0;
	J0x48:

	// End:0x84 [Loop If]
	if(X < CustomPowerLinkSetups.Length)
	{
		// End:0x7A
		if(string(CustomPowerLinkSetups[X].Name) ~= SetupName)
		{
			return true;
		}
		X++;
		// [Loop Continue]
		goto J0x48;
	}
	return false;
	//return;	
}

function bool SetPowerLinkSetup(string SetupName, PlayerController Caller)
{
	local int X, Y, Z, i;
	local array<ONSPowerCore> Traveled;

	SetupName = Repl(SetupName, " ", "_");
	X = 0;
	J0x1A:

	// End:0x171 [Loop If]
	if(X < OfficialPowerLinkSetups.Length)
	{
		// End:0x167
		if(OfficialPowerLinkSetups[X].SetupName ~= SetupName)
		{
			Y = 0;
			J0x4F:

			// End:0x105 [Loop If]
			if(Y < OfficialPowerLinkSetups[X].LinkSetups.Length)
			{
				Z = 0;
				J0x75:

				// End:0xFB [Loop If]
				if(Z < PowerCores.Length)
				{
					// End:0xF1
					if(PowerCores[Z].Name == OfficialPowerLinkSetups[X].LinkSetups[Y].BaseNode)
					{
						PowerCores[Z].LinkedNodes = OfficialPowerLinkSetups[X].LinkSetups[Y].LinkedNodes;
					}
					Z++;
					// [Loop Continue]
					goto J0x75;
				}
				Y++;
				// [Loop Continue]
				goto J0x4F;
			}
			ResetPowerLinks();
			Log("Using Official Link Setup: " $ SetupName);
			CurrentSetupName = SetupName;
			bCurrentSetupIsOfficial = true;
			// End:0x165
			if(Caller != none)
			{
				Caller.ReceiveLocalizedMessage(Class'Onslaught.ONSLinkDesignMessage', 2);
			}
			return true;
		}
		X++;
		// [Loop Continue]
		goto J0x1A;
	}
	X = 0;
	J0x178:

	// End:0x52F [Loop If]
	if(X < CustomPowerLinkSetups.Length)
	{
		// End:0x525
		if(string(CustomPowerLinkSetups[X].Name) ~= SetupName)
		{
			Y = 0;
			J0x1AF:

			// End:0x265 [Loop If]
			if(Y < CustomPowerLinkSetups[X].LinkSetups.Length)
			{
				Z = 0;
				J0x1D5:

				// End:0x25B [Loop If]
				if(Z < PowerCores.Length)
				{
					// End:0x251
					if(PowerCores[Z].Name == CustomPowerLinkSetups[X].LinkSetups[Y].BaseNode)
					{
						PowerCores[Z].LinkedNodes = CustomPowerLinkSetups[X].LinkSetups[Y].LinkedNodes;
					}
					Z++;
					// [Loop Continue]
					goto J0x1D5;
				}
				Y++;
				// [Loop Continue]
				goto J0x1AF;
			}
			ResetPowerLinks();
			// End:0x4CB
			if((PowerLinks.Length > 0) && !ExistsLinkPathTo(PowerCores[FinalCore[0]], PowerCores[FinalCore[1]], Traveled))
			{
				CustomPowerLinkSetups.Remove(X, 1);
				// End:0x2D3
				if(Caller != none)
				{
					Caller.ReceiveLocalizedMessage(Class'Onslaught.ONSLinkDesignMessage', 8);					
				}
				else
				{
					Log(("Failed to load Custom Link Setup" @ SetupName) $ ": There is not a complete path between the PowerCores.");
				}
				// End:0x368
				if(((CurrentSetupName != "") && CurrentSetupName != SetupName) && SetPowerLinkSetup(CurrentSetupName, none))
				{
					return true;
				}
				// End:0x37C
				if(OfficialPowerLinkSetups.Length > 0)
				{
					FindLinkSetup();
					return true;
				}
				Log(("Can't find a better link setup to load, so using" @ SetupName) @ " anyway and forcing a connection between the PowerCores.");
				AddLink(PowerCores[FinalCore[0]], PowerCores[FinalCore[1]]);
				UpdateLinks();
				i = 0;
				J0x420:

				// End:0x4C9 [Loop If]
				if(i < GameReplicationInfo.PRIArray.Length)
				{
					// End:0x4BF
					if((PlayerController(GameReplicationInfo.PRIArray[i].Owner) != none) && ONSPlayerReplicationInfo(GameReplicationInfo.PRIArray[i]) != none)
					{
						ONSPlayerReplicationInfo(GameReplicationInfo.PRIArray[i]).ClientReceivePowerLink(PowerCores[FinalCore[0]], PowerCores[FinalCore[1]]);
					}
					i++;
					// [Loop Continue]
					goto J0x420;
				}
				return true;
			}
			Log("Using Custom Link Setup: " $ SetupName);
			CurrentSetupName = SetupName;
			bCurrentSetupIsOfficial = false;
			// End:0x523
			if(Caller != none)
			{
				Caller.ReceiveLocalizedMessage(Class'Onslaught.ONSLinkDesignMessage', 2);
			}
			return true;
		}
		X++;
		// [Loop Continue]
		goto J0x178;
	}
	// End:0x550
	if(Caller != none)
	{
		Caller.ReceiveLocalizedMessage(Class'Onslaught.ONSLinkDesignMessage', 3);
	}
	return false;
	//return;	
}

function ClearLinks()
{
	local int i;

	i = 0;
	J0x07:

	// End:0x44 [Loop If]
	if(i < PowerLinks.Length)
	{
		// End:0x3A
		if(PowerLinks[i] != none)
		{
			PowerLinks[i].Destroy();
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	PowerLinks.Remove(0, PowerLinks.Length);
	//return;	
}

function ResetPowerLinks()
{
	local int X;
	local ONSPlayerReplicationInfo PRI;

	// End:0x0E
	if(PowerLinks.Length == 0)
	{
		return;
	}
	ClearLinks();
	X = 0;
	J0x1B:

	// End:0x4A [Loop If]
	if(X < PowerCores.Length)
	{
		PowerCores[X].ResetLinks();
		X++;
		// [Loop Continue]
		goto J0x1B;
	}
	SetupLinks();
	// End:0xDC
	if(GameReplicationInfo != none)
	{
		X = 0;
		J0x62:

		// End:0xDC [Loop If]
		if(X < GameReplicationInfo.PRIArray.Length)
		{
			PRI = ONSPlayerReplicationInfo(GameReplicationInfo.PRIArray[X]);
			// End:0xC3
			if((PRI == none) || PlayerController(PRI.Owner) == none)
			{
				// [Explicit Continue]
				goto J0xD2;
			}
			PRI.ClientPrepareToReceivePowerLinks();
			J0xD2:

			X++;
			// [Loop Continue]
			goto J0x62;
		}
	}
	//return;	
}

function bool SavePowerLinkSetup(string SetupName, PlayerController Caller)
{
	local int X, Y, Z;
	local PowerLinkSetup BlankSetup;
	local string MapName;

	MapName = Left(string(Level), InStr(string(Level), "."));
	SetupName = Repl(SetupName, " ", "_");
	X = 0;
	J0x35:

	// End:0x84 [Loop If]
	if(X < OfficialPowerLinkSetups.Length)
	{
		// End:0x7A
		if(OfficialPowerLinkSetups[X].SetupName ~= SetupName)
		{
			Caller.ReceiveLocalizedMessage(Class'Onslaught.ONSLinkDesignMessage', 1);
			return false;
		}
		X++;
		// [Loop Continue]
		goto J0x35;
	}
	X = 0;
	J0x8B:

	// End:0x1F3 [Loop If]
	if(X < CustomPowerLinkSetups.Length)
	{
		// End:0x1E9
		if(string(CustomPowerLinkSetups[X].Name) ~= SetupName)
		{
			CustomPowerLinkSetups[X].LinkSetups.Length = 0;
			Y = 0;
			J0xD9:

			// End:0x1C0 [Loop If]
			if(Y < PowerCores.Length)
			{
				CustomPowerLinkSetups[X].LinkSetups[Y] = BlankSetup;
				CustomPowerLinkSetups[X].LinkSetups[Y].BaseNode = PowerCores[Y].Name;
				Z = 0;
				J0x144:

				// End:0x1B6 [Loop If]
				if(Z < PowerCores[Y].PowerLinks.Length)
				{
					CustomPowerLinkSetups[X].LinkSetups[Y].LinkedNodes[Z] = PowerCores[Y].PowerLinks[Z].Name;
					Z++;
					// [Loop Continue]
					goto J0x144;
				}
				Y++;
				// [Loop Continue]
				goto J0xD9;
			}
			CustomPowerLinkSetups[X].SaveConfig();
			Caller.ReceiveLocalizedMessage(Class'Onslaught.ONSLinkDesignMessage', 0);
			return false;
		}
		X++;
		// [Loop Continue]
		goto J0x8B;
	}
	X = CustomPowerLinkSetups.Length;
	CustomPowerLinkSetups.Length = CustomPowerLinkSetups.Length + 1;
	CustomPowerLinkSetups[X] = new (Level, SetupName) Class'Onslaught.ONSPowerLinkCustomSetup';
	CustomPowerLinkSetups[X].LinkSetups.Length = 0;
	Y = 0;
	J0x24A:

	// End:0x331 [Loop If]
	if(Y < PowerCores.Length)
	{
		CustomPowerLinkSetups[X].LinkSetups[Y] = BlankSetup;
		CustomPowerLinkSetups[X].LinkSetups[Y].BaseNode = PowerCores[Y].Name;
		Z = 0;
		J0x2B5:

		// End:0x327 [Loop If]
		if(Z < PowerCores[Y].PowerLinks.Length)
		{
			CustomPowerLinkSetups[X].LinkSetups[Y].LinkedNodes[Z] = PowerCores[Y].PowerLinks[Z].Name;
			Z++;
			// [Loop Continue]
			goto J0x2B5;
		}
		Y++;
		// [Loop Continue]
		goto J0x24A;
	}
	CustomPowerLinkSetups[X].SaveConfig();
	Caller.ReceiveLocalizedMessage(Class'Onslaught.ONSLinkDesignMessage', 0);
	return true;
	//return;	
}

function bool DeletePowerLinkSetup(string SetupName, PlayerController Caller)
{
	local int X;
	local string MapName;

	MapName = Left(string(Level), InStr(string(Level), "."));
	SetupName = Repl(SetupName, " ", "_");
	X = 0;
	J0x35:

	// End:0x85 [Loop If]
	if(X < OfficialPowerLinkSetups.Length)
	{
		// End:0x7B
		if(OfficialPowerLinkSetups[X].SetupName ~= SetupName)
		{
			Caller.ReceiveLocalizedMessage(Class'Onslaught.ONSLinkDesignMessage', 5);
			return false;
		}
		X++;
		// [Loop Continue]
		goto J0x35;
	}
	X = 0;
	J0x8C:

	// End:0xFC [Loop If]
	if(X < CustomPowerLinkSetups.Length)
	{
		// End:0xF2
		if(string(CustomPowerLinkSetups[X].Name) ~= SetupName)
		{
			CustomPowerLinkSetups[X].ClearConfig();
			CustomPowerLinkSetups.Remove(X, 1);
			Caller.ReceiveLocalizedMessage(Class'Onslaught.ONSLinkDesignMessage', 4);
			return true;
		}
		X++;
		// [Loop Continue]
		goto J0x8C;
	}
	Caller.ReceiveLocalizedMessage(Class'Onslaught.ONSLinkDesignMessage', 6);
	return false;
	//return;	
}

function FindLinkSetup(optional string IgnoredSetup)
{
	local int i, sanity, TotalNumSetups;
	local string NewSetupName;

	TotalNumSetups = OfficialPowerLinkSetups.Length + CustomPowerLinkSetups.Length;
	// End:0x3E
	if(TotalNumSetups == 0)
	{
		Log("Using default Link Setup");		
	}
	else
	{
		// End:0x66
		if((TotalNumSetups == 1) && CurrentSetupName != "")
		{
			SetPowerLinkSetup(CurrentSetupName, none);			
		}
		else
		{
			J0x66:

			i = Rand(TotalNumSetups);
			// End:0xA0
			if(i < OfficialPowerLinkSetups.Length)
			{
				NewSetupName = OfficialPowerLinkSetups[i].SetupName;				
			}
			else
			{
				NewSetupName = string(CustomPowerLinkSetups[i - OfficialPowerLinkSetups.Length].Name);
			}
			sanity++;
			// End:0x66
			if(!((NewSetupName != IgnoredSetup) || sanity > 1000))
				goto J0x66;
			SetPowerLinkSetup(NewSetupName, none);
		}
	}
	//return;	
}

static simulated function bool ExistsLinkPathTo(ONSPowerCore Start, ONSPowerCore Destination, out array<ONSPowerCore> Traveled)
{
	local int i, j;
	local bool bSkip;

	// End:0x1A
	if((Start == none) || Destination == none)
	{
		return false;
	}
	Traveled[Traveled.Length] = Start;
	i = 0;
	J0x33:

	// End:0x104 [Loop If]
	if(i < Start.PowerLinks.Length)
	{
		// End:0x6C
		if(Start.PowerLinks[i] == Destination)
		{
			return true;
		}
		bSkip = false;
		j = 0;
		J0x7B:

		// End:0xC4 [Loop If]
		if(j < Traveled.Length)
		{
			// End:0xBA
			if(Traveled[j] == Start.PowerLinks[i])
			{
				bSkip = true;
				// [Explicit Break]
				goto J0xC4;
			}
			j++;
			// [Loop Continue]
			goto J0x7B;
		}
		J0xC4:

		// End:0xFA
		if(!bSkip && ExistsLinkPathTo(Start.PowerLinks[i], Destination, Traveled))
		{
			return true;
		}
		i++;
		// [Loop Continue]
		goto J0x33;
	}
	return false;
	//return;	
}

function SetCoreDistance(ONSPowerCore PC, byte t, byte Distance)
{
	local int i;

	PC.FinalCoreDistance[int(t)] = Distance;
	i = 0;
	J0x23:

	// End:0xA7 [Loop If]
	if(i < PC.PowerLinks.Length)
	{
		// End:0x9D
		if(int(PC.PowerLinks[i].FinalCoreDistance[int(t)]) > (int(Distance) + 1))
		{
			SetCoreDistance(PC.PowerLinks[i], t, byte(int(Distance) + 1));
		}
		i++;
		// [Loop Continue]
		goto J0x23;
	}
	//return;	
}

function UpdateLinks()
{
	local int i, j;
	local bool bRedCoreWasVulnerable, bBlueCoreWasVulnerable;

	// End:0x0D
	if(!bScriptInitialized)
	{
		return;
	}
	bRedCoreWasVulnerable = PowerCores[FinalCore[0]].bPoweredByBlue;
	bBlueCoreWasVulnerable = PowerCores[FinalCore[1]].bPoweredByRed;
	UpdateSeveredLinks();
	i = 0;
	J0x56:

	// End:0x226 [Loop If]
	if(i < PowerCores.Length)
	{
		PowerCores[i].bPoweredByRed = false;
		PowerCores[i].bPoweredByBlue = false;
		j = 0;
		J0x9B:

		// End:0x1A1 [Loop If]
		if(j < PowerCores[i].PowerLinks.Length)
		{
			// End:0x197
			if((int(PowerCores[i].PowerLinks[j].CoreStage) == 0) && !PowerCores[i].PowerLinks[j].bSevered)
			{
				// End:0x155
				if(int(PowerCores[i].PowerLinks[j].DefenderTeamIndex) == 0)
				{
					PowerCores[i].bPoweredByRed = true;
					// [Explicit Continue]
					goto J0x197;
				}
				// End:0x197
				if(int(PowerCores[i].PowerLinks[j].DefenderTeamIndex) == 1)
				{
					PowerCores[i].bPoweredByBlue = true;
				}
			}
			J0x197:

			j++;
			// [Loop Continue]
			goto J0x9B;
		}
		// End:0x207
		if((int(PowerCores[i].CoreStage) == 4) && PowerCores[i].bPoweredByRed || PowerCores[i].bPoweredByBlue)
		{
			PowerCores[i].CheckTouching();
		}
		PowerCores[i].CheckShield();
		i++;
		// [Loop Continue]
		goto J0x56;
	}
	// End:0x25A
	if(!bRedCoreWasVulnerable && PowerCores[FinalCore[0]].bPoweredByBlue)
	{
		BroadcastLocalizedMessage(Class'Onslaught.ONSOnslaughtMessage', 20);
	}
	// End:0x28E
	if(!bBlueCoreWasVulnerable && PowerCores[FinalCore[1]].bPoweredByRed)
	{
		BroadcastLocalizedMessage(Class'Onslaught.ONSOnslaughtMessage', 21);
	}
	//return;	
}

function UpdateSeveredLinks()
{
	local int i;
	local array<byte> WasSevered;

	i = 0;
	J0x07:

	// End:0x5B [Loop If]
	if(i < PowerCores.Length)
	{
		WasSevered[i] = byte(PowerCores[i].bSevered);
		PowerCores[i].bSevered = true;
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	Sever(PowerCores[FinalCore[0]], 0);
	Sever(PowerCores[FinalCore[1]], 1);
	i = 0;
	J0x8A:

	// End:0x166 [Loop If]
	if(i < PowerCores.Length)
	{
		// End:0x15C
		if(!PowerCores[i].bDisabled && int(PowerCores[i].CoreStage) != 4)
		{
			// End:0x118
			if(PowerCores[i].bSevered && int(WasSevered[i]) == 0)
			{
				PowerCores[i].Sever();
				// [Explicit Continue]
				goto J0x15C;
			}
			// End:0x15C
			if(!PowerCores[i].bSevered && int(WasSevered[i]) == 1)
			{
				PowerCores[i].UnSever();
			}
		}
		J0x15C:

		i++;
		// [Loop Continue]
		goto J0x8A;
	}
	//return;	
}

function Sever(ONSPowerCore PC, int TeamIndex)
{
	local int i;

	PC.bSevered = false;
	// End:0x29
	if(int(PC.CoreStage) != 0)
	{
		return;
	}
	i = 0;
	J0x30:

	// End:0xBE [Loop If]
	if(i < PC.PowerLinks.Length)
	{
		// End:0xB4
		if(PC.PowerLinks[i].bSevered && int(PC.PowerLinks[i].DefenderTeamIndex) == TeamIndex)
		{
			Sever(PC.PowerLinks[i], TeamIndex);
		}
		i++;
		// [Loop Continue]
		goto J0x30;
	}
	//return;	
}

function Reset()
{
	bOverTime = false;
	bOverTimeBroadcast = false;
	//return;	
}

function StartMatch()
{
	local array<ONSPowerCore> Traveled;
	local int i;

	// End:0x201
	if((int(Level.NetMode) != int(NM_Standalone)) && !ExistsLinkPathTo(PowerCores[FinalCore[0]], PowerCores[FinalCore[1]], Traveled))
	{
		Log("Current link setup is invalid: There is not a complete path between the PowerCores.");
		// End:0x201
		if((CurrentSetupName == "") || !SetPowerLinkSetup(CurrentSetupName, none))
		{
			// End:0xD0
			if(OfficialPowerLinkSetups.Length > 0)
			{
				FindLinkSetup();				
			}
			else
			{
				Log("Can't find a better link setup to load, so forcing a connection between the PowerCores.");
				AddLink(PowerCores[FinalCore[0]], PowerCores[FinalCore[1]]);
				UpdateLinks();
				i = 0;
				J0x158:

				// End:0x201 [Loop If]
				if(i < GameReplicationInfo.PRIArray.Length)
				{
					// End:0x1F7
					if((PlayerController(GameReplicationInfo.PRIArray[i].Owner) != none) && ONSPlayerReplicationInfo(GameReplicationInfo.PRIArray[i]) != none)
					{
						ONSPlayerReplicationInfo(GameReplicationInfo.PRIArray[i]).ClientReceivePowerLink(PowerCores[FinalCore[0]], PowerCores[FinalCore[1]]);
					}
					i++;
					// [Loop Continue]
					goto J0x158;
				}
			}
		}
	}
	super(DeathMatch).StartMatch();
	//return;	
}

function MainCoreDestroyed(byte t)
{
	local Controller C;
	local PlayerController PC;
	local int Score;

	// End:0x13
	if(bOverTime)
	{
		Score = 1;		
	}
	else
	{
		Score = 2;
	}
	// End:0xB4
	if(int(t) == 1)
	{
		BroadcastLocalizedMessage(Class'Onslaught.ONSOnslaughtMessage', 0);
		TeamScoreEvent(0, float(Score), "enemy_core_destroyed");
		Teams[0].Score += float(Score);
		Teams[0].NetUpdateTime = Level.TimeSeconds - float(1);
		CheckScore(PowerCores[FinalCore[1]].LastDamagedBy);		
	}
	else
	{
		BroadcastLocalizedMessage(Class'Onslaught.ONSOnslaughtMessage', 1);
		TeamScoreEvent(1, float(Score), "enemy_core_destroyed");
		Teams[1].Score += float(Score);
		Teams[1].NetUpdateTime = Level.TimeSeconds - float(1);
		CheckScore(PowerCores[FinalCore[0]].LastDamagedBy);
	}
	// End:0x1F1
	foreach __NFUN_325__(Class'Engine.Controller', C)
	{
		PC = PlayerController(C);
		// End:0x1D6
		if(PC != none)
		{
			PC.ClientSetBehindView(true);
			PC.ClientSetViewTarget(PowerCores[FinalCore[int(t)]]);
			PC.SetViewTarget(PowerCores[FinalCore[int(t)]]);
			// End:0x1D6
			if(!bGameEnded)
			{
				PC.ClientRoundEnded();
			}
		}
		// End:0x1F0
		if(!bGameEnded)
		{
			C.RoundHasEnded();
		}		
	}	
	ResetCountDown = ResetTimeDelay;
	//return;	
}

function CheckScore(PlayerReplicationInfo Scorer)
{
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
	// End:0x98
	if((GoalScore != 0) && (Teams[0].Score >= float(GoalScore)) || Teams[1].Score >= float(GoalScore))
	{
		EndGame(Scorer, "teamscorelimit");
	}
	//return;	
}

function bool CheckEndGame(PlayerReplicationInfo Winner, string Reason)
{
	// End:0x38
	if(Reason ~= "TimeLimit")
	{
		// End:0x36
		if(!bOverTimeBroadcast)
		{
			StartupStage = 7;
			PlayStartupMessage();
			bOverTimeBroadcast = true;
		}
		return false;
	}
	return super(TeamGame).CheckEndGame(Winner, Reason);
	//return;	
}

function SetEndGameFocus(PlayerReplicationInfo Winner)
{
	local Controller P;
	local PlayerController Player;

	// End:0x51
	if(Winner != none)
	{
		// End:0x3E
		if(Winner.Team.TeamIndex == 0)
		{
			EndGameFocus = PowerCores[FinalCore[1]];			
		}
		else
		{
			EndGameFocus = PowerCores[FinalCore[0]];
		}
	}
	// End:0x6D
	if(EndGameFocus != none)
	{
		EndGameFocus.bAlwaysRelevant = true;
	}
	// End:0x19F
	foreach __NFUN_325__(Class'Engine.Controller', P)
	{
		Player = PlayerController(P);
		// End:0x18F
		if(Player != none)
		{
			// End:0xE7
			if(!Player.PlayerReplicationInfo.bOnlySpectator)
			{
				PlayWinMessage(Player, Player.PlayerReplicationInfo.Team == GameReplicationInfo.Winner);
			}
			Player.ClientSetBehindView(true);
			Player.CameraDist = 10.0000000;
			// End:0x13E
			if(EndGameFocus != none)
			{
				Player.ClientSetViewTarget(EndGameFocus);
				Player.SetViewTarget(EndGameFocus);
			}
			Player.ClientGameEnded();
			// End:0x18F
			if(CurrentGameProfile != none)
			{
				CurrentGameProfile.bWonMatch = Player.PlayerReplicationInfo.Team == GameReplicationInfo.Winner;
			}
		}
		P.GameHasEnded();		
	}	
	//return;	
}

function Killed(Controller Killer, Controller Killed, Pawn KilledPawn, Class<DamageType> DamageType)
{
	// End:0x48
	if((PlayerController(Killed) != none) && ONSPlayerReplicationInfo(Killed.PlayerReplicationInfo) != none)
	{
		ONSPlayerReplicationInfo(Killed.PlayerReplicationInfo).OwnerDied();
	}
	super(DeathMatch).Killed(Killer, Killed, KilledPawn, DamageType);
	//return;	
}

function bool CriticalPlayer(Controller Other)
{
	local int X;

	// End:0x36
	if((Other.Pawn == none) || Other.PlayerReplicationInfo == none)
	{
		return super(TeamGame).CriticalPlayer(Other);
	}
	X = 0;
	J0x3D:

	// End:0x140 [Loop If]
	if(X < PowerCores.Length)
	{
		// End:0x136
		if((((int(PowerCores[X].CoreStage) == 0) || int(PowerCores[X].CoreStage) == 2) && int(PowerCores[X].DefenderTeamIndex) != Other.GetTeamNum()) && (PowerCores[X].bUnderAttack && Other.PlayerReplicationInfo == PowerCores[X].LastDamagedBy) || VSize(Other.Pawn.Location - PowerCores[X].Location) < float(2000))
		{
			return true;
		}
		X++;
		// [Loop Continue]
		goto J0x3D;
	}
	return super(TeamGame).CriticalPlayer(Other);
	//return;	
}

function bool ValidSpawnPoint(ONSPowerCore PC, int TeamIndex)
{
	return ((((PC != none) && int(PC.DefenderTeamIndex) == TeamIndex) && !PC.IsInState('NeutralCore')) && !PC.IsInState('Reconstruction')) && !PC.bUnderAttack || PC.bFinalCore;
	//return;	
}

function NavigationPoint FindPlayerStart(Controller Player, optional byte InTeam, optional string incomingName)
{
	local NavigationPoint N, BestStart;
	local Teleporter Tel;
	local float BestRating, NewRating;
	local byte Team, EnemyTeam;
	local ONSPowerCore SelectedPC;
	local float CoreDistA, CoreDistB;
	local int i;
	local Bot B;

	// End:0x40
	if(GameRulesModifiers != none)
	{
		N = GameRulesModifiers.FindPlayerStart(Player, InTeam, incomingName);
		// End:0x40
		if(N != none)
		{
			return N;
		}
	}
	// End:0x7F
	if(incomingName != "")
	{
		// End:0x7E
		foreach AllActors(Class'Engine.Teleporter', Tel)
		{
			// End:0x7D
			if(string(Tel.Tag) ~= incomingName)
			{				
				return Tel;
			}			
		}		
	}
	// End:0x275
	if((Player != none) && Player.PlayerReplicationInfo != none)
	{
		// End:0xE8
		if(Player.PlayerReplicationInfo.Team != none)
		{
			Team = byte(Player.PlayerReplicationInfo.Team.TeamIndex);			
		}
		else
		{
			Team = InTeam;
		}
		// End:0x1C2
		if(ONSPlayerReplicationInfo(Player.PlayerReplicationInfo) != none)
		{
			SelectedPC = ONSPlayerReplicationInfo(Player.PlayerReplicationInfo).TemporaryStartCore;
			ONSPlayerReplicationInfo(Player.PlayerReplicationInfo).TemporaryStartCore = none;
			// End:0x177
			if((SelectedPC != none) && !ValidSpawnPoint(SelectedPC, int(Team)))
			{
				SelectedPC = none;
			}
			// End:0x1C2
			if(SelectedPC == none)
			{
				SelectedPC = ONSPlayerReplicationInfo(Player.PlayerReplicationInfo).StartCore;
				// End:0x1C2
				if(!ValidSpawnPoint(SelectedPC, int(Team)))
				{
					SelectedPC = none;
				}
			}
		}
		// End:0x272
		if(SelectedPC == none)
		{
			B = Bot(Player);
			// End:0x272
			if((((B != none) && B.Squad != none) && ONSPowerCore(B.Squad.SquadObjective) != none) && ValidSpawnPoint(ONSPowerCore(B.Squad.SquadObjective), int(Team)))
			{
				SelectedPC = ONSPowerCore(B.Squad.SquadObjective);
			}
		}		
	}
	else
	{
		Team = InTeam;
	}
	// End:0x45B
	if(SelectedPC == none)
	{
		// End:0x2D3
		if(PowerCores[FinalCore[int(Team)]].PoweredBy(byte(int(1) - int(Team))))
		{
			SelectedPC = PowerCores[FinalCore[int(Team)]];
		}
		// End:0x45B
		if(SelectedPC == none)
		{
			EnemyTeam = byte(Abs(float(int(Team) - 1)));
			BestRating = 255.0000000;
			i = 0;
			J0x306:

			// End:0x437 [Loop If]
			if(i < PowerCores.Length)
			{
				// End:0x42D
				if(ValidSpawnPoint(PowerCores[i], int(Team)))
				{
					NewRating = float(PowerCores[i].FinalCoreDistance[int(EnemyTeam)]);
					// End:0x390
					if((NewRating < BestRating) || SelectedPC == none)
					{
						BestRating = NewRating;
						SelectedPC = PowerCores[i];
						// [Explicit Continue]
						goto J0x42D;
					}
					// End:0x42D
					if(NewRating == BestRating)
					{
						CoreDistA = VSize(PowerCores[FinalCore[int(EnemyTeam)]].Location - PowerCores[i].Location);
						CoreDistB = VSize(PowerCores[FinalCore[int(EnemyTeam)]].Location - SelectedPC.Location);
						// End:0x42D
						if(CoreDistA < CoreDistB)
						{
							SelectedPC = PowerCores[i];
						}
					}
				}
				J0x42D:

				i++;
				// [Loop Continue]
				goto J0x306;
			}
			// End:0x45B
			if(SelectedPC == none)
			{
				SelectedPC = PowerCores[FinalCore[int(Team)]];
			}
		}
	}
	i = 0;
	J0x462:

	// End:0x50C [Loop If]
	if(i < SelectedPC.CloseActors.Length)
	{
		// End:0x502
		if(NavigationPoint(SelectedPC.CloseActors[i]) != none)
		{
			NewRating = RatePlayerStart(NavigationPoint(SelectedPC.CloseActors[i]), Team, Player);
			// End:0x502
			if(NewRating > BestRating)
			{
				BestRating = NewRating;
				BestStart = NavigationPoint(SelectedPC.CloseActors[i]);
			}
		}
		i++;
		// [Loop Continue]
		goto J0x462;
	}
	// End:0x605
	if((PlayerStart(BestStart) == none) && SelectedPC != PowerCores[FinalCore[int(Team)]])
	{
		SelectedPC = PowerCores[FinalCore[int(Team)]];
		i = 0;
		J0x55B:

		// End:0x605 [Loop If]
		if(i < SelectedPC.CloseActors.Length)
		{
			// End:0x5FB
			if(NavigationPoint(SelectedPC.CloseActors[i]) != none)
			{
				NewRating = RatePlayerStart(NavigationPoint(SelectedPC.CloseActors[i]), Team, Player);
				// End:0x5FB
				if(NewRating > BestRating)
				{
					BestRating = NewRating;
					BestStart = NavigationPoint(SelectedPC.CloseActors[i]);
				}
			}
			i++;
			// [Loop Continue]
			goto J0x55B;
		}
	}
	// End:0x6DF
	if(PlayerStart(BestStart) == none)
	{
		Log("Warning - PATHS NOT DEFINED or NO PLAYERSTART with positive rating");
		BestRating = -100000000.0000000;
		// End:0x6DE
		foreach AllActors(Class'Engine.NavigationPoint', N)
		{
			NewRating = RatePlayerStart(N, 0, Player);
			// End:0x6A9
			if(InventorySpot(N) != none)
			{
				NewRating -= float(50);
			}
			NewRating += (float(20) * FRand());
			// End:0x6DD
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

function ShowPathTo(PlayerController P, int TeamNum)
{
	local int X;
	local ONSPowerCore Best;
	local float BestDist;
	local Class<WillowWhisp> WWclass;

	X = 0;
	J0x07:

	// End:0x10E [Loop If]
	if(X < PowerCores.Length)
	{
		// End:0x104
		if((((int(PowerCores[X].CoreStage) != 0) || int(PowerCores[X].DefenderTeamIndex) != TeamNum) && PowerCores[X].PoweredBy(byte(TeamNum))) && (Best == none) || VSize(P.Pawn.Location - PowerCores[X].Location) < BestDist)
		{
			Best = PowerCores[X];
			BestDist = VSize(P.Pawn.Location - PowerCores[X].Location);
		}
		X++;
		// [Loop Continue]
		goto J0x07;
	}
	// End:0x179
	if((Best != none) && P.FindPathToward(Best, false) != none)
	{
		WWclass = Class<WillowWhisp>(DynamicLoadObject(PathWhisps[TeamNum], Class'Core.Class'));
		Spawn(WWclass, P,, P.Pawn.Location);
	}
	//return;	
}

function GetServerInfo(out ServerResponseLine ServerState)
{
	super(GameInfo).GetServerInfo(ServerState);
	// End:0x27
	if(!bCurrentSetupIsOfficial)
	{
		ServerState.MapName $= "*";
	}
	//return;	
}

function GetServerDetails(out ServerResponseLine ServerState)
{
	super(TeamGame).GetServerDetails(ServerState);
	AddServerDetail(ServerState, "LinkSetup", CurrentSetupName);
	//return;	
}

function bool ChangeTeam(Controller Other, int Num, bool bNewTeam)
{
	local int i;
	local ONSPlayerReplicationInfo PRI;

	// End:0xAE
	if(super(TeamGame).ChangeTeam(Other, Num, bNewTeam))
	{
		// End:0x68
		if(Other == Level.GetLocalPlayerController())
		{
			i = 0;
			J0x39:

			// End:0x68 [Loop If]
			if(i < PowerCores.Length)
			{
				PowerCores[i].CheckShield();
				i++;
				// [Loop Continue]
				goto J0x39;
			}
		}
		PRI = ONSPlayerReplicationInfo(Other.PlayerReplicationInfo);
		// End:0xAC
		if(PRI != none)
		{
			PRI.StartCore = none;
			PRI.TemporaryStartCore = none;
		}
		return true;
	}
	return false;
	//return;	
}

function PlayStartupMessage()
{
	super(DeathMatch).PlayStartupMessage();
	// End:0x2E
	if((int(StartupStage) == 7) && OvertimeCoreDrainPerSec > 0)
	{
		BroadcastLocalizedMessage(Class'Onslaught.ONSOnslaughtMessage', 29);
	}
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
	//return;	
}

static event bool AcceptPlayInfoProperty(string PropertyName)
{
	// End:0x20
	if(InStr(PropertyName, "bAllowTrans") != -1)
	{
		return false;
	}
	return super(TeamGame).AcceptPlayInfoProperty(PropertyName);
	//return;	
}

static function FillPlayInfo(PlayInfo PlayInfo)
{
	local int i;

	super(TeamGame).FillPlayInfo(PlayInfo);
	PlayInfo.AddSetting(default.GameGroup, "OvertimeCoreDrainPerSec", default.ONSPropsDisplayText[i++], 40, 1, "Text", "2;0:99");
	PlayInfo.AddSetting(default.GameGroup, "bRandSetupAfterReset", default.ONSPropsDisplayText[i++], 0, 1, "Check",,,, true);
	PlayInfo.AddSetting(default.GameGroup, "bSwapSidesAfterReset", default.ONSPropsDisplayText[i++], 0, 1, "Check",,,, true);
	//return;	
}

static event string GetDescriptionText(string PropName)
{
	switch(PropName)
	{
		// End:0x2B
		case "OvertimeCoreDrainPerSec":
			return default.ONSPropDescText[0];
		// End:0x4C
		case "bRandSetupAfterReset":
			return default.ONSPropDescText[1];
		// End:0x6E
		case "bSwapSidesAfterReset":
			return default.ONSPropDescText[2];
		// End:0xFFFF
		default:
			return super(TeamGame).GetDescriptionText(PropName);
			break;
	}
	//return;	
}

static function array<string> GetAllLoadHints(optional bool bThisClassOnly)
{
	local int i;
	local array<string> Hints;

	// End:0x25
	if(!bThisClassOnly || default.ONSHints.Length == 0)
	{
		Hints = super(TeamGame).GetAllLoadHints();
	}
	i = 0;
	J0x2C:

	// End:0x5E [Loop If]
	if(i < default.ONSHints.Length)
	{
		Hints[Hints.Length] = default.ONSHints[i];
		i++;
		// [Loop Continue]
		goto J0x2C;
	}
	return Hints;
	//return;	
}

event Destroyed()
{
	CustomPowerLinkSetups.Length = 0;
	super(GameInfo).Destroyed();
	//return;	
}

function SetupLinks()
{
	local ONSPowerCore Core;
	local int i;

	// End:0x0E
	if(PowerCores.Length == 0)
	{
		return;
	}
	Core = PowerCores[0];
	J0x1B:

	i = 0;
	J0x22:

	// End:0x64 [Loop If]
	if(i < Core.PowerLinks.Length)
	{
		AddLink(Core, Core.PowerLinks[i]);
		i++;
		// [Loop Continue]
		goto J0x22;
	}
	Core = Core.NextCore;
	// End:0x1B
	if(!((Core == none) || Core == PowerCores[0]))
		goto J0x1B;
	//return;	
}

function bool AddLink(ONSPowerCore A, ONSPowerCore B)
{
	local PowerLink Link;

	// End:0x15
	if(HasLink(A, B))
	{
		return false;
	}
	Link = Spawn(Class'Onslaught.PowerLink');
	Link.SetNodes(A, B);
	PowerLinks[PowerLinks.Length] = Link;
	return true;
	//return;	
}

function bool RemoveLink(ONSPowerCore A, ONSPowerCore B)
{
	local int i;

	i = PowerLinks.Length - 1;
	J0x0F:

	// End:0x86 [Loop If]
	if(i >= 0)
	{
		// End:0x3A
		if(PowerLinks[i] == none)
		{
			PowerLinks.Remove(i, 1);
			// [Explicit Continue]
			goto J0x7C;
		}
		// End:0x7C
		if(PowerLinks[i].HasNodes(A, B))
		{
			PowerLinks[i].Destroy();
			PowerLinks.Remove(i, 1);
			return true;
		}
		J0x7C:

		i--;
		// [Loop Continue]
		goto J0x0F;
	}
	return false;
	//return;	
}

function bool HasLink(ONSPowerCore A, ONSPowerCore B)
{
	local int i;

	i = PowerLinks.Length - 1;
	J0x0F:

	// End:0x68 [Loop If]
	if(i >= 0)
	{
		// End:0x3A
		if(PowerLinks[i] == none)
		{
			PowerLinks.Remove(i, 1);
			// [Explicit Continue]
			goto J0x5E;
		}
		// End:0x5E
		if(PowerLinks[i].HasNodes(A, B))
		{
			return true;
		}
		J0x5E:

		i--;
		// [Loop Continue]
		goto J0x0F;
	}
	return false;
	//return;	
}

event PostLogin(PlayerController NewPlayer)
{
	super(TeamGame).PostLogin(NewPlayer);
	// End:0x41
	if(ONSPlayerReplicationInfo(NewPlayer.PlayerReplicationInfo) != none)
	{
		ONSPlayerReplicationInfo(NewPlayer.PlayerReplicationInfo).ClientPrepareToReceivePowerLinks();
	}
	//return;	
}

function DeadUse(PlayerController PC)
{
	super(GameInfo).DeadUse(PC);
	PC.ShowMenu();
	//return;	
}

state MatchInProgress
{
	event Timer()
	{
		local Controller C;
		local PlayerController PC;
		local int i, TeamNodes[2], TotalNodes;
		local Actor A;
		local bool bOldUnderAttack;

		i = 0;
		J0x07:

		// End:0x182 [Loop If]
		if(i < PowerCores.Length)
		{
			// End:0xDF
			if(Level.TimeSeconds > PowerCores[i].LastAttackExpirationTime)
			{
				bOldUnderAttack = PowerCores[i].bUnderAttack;
				PowerCores[i].bUnderAttack = (Level.TimeSeconds - PowerCores[i].LastAttackTime) < PowerCores[i].LastAttackExpirationTime;
				// End:0xDF
				if(bOldUnderAttack != PowerCores[i].bUnderAttack)
				{
					PowerCores[i].UnderAttackChange();
				}
			}
			// End:0x178
			if(!PowerCores[i].bFinalCore && int(PowerCores[i].CoreStage) != 255)
			{
				// End:0x171
				if((int(PowerCores[i].CoreStage) == 0) && int(PowerCores[i].DefenderTeamIndex) < 2)
				{
					TeamNodes[int(PowerCores[i].DefenderTeamIndex)]++;
				}
				TotalNodes++;
			}
			i++;
			// [Loop Continue]
			goto J0x07;
		}
		// End:0x23D
		if(bOverTime)
		{
			PowerCores[FinalCore[0]].TakeDamage(int(float(OvertimeCoreDrainPerSec) - (float(OvertimeCoreDrainPerSec) * (float(TeamNodes[0]) / float(TotalNodes)))), none, vect(0.0000000, 0.0000000, 0.0000000), vect(0.0000000, 0.0000000, 0.0000000), none);
			PowerCores[FinalCore[1]].TakeDamage(int(float(OvertimeCoreDrainPerSec) - (float(OvertimeCoreDrainPerSec) * (float(TeamNodes[1]) / float(TotalNodes)))), none, vect(0.0000000, 0.0000000, 0.0000000), vect(0.0000000, 0.0000000, 0.0000000), none);
		}
		super.Timer();
		// End:0x635
		if(ResetCountDown > 0)
		{
			ResetCountDown--;
			// End:0x2C3
			if(ResetCountDown < 3)
			{
				// End:0x2C2
				foreach __NFUN_325__(Class'Engine.Controller', C)
				{
					// End:0x2C1
					if((C.Pawn != none) && C.Pawn.IsA('RedeemerWarhead'))
					{
						C.Pawn.Fire(1.0000000);
					}					
				}				
			}
			// End:0x2FB
			if(ResetCountDown == 8)
			{
				// End:0x2F7
				foreach __NFUN_325__(Class'Engine.PlayerController', PC)
				{
					PC.PlayStatusAnnouncement('NewRoundIn', 1, true);					
				}								
			}
			else
			{
				// End:0x32A
				if((ResetCountDown > 1) && ResetCountDown < 7)
				{
					BroadcastLocalizedMessage(Class'UnrealGame.TimerMessage', ResetCountDown - 1);					
				}
				else
				{
					// End:0x635
					if(ResetCountDown == 1)
					{
						Log("Reset Onslaught.");
						// End:0x38D
						foreach __NFUN_325__(Class'Engine.Controller', C)
						{
							// End:0x37D
							if(PlayerController(C) != none)
							{
								PlayerController(C).ClientReset();
							}
							C.Reset();							
						}						
						// End:0x3F4
						foreach AllActors(Class'Engine.Actor', A)
						{
							// End:0x3F3
							if((!A.IsA('Controller') && !A.IsA('ONSPowerCore')) && !A.IsA('TeamInfo'))
							{
								A.Reset();
							}							
						}						
						i = 0;
						J0x3FC:

						// End:0x53B [Loop If]
						if(i < PowerCores.Length)
						{
							// End:0x4BD
							if(bSwapSidesAfterReset && PowerCores[i].bFinalCore)
							{
								// End:0x464
								if(bSidesAreSwitched)
								{
									PowerCores[i].DefenderTeamIndex = PowerCores[i].default.DefenderTeamIndex;									
								}
								else
								{
									PowerCores[i].DefenderTeamIndex = byte(Abs(float(int(PowerCores[i].default.DefenderTeamIndex) - 1)));
								}
								FinalCore[int(PowerCores[i].DefenderTeamIndex)] = i;								
							}
							else
							{
								PowerCores[i].DefenderTeamIndex = PowerCores[i].default.DefenderTeamIndex;
							}
							PowerCores[i].FinalCoreDistance[0] = byte(255);
							PowerCores[i].FinalCoreDistance[1] = byte(255);
							PowerCores[i].Reset();
							i++;
							// [Loop Continue]
							goto J0x3FC;
						}
						// End:0x581
						if(bSwapSidesAfterReset)
						{
							SetCoreDistance(PowerCores[FinalCore[0]], 0, 0);
							SetCoreDistance(PowerCores[FinalCore[1]], 1, 0);
							bSidesAreSwitched = !bSidesAreSwitched;
						}
						// End:0x5AE
						if(bRandSetupAfterReset && (OfficialPowerLinkSetups.Length + CustomPowerLinkSetups.Length) > 1)
						{
							FindLinkSetup(CurrentSetupName);							
						}
						else
						{
							UpdateLinks();
						}
						FindNewObjectives(none);
						// End:0x60A
						foreach __NFUN_325__(Class'Engine.Controller', C)
						{
							// End:0x609
							if((C.PlayerReplicationInfo != none) && !C.PlayerReplicationInfo.bOnlySpectator)
							{
								RestartPlayer(C);
							}							
						}						
						RemainingTime = 60 * TimeLimit;
						GameReplicationInfo.RemainingMinute = RemainingTime;
						ResetCountDown = 0;
					}
				}
			}
		}
		//return;		
	}
	stop;	
}

defaultproperties
{
	OvertimeCoreDrainPerSec=20
	bSwapSidesAfterReset=true
	ONSPropsDisplayText[0]="Core Drain in Overtime"
	ONSPropsDisplayText[1]="Random Link Setup After Reset"
	ONSPropsDisplayText[2]="Teams Swap Sides After Reset"
	ONSPropDescText[0]="In overtime, PowerCores lose a maximum of this much health every second."
	ONSPropDescText[1]="After a reset, a new link setup will be chosen at random."
	ONSPropDescText[2]="After a reset, teams will switch sides so they are defending the PowerCore they were previously attacking."
	ONSHints[0]="If you receive a missile lock warning, try to get out of sight quickly!"
	ONSHints[1]="The Raptor's missiles will automatically lock onto Mantas and other Raptors."
	ONSHints[2]="In the Raptor press %JUMP% to fly higher and %DUCK% to fly lower."
	ONSHints[3]="The Manta can rapidly descend to smash your enemies by pressing %DUCK% or %ALTFIRE%."
	ONSHints[4]="Press %JUMP% to perform a 180 spin out in the Hellbender or Scorpion."
	ONSHints[5]="The Manta is the only vehicle that has the ability to jump."
	ONSHints[6]="When deployed, the Leviathan is highly vulnerable to air attacks."
	ONSHints[7]="You can heal a friendly vehicle with the link gun alt-fire."
	ONSHints[8]="You can heal a friendly PowerNode with the link gun alt-fire."
	ONSHints[9]="It is impossible to heal the final PowerCore, so defend it at all costs!"
	ONSHints[10]="Press %TOGGLERADARMAP% to toggle the radar map on and off."
	ONSHints[11]="You can be hurt or killed by vehicles exploding near you."
	ONSHints[12]="Enemy Spider Mines can be destroyed, but some weapons are better against them than others."
	ONSHints[13]="Pressing %USE% on a PowerNode allows you to teleport to any PowerNode your team controls."
	ONSHints[14]="You won't be able to spawn at a PowerNode that is under attack, even if your team controls it."
	ONSHints[15]="If you die, any Spider Mines or Grenades you fired will explode."
	ONSHints[16]="Press %VOICETALK% to voice chat with your team."
	ONSHints[17]="%BASEPATH 0% will show the way to the nearest PowerNode or PowerCore the Red Team can attack, while %BASEPATH 1% will do the same for the Blue Team."
	ONSHints[18]="Press %TOGGLEBEHINDVIEW% to switch between 1st and 3rd person mode in vehicles."
	ONSHints[19]="AVRiL rockets will home into an occupied enemy vehicle as long as you keep your crosshair on it."
	ONSHints[20]="When you find a target with the AVRiL, press alt-fire to zoom and lock your view to that target."
	ONSHints[21]="The green light on top of the weaponlockers indicates that additional ammo is available at that locker."
	ONSHints[22]="Attack PowerNodes that have the enemy team color sky beams above them."
	ONSHints[23]="You cannot attack the PowerCore or PowerNodes if there is an energy shield present. Remove the shield by controlling a node that is linked to it."
	ONSHints[24]="The Grenade Launcher shoots sticky grenades that attach themselves to vehicles and players. You must detonate them yourself with the alternate fire (press %ALTFIRE%)"
	ONSHints[25]="The bomber that the Target Painter calls in can be shot down by enemy fire."
	ONSHints[26]="In Onslaught, your team earns 2 points for winning before overtime and 1 point for a win during overtime."
	bScoreTeamKills=false
	bSpawnInTeamArea=true
	TeamAIType[0]=Class'Onslaught.ONSTeamAI'
	TeamAIType[1]=Class'Onslaught.ONSTeamAI'
	NetWait=15
	bAlwaysShowLoginMenu=true
	DefaultEnemyRosterClass="XGame.xTeamRoster"
	ADR_Kill=2.0000000
	LoginMenuClass="GUI2K4.UT2K4OnslaughtLoginMenu"
	bAllowVehicles=true
	bLiberalVehiclePaths=true
	GameUMenuType="GUI2K4.UT2K4OnslaughtLoginMenu"
	HUDSettingsMenu="GUI2K4.CustomHUDMenuOnslaught"
	HUDType="Onslaught.ONSHUDOnslaught"
	MapListType="Onslaught.ONSMapListOnslaught"
	MapPrefix="ONS"
	BeaconName="ONS"
	ResetTimeDelay=11
	GoalScore=3
	MutatorClass="Onslaught.ONSDefaultMut"
	GameName="Onslaught"
	Description="Your team must take control over PowerNodes in a 'connect the dots' fashion to establish a direct line to the enemy PowerCore. Once you establish a link to the next PowerNode, you can destroy it if controlled by the enemy. Control the PowerNode for your team by touching it to start the build process (Use the linkgun alt-fire to speed things up). Once your team has a link to the enemy PowerCore, attack and destroy it."
	ScreenShotName="UT2004Thumbnails.OnslaughtShots"
	DecoTextName="Onslaught.ONSOnslaughtGame"
	Acronym="ONS"
}
