class TeamGame extends DeathMatch
	config
	hidedropdown
	cacheexempt
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

const TGPROPNUM = 5;

var globalconfig bool bBalanceTeams;
var globalconfig bool bPlayersBalanceTeams;
var config bool bAllowNonTeamChat;
var bool bScoreTeamKills;
var bool bSpawnInTeamArea;
var bool bScoreVictimsTarget;
var config float FriendlyFireScale;
var int MaxTeamSize;
var float TeammateBoost;
var UnrealTeamInfo Teams[2];
var string BlueTeamName;
var string RedTeamName;
var Class<TeamAI> TeamAIType[2];
var string PathWhisps[2];
var localized string NearString;
var localized string BareHanded;
var name CaptureSoundName[2];
var name TakeLeadName[2];
var name IncreaseLeadName[2];
var localized string TGPropsDisplayText[5];
var localized string TGPropDescText[5];
var(LoadingHints) private localized array<localized string> TGHints;
var() float ADR_Goal;
var() float ADR_Return;
var() float ADR_Control;
var Texture TempSymbols[2];
var float LastEndGameTauntTime;
var localized string EndGameComments[10];
var localized string EndGameTaunts[10];
var localized string EndGameVictoryRemarks[10];
var localized string EndGameLossRemarks[10];
var localized string EndGameResponses[10];
var byte EndGameCommented[10];
var byte EndGameRemark[10];
var int LastEndGameComment;
var int LastEndGameRemark;
var int LastEndGameResponse;

function PostBeginPlay()
{
	local int i;

	// End:0x54
	if(InitialBots > 0)
	{
		Teams[0] = GetRedTeam(int((0.5000000 * float(InitialBots)) + float(1)));
		Teams[1] = GetBlueTeam(int((0.5000000 * float(InitialBots)) + float(1)));		
	}
	else
	{
		Teams[0] = GetRedTeam(0);
		Teams[1] = GetBlueTeam(0);
	}
	i = 0;
	J0x79:

	// End:0x115 [Loop If]
	if(i < 2)
	{
		Teams[i].TeamIndex = i;
		Teams[i].AI = Spawn(TeamAIType[i]);
		Teams[i].AI.Team = Teams[i];
		GameReplicationInfo.Teams[i] = Teams[i];
		i++;
		// [Loop Continue]
		goto J0x79;
	}
	Teams[0].AI.EnemyTeam = Teams[1];
	Teams[1].AI.EnemyTeam = Teams[0];
	Teams[0].AI.SetObjectiveLists();
	Teams[1].AI.SetObjectiveLists();
	super.PostBeginPlay();
	//return;	
}

event SetGrammar()
{
	LoadSRGrammar("TDM");
	//return;	
}

function int ParseOrder(string OrderString)
{
	switch(OrderString)
	{
		// End:0x12
		case "DEFEND":
		// End:0x23
		case "TAKE ALPHA":
			return 0;
		// End:0x2E
		case "ATTACK":
		// End:0x40
		case "TAKE BRAVO":
			return 2;
		// End:0x4D
		case "COVER":
			return 3;
		// End:0x58
		case "HOLD":
			return 1;
		// End:0x69
		case "FREELANCE":
			return 4;
		// End:0x79
		case "GIMME":
			return 256;
		// End:0x88
		case "JUMP":
			return 257;
		// End:0x99
		case "STATUS":
			return 258;
		// End:0xA9
		case "TAUNT":
			return 259;
		// End:0xBB
		case "SUICIDE":
			return 260;
		// End:0xFFFF
		default:
			//return;
			break;
	}	
}

function bool ApplyOrder(PlayerController Sender, int RecipientID, int OrderID)
{
	local Bot P;

	// End:0x588
	if(OrderID > 255)
	{
		// End:0x128
		if(OrderID == 260)
		{
			// End:0x123
			if(int(Level.NetMode) == int(NM_Standalone))
			{
				// End:0x122
				foreach __NFUN_325__(Class'UnrealGame.Bot', P)
				{
					// End:0x121
					if((((P.Pawn != none) && P.PlayerReplicationInfo != none) && P.PlayerReplicationInfo.Team == Sender.PlayerReplicationInfo.Team) && (RecipientID == -1) || RecipientID == P.PlayerReplicationInfo.TeamID)
					{
						P.Pawn.KilledBy(P.Pawn);
						// End:0x121
						if(RecipientID == P.PlayerReplicationInfo.TeamID)
						{
							// End:0x122
							break;
						}
					}					
				}				
			}
			return true;			
		}
		else
		{
			// End:0x214
			if(OrderID == 259)
			{
				// End:0x20E
				foreach __NFUN_325__(Class'UnrealGame.Bot', P)
				{
					// End:0x20D
					if((((P.Pawn != none) && P.PlayerReplicationInfo != none) && P.PlayerReplicationInfo.Team == Sender.PlayerReplicationInfo.Team) && (RecipientID == -1) || RecipientID == P.PlayerReplicationInfo.TeamID)
					{
						P.ForceCelebrate();
						// End:0x20D
						if(RecipientID == P.PlayerReplicationInfo.TeamID)
						{
							// End:0x20E
							break;
						}
					}					
				}				
				return true;				
			}
			else
			{
				// End:0x32C
				if(OrderID == 256)
				{
					// End:0x24F
					if((int(Level.NetMode) != int(NM_Standalone)) && RecipientID == -1)
					{
						return true;
					}
					// End:0x326
					foreach __NFUN_325__(Class'UnrealGame.Bot', P)
					{
						// End:0x325
						if((((P.Pawn != none) && P.PlayerReplicationInfo != none) && P.PlayerReplicationInfo.Team == Sender.PlayerReplicationInfo.Team) && (RecipientID == -1) || RecipientID == P.PlayerReplicationInfo.TeamID)
						{
							P.ForceGiveWeapon();
							// End:0x325
							if(RecipientID == P.PlayerReplicationInfo.TeamID)
							{
								// End:0x326
								break;
							}
						}						
					}					
					return true;					
				}
				else
				{
					// End:0x468
					if(OrderID == 257)
					{
						// End:0x367
						if((int(Level.NetMode) != int(NM_Standalone)) && RecipientID == -1)
						{
							return true;
						}
						// End:0x462
						foreach __NFUN_325__(Class'UnrealGame.Bot', P)
						{
							// End:0x461
							if((((P.Pawn != none) && P.PlayerReplicationInfo != none) && P.PlayerReplicationInfo.Team == Sender.PlayerReplicationInfo.Team) && (RecipientID == -1) || RecipientID == P.PlayerReplicationInfo.TeamID)
							{
								P.Pawn.bWantsToCrouch = false;
								P.Pawn.DoJump(false);
								// End:0x461
								if(RecipientID == P.PlayerReplicationInfo.TeamID)
								{
									// End:0x462
									break;
								}
							}							
						}						
						return true;						
					}
					else
					{
						// End:0x583
						if(OrderID == 258)
						{
							// End:0x57D
							foreach __NFUN_325__(Class'UnrealGame.Bot', P)
							{
								// End:0x57C
								if((((P.Pawn != none) && P.PlayerReplicationInfo != none) && P.PlayerReplicationInfo.Team == Sender.PlayerReplicationInfo.Team) && (RecipientID == -1) || RecipientID == P.PlayerReplicationInfo.TeamID)
								{
									P.SendMessage(Sender.PlayerReplicationInfo, 'Other', byte(GetStatus(Sender, P)), 0.0000000, 'Team');
									// End:0x57C
									if(RecipientID == P.PlayerReplicationInfo.TeamID)
									{
										// End:0x57D
										break;
									}
								}								
							}							
							return true;							
						}
						else
						{
							return false;
						}
					}
				}
			}
		}		
	}
	else
	{
		// End:0x68B
		foreach __NFUN_325__(Class'UnrealGame.Bot', P)
		{
			// End:0x68A
			if((P.PlayerReplicationInfo != none) && P.PlayerReplicationInfo.Team == Sender.PlayerReplicationInfo.Team)
			{
				P.bInstantAck = true;
				// End:0x624
				if(RecipientID == -1)
				{
					P.BotVoiceMessage('Order', byte(OrderID), Sender);					
				}
				else
				{
					// End:0x679
					if(RecipientID == P.PlayerReplicationInfo.TeamID)
					{
						P.BotVoiceMessage('Order', byte(OrderID), Sender);
						P.bInstantAck = false;
						// End:0x68B
						break;
					}
				}
				P.bInstantAck = false;
			}			
		}		
	}
	return true;
	//return;	
}

function int ParseRecipient(string Recipient)
{
	local int RecipientID, i;

	// End:0x1A
	if(Recipient == "")
	{
		RecipientID = -2;		
	}
	else
	{
		// End:0x38
		if(Recipient == "TEAM")
		{
			RecipientID = -1;			
		}
		else
		{
			RecipientID = -2;
			i = 0;
			J0x4A:

			// End:0x83 [Loop If]
			if(i < 15)
			{
				// End:0x79
				if(Recipient ~= CallSigns[i])
				{
					RecipientID = i;
					// [Explicit Break]
					goto J0x83;
				}
				i++;
				// [Loop Continue]
				goto J0x4A;
			}
		}
	}
	J0x83:

	return RecipientID;
	//return;	
}

function ParseRecipients(out int RecipientIDs[3], out int NumRecipients, out string OrderString)
{
	local string Recipient, rest;
	local int RecipientID;
	local bool Done;

	RecipientIDs[0] = -2;
	RecipientIDs[1] = -2;
	RecipientIDs[2] = -2;
	NumRecipients = 0;
	Done = false;
	// End:0x52
	if(!Divide(OrderString, " ", Recipient, rest))
	{
		return;
	}
	J0x52:

	RecipientID = ParseRecipient(Recipient);
	// End:0xB5
	if(RecipientID != -2)
	{
		OrderString = rest;
		Done = !Divide(OrderString, " ", Recipient, rest);
		RecipientIDs[NumRecipients] = RecipientID;
		NumRecipients++;		
	}
	else
	{
		Done = true;
	}
	// End:0x52
	if(!((NumRecipients == 3) || Done))
		goto J0x52;
	//return;	
}

function ParseVoiceCommand(PlayerController Sender, string RecognizedString)
{
	local int RecipientIDs[3], NumRecipients, OrderID, i;
	local string OrderString;

	// End:0x0D
	if(Sender == none)
	{
		return;
	}
	OrderString = RecognizedString;
	ParseRecipients(RecipientIDs, NumRecipients, OrderString);
	// End:0x3A
	if(NumRecipients == 0)
	{
		return;
	}
	OrderID = ParseOrder(OrderString);
	i = 0;
	J0x52:

	// End:0x86 [Loop If]
	if(i < NumRecipients)
	{
		ApplyOrder(Sender, RecipientIDs[i], OrderID);
		i++;
		// [Loop Continue]
		goto J0x52;
	}
	//return;	
}

function int GetStatus(PlayerController Sender, Bot B)
{
	local name BotOrders;
	local int i, Count;

	BotOrders = B.GetOrders();
	// End:0x5C
	if(B.Pawn == none)
	{
		// End:0x59
		if((BotOrders == 'Defend') && B.Squad.Size == 1)
		{
			return 0;
		}		
	}
	else
	{
		// End:0xA0
		if(B.PlayerReplicationInfo.HasFlag != none)
		{
			// End:0x9A
			if(B.Pawn.Health < 50)
			{
				return 13;
			}
			return 2;			
		}
		else
		{
			// End:0xEF
			if(B.Enemy == none)
			{
				// End:0xC6
				if(BotOrders == 'Defend')
				{
					return 11;
				}
				// End:0xEC
				if((BotOrders == 'Attack') && B.bReachedGatherPoint)
				{
					return 9;
				}				
			}
			else
			{
				// End:0x37E
				if(B.EnemyVisible())
				{
					// End:0x14D
					if((B.Enemy.PlayerReplicationInfo != none) && B.Enemy.PlayerReplicationInfo.HasFlag != none)
					{
						return BallCarrierMessage();
					}
					// End:0x285
					if((BotOrders == 'Defend') && ((B.GoalScript != none) && VSize(B.GoalScript.Location - B.Pawn.Location) < float(1500)) || B.Squad.SquadObjective.BotNearObjective(B))
					{
						i = 0;
						J0x1E4:

						// End:0x252 [Loop If]
						if(i < 8)
						{
							// End:0x248
							if((B.Squad.Enemies[i] != none) && B.Squad.Enemies[i].Health > 0)
							{
								Count++;
							}
							i++;
							// [Loop Continue]
							goto J0x1E4;
						}
						// End:0x282
						if(Count > 2)
						{
							// End:0x27F
							if(B.Pawn.Health < 60)
							{
								return 21;
							}
							return 22;
						}
						return 20;
					}
					// End:0x37B
					if((BotOrders != 'Follow') || B.Squad.SquadLeader != Sender)
					{
						i = 0;
						J0x2BE:

						// End:0x32C [Loop If]
						if(i < 8)
						{
							// End:0x322
							if((B.Squad.Enemies[i] != none) && B.Squad.Enemies[i].Health > 0)
							{
								Count++;
							}
							i++;
							// [Loop Continue]
							goto J0x2BE;
						}
						// End:0x37B
						if(Count > 1)
						{
							// End:0x37B
							if(B.Pawn.Health < 60)
							{
								// End:0x378
								if((BotOrders == 'Attack') || BotOrders == 'Freelance')
								{
									return 13;
								}
								return 21;
							}
						}
					}					
				}
				else
				{
					// End:0x3A2
					if(B.Pawn.Health < 50)
					{
						return 13;						
					}
					else
					{
						// End:0x454
						if(((BotOrders == 'Defend') && B.Squad.SquadObjective != none) && ((B.GoalScript != none) && VSize(B.GoalScript.Location - B.Pawn.Location) < float(1500)) || B.Squad.SquadObjective.BotNearObjective(B))
						{
							return 20;
						}
					}
				}
			}
		}
	}
	// End:0x491
	if((BotOrders == 'HOLD') && B.Pawn.ReachedDestination(B.GoalScript))
	{
		return 9;
	}
	// End:0x51F
	if((((BotOrders == 'Follow') && B.Squad.SquadLeader == Sender) && B.Squad.SquadLeader.Pawn != none) && B.LineOfSightTo(B.Squad.SquadLeader.Pawn))
	{
		return 3;
	}
	// End:0x531
	if(BotOrders == 'Defend')
	{
		return 26;
	}
	// End:0x558
	if(BotOrders == 'Attack')
	{
		// End:0x555
		if(B.bFinalStretch)
		{
			return 10;
		}
		return 27;
	}
	return 11;
	//return;	
}

function int BallCarrierMessage()
{
	return 12;
	//return;	
}

static function PrecacheGameAnnouncements(AnnouncerVoice V, bool bRewardSounds)
{
	super.PrecacheGameAnnouncements(V, bRewardSounds);
	// End:0x97
	if(!bRewardSounds)
	{
		V.PrecacheSound('Red_Team_Scores');
		V.PrecacheSound('Blue_Team_Scores');
		V.PrecacheSound('Red_Team_increases_their_lead');
		V.PrecacheSound('Blue_Team_increases_their_lead');
		V.PrecacheSound('Red_Team_takes_the_lead');
		V.PrecacheSound('Blue_Team_takes_the_lead');		
	}
	else
	{
		V.PrecacheSound('HatTrick');
	}
	//return;	
}

simulated function UpdateAnnouncements()
{
	//return;	
}

function bool CheckMaxLives(PlayerReplicationInfo Scorer)
{
	local Controller C;
	local PlayerReplicationInfo Living;
	local bool bNoneLeft;

	// End:0x169
	if(MaxLives > 0)
	{
		// End:0x37
		if((Scorer != none) && !Scorer.bOutOfLives)
		{
			Living = Scorer;
		}
		bNoneLeft = true;
		// End:0x127
		foreach __NFUN_325__(Class'Engine.Controller', C)
		{
			// End:0x126
			if((((C.PlayerReplicationInfo != none) && C.bIsPlayer) && !C.PlayerReplicationInfo.bOutOfLives) && !C.PlayerReplicationInfo.bOnlySpectator)
			{
				// End:0xD7
				if(Living == none)
				{
					Living = C.PlayerReplicationInfo;
					// End:0x126
					continue;
				}
				// End:0x126
				if((C.PlayerReplicationInfo != Living) && C.PlayerReplicationInfo.Team != Living.Team)
				{
					bNoneLeft = false;
					// End:0x127
					break;
				}
			}			
		}		
		// End:0x169
		if(bNoneLeft)
		{
			// End:0x153
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

function TeamInfo OtherTeam(TeamInfo Requester)
{
	// End:0x19
	if(Requester == Teams[0])
	{
		return Teams[1];
	}
	return Teams[0];
	//return;	
}

function OverrideInitialBots()
{
	InitialBots = Teams[0].OverrideInitialBots(InitialBots, Teams[1]);
	//return;	
}

function PreLoadNamedBot(string botname)
{
	local int First, Second;

	Second = 1;
	// End:0x48
	if((StandalonePlayer != none) && StandalonePlayer.PlayerReplicationInfo.Team.TeamIndex == 1)
	{
		First = 1;
		Second = 0;
	}
	// End:0x97
	if((1 + Teams[First].Roster.Length) < Teams[Second].Roster.Length)
	{
		Teams[First].AddNamedBot(botname);		
	}
	else
	{
		Teams[Second].AddNamedBot(botname);
	}
	//return;	
}

function PreLoadBot()
{
	// End:0x3C
	if(float(Teams[0].Roster.Length) < ((0.5000000 * float(InitialBots)) + float(1)))
	{
		Teams[0].AddRandomPlayer();
	}
	// End:0x78
	if(float(Teams[1].Roster.Length) < ((0.5000000 * float(InitialBots)) + float(1)))
	{
		Teams[1].AddRandomPlayer();
	}
	//return;	
}

function UnrealTeamInfo GetBlueTeam(int TeamBots)
{
	local Class<UnrealTeamInfo> RosterClass;
	local UnrealTeamInfo Roster;

	// End:0x51
	if(CurrentGameProfile != none)
	{
		RosterClass = Class<UnrealTeamInfo>(DynamicLoadObject(DefaultEnemyRosterClass, Class'Core.Class'));
		Roster = Spawn(RosterClass);
		Roster.FillPlayerTeam(CurrentGameProfile);
		return Roster;		
	}
	else
	{
		// End:0x7B
		if(BlueTeamName != "")
		{
			RosterClass = Class<UnrealTeamInfo>(DynamicLoadObject(BlueTeamName, Class'Core.Class'));			
		}
		else
		{
			RosterClass = Class<UnrealTeamInfo>(DynamicLoadObject(DefaultEnemyRosterClass, Class'Core.Class'));
		}
	}
	Roster = Spawn(RosterClass);
	Roster.Initialize(TeamBots);
	return Roster;
	//return;	
}

function UnrealTeamInfo GetRedTeam(int TeamBots)
{
	EnemyRosterName = RedTeamName;
	return GetBotTeam(TeamBots);
	//return;	
}

event InitGame(string Options, out string Error)
{
	local string InOpt;
	local Class<TeamAI> InType;
	local string RedSymbolName, BlueSymbolName;
	local Texture NewSymbol;

	super.InitGame(Options, Error);
	InOpt = ParseOption(Options, "RedTeamAI");
	// End:0x6B
	if(InOpt != "")
	{
		InType = Class<TeamAI>(DynamicLoadObject(InOpt, Class'Core.Class'));
		// End:0x6B
		if(InType != none)
		{
			TeamAIType[0] = InType;
		}
	}
	InOpt = ParseOption(Options, "BlueTeamAI");
	// End:0xC7
	if(InOpt != "")
	{
		InType = Class<TeamAI>(DynamicLoadObject(InOpt, Class'Core.Class'));
		// End:0xC7
		if(InType != none)
		{
			TeamAIType[1] = InType;
		}
	}
	RedTeamName = ParseOption(Options, "RedTeam");
	BlueTeamName = ParseOption(Options, "BlueTeam");
	// End:0x13F
	if(RedTeamName != "")
	{
		bCustomBots = true;
		// End:0x13C
		if(BlueTeamName == "")
		{
			BlueTeamName = "xGame.TeamBlueConfigured";
		}		
	}
	else
	{
		// End:0x172
		if(BlueTeamName != "")
		{
			bCustomBots = true;
			RedTeamName = "xGame.TeamRedConfigured";
		}
	}
	RedSymbolName = ParseOption(Options, "RedTeamSymbol");
	BlueSymbolName = ParseOption(Options, "BlueTeamSymbol");
	// End:0x1F2
	if(RedSymbolName != "")
	{
		NewSymbol = Texture(DynamicLoadObject(RedSymbolName, Class'Engine.Texture'));
		// End:0x1F2
		if(NewSymbol != none)
		{
			TempSymbols[0] = NewSymbol;
		}
	}
	// End:0x231
	if(BlueSymbolName != "")
	{
		NewSymbol = Texture(DynamicLoadObject(BlueSymbolName, Class'Engine.Texture'));
		// End:0x231
		if(NewSymbol != none)
		{
			TempSymbols[1] = NewSymbol;
		}
	}
	InOpt = ParseOption(Options, "FF");
	// End:0x266
	if(InOpt != "")
	{
		FriendlyFireScale = FMin(1.0000000, float(InOpt));
	}
	// End:0x27C
	if(CurrentGameProfile != none)
	{
		FriendlyFireScale = 0.0000000;
	}
	InOpt = ParseOption(Options, "FriendlyFireScale");
	// End:0x2C0
	if(InOpt != "")
	{
		FriendlyFireScale = FMin(1.0000000, float(InOpt));
	}
	// End:0x2D6
	if(CurrentGameProfile != none)
	{
		FriendlyFireScale = 0.0000000;
	}
	InOpt = ParseOption(Options, "BalanceTeams");
	// End:0x31C
	if(InOpt != "")
	{
		bBalanceTeams = bool(InOpt);
		bPlayersBalanceTeams = bBalanceTeams;
	}
	//return;	
}

function InitTeamSymbols()
{
	// End:0x4E
	if((TempSymbols[0] == none) && Teams[0].TeamSymbolName != "")
	{
		TempSymbols[0] = Texture(DynamicLoadObject(Teams[0].TeamSymbolName, Class'Engine.Texture'));
	}
	// End:0x9C
	if((TempSymbols[1] == none) && Teams[1].TeamSymbolName != "")
	{
		TempSymbols[1] = Texture(DynamicLoadObject(Teams[1].TeamSymbolName, Class'Engine.Texture'));
	}
	GameReplicationInfo.TeamSymbols[0] = TempSymbols[0];
	GameReplicationInfo.TeamSymbols[1] = TempSymbols[1];
	super.InitTeamSymbols();
	//return;	
}

function int GetMinPlayers()
{
	local int LevelMinPlayers;

	LevelMinPlayers = super.GetMinPlayers();
	// End:0x26
	if((LevelMinPlayers & 1) != 0)
	{
		return LevelMinPlayers + 1;		
	}
	else
	{
		return LevelMinPlayers;
	}
	//return;	
}

function bool CanShowPathTo(PlayerController P, int TeamNum)
{
	return true;
	//return;	
}

function ShowPathTo(PlayerController P, int TeamNum)
{
	local GameObjective G, Best;
	local Class<WillowWhisp> WWclass;

	G = Teams[0].AI.Objectives;
	J0x1F:

	// End:0x8C [Loop If]
	if(G != none)
	{
		// End:0x75
		if(G.BetterObjectiveThan(Best, byte(TeamNum), byte(P.PlayerReplicationInfo.Team.TeamIndex)))
		{
			Best = G;
		}
		G = G.NextObjective;
		// [Loop Continue]
		goto J0x1F;
	}
	// End:0xF7
	if((Best != none) && P.FindPathToward(Best, false) != none)
	{
		WWclass = Class<WillowWhisp>(DynamicLoadObject(PathWhisps[TeamNum], Class'Core.Class'));
		Spawn(WWclass, P,, P.Pawn.Location);
	}
	//return;	
}

function RestartPlayer(Controller aPlayer)
{
	local TeamInfo BotTeam, OtherTeam;

	// End:0xE8
	if((((!bPlayersVsBots || int(Level.NetMode) == int(NM_Standalone)) && bBalanceTeams) && Bot(aPlayer) != none) && !bCustomBots || int(Level.NetMode) != int(NM_Standalone))
	{
		BotTeam = aPlayer.PlayerReplicationInfo.Team;
		// End:0xA9
		if(BotTeam == Teams[0])
		{
			OtherTeam = Teams[1];			
		}
		else
		{
			OtherTeam = Teams[0];
		}
		// End:0xE8
		if(OtherTeam.Size < (BotTeam.Size - 1))
		{
			aPlayer.Destroy();
			return;
		}
	}
	super.RestartPlayer(aPlayer);
	//return;	
}

function NotifyKilled(Controller Killer, Controller Killed, Pawn KilledPawn)
{
	Teams[0].AI.NotifyKilled(Killer, Killed, KilledPawn);
	Teams[1].AI.NotifyKilled(Killer, Killed, KilledPawn);
	//return;	
}

function IncrementGoalsScored(PlayerReplicationInfo PRI)
{
	PRI.GoalsScored += 1;
	// End:0x65
	if((PRI.GoalsScored == 3) && UnrealPlayer(PRI.Owner) != none)
	{
		UnrealPlayer(PRI.Owner).ClientDelayedAnnouncementNamed('HatTrick', 30);
	}
	//return;	
}

function bool CheckEndGame(PlayerReplicationInfo Winner, string Reason)
{
	local Controller P;
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
	// End:0x12F
	if(bTeamScoreRounds)
	{
		// End:0x12C
		if(Winner != none)
		{
			Winner.Team.Score += float(1);
			Winner.Team.NetUpdateTime = Level.TimeSeconds - float(1);
		}		
	}
	else
	{
		// End:0x184
		if(!bLastMan && Teams[1].Score == Teams[0].Score)
		{
			// End:0x182
			if(!bOverTimeBroadcast)
			{
				StartupStage = 7;
				PlayStartupMessage();
				bOverTimeBroadcast = true;
			}
			return false;
		}
	}
	// End:0x1AD
	if(bLastMan)
	{
		GameReplicationInfo.Winner = Winner.Team;		
	}
	else
	{
		// End:0x1EB
		if(Teams[1].Score > Teams[0].Score)
		{
			GameReplicationInfo.Winner = Teams[1];			
		}
		else
		{
			GameReplicationInfo.Winner = Teams[0];
		}
	}
	// End:0x2AB
	if(Winner == none)
	{
		// End:0x2AA
		foreach __NFUN_325__(Class'Engine.Controller', P)
		{
			// End:0x2A9
			if(((P.PlayerReplicationInfo != none) && P.PlayerReplicationInfo.Team == GameReplicationInfo.Winner) && (Winner == none) || P.PlayerReplicationInfo.Score > Winner.Score)
			{
				Winner = P.PlayerReplicationInfo;
			}			
		}		
	}
	EndTime = Level.TimeSeconds + EndTimeDelay;
	SetEndGameFocus(Winner);
	return true;
	//return;	
}

function SetEndGameFocus(PlayerReplicationInfo Winner)
{
	local Controller P;
	local PlayerController Player;

	// End:0x2D
	if(Winner != none)
	{
		EndGameFocus = Controller(Winner.Owner).Pawn;
	}
	// End:0x49
	if(EndGameFocus != none)
	{
		EndGameFocus.bAlwaysRelevant = true;
	}
	// End:0x167
	foreach __NFUN_325__(Class'Engine.Controller', P)
	{
		P.GameHasEnded();
		Player = PlayerController(P);
		// End:0x166
		if(Player != none)
		{
			// End:0xD2
			if(!Player.PlayerReplicationInfo.bOnlySpectator)
			{
				PlayWinMessage(Player, Player.PlayerReplicationInfo.Team == GameReplicationInfo.Winner);
			}
			Player.ClientSetBehindView(true);
			// End:0x115
			if(EndGameFocus != none)
			{
				Player.ClientSetViewTarget(EndGameFocus);
				Player.SetViewTarget(EndGameFocus);
			}
			Player.ClientGameEnded();
			// End:0x166
			if(CurrentGameProfile != none)
			{
				CurrentGameProfile.bWonMatch = Player.PlayerReplicationInfo.Team == GameReplicationInfo.Winner;
			}
		}		
	}	
	//return;	
}

function bool CanSpectate(PlayerController Viewer, bool bOnlySpectator, Actor ViewTarget)
{
	// End:0x0D
	if(ViewTarget == none)
	{
		return false;
	}
	// End:0x63
	if(bOnlySpectator)
	{
		// End:0x61
		if(Controller(ViewTarget) != none)
		{
			return (Controller(ViewTarget).PlayerReplicationInfo != none) && !Controller(ViewTarget).PlayerReplicationInfo.bOnlySpectator;
		}
		return true;
	}
	// End:0xE8
	if(Controller(ViewTarget) != none)
	{
		return ((Controller(ViewTarget).PlayerReplicationInfo != none) && !Controller(ViewTarget).PlayerReplicationInfo.bOnlySpectator) && Controller(ViewTarget).PlayerReplicationInfo.Team == Viewer.PlayerReplicationInfo.Team;
	}
	return ((Pawn(ViewTarget) != none) && Pawn(ViewTarget).IsPlayerPawn()) && Pawn(ViewTarget).PlayerReplicationInfo.Team == Viewer.PlayerReplicationInfo.Team;
	//return;	
}

function GetServerDetails(out ServerResponseLine ServerState)
{
	super.GetServerDetails(ServerState);
	AddServerDetail(ServerState, "BalanceTeams", string(bBalanceTeams));
	AddServerDetail(ServerState, "PlayersBalanceTeams", string(bPlayersBalanceTeams));
	AddServerDetail(ServerState, "FriendlyFireScale", string(int(FriendlyFireScale * float(100))) $ "%");
	//return;	
}

function UnrealTeamInfo GetBotTeam(optional int TeamBots)
{
	local int First, Second;

	// End:0x2C
	if(bPlayersVsBots && int(Level.NetMode) != int(NM_Standalone))
	{
		return Teams[0];
	}
	// End:0xB3
	if((int(Level.NetMode) == int(NM_Standalone)) || !bBalanceTeams)
	{
		// End:0x8F
		if(Teams[0].AllBotsSpawned())
		{
			bBalanceTeams = false;
			// End:0x8C
			if(!Teams[1].AllBotsSpawned())
			{
				return Teams[1];
			}			
		}
		else
		{
			// End:0xB3
			if(Teams[1].AllBotsSpawned())
			{
				bBalanceTeams = false;
				return Teams[0];
			}
		}
	}
	Second = 1;
	// End:0x11A
	if(((StandalonePlayer != none) && StandalonePlayer.PlayerReplicationInfo.Team != none) && StandalonePlayer.PlayerReplicationInfo.Team.TeamIndex == 1)
	{
		First = 1;
		Second = 0;
	}
	// End:0x156
	if(Teams[First].Size < Teams[Second].Size)
	{
		return Teams[First];		
	}
	else
	{
		return Teams[Second];
	}
	//return;	
}

function UnrealTeamInfo FindTeamFor(Controller C)
{
	// End:0x33
	if(Teams[0].BelongsOnTeam(C.Pawn.Class))
	{
		return Teams[0];
	}
	// End:0x66
	if(Teams[1].BelongsOnTeam(C.Pawn.Class))
	{
		return Teams[1];
	}
	return GetBotTeam();
	//return;	
}

function byte PickTeam(byte Num, Controller C)
{
	local UnrealTeamInfo SmallTeam, BigTeam, NewTeam;
	local Controller B;
	local int BigTeamBots, SmallTeamBots;

	// End:0x3A
	if(bPlayersVsBots && int(Level.NetMode) != int(NM_Standalone))
	{
		// End:0x37
		if(PlayerController(C) != none)
		{
			return 1;
		}
		return 0;
	}
	SmallTeam = Teams[0];
	BigTeam = Teams[1];
	// End:0x8F
	if(SmallTeam.Size > BigTeam.Size)
	{
		SmallTeam = Teams[1];
		BigTeam = Teams[0];
	}
	// End:0xB0
	if(int(Num) < 2)
	{
		NewTeam = Teams[int(Num)];
	}
	// End:0xC9
	if(NewTeam == none)
	{
		NewTeam = SmallTeam;		
	}
	else
	{
		// End:0x2BF
		if((bPlayersBalanceTeams && int(Level.NetMode) != int(NM_Standalone)) && PlayerController(C) != none)
		{
			// End:0x12E
			if(SmallTeam.Size < BigTeam.Size)
			{
				NewTeam = SmallTeam;				
			}
			else
			{
				// End:0x1C3
				foreach __NFUN_325__(Class'Engine.Controller', B)
				{
					// End:0x1C2
					if((B.PlayerReplicationInfo != none) && B.PlayerReplicationInfo.bBot)
					{
						// End:0x19A
						if(B.PlayerReplicationInfo.Team == BigTeam)
						{
							BigTeamBots++;
							// End:0x1C2
							continue;
						}
						// End:0x1C2
						if(B.PlayerReplicationInfo.Team == SmallTeam)
						{
							SmallTeamBots++;
						}
					}					
				}				
				// End:0x262
				if(BigTeamBots > 0)
				{
					// End:0x20C
					if((SmallTeam.Size - SmallTeamBots) < (BigTeam.Size - BigTeamBots))
					{
						NewTeam = SmallTeam;						
					}
					else
					{
						// End:0x249
						if((BigTeam.Size - BigTeamBots) < (SmallTeam.Size - SmallTeamBots))
						{
							NewTeam = BigTeam;							
						}
						else
						{
							// End:0x25F
							if(SmallTeamBots == 0)
							{
								NewTeam = BigTeam;
							}
						}
					}					
				}
				else
				{
					// End:0x27B
					if(SmallTeamBots > 0)
					{
						NewTeam = SmallTeam;						
					}
					else
					{
						// End:0x2BF
						if(UnrealTeamInfo(C.PlayerReplicationInfo.Team) != none)
						{
							NewTeam = UnrealTeamInfo(C.PlayerReplicationInfo.Team);
						}
					}
				}
			}
		}
	}
	return byte(NewTeam.TeamIndex);
	//return;	
}

function bool ChangeTeam(Controller Other, int Num, bool bNewTeam)
{
	local UnrealTeamInfo NewTeam;

	// End:0x1F
	if(bMustJoinBeforeStart && GameReplicationInfo.bMatchHasBegun)
	{
		return false;
	}
	// End:0x4A
	if(CurrentGameProfile != none)
	{
		// End:0x4A
		if(!CurrentGameProfile.CanChangeTeam(Other, Num))
		{
			return false;
		}
	}
	// End:0x96
	if(Other.IsA('PlayerController') && Other.PlayerReplicationInfo.bOnlySpectator)
	{
		Other.PlayerReplicationInfo.Team = none;
		return true;
	}
	NewTeam = Teams[int(PickTeam(byte(Num), Other))];
	// End:0xD9
	if(Other.PlayerReplicationInfo.Team == NewTeam)
	{
		return false;
	}
	Other.StartSpot = none;
	// End:0x12C
	if(Other.PlayerReplicationInfo.Team != none)
	{
		Other.PlayerReplicationInfo.Team.RemoveFromTeam(Other);
	}
	// End:0x1AA
	if(NewTeam.AddToTeam(Other))
	{
		BroadcastLocalizedMessage(GameMessageClass, 3, Other.PlayerReplicationInfo, none, NewTeam);
		// End:0x1AA
		if(bNewTeam && PlayerController(Other) != none)
		{
			GameEvent("TeamChange", "" $ string(Num), Other.PlayerReplicationInfo);
		}
	}
	return true;
	//return;	
}

function float RatePlayerStart(NavigationPoint N, byte Team, Controller Player)
{
	local PlayerStart P;

	P = PlayerStart(N);
	// End:0x21
	if(P == none)
	{
		return -10000000.0000000;
	}
	// End:0x4E
	if(bSpawnInTeamArea && int(Team) != int(P.TeamNumber))
	{
		return -9000000.0000000;
	}
	return super.RatePlayerStart(N, Team, Player);
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
	// End:0x50
	if(!bOverTime && GoalScore == 0)
	{
		return;
	}
	// End:0xB1
	if(((Scorer != none) && Scorer.Team != none) && Scorer.Team.Score >= float(GoalScore))
	{
		EndGame(Scorer, "teamscorelimit");
	}
	// End:0xDD
	if((Scorer != none) && bOverTime)
	{
		EndGame(Scorer, "timelimit");
	}
	//return;	
}

function bool CriticalPlayer(Controller Other)
{
	// End:0x26
	if((GameRulesModifiers != none) && GameRulesModifiers.CriticalPlayer(Other))
	{
		return true;
	}
	// End:0x5B
	if((Other.PlayerReplicationInfo != none) && Other.PlayerReplicationInfo.HasFlag != none)
	{
		return true;
	}
	return false;
	//return;	
}

function Pawn FindVictimsTarget(Controller Other)
{
	local Vector Start, X, Y, Z;
	local float Dist, Aim;
	local Actor Target;

	// End:0x42
	if(((Other == none) || Other.Pawn == none) || Other.Pawn.Weapon == none)
	{
		return none;
	}
	GetAxes(Other.Pawn.GetViewRotation(), X, Y, Z);
	Start = Other.Pawn.Location + Other.Pawn.CalcDrawOffset(Other.Pawn.Weapon);
	Aim = 0.9700000;
	Target = Other.PickTarget(Aim, Dist, X, Start, 4000.0000000);
	return Pawn(Target);
	//return;	
}

function bool NearGoal(Controller C)
{
	return false;
	//return;	
}

function ScoreKill(Controller Killer, Controller Other)
{
	local Pawn Target;

	// End:0x96
	if(!Other.bIsPlayer || (Killer != none) && !Killer.bIsPlayer)
	{
		super.ScoreKill(Killer, Other);
		// End:0x94
		if(((!bScoreTeamKills && Killer != none) && Killer.bIsPlayer) && MaxLives > 0)
		{
			CheckScore(Killer.PlayerReplicationInfo);
		}
		return;
	}
	// End:0x317
	if(((Killer == none) || Killer == Other) || Killer.PlayerReplicationInfo.Team != Other.PlayerReplicationInfo.Team)
	{
		// End:0x304
		if((Killer != none) && Killer.PlayerReplicationInfo.Team != Other.PlayerReplicationInfo.Team)
		{
			// End:0x18A
			if(Other.PlayerReplicationInfo.HasFlag != none)
			{
				Killer.AwardAdrenaline(ADR_MajorKill);
				GameObject(Other.PlayerReplicationInfo.HasFlag).bLastSecondSave = NearGoal(Other);
			}
			// End:0x208
			if(CriticalPlayer(Other))
			{
				Killer.PlayerReplicationInfo.Score += float(2);
				Killer.PlayerReplicationInfo.NetUpdateTime = Level.TimeSeconds - float(1);
				ScoreEvent(Killer.PlayerReplicationInfo, 1.0000000, "critical_frag");
			}
			// End:0x304
			if(bScoreVictimsTarget)
			{
				Target = FindVictimsTarget(Other);
				// End:0x304
				if((((Target != none) && Target.PlayerReplicationInfo != none) && Target.PlayerReplicationInfo.Team == Killer.PlayerReplicationInfo.Team) && CriticalPlayer(Target.Controller))
				{
					Killer.PlayerReplicationInfo.Score += float(1);
					Killer.PlayerReplicationInfo.NetUpdateTime = Level.TimeSeconds - float(1);
					ScoreEvent(Killer.PlayerReplicationInfo, 1.0000000, "team_protect_frag");
				}
			}
		}
		super.ScoreKill(Killer, Other);		
	}
	else
	{
		// End:0x33B
		if(GameRulesModifiers != none)
		{
			GameRulesModifiers.ScoreKill(Killer, Other);
		}
	}
	// End:0x458
	if(!bScoreTeamKills)
	{
		// End:0x42A
		if((((Other.bIsPlayer && Killer != none) && Killer.bIsPlayer) && Killer != Other) && Killer.PlayerReplicationInfo.Team == Other.PlayerReplicationInfo.Team)
		{
			Killer.PlayerReplicationInfo.Score -= float(1);
			Killer.PlayerReplicationInfo.NetUpdateTime = Level.TimeSeconds - float(1);
			ScoreEvent(Killer.PlayerReplicationInfo, -1.0000000, "team_frag");
		}
		// End:0x456
		if((MaxLives > 0) && Killer != none)
		{
			CheckScore(Killer.PlayerReplicationInfo);
		}
		return;
	}
	// End:0x6BF
	if(Other.bIsPlayer)
	{
		// End:0x518
		if((Killer == none) || Killer == Other)
		{
			Other.PlayerReplicationInfo.Team.Score -= float(1);
			Other.PlayerReplicationInfo.Team.NetUpdateTime = Level.TimeSeconds - float(1);
			TeamScoreEvent(Other.PlayerReplicationInfo.Team.TeamIndex, 1.0000000, "team_frag");			
		}
		else
		{
			// End:0x5DC
			if(Killer.PlayerReplicationInfo.Team != Other.PlayerReplicationInfo.Team)
			{
				Killer.PlayerReplicationInfo.Team.Score += float(1);
				Killer.PlayerReplicationInfo.Team.NetUpdateTime = Level.TimeSeconds - float(1);
				TeamScoreEvent(Killer.PlayerReplicationInfo.Team.TeamIndex, 1.0000000, "tdm_frag");				
			}
			else
			{
				// End:0x6BF
				if(FriendlyFireScale > float(0))
				{
					Killer.PlayerReplicationInfo.NetUpdateTime = Level.TimeSeconds - float(1);
					Killer.PlayerReplicationInfo.Score -= float(1);
					Killer.PlayerReplicationInfo.Team.Score -= float(1);
					Killer.PlayerReplicationInfo.Team.NetUpdateTime = Level.TimeSeconds - float(1);
					TeamScoreEvent(Killer.PlayerReplicationInfo.Team.TeamIndex, 1.0000000, "team_frag");
				}
			}
		}
	}
	// End:0x6E9
	if((Killer != none) && bScoreTeamKills)
	{
		CheckScore(Killer.PlayerReplicationInfo);
	}
	//return;	
}

function int ReduceDamage(int Damage, Pawn injured, Pawn instigatedBy, Vector HitLocation, out Vector Momentum, Class<DamageType> DamageType)
{
	local int InjuredTeam, InstigatorTeam;
	local Controller InstigatorController;

	// End:0x1F
	if(instigatedBy != none)
	{
		InstigatorController = instigatedBy.Controller;
	}
	// End:0x8D
	if(InstigatorController == none)
	{
		// End:0x5D
		if((DamageType != none) && DamageType.default.bDelayedDamage)
		{
			InstigatorController = injured.DelayedDamageInstigatorController;
		}
		// End:0x8D
		if(InstigatorController == none)
		{
			return super.ReduceDamage(Damage, injured, instigatedBy, HitLocation, Momentum, DamageType);
		}
	}
	InjuredTeam = injured.GetTeamNum();
	InstigatorTeam = InstigatorController.GetTeamNum();
	// End:0x32D
	if(InstigatorController != injured.Controller)
	{
		// End:0x32D
		if((InjuredTeam != 255) && InstigatorTeam != 255)
		{
			// End:0x289
			if(InjuredTeam == InstigatorTeam)
			{
				// End:0x133
				if((DamageType != none) && (Class<WeaponDamageType>(DamageType) != none) || Class<VehicleDamageType>(DamageType) != none)
				{
					Momentum *= TeammateBoost;
				}
				// End:0x190
				if((Bot(injured.Controller) != none) && InstigatorController.Pawn != none)
				{
					Bot(injured.Controller).YellAt(InstigatorController.Pawn);					
				}
				else
				{
					// End:0x201
					if((PlayerController(injured.Controller) != none) && injured.Controller.AutoTaunt())
					{
						injured.Controller.SendMessage(InstigatorController.PlayerReplicationInfo, 'FRIENDLYFIRE', byte(Rand(3)), 5.0000000, 'Team');
					}
				}
				// End:0x27A
				if((FriendlyFireScale == 0.0000000) || (Vehicle(injured) != none) && Vehicle(injured).bNoFriendlyFire)
				{
					// End:0x278
					if(GameRulesModifiers != none)
					{
						return GameRulesModifiers.NetDamage(Damage, 0, injured, instigatedBy, HitLocation, Momentum, DamageType);						
					}
					else
					{
						return 0;
					}
				}
				Damage *= FriendlyFireScale;				
			}
			else
			{
				// End:0x32D
				if(((!injured.IsHumanControlled() && injured.Controller != none) && injured.PlayerReplicationInfo != none) && injured.PlayerReplicationInfo.HasFlag != none)
				{
					injured.Controller.SendMessage(none, 'Other', injured.Controller.GetMessageIndex('injured'), 15.0000000, 'Team');
				}
			}
		}
	}
	return super.ReduceDamage(Damage, injured, instigatedBy, HitLocation, Momentum, DamageType);
	//return;	
}

function bool SameTeam(Controller A, Controller B)
{
	// End:0x1A
	if((A == none) || B == none)
	{
		return false;
	}
	return A.PlayerReplicationInfo.Team.TeamIndex == B.PlayerReplicationInfo.Team.TeamIndex;
	//return;	
}

function bool TooManyBots(Controller botToRemove)
{
	// End:0x40
	if((int(Level.NetMode) != int(NM_Standalone)) && bPlayersVsBots)
	{
		return NumBots > Min(16, int(BotRatio * float(NumPlayers)));
	}
	// End:0xE7
	if((botToRemove.PlayerReplicationInfo != none) && botToRemove.PlayerReplicationInfo.Team != none)
	{
		// End:0xC0
		if(botToRemove.PlayerReplicationInfo.Team == Teams[0])
		{
			// End:0xBD
			if(Teams[0].Size < Teams[1].Size)
			{
				return false;
			}			
		}
		else
		{
			// End:0xE7
			if(Teams[1].Size < Teams[0].Size)
			{
				return false;
			}
		}
	}
	return super.TooManyBots(botToRemove);
	//return;	
}

function PlayEndOfMatchMessage()
{
	local PlayerController C;

	// End:0x19A
	if(((Teams[0].Score == float(0)) || Teams[1].Score == float(0)) && (Teams[0].Score + Teams[1].Score) >= float(3))
	{
		// End:0x196
		foreach __NFUN_325__(Class'Engine.PlayerController', C)
		{
			// End:0x195
			if(C.Player != none)
			{
				// End:0x120
				if(Teams[0].Score > Teams[1].Score)
				{
					// End:0x104
					if((C.PlayerReplicationInfo.Team == Teams[0]) || C.PlayerReplicationInfo.bOnlySpectator)
					{
						C.PlayStatusAnnouncement(AltEndGameSoundName[0], 1, true);						
					}
					else
					{
						C.PlayStatusAnnouncement(AltEndGameSoundName[1], 1, true);
					}
					// End:0x195
					continue;
				}
				// End:0x17C
				if((C.PlayerReplicationInfo.Team == Teams[1]) || C.PlayerReplicationInfo.bOnlySpectator)
				{
					C.PlayStatusAnnouncement(AltEndGameSoundName[0], 1, true);
					// End:0x195
					continue;
				}
				C.PlayStatusAnnouncement(AltEndGameSoundName[1], 1, true);
			}			
		}				
	}
	else
	{
		// End:0x219
		foreach __NFUN_325__(Class'Engine.PlayerController', C)
		{
			// End:0x218
			if(C.Player != none)
			{
				// End:0x1FF
				if(Teams[0].Score > Teams[1].Score)
				{
					C.PlayStatusAnnouncement(EndGameSoundName[0], 1, true);
					// End:0x218
					continue;
				}
				C.PlayStatusAnnouncement(EndGameSoundName[1], 1, true);
			}			
		}		
	}
	//return;	
}

static function string ParseChatPercVar(Mutator BaseMutator, Controller Who, string Cmd)
{
	local float minDist, currDist, currInvDist, BestInvDist;
	local Actor Closest;
	local string near, where, locName;
	local InventorySpot S, BestInv;
	local GameObjective GO;
	local NavigationPoint N;

	// End:0x1A
	if(Who.Pawn == none)
	{
		return Cmd;
	}
	// End:0x4D
	if(Cmd ~= "%H")
	{
		return string(Who.Pawn.Health) $ " Health";
	}
	// End:0xDD
	if(Cmd ~= "%W")
	{
		// End:0x9D
		if(Who.Pawn.Weapon != none)
		{
			return Who.Pawn.Weapon.GetHumanReadableName();			
		}
		else
		{
			// End:0xD7
			if(Vehicle(Who.Pawn) != none)
			{
				return Vehicle(Who.Pawn).GetVehiclePositionString();				
			}
			else
			{
				return default.BareHanded;
			}
		}
	}
	// End:0xEF
	if(Cmd == "%%")
	{
		return "%";
	}
	// End:0x3B2
	if(Cmd ~= "%L")
	{
		minDist = 10000000.0000000;
		BestInvDist = 2000.0000000;
		N = Who.Level.NavigationPointList;
		J0x130:

		// End:0x249 [Loop If]
		if(N != none)
		{
			S = InventorySpot(N);
			// End:0x1C3
			if((S != none) && S.markedItem != none)
			{
				currInvDist = VSize(S.Location - Who.Pawn.Location);
				// End:0x1C0
				if(currInvDist < BestInvDist)
				{
					BestInvDist = currInvDist;
					BestInv = S;
				}				
			}
			else
			{
				GO = GameObjective(N);
				// End:0x232
				if(GO != none)
				{
					currDist = VSize(GO.Location - Who.Pawn.Location);
					// End:0x232
					if(currDist < minDist)
					{
						minDist = currDist;
						Closest = GO;
					}
				}
			}
			N = N.nextNavigationPoint;
			// [Loop Continue]
			goto J0x130;
		}
		// End:0x2AA
		if(((minDist > float(2048)) && BestInvDist < minDist) && BestInv != none)
		{
			Closest = BestInv.markedItem;
			near = BestInv.markedItem.GetHumanReadableName();
		}
		// End:0x2F4
		if((Who != none) && Who.PlayerReplicationInfo != none)
		{
			locName = (" (" $ Who.PlayerReplicationInfo.GetLocationName()) $ ")";
		}
		// End:0x3B2
		if(Closest != none)
		{
			// End:0x335
			if(GameObjective(Closest) != none)
			{
				return (default.NearString @ GameObjective(Closest).GetHumanReadableName()) $ locName;				
			}
			else
			{
				where = Who.Level.Game.FindTeamDesignation(PlayerController(Who).GameReplicationInfo, Closest);
				// End:0x397
				if(where == "")
				{
					return (default.NearString @ near) $ locName;					
				}
				else
				{
					return ((default.NearString @ where) @ near) $ locName;
				}
			}
		}
	}
	return super(GameInfo).ParseChatPercVar(BaseMutator, Who, Cmd);
	//return;	
}

static function string FindTeamDesignation(GameReplicationInfo GRI, Actor A)
{
	// End:0x50
	if(((GRI == none) || GRI.Teams[0].HomeBase == none) || GRI.Teams[1].HomeBase == none)
	{
		return "";
	}
	// End:0xE0
	if(VSize(A.Location - GRI.Teams[0].HomeBase.Location) < VSize(A.Location - GRI.Teams[1].HomeBase.Location))
	{
		return GRI.Teams[0].GetHumanReadableName() $ " ";		
	}
	else
	{
		return GRI.Teams[1].GetHumanReadableName() $ " ";
	}
	//return;	
}

static function string ParseMessageString(Mutator BaseMutator, Controller Who, string Message)
{
	local string OutMsg, Cmd;
	local int pos, i;

	OutMsg = "";
	pos = InStr(Message, "%");
	J0x18:

	// End:0xEA [Loop If]
	if(pos > -1)
	{
		// End:0x64
		if(pos > 0)
		{
			OutMsg = OutMsg $ Left(Message, pos);
			Message = Mid(Message, pos);
			pos = 0;
		}
		i = Len(Message);
		Cmd = Mid(Message, pos, 2);
		// End:0xAD
		if((i - 2) > 0)
		{
			Message = Right(Message, i - 2);			
		}
		else
		{
			Message = "";
		}
		OutMsg = OutMsg $ (ParseChatPercVar(BaseMutator, Who, Cmd));
		pos = InStr(Message, "%");
		// [Loop Continue]
		goto J0x18;
	}
	// End:0x108
	if(Message != "")
	{
		OutMsg = OutMsg $ Message;
	}
	return OutMsg;
	//return;	
}

function FindNewObjectives(GameObjective DisabledObjective)
{
	Teams[0].AI.FindNewObjectives(DisabledObjective);
	Teams[1].AI.FindNewObjectives(DisabledObjective);
	//return;	
}

static function FillPlayInfo(PlayInfo PlayInfo)
{
	local int i;

	super.FillPlayInfo(PlayInfo);
	PlayInfo.AddSetting(default.BotsGroup, "bBalanceTeams", default.TGPropsDisplayText[i++], 0, 2, "Check");
	PlayInfo.AddSetting(default.RulesGroup, "bPlayersBalanceTeams", default.TGPropsDisplayText[i++], 0, 1, "Check",,, true);
	PlayInfo.AddSetting(default.GameGroup, "FriendlyFireScale", default.TGPropsDisplayText[i++], 20, 1, "Text", "8;0.0:1.0",,, true);
	PlayInfo.AddSetting(default.ChatGroup, "bAllowNonTeamChat", default.TGPropsDisplayText[i++], 60, 1, "Check",, "Xv", true, true);
	//return;	
}

static event string GetDescriptionText(string PropName)
{
	switch(PropName)
	{
		// End:0x21
		case "bBalanceTeams":
			return default.TGPropDescText[0];
		// End:0x42
		case "bPlayersBalanceTeams":
			return default.TGPropDescText[1];
		// End:0x61
		case "FriendlyFireScale":
			return default.TGPropDescText[2];
		// End:0x80
		case "bAllowNonTeamChat":
			return default.TGPropDescText[3];
		// End:0xFFFF
		default:
			return super.GetDescriptionText(PropName);
			break;
	}
	//return;	
}

static event bool AcceptPlayInfoProperty(string PropertyName)
{
	// End:0x24
	if(InStr(PropertyName, "bColoredDMSkins") != -1)
	{
		return false;
	}
	return super.AcceptPlayInfoProperty(PropertyName);
	//return;	
}

function AnnounceScore(int ScoringTeam)
{
	local PlayerController C;
	local name ScoreSound;
	local int OtherTeam;

	// End:0x15
	if(ScoringTeam == 1)
	{
		OtherTeam = 0;		
	}
	else
	{
		OtherTeam = 1;
	}
	// End:0x62
	if(Teams[ScoringTeam].Score == (Teams[OtherTeam].Score + float(1)))
	{
		ScoreSound = TakeLeadName[ScoringTeam];		
	}
	else
	{
		// End:0xA9
		if(Teams[ScoringTeam].Score == (Teams[OtherTeam].Score + float(2)))
		{
			ScoreSound = IncreaseLeadName[ScoringTeam];			
		}
		else
		{
			ScoreSound = CaptureSoundName[ScoringTeam];
		}
	}
	// End:0xF6
	foreach __NFUN_325__(Class'Engine.PlayerController', C)
	{
		// End:0xF5
		if(C.Player != none)
		{
			C.PlayStatusAnnouncement(ScoreSound, 1, true);
		}		
	}	
	//return;	
}

function InitVoiceReplicationInfo()
{
	super(UnrealMPGameInfo).InitVoiceReplicationInfo();
	// End:0x40
	if((VoiceReplicationInfo != none) && TeamVoiceReplicationInfo(VoiceReplicationInfo) != none)
	{
		TeamVoiceReplicationInfo(VoiceReplicationInfo).bTeamChatOnly = !bAllowNonTeamChat;
	}
	//return;	
}

event PostLogin(PlayerController NewPlayer)
{
	super.PostLogin(NewPlayer);
	// End:0x6E
	if(NewPlayer.PlayerReplicationInfo.Team != none)
	{
		GameEvent("TeamChange", "" $ string(NewPlayer.PlayerReplicationInfo.Team.TeamIndex), NewPlayer.PlayerReplicationInfo);
	}
	//return;	
}

static function array<string> GetAllLoadHints(optional bool bThisClassOnly)
{
	local int i;
	local array<string> Hints;

	// End:0x25
	if(!bThisClassOnly || default.TGHints.Length == 0)
	{
		Hints = super.GetAllLoadHints();
	}
	i = 0;
	J0x2C:

	// End:0x5E [Loop If]
	if(i < default.TGHints.Length)
	{
		Hints[Hints.Length] = default.TGHints[i];
		i++;
		// [Loop Continue]
		goto J0x2C;
	}
	return Hints;
	//return;	
}

function WeakObjectives()
{
	local GameObjective GO;

	GO = Teams[0].AI.Objectives;
	J0x1F:

	// End:0x6A [Loop If]
	if(GO != none)
	{
		// End:0x53
		if(GO.IsA('DestroyableObjective'))
		{
			DestroyableObjective(GO).Health = 1;
		}
		GO = GO.NextObjective;
		// [Loop Continue]
		goto J0x1F;
	}
	//return;	
}

function bool PickEndGameTauntFor(Bot B)
{
	// End:0x21
	if((Level.TimeSeconds - LastEndGameTauntTime) < 1.5000000)
	{
		return false;
	}
	// End:0x40
	if(B.PlayerReplicationInfo.Team == none)
	{
		return false;
	}
	// End:0x78
	if(B.PlayerReplicationInfo.Team != GameReplicationInfo.Winner)
	{
		EndGameCommentFor(B);		
	}
	else
	{
		EndGameTauntFor(B);
	}
	LastEndGameTauntTime = Level.TimeSeconds;
	return true;
	//return;	
}

function EndGameCommentFor(Bot B)
{
	local PlayerController C, Best;
	local string S;

	// End:0xF4
	if(FRand() < 0.4000000)
	{
		LastEndGameRemark = Rand(10);
		// End:0xEF
		if(int(EndGameRemark[LastEndGameRemark]) == 0)
		{
			S = EndGameLossRemarks[LastEndGameRemark];
			LastEndGameComment = -1;
			EndGameRemark[LastEndGameRemark] = 1;
			// End:0xEC
			if(LastEndGameRemark == 0)
			{
				// End:0xBA
				foreach __NFUN_325__(Class'Engine.PlayerController', C)
				{
					// End:0xB9
					if((Best == none) || C.PlayerReplicationInfo.Score > Best.PlayerReplicationInfo.Score)
					{
						Best = C;
					}					
				}				
				// End:0xC8
				if(Best == none)
				{
					return;
				}
				S = Best.PlayerReplicationInfo.PlayerName @ S;
			}			
		}
		else
		{
			return;
		}		
	}
	else
	{
		// End:0x11E
		if(LastEndGameComment == -1)
		{
			LastEndGameComment = 10;
			S = EndGameResponses[Rand(10)];			
		}
		else
		{
			LastEndGameComment = Rand(10);
			// End:0x15D
			if(int(EndGameCommented[LastEndGameComment]) == 0)
			{
				EndGameCommented[LastEndGameComment] = 1;
				S = EndGameComments[LastEndGameComment];				
			}
			else
			{
				return;
			}
		}
	}
	Broadcast(B, S, 'Say');
	//return;	
}

function EndGameTauntFor(Bot B)
{
	local string S;

	// End:0x5B
	if(FRand() < 0.4000000)
	{
		LastEndGameRemark = Rand(10);
		// End:0x56
		if(int(EndGameRemark[LastEndGameRemark]) == 0)
		{
			S = EndGameVictoryRemarks[LastEndGameRemark];
			LastEndGameComment = -1;
			EndGameRemark[LastEndGameRemark] = 1;			
		}
		else
		{
			return;
		}		
	}
	else
	{
		// End:0x85
		if(LastEndGameComment == -1)
		{
			LastEndGameComment = 10;
			S = EndGameResponses[Rand(10)];			
		}
		else
		{
			LastEndGameComment = Rand(10);
			// End:0xC4
			if(int(EndGameCommented[LastEndGameComment]) == 0)
			{
				EndGameCommented[LastEndGameComment] = 1;
				S = EndGameTaunts[LastEndGameComment];				
			}
			else
			{
				return;
			}
		}
	}
	Broadcast(B, S, 'Say');
	//return;	
}

defaultproperties
{
	bBalanceTeams=true
	bPlayersBalanceTeams=true
	bScoreTeamKills=true
	MaxTeamSize=32
	TeammateBoost=0.3000000
	TeamAIType[0]=Class'UnrealGame.TeamAI'
	TeamAIType[1]=Class'UnrealGame.TeamAI'
	PathWhisps[0]="XEffects.RedWhisp"
	PathWhisps[1]="XEffects.BlueWhisp"
	NearString="Near the"
	BareHanded="Bare Handed"
	CaptureSoundName[0]="Red_Team_Scores"
	CaptureSoundName[1]="Blue_Team_Scores"
	TakeLeadName[0]="Red_Team_takes_the_lead"
	TakeLeadName[1]="Blue_Team_takes_the_lead"
	IncreaseLeadName[0]="Red_Team_increases_their_lead"
	IncreaseLeadName[1]="Blue_Team_increases_their_lead"
	TGPropsDisplayText[0]="Bots Balance Teams"
	TGPropsDisplayText[1]="Players Balance Teams"
	TGPropsDisplayText[2]="Friendly Fire Scale"
	TGPropsDisplayText[3]="Cross-Team Priv. Chat"
	TGPropsDisplayText[4]="Max Team Size"
	TGPropDescText[0]="Bots will join or change teams to make sure they are even."
	TGPropDescText[1]="Players are forced to join the smaller team when they enter."
	TGPropDescText[2]="Specifies how much damage players from the same team can do to each other."
	TGPropDescText[3]="Determines whether members of opposing teams are allowed to join the same private chat room"
	TGPropDescText[4]="Maximum number of players on each team"
	TGHints[0]="If you miss a player's chat message, you can use %INGAMECHAT% to display a box of all chat messages you have received."
	TGHints[1]="Use the link gun alt fire beam to link up with link gun carrying teammates.  While linked, the teammate will receive a significant power boost to their link gun."
	TGHints[2]="You can toss your current weapon for a teammate by pressing %THROWWEAPON%."
	TGHints[3]="Teammates who have a link gun equipped will have a green team beacon above their heads instead of the standard yellow beacon."
	TGHints[4]="Press %VOICETALK% to voice chat with your team."
	TGHints[5]="Press %TEAMTALK% and type your message to send text messages to other team members."
	TGHints[6]="The text-to-speech feature that makes the game read text messages aloud can be enabled in the audio settings menu."
	ADR_Goal=25.0000000
	ADR_Return=5.0000000
	ADR_Control=2.0000000
	EndGameComments[0]="lllllllamas"
	EndGameComments[1]="bye"
	EndGameComments[2]="gg"
	EndGameComments[3]="gg"
	EndGameComments[4]="gg everyone"
	EndGameComments[5]="Teams"
	EndGameComments[6]="omg"
	EndGameComments[7]="dammit!"
	EndGameComments[8]="my team sux0rs"
	EndGameComments[9]="gg"
	EndGameTaunts[0]="woot"
	EndGameTaunts[1]="DENIED!"
	EndGameTaunts[2]="gg everyone"
	EndGameTaunts[3]="gg"
	EndGameTaunts[4]="gg"
	EndGameTaunts[5]="PANTS!"
	EndGameTaunts[6]="owned"
	EndGameTaunts[7]="Booyah!"
	EndGameTaunts[8]="W00T!"
	EndGameTaunts[9]="oh yeah!"
	EndGameVictoryRemarks[0]="Take that to the bank, punks!"
	EndGameVictoryRemarks[1]="omg, so owned."
	EndGameVictoryRemarks[2]="Our Victory, Your Defeat"
	EndGameVictoryRemarks[3]="You know, practice might help"
	EndGameVictoryRemarks[4]="You suckas got served"
	EndGameVictoryRemarks[5]="That was pathetic"
	EndGameVictoryRemarks[6]="Ya mamma!"
	EndGameVictoryRemarks[7]="pwned!"
	EndGameVictoryRemarks[8]="u r teh suk"
	EndGameVictoryRemarks[9]="Humans need better AI"
	EndGameLossRemarks[0]="was using an aimbot"
	EndGameLossRemarks[1]="Take a screenshot, this wonÂ’t happen again."
	EndGameLossRemarks[2]="crappy map"
	EndGameLossRemarks[3]="this server sux"
	EndGameLossRemarks[4]="Campers."
	EndGameLossRemarks[5]="Omg wtf wallhacking mofos"
	EndGameLossRemarks[6]="Where's Malcolm when you need him?"
	EndGameLossRemarks[7]="my team sux"
	EndGameLossRemarks[8]="OMG Epic plz fix kthxbye"
	EndGameLossRemarks[9]="Vwvwvwvwvwvwvwvwvwvwvwvzxcjjj"
	EndGameResponses[0]=":)"
	EndGameResponses[1]=";)"
	EndGameResponses[2]="haha"
	EndGameResponses[3]="LOL"
	EndGameResponses[4]="lol"
	EndGameResponses[5]="ROFL"
	EndGameResponses[6]="rofl"
	EndGameResponses[7]="werd"
	EndGameResponses[8]="ahaha"
	EndGameResponses[9]="omg"
	bMustHaveMultiplePlayers=true
	NumRounds=5
	EndMessageWait=3
	EndGameSoundName[0]="red_team_is_the_winner"
	EndGameSoundName[1]="blue_team_is_the_winner"
	SinglePlayerWait=2
	bCanChangeSkin=false
	bTeamGame=true
	ScoreBoardType="XInterface.ScoreBoardTeamDeathMatch"
	BeaconName="Team"
	GoalScore=60
	VoiceReplicationInfoClass=Class'UnrealGame.TeamVoiceReplicationInfo'
	Description="Two teams duke it out in a quest for battlefield supremacy.  The team with the most total frags wins."
}
