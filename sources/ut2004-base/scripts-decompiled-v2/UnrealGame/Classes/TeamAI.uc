class TeamAI extends Info
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var UnrealTeamInfo Team;
var UnrealTeamInfo EnemyTeam;
var int NumSupportingPlayer;
var GameObjective Objectives;
var GameObjective PickedObjective;
var SquadAI Squads;
var SquadAI AttackSquad;
var SquadAI FreelanceSquad;
var Class<SquadAI> SquadType;
var int OrderOffset;
var name OrderList[8];
var Pickup SuperPickups[16];
var int NumSuperPickups;

function PostBeginPlay()
{
	super(Actor).PostBeginPlay();
	SetTimer(5.0000000, true);
	//return;	
}

function Timer()
{
	ReAssessStrategy();
	//return;	
}

function CriticalObjectiveWarning(GameObjective G, Pawn NewEnemy)
{
	//return;	
}

function CallForBall(Pawn Recipient)
{
	//return;	
}

function bool SuperPickupAvailable(Bot B)
{
	local int i;
	local Pickup P;

	// End:0x56
	if(NumSuperPickups == 0)
	{
		// End:0x55
		foreach DynamicActors(Class'Engine.Pickup', P)
		{
			// End:0x54
			if(P.IsSuperItem())
			{
				SuperPickups[NumSuperPickups] = P;
				NumSuperPickups++;
				// End:0x54
				if(NumSuperPickups == 16)
				{
					// End:0x55
					break;
				}
			}			
		}		
	}
	// End:0x6E
	if(NumSuperPickups <= 0)
	{
		NumSuperPickups = -1;
		return false;
	}
	i = 0;
	J0x75:

	// End:0xDF [Loop If]
	if(i < NumSuperPickups)
	{
		// End:0xD5
		if(((SuperPickups[i] != none) && SuperPickups[i].ReadyToPickup(0.0000000)) && B.SuperPickupNotSpokenFor(SuperPickups[i]))
		{
			return true;
		}
		i++;
		// [Loop Continue]
		goto J0x75;
	}
	// End:0xED
	if(NumSuperPickups < 16)
	{
		return false;
	}
	// End:0x12A
	foreach DynamicActors(Class'Engine.Pickup', P)
	{
		// End:0x129
		if(P.IsSuperItem())
		{
			// End:0x129
			if(P.ReadyToPickup(2.0000000))
			{				
				return true;
			}
		}		
	}	
	return false;
	//return;	
}

function Reset()
{
	super(Actor).Reset();
	PickedObjective = none;
	//return;	
}

function ClearEnemies()
{
	local SquadAI S;
	local int i;
	local Bot M;

	Reset();
	S = Squads;
	J0x11:

	// End:0xA4 [Loop If]
	if(S != none)
	{
		i = 0;
		J0x23:

		// End:0x48 [Loop If]
		if(i < 8)
		{
			S.Reset();
			i++;
			// [Loop Continue]
			goto J0x23;
		}
		M = S.SquadMembers;
		J0x5C:

		// End:0x8D [Loop If]
		if(M != none)
		{
			M.Reset();
			M = M.NextSquadMember;
			// [Loop Continue]
			goto J0x5C;
		}
		S = S.NextSquad;
		// [Loop Continue]
		goto J0x11;
	}
	//return;	
}

function SquadAI GetSquadLedBy(Controller C)
{
	local SquadAI S;

	S = Squads;
	J0x0B:

	// End:0x4B [Loop If]
	if(S != none)
	{
		// End:0x34
		if(S.SquadLeader == C)
		{
			return S;
		}
		S = S.NextSquad;
		// [Loop Continue]
		goto J0x0B;
	}
	return none;
	//return;	
}

function ReAssessStrategy()
{
	local GameObjective O;
	local int PlusDiff, MinusDiff;

	// End:0x0D
	if(FreelanceSquad == none)
	{
		return;
	}
	// End:0x66
	if(Level.Game.TimeLimit > 0)
	{
		PlusDiff = 0;
		MinusDiff = 2;
		// End:0x63
		if(DeathMatch(Level.Game).RemainingTime < 180)
		{
			MinusDiff = 0;
		}		
	}
	else
	{
		PlusDiff = 2;
		MinusDiff = 2;
	}
	FreelanceSquad.bFreelanceAttack = false;
	FreelanceSquad.bFreelanceDefend = false;
	// End:0xE2
	if(Team.Score > (EnemyTeam.Score + float(PlusDiff)))
	{
		FreelanceSquad.bFreelanceDefend = true;
		O = GetLeastDefendedObjective();		
	}
	else
	{
		// End:0x131
		if(Team.Score < (EnemyTeam.Score - float(MinusDiff)))
		{
			FreelanceSquad.bFreelanceAttack = true;
			O = GetPriorityAttackObjectiveFor(FreelanceSquad);			
		}
		else
		{
			O = GetPriorityFreelanceObjective();
		}
	}
	// End:0x177
	if((O != none) && O != FreelanceSquad.SquadObjective)
	{
		FreelanceSquad.SetObjective(O, true);
	}
	//return;	
}

function NotifyKilled(Controller Killer, Controller Killed, Pawn KilledPawn)
{
	local SquadAI S, Next;

	S = Squads;
	J0x0B:

	// End:0x56 [Loop If]
	if(S != none)
	{
		Next = S.NextSquad;
		S.NotifyKilled(Killer, Killed, KilledPawn);
		S = Next;
		// [Loop Continue]
		goto J0x0B;
	}
	//return;	
}

function FindNewObjectives(GameObjective DisabledObjective)
{
	local SquadAI S;

	S = Squads;
	J0x0B:

	// End:0x51 [Loop If]
	if(S != none)
	{
		// End:0x3A
		if(S.SquadObjective == DisabledObjective)
		{
			FindNewObjectiveFor(S, true);
		}
		S = S.NextSquad;
		// [Loop Continue]
		goto J0x0B;
	}
	//return;	
}

function FindNewObjectiveFor(SquadAI S, bool bForceUpdate)
{
	local GameObjective O, Temp;

	// End:0x1B
	if(PlayerController(S.SquadLeader) != none)
	{
		return;
	}
	// End:0x3C
	if(S.bFreelance)
	{
		O = GetPriorityFreelanceObjective();		
	}
	else
	{
		// End:0x66
		if(S.GetOrders() == 'Attack')
		{
			O = GetPriorityAttackObjectiveFor(S);
		}
	}
	// End:0x11F
	if(O == none)
	{
		O = GetLeastDefendedObjective();
		// End:0x11F
		if((O != none) && O.DefenseSquad != none)
		{
			// End:0xD9
			if(S.GetOrders() == 'Attack')
			{
				S.MergeWith(O.DefenseSquad);
				return;				
			}
			else
			{
				Temp = O;
				O = GetPriorityAttackObjectiveFor(S);
				// End:0x11F
				if(O == none)
				{
					S.MergeWith(Temp.DefenseSquad);
					return;
				}
			}
		}
	}
	// End:0x16A
	if((O == none) && S.bFreelance || S.GetOrders() == 'Defend')
	{
		O = GetPriorityAttackObjectiveFor(S);
	}
	S.SetObjective(O, bForceUpdate);
	//return;	
}

function RemoveSquad(SquadAI Squad)
{
	local SquadAI S;

	// End:0x25
	if(Squad == Squads)
	{
		Squads = Squads.NextSquad;
		return;
	}
	S = Squads;
	J0x30:

	// End:0x92 [Loop If]
	if(S != none)
	{
		// End:0x7B
		if(S.NextSquad == Squad)
		{
			S.NextSquad = S.NextSquad.NextSquad;
			return;
		}
		S = S.NextSquad;
		// [Loop Continue]
		goto J0x30;
	}
	//return;	
}

function bool OnThisTeam(Pawn Other)
{
	// End:0x33
	if(Other.PlayerReplicationInfo != none)
	{
		return Other.PlayerReplicationInfo.Team == Team;
	}
	// End:0x69
	if(Vehicle(Other) != none)
	{
		return int(Vehicle(Other).Team) == Team.TeamIndex;
	}
	return false;
	//return;	
}

function SquadAI FindSquadOf(Controller C)
{
	local SquadAI S;

	// End:0x24
	if(Bot(C) != none)
	{
		return Bot(C).Squad;
	}
	S = Squads;
	J0x2F:

	// End:0x6F [Loop If]
	if(S != none)
	{
		// End:0x58
		if(S.SquadLeader == C)
		{
			return S;
		}
		S = S.NextSquad;
		// [Loop Continue]
		goto J0x2F;
	}
	return none;
	//return;	
}

function bool FriendlyToward(Pawn Other)
{
	return OnThisTeam(Other);
	//return;	
}

function SetObjectiveLists()
{
	local GameObjective O;

	// End:0x31
	foreach AllActors(Class'UnrealGame.GameObjective', O)
	{
		// End:0x30
		if(O.bFirstObjective)
		{
			Objectives = O;
			// End:0x31
			break;
		}		
	}	
	//return;	
}

function SquadAI FindHumanSquad()
{
	local SquadAI S;

	S = Squads;
	J0x0B:

	// End:0x50 [Loop If]
	if(S != none)
	{
		// End:0x39
		if(S.SquadLeader.IsA('PlayerController'))
		{
			return S;
		}
		S = S.NextSquad;
		// [Loop Continue]
		goto J0x0B;
	}
	//return;	
}

function SquadAI AddHumanSquad()
{
	local SquadAI S;
	local PlayerController P;

	S = FindHumanSquad();
	// End:0x1D
	if(S != none)
	{
		return S;
	}
	// End:0x7C
	foreach __NFUN_325__(Class'Engine.PlayerController', P)
	{
		// End:0x7B
		if((P.PlayerReplicationInfo.Team == Team) && !P.PlayerReplicationInfo.bOnlySpectator)
		{			
			return AddSquadWithLeader(P, none);
		}		
	}	
	//return;	
}

function PutBotOnSquadLedBy(Controller C, Bot B)
{
	local SquadAI S;

	S = Squads;
	J0x0B:

	// End:0x48 [Loop If]
	if(S != none)
	{
		// End:0x31
		if(S.SquadLeader == C)
		{
			// [Explicit Break]
			goto J0x48;
		}
		S = S.NextSquad;
		// [Loop Continue]
		goto J0x0B;
	}
	J0x48:

	// End:0x77
	if((S == none) && PlayerController(C) != none)
	{
		S = AddSquadWithLeader(C, none);
	}
	// End:0x96
	if(S != none)
	{
		S.AddBot(B);
	}
	//return;	
}

function SquadAI AddSquadWithLeader(Controller C, GameObjective O)
{
	local SquadAI S;

	S = Spawn(SquadType);
	S.Initialize(Team, O, C);
	S.NextSquad = Squads;
	Squads = S;
	return S;
	//return;	
}

function GameObjective GetLeastDefendedObjective()
{
	local GameObjective O, Best;

	O = Objectives;
	J0x0B:

	// End:0x105 [Loop If]
	if(O != none)
	{
		// End:0xEE
		if(((!O.bDisabled && O.bActive) && int(O.DefenderTeamIndex) == Team.TeamIndex) && ((Best == none) || int(Best.DefensePriority) < int(O.DefensePriority)) || (int(Best.DefensePriority) == int(O.DefensePriority)) && Best.GetNumDefenders() > O.GetNumDefenders())
		{
			Best = O;
		}
		O = O.NextObjective;
		// [Loop Continue]
		goto J0x0B;
	}
	return Best;
	//return;	
}

function GameObjective GetMostDefendedObjective()
{
	local GameObjective O, Best;

	O = Objectives;
	J0x0B:

	// End:0x105 [Loop If]
	if(O != none)
	{
		// End:0xEE
		if(((!O.bDisabled && O.bActive) && int(O.DefenderTeamIndex) == Team.TeamIndex) && ((Best == none) || int(Best.DefensePriority) < int(O.DefensePriority)) || (int(Best.DefensePriority) == int(O.DefensePriority)) && Best.GetNumDefenders() < O.GetNumDefenders())
		{
			Best = O;
		}
		O = O.NextObjective;
		// [Loop Continue]
		goto J0x0B;
	}
	return Best;
	//return;	
}

function GameObjective GetPriorityAttackObjective()
{
	return GetPriorityAttackObjectiveFor(none);
	//return;	
}

function GameObjective GetPriorityAttackObjectiveFor(SquadAI AttackSquad)
{
	local GameObjective O;

	// End:0x26
	if((PickedObjective != none) && PickedObjective.bDisabled)
	{
		PickedObjective = none;
	}
	// End:0x11F
	if(PickedObjective == none)
	{
		O = Objectives;
		J0x3C:

		// End:0x11F [Loop If]
		if(O != none)
		{
			// End:0x108
			if(((!O.bDisabled && O.bActive) && int(O.DefenderTeamIndex) != Team.TeamIndex) && ((PickedObjective == none) || int(PickedObjective.DefensePriority) < int(O.DefensePriority)) || (int(PickedObjective.DefensePriority) == int(O.DefensePriority)) && FRand() < 0.3000000)
			{
				PickedObjective = O;
			}
			O = O.NextObjective;
			// [Loop Continue]
			goto J0x3C;
		}
	}
	return PickedObjective;
	//return;	
}

function GameObjective GetPriorityFreelanceObjective()
{
	return GetPriorityAttackObjectiveFor(none);
	//return;	
}

function bool PutOnDefense(Bot B)
{
	local GameObjective O;

	O = GetLeastDefendedObjective();
	// End:0x6C
	if(O != none)
	{
		// End:0x4D
		if(O.DefenseSquad == none)
		{
			O.DefenseSquad = AddSquadWithLeader(B, O);			
		}
		else
		{
			O.DefenseSquad.AddBot(B);
		}
		return true;
	}
	return false;
	//return;	
}

function PutOnOffense(Bot B)
{
	// End:0x49
	if((AttackSquad == none) || AttackSquad.Size >= AttackSquad.MaxSquadSize)
	{
		AttackSquad = AddSquadWithLeader(B, GetPriorityAttackObjectiveFor(none));		
	}
	else
	{
		AttackSquad.AddBot(B);
	}
	//return;	
}

function PutOnFreelance(Bot B)
{
	// End:0x48
	if((FreelanceSquad == none) || FreelanceSquad.Size >= FreelanceSquad.MaxSquadSize)
	{
		FreelanceSquad = AddSquadWithLeader(B, GetPriorityFreelanceObjective());		
	}
	else
	{
		FreelanceSquad.AddBot(B);
	}
	// End:0x9A
	if(!FreelanceSquad.bFreelance)
	{
		FreelanceSquad.bFreelance = true;
		NetUpdateTime = Level.TimeSeconds - float(1);
	}
	//return;	
}

function SetBotOrders(Bot NewBot, RosterEntry R)
{
	local SquadAI HumanSquad;
	local name NewOrders;

	// End:0x11
	if(Objectives == none)
	{
		SetObjectiveLists();
	}
	// End:0x70
	if((R == none) || R.NoRecommendation())
	{
		// End:0x4B
		if(Team.Size == 0)
		{
			OrderOffset = 0;
		}
		NewOrders = OrderList[int(float(OrderOffset) % float(8))];
		OrderOffset++;		
	}
	else
	{
		// End:0x90
		if(R.RecommendDefense())
		{
			NewOrders = 'Defend';			
		}
		else
		{
			// End:0xB0
			if(R.RecommendAttack())
			{
				NewOrders = 'Attack';				
			}
			else
			{
				// End:0xD0
				if(R.RecommendSupport())
				{
					NewOrders = 'Follow';					
				}
				else
				{
					NewOrders = 'Freelance';
				}
			}
		}
	}
	// End:0xFC
	if((NewOrders == 'Defend') && PutOnDefense(NewBot))
	{
		return;
	}
	// End:0x118
	if(NewOrders == 'Freelance')
	{
		PutOnFreelance(NewBot);
		return;
	}
	// End:0x134
	if(NewOrders == 'Attack')
	{
		PutOnOffense(NewBot);
		return;
	}
	// End:0x170
	if(NewOrders == 'Follow')
	{
		HumanSquad = AddHumanSquad();
		// End:0x170
		if(HumanSquad != none)
		{
			HumanSquad.AddBot(NewBot);
			return;
		}
	}
	PutOnOffense(NewBot);
	//return;	
}

function SetOrders(Bot B, name NewOrders, Controller OrderGiver)
{
	local TeamPlayerReplicationInfo PRI;

	PRI = TeamPlayerReplicationInfo(B.PlayerReplicationInfo);
	// End:0x52
	if(HoldSpot(B.GoalScript) != none)
	{
		PRI.bHolding = false;
		B.FreeScript();
	}
	// End:0x144
	if(NewOrders == 'HOLD')
	{
		PRI.bHolding = true;
		PutBotOnSquadLedBy(OrderGiver, B);
		B.GoalScript = PlayerController(OrderGiver).ViewTarget.Spawn(Class'UnrealGame.HoldSpot');
		// End:0x103
		if(Vehicle(PlayerController(OrderGiver).ViewTarget) != none)
		{
			HoldSpot(B.GoalScript).HoldVehicle = Vehicle(PlayerController(OrderGiver).ViewTarget);
		}
		// End:0x141
		if(int(PlayerController(OrderGiver).ViewTarget.Physics) == int(11))
		{
			B.GoalScript.SetPhysics(11);
		}		
	}
	else
	{
		// End:0x161
		if(NewOrders == 'Defend')
		{
			PutOnDefense(B);			
		}
		else
		{
			// End:0x17E
			if(NewOrders == 'Attack')
			{
				PutOnOffense(B);				
			}
			else
			{
				// End:0x1AF
				if(NewOrders == 'Follow')
				{
					B.FreeScript();
					PutBotOnSquadLedBy(OrderGiver, B);					
				}
				else
				{
					// End:0x1CB
					if(NewOrders == 'Freelance')
					{
						PutOnFreelance(B);
						return;
					}
				}
			}
		}
	}
	//return;	
}

function CallForHelp(Bot B)
{
	//return;	
}

function RemoveFromTeam(Controller Other)
{
	local SquadAI S;

	// End:0x59
	if(PlayerController(Other) != none)
	{
		S = Squads;
		J0x1B:

		// End:0x56 [Loop If]
		if(S != none)
		{
			S.RemovePlayer(PlayerController(Other));
			S = S.NextSquad;
			// [Loop Continue]
			goto J0x1B;
		}		
	}
	else
	{
		// End:0xAF
		if(Bot(Other) != none)
		{
			S = Squads;
			J0x74:

			// End:0xAF [Loop If]
			if(S != none)
			{
				S.RemoveBot(Bot(Other));
				S = S.NextSquad;
				// [Loop Continue]
				goto J0x74;
			}
		}
	}
	//return;	
}

defaultproperties
{
	SquadType=Class'UnrealGame.SquadAI'
	OrderList[0]="Follow"
	OrderList[1]="Attack"
	OrderList[2]="Defend"
	OrderList[3]="Freelance"
	OrderList[4]="Follow"
	OrderList[5]="Attack"
	OrderList[6]="Defend"
	OrderList[7]="Freelance"
}
