class CTFGame extends TeamGame
	config
	cacheexempt
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var(LoadingHints) private localized array<localized string> CTFHints;

function PostBeginPlay()
{
	super.PostBeginPlay();
	SetTeamFlags();
	//return;	
}

function RegisterVehicle(Vehicle V)
{
	super(GameInfo).RegisterVehicle(V);
	//return;	
}

static function PrecacheGameAnnouncements(AnnouncerVoice V, bool bRewardSounds)
{
	super.PrecacheGameAnnouncements(V, bRewardSounds);
	// End:0x97
	if(!bRewardSounds)
	{
		V.PrecacheSound('Red_Flag_Returned');
		V.PrecacheSound('Blue_Flag_Returned');
		V.PrecacheSound('Red_Flag_Dropped');
		V.PrecacheSound('Blue_Flag_Dropped');
		V.PrecacheSound('Red_Flag_Taken');
		V.PrecacheSound('Blue_Flag_Taken');		
	}
	else
	{
		V.PrecacheSound('Denied');
	}
	//return;	
}

simulated function UpdateAnnouncements()
{
	//return;	
}

function bool NearGoal(Controller C)
{
	local PlayerReplicationInfo P;

	P = C.PlayerReplicationInfo;
	return CTFBase(P.Team.HomeBase).myFlag.bHome && VSize(C.Pawn.Location - P.Team.HomeBase.Location) < float(1000);
	//return;	
}

static function int OrderToIndex(int Order)
{
	// End:0x0F
	if(Order == 2)
	{
		return 10;
	}
	// End:0x1D
	if(Order == 0)
	{
		return 11;
	}
	return Order;
	//return;	
}

function float SpawnWait(AIController B)
{
	// End:0x21
	if(B.PlayerReplicationInfo.bOutOfLives)
	{
		return 999.0000000;
	}
	// End:0xAB
	if(int(Level.NetMode) == int(NM_Standalone))
	{
		// End:0x4C
		if(NumBots < 4)
		{
			return 0.0000000;
		}
		// End:0x8D
		if(!CTFSquadAI(Bot(B).Squad).FriendlyFlag.bHome && NumBots <= 16)
		{
			return FRand();
		}
		return (0.5000000 * FMax(2.0000000, float(NumBots - 4))) * FRand();
	}
	return FRand();
	//return;	
}

function SetTeamFlags()
{
	local CTFFlag F;

	// End:0xE8
	foreach AllActors(Class'UnrealGame.CTFFlag', F)
	{
		F.Team = Teams[int(F.TeamNum)];
		F.Team.HomeBase = F.HomeBase;
		CTFTeamAI(F.Team.AI).FriendlyFlag = F;
		// End:0xC3
		if(int(F.TeamNum) == 0)
		{
			CTFTeamAI(Teams[1].AI).EnemyFlag = F;
			// End:0xE7
			continue;
		}
		CTFTeamAI(Teams[0].AI).EnemyFlag = F;		
	}	
	//return;	
}

function GameObject GetGameObject(name GameObjectName)
{
	local int i;

	i = 0;
	J0x07:

	// End:0x71 [Loop If]
	if(i < 2)
	{
		// End:0x67
		if(CTFTeamAI(Teams[i].AI).FriendlyFlag.IsA(GameObjectName))
		{
			return CTFTeamAI(Teams[i].AI).FriendlyFlag;
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	return super(UnrealMPGameInfo).GetGameObject(GameObjectName);
	//return;	
}

function Logout(Controller Exiting)
{
	// End:0x50
	if(Exiting.PlayerReplicationInfo.HasFlag != none)
	{
		CTFFlag(Exiting.PlayerReplicationInfo.HasFlag).Drop(vect(0.0000000, 0.0000000, 0.0000000));
	}
	super(DeathMatch).Logout(Exiting);
	//return;	
}

function bool CheckEndGame(PlayerReplicationInfo Winner, string Reason)
{
	local CTFFlag BestFlag;
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
	// End:0xC4
	if((GameRulesModifiers != none) && !GameRulesModifiers.CheckEndGame(Winner, Reason))
	{
		return false;
	}
	// End:0xED
	if(bLastMan)
	{
		GameReplicationInfo.Winner = Winner.Team;		
	}
	else
	{
		// End:0x135
		if(Teams[1].Score == Teams[0].Score)
		{
			// End:0x133
			if(!bOverTimeBroadcast)
			{
				StartupStage = 7;
				PlayStartupMessage();
				bOverTimeBroadcast = true;
			}
			return false;
		}
		// End:0x173
		if(Teams[1].Score > Teams[0].Score)
		{
			GameReplicationInfo.Winner = Teams[1];			
		}
		else
		{
			GameReplicationInfo.Winner = Teams[0];
		}
	}
	BestFlag = CTFTeamAI(UnrealTeamInfo(GameReplicationInfo.Winner).AI).FriendlyFlag;
	EndGameFocus = BestFlag.HomeBase;
	EndGameFocus.bHidden = false;
	EndTime = Level.TimeSeconds + EndTimeDelay;
	// End:0x30C
	foreach __NFUN_325__(Class'Engine.Controller', P)
	{
		P.GameHasEnded();
		Player = PlayerController(P);
		// End:0x30B
		if(Player != none)
		{
			Player.ClientSetBehindView(true);
			Player.ClientSetViewTarget(EndGameFocus);
			Player.SetViewTarget(EndGameFocus);
			// End:0x2BA
			if(!Player.PlayerReplicationInfo.bOnlySpectator)
			{
				PlayWinMessage(Player, Player.PlayerReplicationInfo.Team == GameReplicationInfo.Winner);
			}
			Player.ClientGameEnded();
			// End:0x30B
			if(CurrentGameProfile != none)
			{
				CurrentGameProfile.bWonMatch = Player.PlayerReplicationInfo.Team == GameReplicationInfo.Winner;
			}
		}		
	}	
	BestFlag.HomeBase.bHidden = false;
	BestFlag.bHidden = true;
	return true;
	//return;	
}

function ScoreGameObject(Controller C, GameObject GO)
{
	super(UnrealMPGameInfo).ScoreGameObject(C, GO);
	// End:0x39
	if(GO.IsA('CTFFlag'))
	{
		ScoreFlag(C, CTFFlag(GO));
	}
	//return;	
}

function ScoreFlag(Controller Scorer, CTFFlag theFlag)
{
	local float Dist, oppDist;
	local int i;
	local float ppp, numtouch;
	local Vector FlagLoc;

	// End:0x25C
	if(Scorer.PlayerReplicationInfo.Team == theFlag.Team)
	{
		Scorer.AwardAdrenaline(ADR_Return);
		FlagLoc = theFlag.Position().Location;
		Dist = VSize(FlagLoc - theFlag.HomeBase.Location);
		// End:0xC3
		if(int(theFlag.TeamNum) == 0)
		{
			oppDist = VSize(FlagLoc - Teams[1].HomeBase.Location);			
		}
		else
		{
			oppDist = VSize(FlagLoc - Teams[0].HomeBase.Location);
		}
		GameEvent("flag_returned", "" $ string(theFlag.Team.TeamIndex), Scorer.PlayerReplicationInfo);
		BroadcastLocalizedMessage(Class'UnrealGame.CTFMessage', 1, Scorer.PlayerReplicationInfo, none, theFlag.Team);
		// End:0x25A
		if(Dist > float(1024))
		{
			// End:0x1C0
			if(Dist <= oppDist)
			{
				Scorer.PlayerReplicationInfo.Score += float(3);
				ScoreEvent(Scorer.PlayerReplicationInfo, 3.0000000, "flag_ret_friendly");				
			}
			else
			{
				Scorer.PlayerReplicationInfo.Score += float(5);
				ScoreEvent(Scorer.PlayerReplicationInfo, 5.0000000, "flag_ret_enemy");
				// End:0x25A
				if(oppDist <= float(1024))
				{
					Scorer.PlayerReplicationInfo.Score += float(7);
					ScoreEvent(Scorer.PlayerReplicationInfo, 7.0000000, "flag_denial");
				}
			}
		}
		return;
	}
	// End:0x300
	if(theFlag.FirstTouch != none)
	{
		ScoreEvent(theFlag.FirstTouch.PlayerReplicationInfo, 5.0000000, "flag_cap_1st_touch");
		theFlag.FirstTouch.PlayerReplicationInfo.Score += float(5);
		theFlag.FirstTouch.PlayerReplicationInfo.NetUpdateTime = Level.TimeSeconds - float(1);
	}
	Scorer.PlayerReplicationInfo.NetUpdateTime = Level.TimeSeconds - float(1);
	Scorer.PlayerReplicationInfo.Score += float(5);
	IncrementGoalsScored(Scorer.PlayerReplicationInfo);
	Scorer.AwardAdrenaline(ADR_Goal);
	numtouch = 0.0000000;
	i = 0;
	J0x382:

	// End:0x3D1 [Loop If]
	if(i < theFlag.Assists.Length)
	{
		// End:0x3C7
		if(theFlag.Assists[i] != none)
		{
			numtouch = numtouch + 1.0000000;
		}
		i++;
		// [Loop Continue]
		goto J0x382;
	}
	ppp = FClamp(20.0000000 / numtouch, 1.0000000, 5.0000000);
	i = 0;
	J0x3F6:

	// End:0x49D [Loop If]
	if(i < theFlag.Assists.Length)
	{
		// End:0x493
		if(theFlag.Assists[i] != none)
		{
			ScoreEvent(theFlag.Assists[i].PlayerReplicationInfo, ppp, "flag_cap_assist");
			theFlag.Assists[i].PlayerReplicationInfo.Score += float(int(ppp));
		}
		i++;
		// [Loop Continue]
		goto J0x3F6;
	}
	Scorer.PlayerReplicationInfo.Team.Score += 1.0000000;
	Scorer.PlayerReplicationInfo.Team.NetUpdateTime = Level.TimeSeconds - float(1);
	ScoreEvent(Scorer.PlayerReplicationInfo, 5.0000000, "flag_cap_final");
	TeamScoreEvent(Scorer.PlayerReplicationInfo.Team.TeamIndex, 1.0000000, "flag_cap");
	GameEvent("flag_captured", "" $ string(theFlag.Team.TeamIndex), Scorer.PlayerReplicationInfo);
	BroadcastLocalizedMessage(Class'UnrealGame.CTFMessage', 0, Scorer.PlayerReplicationInfo, none, theFlag.Team);
	AnnounceScore(Scorer.PlayerReplicationInfo.Team.TeamIndex);
	CheckScore(Scorer.PlayerReplicationInfo);
	// End:0x621
	if(bOverTime)
	{
		EndGame(Scorer.PlayerReplicationInfo, "timelimit");
	}
	//return;	
}

function DiscardInventory(Pawn Other)
{
	// End:0x0D
	if(Other == none)
	{
		return;
	}
	// End:0x7B
	if((Other.PlayerReplicationInfo != none) && Other.PlayerReplicationInfo.HasFlag != none)
	{
		CTFFlag(Other.PlayerReplicationInfo.HasFlag).Drop(0.5000000 * Other.Velocity);
	}
	super(GameInfo).DiscardInventory(Other);
	//return;	
}

static function array<string> GetAllLoadHints(optional bool bThisClassOnly)
{
	local int i;
	local array<string> Hints;

	// End:0x25
	if(!bThisClassOnly || default.CTFHints.Length == 0)
	{
		Hints = super.GetAllLoadHints();
	}
	i = 0;
	J0x2C:

	// End:0x5E [Loop If]
	if(i < default.CTFHints.Length)
	{
		Hints[Hints.Length] = default.CTFHints[i];
		i++;
		// [Loop Continue]
		goto J0x2C;
	}
	return Hints;
	//return;	
}

state MatchOver
{
	function ScoreFlag(Controller Scorer, CTFFlag theFlag)
	{
		//return;		
	}
	stop;	
}

defaultproperties
{
	CTFHints[0]="You can use %BASEPATH 0% to see the path to the Red Team base and %BASEPATH 1% to see the path to the Blue Team base."
	CTFHints[1]="Firing the translocator sends out your translocator beacon.  Pressing %FIRE% again returns the beacon, while pressing %A:TFIRE% teleports you instantly to the beacon's location (if you fit)."
	CTFHints[2]="Using the translocator to teleport while carrying the flag will cause you to drop the flag."
	CTFHints[3]="Pressing %SWITCHWEAPON 10% after tossing the Translocator allows you to view from its internal camera."
	CTFHints[4]="Pressing %FIRE% while your %ALTFIRE% is still held down after teleporting with the translocator will switch you back to your previous weapon."
	bScoreTeamKills=false
	bSpawnInTeamArea=true
	bScoreVictimsTarget=true
	TeamAIType[0]=Class'UnrealGame.CTFTeamAI'
	TeamAIType[1]=Class'UnrealGame.CTFTeamAI'
	bAllowTrans=true
	bDefaultTranslocator=true
	bMustHaveMultiplePlayers=false
	ADR_Kill=2.0000000
	MapPrefix="CTF"
	BeaconName="CTF"
	GoalScore=3
	Description="Your team must score flag captures by taking the enemy flag from the enemy base and returning it to their own flag.  If the flag carrier is killed, the flag drops to the ground for anyone to pick up.  If your team's flag is taken, it must be returned (by touching it after it is dropped) before your team can score a flag capture."
}
