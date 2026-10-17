class Game_BWConflict extends xTeamGame
	transient
	config(BallisticProV55)
	hidedropdown
	cacheexempt
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

struct SafeSpawnPoints
{
	var() NavigationPoint StartSpot;
	var() array<Vector> StartLocs;
};

var int RoundCounter;
var int RoundWinner;
var int RoundTime;
var NavigationPoint StartA;
var NavigationPoint StartB;
var int RoundNum;
var() globalconfig int PreRoundDelay;
var() globalconfig int PostRoundDelay;
var() globalconfig int SpawnAreaAllowance;
var() globalconfig bool bKeepHealth;
var() globalconfig bool bKeepWeapons;
var() globalconfig bool bPurgeActors;
var() globalconfig bool bBallisticItems;
var() globalconfig bool bAmmoPacks;
var() globalconfig int RoundLimit;
var() localized string DisplayText[12];
var() localized string DescriptionText[12];
var() Vector StaticSpawnOffsets[25];
var array<SafeSpawnPoints> SafeSpawns;
var Class<DamageType> LastDT;
var int TotalMatchTime;
var globalconfig string WeapListsVar;
var globalconfig string ConfigMenuVar;

function BeginRound()
{
	local Controller P;

	P = Level.ControllerList;
	J0x14:

	// End:0x179 [Loop If]
	if(P != none)
	{
		// End:0x162
		if((P.bIsPlayer && !P.PlayerReplicationInfo.bOnlySpectator) && P.Pawn != none)
		{
			P.Pawn.bNoWeaponFiring = false;
			P.Pawn.GroundSpeed = Class'BCoreProV55.BallisticReplicationInfo'.default.PlayerGroundSpeed;
			P.Pawn.WaterSpeed = P.Pawn.default.WaterSpeed;
			P.Pawn.AirSpeed = P.Pawn.default.AirSpeed;
			P.Pawn.LadderSpeed = P.Pawn.default.LadderSpeed;
			P.Pawn.JumpZ = P.Pawn.default.JumpZ;
		}
		P = P.nextController;
		// [Loop Continue]
		goto J0x14;
	}
	GotoState('MatchInProgress');
	//return;	
}

function StartRound()
{
	local Controller C;
	local Actor A;

	GotoState('PendingRound');
	C = Level.ControllerList;
	J0x1B:

	// End:0xF8 [Loop If]
	if(C != none)
	{
		// End:0x4A
		if(PlayerController(C) != none)
		{
			PlayerController(C).ClientReset();
		}
		C.Reset();
		// End:0x87
		if(C.PlayerReplicationInfo != none)
		{
			C.PlayerReplicationInfo.bOutOfLives = false;
		}
		// End:0xE1
		if(ConflictLoadoutLRI(Class'BallisticProV55.Mut_Ballistic'.static.GetBPRI(C.PlayerReplicationInfo)) != none)
		{
			ConflictLoadoutLRI(Class'BallisticProV55.Mut_Ballistic'.static.GetBPRI(C.PlayerReplicationInfo)).ClientPurge(bPurgeActors);
		}
		C = C.nextController;
		// [Loop Continue]
		goto J0x1B;
	}
	RemainingTime = 60 * TimeLimit;
	GameReplicationInfo.RemainingTime = RemainingTime;
	GameReplicationInfo.RemainingMinute = RemainingTime;
	GameReplicationInfo.NetUpdateTime = Level.TimeSeconds - float(1);
	// End:0x1E3
	foreach AllActors(Class'Engine.Actor', A)
	{
		// End:0x1E2
		if(!A.bDeleteMe && (!bPurgeActors && A.IsA('Pawn')) || (bPurgeActors && !A.IsA('Controller')) && !A.IsA('Info'))
		{
			A.Reset();
		}		
	}	
	C = Level.ControllerList;
	J0x1F8:

	// End:0x258 [Loop If]
	if(C != none)
	{
		// End:0x241
		if((C.PlayerReplicationInfo != none) && !C.PlayerReplicationInfo.bOnlySpectator)
		{
			RestartPlayer(C);
		}
		C = C.nextController;
		// [Loop Continue]
		goto J0x1F8;
	}
	//return;	
}

function StartMatch()
{
	local bool bTemp;
	local int Num;

	SortPlayerStarts();
	GotoState('PendingRound');
	// End:0x34
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
	J0x6A:

	// End:0x9B [Loop If]
	if((NeedPlayers()) && Num < 16)
	{
		// End:0x91
		if(AddBot())
		{
			RemainingBots--;
		}
		Num++;
		// [Loop Continue]
		goto J0x6A;
	}
	bMustJoinBeforeStart = bTemp;
	Log("START MATCH");
	//return;	
}

function ResetLevel()
{
	local Actor A;

	// End:0x66
	foreach AllActors(Class'Engine.Actor', A)
	{
		// End:0x65
		if((!A.IsA('Controller') && !A.IsA('ReplicationInfo')) && !A.IsA('Info'))
		{
			A.Reset();
		}		
	}	
	//return;	
}

function ScoreKill(Controller Killer, Controller Other)
{
	local PlayerReplicationInfo OtherPRI;

	OtherPRI = Other.PlayerReplicationInfo;
	// End:0x30
	if(OtherPRI != none)
	{
		OtherPRI.bOutOfLives = true;
	}
	super(TeamGame).ScoreKill(Killer, Other);
	CheckScore(Killer.PlayerReplicationInfo);
	//return;	
}

function Logout(Controller Exiting)
{
	super(DeathMatch).Logout(Exiting);
	CheckMaxLives(none);
	//return;	
}

function bool CheckMaxLives(PlayerReplicationInfo Scorer)
{
	local Controller C;
	local PlayerReplicationInfo Living;
	local bool bNoneLeft;

	// End:0x2C
	if((Scorer != none) && !Scorer.bOutOfLives)
	{
		Living = Scorer;
	}
	bNoneLeft = true;
	C = Level.ControllerList;
	J0x48:

	// End:0x141 [Loop If]
	if(C != none)
	{
		// End:0x12A
		if((((C.PlayerReplicationInfo != none) && C.bIsPlayer) && !C.PlayerReplicationInfo.bOutOfLives) && !C.PlayerReplicationInfo.bOnlySpectator)
		{
			// End:0xDB
			if(Living == none)
			{
				Living = C.PlayerReplicationInfo;				
			}
			else
			{
				// End:0x12A
				if((C.PlayerReplicationInfo != Living) && C.PlayerReplicationInfo.Team != Living.Team)
				{
					bNoneLeft = false;
					// [Explicit Break]
					goto J0x141;
				}
			}
		}
		C = C.nextController;
		// [Loop Continue]
		goto J0x48;
	}
	J0x141:

	// End:0x26C
	if(bNoneLeft)
	{
		// End:0x175
		if(Living != none)
		{
			RoundWinner = Living.Team.TeamIndex;			
		}
		else
		{
			RoundWinner = -1;
		}
		// End:0x263
		if(IsInState('MatchInProgress') && RoundWinner > -1)
		{
			GameReplicationInfo.Teams[RoundWinner].Score += float(1);
			GameReplicationInfo.Teams[RoundWinner].NetUpdateTime = Level.TimeSeconds - float(1);
			TeamScoreEvent(RoundWinner, 1.0000000, "tdm_frag");
			// End:0x259
			if((RoundLimit > 0) && GameReplicationInfo.Teams[RoundWinner].Score >= float(RoundLimit))
			{
				EndGame(Scorer, "RoundLimit");				
			}
			else
			{
				GotoState('RoundEnded');
			}			
		}
		else
		{
			GotoState('RoundEnded');
		}
		return true;
	}
	return false;
	//return;	
}

function CheckScore(PlayerReplicationInfo Scorer)
{
	// End:0x0D
	if(IsInState('MatchOver'))
	{
		return;
	}
	// End:0x1A
	if(IsInState('RoundEnded'))
	{
		return;
	}
	// End:0x2A
	if(CheckMaxLives(Scorer))
	{
		return;
	}
	super(TeamGame).CheckScore(Scorer);
	//return;	
}

function EndGame(PlayerReplicationInfo Winner, string Reason)
{
	// End:0xAC
	if((((((Reason ~= "triggered") || Reason ~= "LastMan") || Reason ~= "TimeLimit") || Reason ~= "FragLimit") || Reason ~= "TeamScoreLimit") || Reason ~= "RoundLimit")
	{
		super(GameInfo).EndGame(Winner, Reason);
		// End:0xAC
		if(bGameEnded)
		{
			GotoState('MatchOver');
		}
	}
	//return;	
}

function SortPlayerStarts()
{
	local NavigationPoint N, P, BestStart, Other;
	local float D, dist;

	N = Level.NavigationPointList;
	J0x14:

	// End:0x135 [Loop If]
	if(N != none)
	{
		// End:0x32
		if(PlayerStart(N) == none)
		{			
		}
		else
		{
			P = Level.NavigationPointList;
			J0x46:

			// End:0x11E [Loop If]
			if(P != none)
			{
				// End:0x97
				if(((PlayerStart(P) == none) || P == N) || (P == BestStart) && N == Other)
				{					
				}
				else
				{
					D = VSize(N.Location - P.Location);
					// End:0x107
					if((dist == float(0)) || (D - dist) > float(Rand(SpawnAreaAllowance)))
					{
						dist = D;
						BestStart = N;
						Other = P;
					}
				}
				P = P.nextNavigationPoint;
				// [Loop Continue]
				goto J0x46;
			}
		}
		N = N.nextNavigationPoint;
		// [Loop Continue]
		goto J0x14;
	}
	// End:0x15A
	if(FRand() > 0.5000000)
	{
		StartA = BestStart;
		StartB = Other;		
	}
	else
	{
		StartA = Other;
		StartB = BestStart;
	}
	//return;	
}

function byte SpawnLocQuality(Controller P, Vector loc, out Vector HitLoc, out Vector HitNorm)
{
	local Actor t;

	bTraceWater = true;
	t = Trace(HitLoc, HitNorm, loc - vect(0.0000000, 0.0000000, 20.0000000), loc + vect(0.0000000, 0.0000000, 50.0000000), true, vect(20.0000000, 20.0000000, 0.0000000));
	bTraceWater = false;
	// End:0x117
	if(t != none)
	{
		// End:0x77
		if(FluidSurfaceInfo(t) != none)
		{
			return 2;
		}
		// End:0xD8
		if(PhysicsVolume(t) != none)
		{
			// End:0xA1
			if(PhysicsVolume(t).bPainCausing)
			{
				return 3;
			}
			// End:0xBB
			if(PhysicsVolume(t).bDestructive)
			{
				return 5;
			}
			// End:0xD5
			if(PhysicsVolume(t).bWaterVolume)
			{
				return 2;
			}
			return 1;
		}
		// End:0x114
		if((Normal(HitLoc - (loc + vect(0.0000000, 0.0000000, 50.0000000))) Dot HitNorm) > 0.0000000)
		{
			HitNorm *= float(-1);
		}
		return 6;
	}
	bTraceWater = true;
	t = Trace(HitLoc, HitNorm, loc - vect(0.0000000, 0.0000000, 384.0000000), loc, false, vect(25.0000000, 25.0000000, 44.0000000));
	bTraceWater = false;
	// End:0x16F
	if(t == none)
	{
		return 4;
	}
	// End:0x1CD
	if(PhysicsVolume(t) != none)
	{
		// End:0x199
		if(PhysicsVolume(t).bPainCausing)
		{
			return 3;
		}
		// End:0x1B3
		if(PhysicsVolume(t).bDestructive)
		{
			return 5;
		}
		// End:0x1CD
		if(PhysicsVolume(t).bWaterVolume)
		{
			return 1;
		}
	}
	// End:0x1FA
	if((Normal(HitLoc - loc) Dot HitNorm) > 0.0000000)
	{
		HitNorm *= float(-1);
	}
	return 0;
	//return;	
}

function Vector GetStartLocation(Controller P, NavigationPoint StartSpot)
{
	local Vector Start, End, HitLoc, HitNorm, BestLoc, TestLoc,
		TestNorm;

	local Actor t;
	local Rotator R;
	local int i, j, k, BestLocScore, TestScore;

	Start = StartSpot.Location;
	BestLoc = StartSpot.Location;
	BestLocScore = int(SpawnLocQuality(P, StartSpot.Location, TestLoc, TestNorm));
	i = 0;
	J0x5A:

	// End:0x1A4 [Loop If]
	if(i < SafeSpawns.Length)
	{
		// End:0x19A
		if(SafeSpawns[i].StartSpot == StartSpot)
		{
			k = Rand(SafeSpawns[i].StartLocs.Length);
			j = 0;
			J0xA4:

			// End:0x19A [Loop If]
			if(j < SafeSpawns[i].StartLocs.Length)
			{
				t = Trace(HitLoc, HitNorm, SafeSpawns[i].StartLocs[j] - vect(0.0000000, 0.0000000, 20.0000000), SafeSpawns[i].StartLocs[j] + vect(0.0000000, 0.0000000, 50.0000000), true, vect(20.0000000, 20.0000000, 0.0000000));
				// End:0x160
				if((t == none) || t.bWorldGeometry)
				{
					return SafeSpawns[i].StartLocs[j];
				}
				k = Class'BCoreProV55.BUtil'.static.Loop(k, 1, SafeSpawns[i].StartLocs.Length - 1, 0);
				j++;
				// [Loop Continue]
				goto J0xA4;
			}
		}
		i++;
		// [Loop Continue]
		goto J0x5A;
	}
	j = Rand(25);
	i = 0;
	J0x1B5:

	// End:0x34B [Loop If]
	if(i < 25)
	{
		End = StartSpot.Location + StaticSpawnOffsets[j];
		t = Trace(HitLoc, HitNorm, End, Start, false, vect(8.0000000, 8.0000000, 8.0000000));
		// End:0x23D
		if(t == none)
		{
			TestScore = int(SpawnLocQuality(P, End, TestLoc, TestNorm));			
		}
		else
		{
			// End:0x26A
			if((Normal(End - Start) Dot HitNorm) > 0.0000000)
			{
				HitNorm *= float(-1);
			}
			End = HitLoc + (HitNorm * float(30));
			TestScore = int(SpawnLocQuality(P, End, TestLoc, TestNorm));
		}
		// End:0x2EA
		if(TestScore == 6)
		{
			End = TestLoc + (TestNorm * float(30));
			TestScore = int(SpawnLocQuality(P, End, TestLoc, TestNorm));
		}
		// End:0x2FE
		if(TestScore == 0)
		{
			return End;			
		}
		else
		{
			// End:0x323
			if(TestScore < BestLocScore)
			{
				BestLocScore = TestScore;
				BestLoc = End;
			}
		}
		j = Class'BCoreProV55.BUtil'.static.Loop(j, 1, 24, 0);
		i++;
		// [Loop Continue]
		goto J0x1B5;
	}
	// End:0x518
	if(TestScore >= 6)
	{
		End = Start + vect(0.0000000, 0.0000000, 100.0000000);
		t = Trace(HitLoc, HitNorm, End, Start, false, vect(25.0000000, 25.0000000, 44.0000000));
		// End:0x3B2
		if(t == none)
		{
			HitLoc = End;
		}
		Start = HitLoc;
		i = 0;
		J0x3C4:

		// End:0x518 [Loop If]
		if(i < 8)
		{
			R.Yaw = Rand(65536);
			End = Start + (Vector(R) * float(128 + Rand(256)));
			t = Trace(HitLoc, HitNorm, End, Start, false);
			// End:0x453
			if(t == none)
			{
				TestScore = int(SpawnLocQuality(P, End, TestLoc, TestNorm));				
			}
			else
			{
				End = HitLoc - (Vector(R) * float(30));
				TestScore = int(SpawnLocQuality(P, End, TestLoc, TestNorm));
			}
			// End:0x4D5
			if(TestScore == 6)
			{
				End = TestLoc + (TestNorm * float(30));
				TestScore = int(SpawnLocQuality(P, End, TestLoc, TestNorm));
			}
			// End:0x4E9
			if(TestScore == 0)
			{
				return End;
				// [Explicit Continue]
				goto J0x50E;
			}
			// End:0x50E
			if(TestScore < BestLocScore)
			{
				BestLocScore = TestScore;
				BestLoc = End;
			}
			J0x50E:

			i++;
			// [Loop Continue]
			goto J0x3C4;
		}
	}
	return BestLoc;
	//return;	
}

event InitGame(string Options, out string Error)
{
	super(TeamGame).InitGame(Options, Error);
	AddMutator("BallisticProV55.Mut_ConflictLoadout", true);
	bForceRespawn = true;
	//return;	
}

function bool IsNearStartSpot(PlayerReplicationInfo PRI)
{
	// End:0x3F
	if((Controller(PRI.Owner) == none) || Controller(PRI.Owner).Pawn == none)
	{
		return false;
	}
	// End:0xA3
	if((PRI.Team.TeamIndex == 0) && VSize(Controller(PRI.Owner).Pawn.Location - StartA.Location) < float(512))
	{
		return true;
	}
	// End:0x107
	if((PRI.Team.TeamIndex == 1) && VSize(Controller(PRI.Owner).Pawn.Location - StartB.Location) < float(512))
	{
		return true;
	}
	return false;
	//return;	
}

function RestartPlayer(Controller aPlayer)
{
	local NavigationPoint StartSpot;
	local int TeamNum, i, j;
	local Class<Pawn> DefaultPlayerClass;
	local Vehicle V, Best;
	local Vector ViewDir;
	local float BestDist, dist;
	local Vector StartLocation;
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
	// End:0x11E
	if((bMustJoinBeforeStart && UnrealPlayer(aPlayer) != none) && UnrealPlayer(aPlayer).bLatecomer)
	{
		return;
	}
	// End:0x13B
	if(aPlayer.PlayerReplicationInfo.bOutOfLives)
	{
		return;
	}
	// End:0x16D
	if(aPlayer.IsA('Bot') && TooManyBots(aPlayer))
	{
		aPlayer.Destroy();
		return;
	}
	// End:0x1AE
	if((bRestartLevel && int(Level.NetMode) != int(NM_DedicatedServer)) && int(Level.NetMode) != int(NM_ListenServer))
	{
		return;
	}
	// End:0x1EC
	if((aPlayer.PlayerReplicationInfo == none) || aPlayer.PlayerReplicationInfo.Team == none)
	{
		TeamNum = 255;		
	}
	else
	{
		TeamNum = aPlayer.PlayerReplicationInfo.Team.TeamIndex;
	}
	StartSpot = FindPlayerStart(aPlayer, byte(TeamNum));
	// End:0x255
	if(StartSpot == none)
	{
		Log(" Player start not found!!!");
		return;
	}
	StartLocation = GetStartLocation(aPlayer, StartSpot);
	// End:0x2B6
	if((aPlayer.PreviousPawnClass != none) && aPlayer.PawnClass != aPlayer.PreviousPawnClass)
	{
		BaseMutator.PlayerChangedClass(aPlayer);
	}
	// End:0x2FF
	if(aPlayer.PawnClass != none)
	{
		aPlayer.Pawn = Spawn(aPlayer.PawnClass,,, StartLocation, StartSpot.Rotation);
	}
	// End:0x350
	if(aPlayer.Pawn == none)
	{
		DefaultPlayerClass = GetDefaultPlayerClass(aPlayer);
		aPlayer.Pawn = Spawn(DefaultPlayerClass,,, StartLocation, StartSpot.Rotation);
	}
	// End:0x401
	if(aPlayer.Pawn == none)
	{
		Log((((("Couldn't spawn player '" $ aPlayer.GetHumanReadableName()) $ "' of type ") $ string(aPlayer.PawnClass)) $ " at ") $ string(StartSpot));
		aPlayer.GotoState('Dead');
		// End:0x3FF
		if(PlayerController(aPlayer) != none)
		{
			PlayerController(aPlayer).ClientGotoState('Dead', 'Begin');
		}
		return;
	}
	i = 0;
	J0x408:

	// End:0x4D1 [Loop If]
	if(i < SafeSpawns.Length)
	{
		// End:0x4C7
		if(SafeSpawns[i].StartSpot == StartSpot)
		{
			j = 0;
			J0x439:

			// End:0x481 [Loop If]
			if(j < SafeSpawns[i].StartLocs.Length)
			{
				// End:0x477
				if(SafeSpawns[i].StartLocs[j] == StartLocation)
				{
					// [Explicit Break]
					goto J0x481;
				}
				j++;
				// [Loop Continue]
				goto J0x439;
			}
			J0x481:

			// End:0x4C4
			if(j >= SafeSpawns[i].StartLocs.Length)
			{
				SafeSpawns[i].StartLocs[SafeSpawns[i].StartLocs.Length] = StartLocation;
			}
			// [Explicit Break]
			goto J0x4D1;
		}
		i++;
		// [Loop Continue]
		goto J0x408;
	}
	J0x4D1:

	// End:0x53B
	if(i >= SafeSpawns.Length)
	{
		SafeSpawns.Length = SafeSpawns.Length + 1;
		SafeSpawns[SafeSpawns.Length - 1].StartSpot = StartSpot;
		SafeSpawns[SafeSpawns.Length - 1].StartLocs[SafeSpawns[SafeSpawns.Length - 1].StartLocs.Length] = StartLocation;
	}
	// End:0x564
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
	// End:0x835
	if((bAllowVehicles && int(Level.NetMode) == int(NM_Standalone)) && PlayerController(aPlayer) != none)
	{
		BestDist = 2000.0000000;
		ViewDir = Vector(aPlayer.Pawn.Rotation);
		V = VehicleList;
		J0x718:

		// End:0x807 [Loop If]
		if(V != none)
		{
			// End:0x7F0
			if(V.bTeamLocked && aPlayer.GetTeamNum() == int(V.Team))
			{
				dist = VSize(V.Location - aPlayer.Pawn.Location);
				// End:0x7CB
				if((ViewDir Dot (V.Location - aPlayer.Pawn.Location)) < float(0))
				{
					dist *= float(2);
				}
				// End:0x7F0
				if(dist < BestDist)
				{
					Best = V;
					BestDist = dist;
				}
			}
			V = V.NextVehicle;
			// [Loop Continue]
			goto J0x718;
		}
		// End:0x835
		if(Best != none)
		{
			Best.PlayerStartTime = Level.TimeSeconds + float(8);
		}
	}
	// End:0x8EB
	if(IsInState('PendingRound'))
	{
		aPlayer.Pawn.bNoWeaponFiring = true;
		aPlayer.Pawn.GroundSpeed = 0.0000000;
		aPlayer.Pawn.WaterSpeed = 0.0000000;
		aPlayer.Pawn.AirSpeed = 0.0000000;
		aPlayer.Pawn.LadderSpeed = 0.0000000;
		aPlayer.Pawn.JumpZ = 0.0000000;
	}
	// End:0x926
	if(xPawn(aPlayer.Pawn) != none)
	{
		xPawn(aPlayer.Pawn).RagdollLifeSpan = 600.0000000;
	}
	//return;	
}

function NavigationPoint FindPlayerStart(Controller Player, optional byte InTeam, optional string incomingName)
{
	local NavigationPoint N, BestStart;
	local Teleporter Tel;
	local float BestRating, NewRating;
	local byte Team;

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
	// End:0xF6
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
	}
	else
	{
		Team = InTeam;
	}
	// End:0x11C
	if(int(Team) == 0)
	{
		BestStart = StartA;		
	}
	else
	{
		BestStart = StartB;
	}
	// End:0x22F
	if((BestStart == none) || ((PlayerStart(BestStart) == none) && Player != none) && Player.bIsPlayer)
	{
		Log("Warning - PATHS NOT DEFINED or NO PLAYERSTART with positive rating");
		BestRating = -100000000.0000000;
		// End:0x22E
		foreach AllActors(Class'Engine.NavigationPoint', N)
		{
			NewRating = RatePlayerStart(N, 0, Player);
			// End:0x1F9
			if(InventorySpot(N) != none)
			{
				NewRating -= float(50);
			}
			NewRating += (float(20) * FRand());
			// End:0x22D
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

static function FillPlayInfo(PlayInfo Pi)
{
	super(TeamGame).FillPlayInfo(Pi);
	Pi.AddSetting(default.GameGroup, "RoundLimit", GetDisplayText("RoundLimit"), 50, 1, "Text", "3;0:999");
	Pi.AddSetting(default.GameGroup, "PreRoundDelay", GetDisplayText("PreRoundDelay"), 50, 1, "Text", "2;0:60",,, true);
	Pi.AddSetting(default.GameGroup, "PostRoundDelay", GetDisplayText("PostRoundDelay"), 50, 1, "Text", "2;0:60",,, true);
	Pi.AddSetting(default.GameGroup, "SpawnAreaAllowance", GetDisplayText("SpawnAreaAllowance"), 50, 3, "Text", "2;0:32768",,, true);
	Pi.AddSetting(default.RulesGroup, "bEvolutionMode", GetDisplayText("bEvolutionMode"), 50, 1, "Check");
	Pi.AddSetting(default.RulesGroup, "bBallisticItems", GetDisplayText("bBallisticItems"), 50, 1, "Check");
	Pi.AddSetting(default.RulesGroup, "bAmmoPacks", GetDisplayText("bAmmoPacks"), 50, 1, "Check");
	Pi.AddSetting(default.RulesGroup, "bKeepHealth", GetDisplayText("bKeepHealth"), 50, 1, "Check");
	Pi.AddSetting(default.RulesGroup, "bKeepWeapons", GetDisplayText("bKeepWeapons"), 50, 1, "Check");
	Pi.AddSetting(default.RulesGroup, "bPurgeActors", GetDisplayText("bPurgeActors"), 50, 1, "Check",,,, true);
	Pi.AddSetting(default.RulesGroup, "WeapListsVar", GetDisplayText("WeapListsVar"), 60, 2, "Custom", ";;BallisticProV55.BallisticConflictWeaponMenuPro");
	Pi.AddSetting(default.GameGroup, "ConfigMenuVar", GetDisplayText("ConfigMenuVar"), 60, 2, "Custom", ";;BallisticProV55.ConfigMenu_Rules");
	//return;	
}

static event string GetDisplayText(string PropName)
{
	switch(PropName)
	{
		// End:0x21
		case "PreRoundDelay":
			return default.DisplayText[0];
		// End:0x3C
		case "PostRoundDelay":
			return default.DisplayText[1];
		// End:0x5C
		case "SpawnAreaAllowance":
			return default.DisplayText[2];
		// End:0x75
		case "bKeepHealth":
			return default.DisplayText[3];
		// End:0x8F
		case "bKeepWeapons":
			return default.DisplayText[4];
		// End:0xA9
		case "bPurgeActors":
			return default.DisplayText[5];
		// End:0xC6
		case "bBallisticItems":
			return default.DisplayText[6];
		// End:0xDE
		case "bAmmoPacks":
			return default.DisplayText[7];
		// End:0xFA
		case "bEvolutionMode":
			return default.DisplayText[8];
		// End:0x114
		case "WeapListsVar":
			return default.DisplayText[9];
		// End:0x12F
		case "ConfigMenuVar":
			return default.DisplayText[10];
		// End:0x147
		case "RoundLimit":
			return default.DisplayText[11];
		// End:0xFFFF
		default:
			return super(DeathMatch).GetDisplayText(PropName);
			break;
	}
	//return;	
}

static event string GetDescriptionText(string PropName)
{
	switch(PropName)
	{
		// End:0x21
		case "PreRoundDelay":
			return default.DescriptionText[0];
		// End:0x3C
		case "PostRoundDelay":
			return default.DescriptionText[1];
		// End:0x5C
		case "SpawnAreaAllowance":
			return default.DescriptionText[2];
		// End:0x75
		case "bKeepHealth":
			return default.DescriptionText[3];
		// End:0x8F
		case "bKeepWeapons":
			return default.DescriptionText[4];
		// End:0xA9
		case "bPurgeActors":
			return default.DescriptionText[5];
		// End:0xC6
		case "bBallisticItems":
			return default.DescriptionText[6];
		// End:0xDE
		case "bAmmoPacks":
			return default.DescriptionText[7];
		// End:0xFA
		case "bEvolutionMode":
			return default.DescriptionText[8];
		// End:0x114
		case "WeapListsVar":
			return default.DescriptionText[9];
		// End:0x12F
		case "ConfigMenuVar":
			return default.DescriptionText[10];
		// End:0x147
		case "RoundLimit":
			return default.DescriptionText[11];
		// End:0xFFFF
		default:
			return super(TeamGame).GetDescriptionText(PropName);
			break;
	}
	//return;	
}

function InitializeBot(Bot NewBot, UnrealTeamInfo BotTeam, RosterEntry Chosen)
{
	super(DeathMatch).InitializeBot(NewBot, BotTeam, Chosen);
	NewBot.Jumpiness -= 0.5000000;
	NewBot.StrafingAbility -= 1.0000000;
	NewBot.CombatStyle -= 0.3000000;
	//return;	
}

function Bot SpawnBot(optional string botname)
{
	local Bot B;

	B = super(DeathMatch).SpawnBot(botname);
	// End:0x4A
	if((B != none) && B.PawnClass == Class'XGame.xPawn')
	{
		B.PawnClass = Class'BallisticProV55.BallisticPawn';
	}
	return B;
	//return;	
}

event PlayerController Login(string Portal, string Options, out string Error)
{
	local PlayerController PC;

	PC = super(DeathMatch).Login(Portal, Options, Error);
	// End:0x54
	if((PC != none) && PC.PawnClass == Class'XGame.xPawn')
	{
		PC.PawnClass = Class'BallisticProV55.BallisticPawn';
	}
	return PC;
	//return;	
}

state PendingRound
{
	function BeginState()
	{
		GameReplicationInfo.bStopCountDown = true;
		RoundNum++;
		RoundCounter = PreRoundDelay;
		BroadcastLocalizedMessage(Class'BallisticProV55.EliminationMessage', RoundCounter);
		//return;		
	}

	event Timer()
	{
		RoundCounter--;
		// End:0x1B
		if(RoundCounter <= 0)
		{
			BeginRound();			
		}
		else
		{
			BroadcastLocalizedMessage(Class'BallisticProV55.EliminationMessage', RoundCounter);
		}
		//return;		
	}
	stop;	
}

state RoundEnded
{
	function BeginState()
	{
		local Controller P;

		GameReplicationInfo.bStopCountDown = true;
		GameReplicationInfo.RemainingMinute = RemainingTime;
		SortPlayerStarts();
		RoundCounter = PostRoundDelay;
		// End:0x55
		if(RoundWinner == -1)
		{
			BroadcastLocalizedMessage(Class'BallisticProV55.EliminationMessage', 95);			
		}
		else
		{
			// End:0x74
			if(RoundWinner == -2)
			{
				BroadcastLocalizedMessage(Class'BallisticProV55.EliminationMessage', 96);				
			}
			else
			{
				// End:0x203
				if(RoundWinner == 0)
				{
					// End:0xC6
					if(GameReplicationInfo.Teams[0].Score == GameReplicationInfo.Teams[1].Score)
					{
						BroadcastLocalizedMessage(Class'BallisticProV55.EliminationMessage', 103);						
					}
					else
					{
						// End:0x113
						if(GameReplicationInfo.Teams[0].Score >= (GameReplicationInfo.Teams[1].Score + float(5)))
						{
							BroadcastLocalizedMessage(Class'BallisticProV55.EliminationMessage', 100);							
						}
						else
						{
							// End:0x160
							if(GameReplicationInfo.Teams[0].Score <= (GameReplicationInfo.Teams[1].Score - float(5)))
							{
								BroadcastLocalizedMessage(Class'BallisticProV55.EliminationMessage', 105);								
							}
							else
							{
								// End:0x1AC
								if(GameReplicationInfo.Teams[0].Score == (GameReplicationInfo.Teams[1].Score + float(1)))
								{
									BroadcastLocalizedMessage(Class'BallisticProV55.EliminationMessage', 102);									
								}
								else
								{
									// End:0x1F3
									if(GameReplicationInfo.Teams[0].Score < GameReplicationInfo.Teams[1].Score)
									{
										BroadcastLocalizedMessage(Class'BallisticProV55.EliminationMessage', 104);										
									}
									else
									{
										BroadcastLocalizedMessage(Class'BallisticProV55.EliminationMessage', 101);
									}
								}
							}
						}
					}					
				}
				else
				{
					// End:0x38F
					if(RoundWinner == 1)
					{
						// End:0x255
						if(GameReplicationInfo.Teams[1].Score == GameReplicationInfo.Teams[0].Score)
						{
							BroadcastLocalizedMessage(Class'BallisticProV55.EliminationMessage', 113);							
						}
						else
						{
							// End:0x2A2
							if(GameReplicationInfo.Teams[1].Score >= (GameReplicationInfo.Teams[0].Score + float(5)))
							{
								BroadcastLocalizedMessage(Class'BallisticProV55.EliminationMessage', 110);								
							}
							else
							{
								// End:0x2EF
								if(GameReplicationInfo.Teams[1].Score <= (GameReplicationInfo.Teams[0].Score - float(5)))
								{
									BroadcastLocalizedMessage(Class'BallisticProV55.EliminationMessage', 115);									
								}
								else
								{
									// End:0x33B
									if(GameReplicationInfo.Teams[1].Score == (GameReplicationInfo.Teams[0].Score + float(1)))
									{
										BroadcastLocalizedMessage(Class'BallisticProV55.EliminationMessage', 112);										
									}
									else
									{
										// End:0x382
										if(GameReplicationInfo.Teams[1].Score < GameReplicationInfo.Teams[0].Score)
										{
											BroadcastLocalizedMessage(Class'BallisticProV55.EliminationMessage', 114);											
										}
										else
										{
											BroadcastLocalizedMessage(Class'BallisticProV55.EliminationMessage', 111);
										}
									}
								}
							}
						}
					}
				}
			}
		}
		P = Level.ControllerList;
		J0x3A3:

		// End:0x429 [Loop If]
		if(P != none)
		{
			// End:0x412
			if(P.bIsPlayer && !P.PlayerReplicationInfo.bOnlySpectator)
			{
				// End:0x403
				if(PlayerController(P) != none)
				{
					PlayerController(P).ClientRoundEnded();
				}
				P.RoundHasEnded();
			}
			P = P.nextController;
			// [Loop Continue]
			goto J0x3A3;
		}
		//return;		
	}

	event Timer()
	{
		RoundCounter--;
		// End:0x18
		if(RoundCounter <= 0)
		{
			StartRound();
		}
		//return;		
	}
	stop;	
}

state MatchInProgress
{
	function BeginState()
	{
		bWaitingToStartMatch = false;
		StartupStage = 5;
		PlayStartupMessage();
		StartupStage = 6;
		GameReplicationInfo.bStopCountDown = false;
		RoundTime = 0;
		//return;		
	}

	function Timer()
	{
		local Controller P;

		global.Timer();
		// End:0x1F
		if(!bFinalStartup)
		{
			bFinalStartup = true;
			PlayStartupMessage();
		}
		// End:0xBB
		if(bForceRespawn)
		{
			P = Level.ControllerList;
			J0x3C:

			// End:0xBB [Loop If]
			if(P != none)
			{
				// End:0xA4
				if(((P.Pawn == none) && P.IsA('PlayerController')) && !P.PlayerReplicationInfo.bOnlySpectator)
				{
					PlayerController(P).ServerReStartPlayer();
				}
				P = P.nextController;
				// [Loop Continue]
				goto J0x3C;
			}
		}
		// End:0xE3
		if(((NeedPlayers()) && AddBot()) && RemainingBots > 0)
		{
			RemainingBots--;
		}
		// End:0x101
		if(bOverTime)
		{
			EndGame(none, "TimeLimit");			
		}
		else
		{
			// End:0x181
			if(TimeLimit > 0)
			{
				GameReplicationInfo.bStopCountDown = false;
				RemainingTime--;
				GameReplicationInfo.RemainingTime = RemainingTime;
				// End:0x161
				if((float(RemainingTime) % float(60)) == float(0))
				{
					GameReplicationInfo.RemainingMinute = RemainingTime;
				}
				// End:0x17E
				if(RemainingTime <= 0)
				{
					RoundWinner = -2;
					GotoState('RoundEnded');
				}				
			}
			else
			{
				// End:0x1A7
				if((MaxLives > 0) && (NumPlayers + NumBots) != 1)
				{
					CheckMaxLives(none);
				}
			}
		}
		RoundTime++;
		ElapsedTime++;
		GameReplicationInfo.ElapsedTime = ElapsedTime;
		TotalMatchTime++;
		//return;		
	}
	stop;	
}

defaultproperties
{
	PreRoundDelay=4
	PostRoundDelay=5
	SpawnAreaAllowance=768
	bPurgeActors=true
	bBallisticItems=true
	bAmmoPacks=true
	DisplayText[0]="Round Start Delay"
	DisplayText[1]="Round End Delay"
	DisplayText[2]="Spawn Distance Allowance"
	DisplayText[3]="Keep Health Pickups"
	DisplayText[4]="Keep Weapon Pickups"
	DisplayText[5]="Purge After Round"
	DisplayText[6]="Ballistic Items"
	DisplayText[7]="Ammo Packs"
	DisplayText[8]="Evolution Mode"
	DisplayText[9]="Choose weapons"
	DisplayText[10]="Ballistic Weapons Config"
	DisplayText[11]="Round Limit"
	DescriptionText[0]="Time before a round begins, during which players can't move or attack."
	DescriptionText[1]="Time round continues after a team has won before going to the next round."
	DescriptionText[2]="Teams start as far apart as possible, but can start this distance closer together."
	DescriptionText[3]="Keep health and armor pickups around."
	DescriptionText[4]="Keep weapons and ammo pickups"
	DescriptionText[5]="Clean out all projectiles, bombs and other actors between rounds."
	DescriptionText[6]="Replace health, armor, etc with Ballistic style items."
	DescriptionText[7]="Generic ammo packs are placed instead of normal weapon and ammo pickups"
	DescriptionText[8]="Use Evolution Loadout system which gives access to weapons depending on the skill level of players."
	DescriptionText[9]="Select the weapons that you want to be available to each team."
	DescriptionText[10]="Access the Ballistic Weapons config menu."
	DescriptionText[11]="Set how many rounds can be played before match ends."
	StaticSpawnOffsets[0]=(X=0.0000000,Y=60.0000000,Z=0.0000000)
	StaticSpawnOffsets[1]=(X=-60.0000000,Y=60.0000000,Z=0.0000000)
	StaticSpawnOffsets[2]=(X=-60.0000000,Y=0.0000000,Z=0.0000000)
	StaticSpawnOffsets[3]=(X=-60.0000000,Y=-60.0000000,Z=0.0000000)
	StaticSpawnOffsets[4]=(X=0.0000000,Y=-60.0000000,Z=0.0000000)
	StaticSpawnOffsets[5]=(X=60.0000000,Y=-60.0000000,Z=0.0000000)
	StaticSpawnOffsets[6]=(X=60.0000000,Y=0.0000000,Z=0.0000000)
	StaticSpawnOffsets[7]=(X=60.0000000,Y=60.0000000,Z=0.0000000)
	StaticSpawnOffsets[9]=(X=120.0000000,Y=0.0000000,Z=0.0000000)
	StaticSpawnOffsets[10]=(X=120.0000000,Y=60.0000000,Z=0.0000000)
	StaticSpawnOffsets[11]=(X=120.0000000,Y=120.0000000,Z=0.0000000)
	StaticSpawnOffsets[12]=(X=60.0000000,Y=120.0000000,Z=0.0000000)
	StaticSpawnOffsets[13]=(X=0.0000000,Y=120.0000000,Z=0.0000000)
	StaticSpawnOffsets[14]=(X=60.0000000,Y=120.0000000,Z=0.0000000)
	StaticSpawnOffsets[15]=(X=-120.0000000,Y=120.0000000,Z=0.0000000)
	StaticSpawnOffsets[16]=(X=-120.0000000,Y=60.0000000,Z=0.0000000)
	StaticSpawnOffsets[17]=(X=-120.0000000,Y=0.0000000,Z=0.0000000)
	StaticSpawnOffsets[18]=(X=-120.0000000,Y=-60.0000000,Z=0.0000000)
	StaticSpawnOffsets[19]=(X=-120.0000000,Y=-120.0000000,Z=0.0000000)
	StaticSpawnOffsets[20]=(X=-60.0000000,Y=-120.0000000,Z=0.0000000)
	StaticSpawnOffsets[21]=(X=0.0000000,Y=-120.0000000,Z=0.0000000)
	StaticSpawnOffsets[22]=(X=60.0000000,Y=-120.0000000,Z=0.0000000)
	StaticSpawnOffsets[23]=(X=120.0000000,Y=-120.0000000,Z=0.0000000)
	StaticSpawnOffsets[24]=(X=120.0000000,Y=-60.0000000,Z=0.0000000)
	bScoreTeamKills=false
	bAlwaysShowLoginMenu=true
	DefaultPlayerClassName="BallisticProV55.BallisticPawn"
	PlayerControllerClassName="BallisticProV55.BallisticPlayer"
	GameName="Ballistic Conflict"
	Description="Rival teams prepare for battle and must eliminate the entire enemy team to score!||A round based Ballistic Weapons game where teams start on opposite sides of the map and players have a chance to choose their starting loadout. Dead players don't respawn until the next round. When one team has been completely eliminated the round ends and teams are reset to a starting location.||www.runestorm.com"
	ScreenShotName="BW_Core_WeaponTex.ui.Conflict-Sequence"
	DecoTextName="BallisticProV55.Game_BWConflict"
	Acronym="BWCP"
}
