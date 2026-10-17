class DOMTeamAI extends TeamAI
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var SquadAI PrimaryDefender;

function bool DominationPending()
{
	local GameObjective O;

	O = Objectives;
	J0x0B:

	// End:0x6B [Loop If]
	if(O != none)
	{
		// End:0x54
		if((int(O.DefenderTeamIndex) == Team.TeamIndex) || int(O.DefenderTeamIndex) == 255)
		{
			return false;
		}
		O = O.NextObjective;
		// [Loop Continue]
		goto J0x0B;
	}
	return true;
	//return;	
}

function CheckFreelanceObjective(SquadAI S)
{
	local GameObjective O, Best;

	// End:0x4F
	if((S.SquadObjective != none) && (int(S.SquadObjective.DefenderTeamIndex) != Team.TeamIndex) || DominationPending())
	{
		return;
	}
	O = Objectives;
	J0x5A:

	// End:0xC9 [Loop If]
	if(O != none)
	{
		// End:0xB2
		if((DominationPoint(O) != none) && (Best == none) || int(Best.DefenderTeamIndex) == Team.TeamIndex)
		{
			Best = O;
		}
		O = O.NextObjective;
		// [Loop Continue]
		goto J0x5A;
	}
	// End:0x11E
	if(Best != S.SquadObjective)
	{
		S.SquadObjective = Best;
		NetUpdateTime = Level.TimeSeconds - float(1);
		S.SetFinalStretch(false);
	}
	//return;	
}

function bool StayFreelance(SquadAI S)
{
	// End:0x4F
	if((S.SquadObjective != none) && (int(S.SquadObjective.DefenderTeamIndex) != Team.TeamIndex) || DominationPending())
	{
		return false;
	}
	return (S.SquadObjective == none) || int(S.SquadObjective.DefenderTeamIndex) == Team.TeamIndex;
	//return;	
}

function bool PutOnDefense(Bot B)
{
	local GameObjective O;

	O = GetLeastDefendedObjective();
	// End:0x51
	if(O != none)
	{
		// End:0x3B
		if(PrimaryDefender == none)
		{
			PrimaryDefender = AddSquadWithLeader(B, O);			
		}
		else
		{
			PrimaryDefender.AddBot(B);
		}
		return true;
	}
	return false;
	//return;	
}

function FindNewObjectiveFor(SquadAI S, bool bForceUpdate)
{
	local GameObjective O;

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
		// End:0x67
		if(S.SquadObjective != none)
		{
			O = S.SquadObjective;			
		}
		else
		{
			// End:0x91
			if(S.GetOrders() == 'Attack')
			{
				O = GetPriorityAttackObjectiveFor(S);
			}
		}
	}
	// End:0xA8
	if(O == none)
	{
		O = GetLeastDefendedObjective();
	}
	S.SetObjective(O, bForceUpdate);
	//return;	
}

function GameObjective GetLeastDefendedObjective()
{
	local GameObjective O, Best;

	O = Objectives;
	J0x0B:

	// End:0xF1 [Loop If]
	if(O != none)
	{
		// End:0xDA
		if(((DominationPoint(O) != none) && DominationPoint(O).CheckPrimaryTeam(byte(Team.TeamIndex))) && ((Best == none) || int(Best.DefensePriority) < int(O.DefensePriority)) || (int(Best.DefensePriority) == int(O.DefensePriority)) && Best.GetNumDefenders() > O.GetNumDefenders())
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

function GameObjective GetPriorityAttackObjectiveFor(SquadAI AttackSquad)
{
	local GameObjective O, Best;

	O = Objectives;
	J0x0B:

	// End:0xA5 [Loop If]
	if(O != none)
	{
		// End:0x8E
		if(((DominationPoint(O) != none) && !DominationPoint(O).CheckPrimaryTeam(byte(Team.TeamIndex))) && (Best == none) || int(Best.DefenderTeamIndex) == Team.TeamIndex)
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

function GameObjective GetPriorityFreelanceObjective()
{
	local GameObjective O, Best;

	O = Objectives;
	J0x0B:

	// End:0x7A [Loop If]
	if(O != none)
	{
		// End:0x63
		if((DominationPoint(O) != none) && (Best == none) || int(Best.DefenderTeamIndex) == Team.TeamIndex)
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

function SetBotOrders(Bot NewBot, RosterEntry R)
{
	// End:0x21
	if(Team.Size == 1)
	{
		OrderList[0] = 'Freelance';
	}
	super.SetBotOrders(NewBot, R);
	//return;	
}

function SetOrders(Bot B, name NewOrders, Controller OrderGiver)
{
	local GameObjective O, Best;
	local SquadAI S;
	local float BestDist;
	local TeamPlayerReplicationInfo PRI;
	local byte Picked;

	PRI = TeamPlayerReplicationInfo(B.PlayerReplicationInfo);
	// End:0x52
	if(HoldSpot(B.GoalScript) != none)
	{
		PRI.bHolding = false;
		B.FreeScript();
	}
	// End:0x1EC
	if((NewOrders == 'HOLD') && PlayerController(OrderGiver) != none)
	{
		BestDist = 2000.0000000;
		O = Objectives;
		J0x89:

		// End:0x138 [Loop If]
		if(O != none)
		{
			// End:0x121
			if((VSize(PlayerController(OrderGiver).ViewTarget.Location - O.Location) < BestDist) && OrderGiver.LineOfSightTo(O))
			{
				Best = O;
				BestDist = VSize(PlayerController(OrderGiver).ViewTarget.Location - O.Location);
			}
			O = O.NextObjective;
			// [Loop Continue]
			goto J0x89;
		}
		// End:0x1EC
		if(Best != none)
		{
			// End:0x1EC
			if(B.Squad.SquadObjective != Best)
			{
				S = Squads;
				J0x16F:

				// End:0x1DA [Loop If]
				if(S != none)
				{
					// End:0x1C3
					if((S.SquadObjective == Best) && PlayerController(S.SquadLeader) == none)
					{
						S.AddBot(B);
						return;
					}
					S = S.NextSquad;
					// [Loop Continue]
					goto J0x16F;
				}
				AddSquadWithLeader(B, Best);
				return;
			}
		}
	}
	Picked = byte(255);
	// End:0x210
	if(NewOrders == 'Defend')
	{
		Picked = 1;		
	}
	else
	{
		// End:0x227
		if(NewOrders == 'Attack')
		{
			Picked = 0;
		}
	}
	// End:0x24D
	if(int(Picked) == 255)
	{
		super.SetOrders(B, NewOrders, OrderGiver);		
	}
	else
	{
		// End:0x29B
		if((PrimaryDefender != none) && int(DominationPoint(PrimaryDefender.SquadObjective).PrimaryTeam) == int(Picked))
		{
			PrimaryDefender.AddBot(B);			
		}
		else
		{
			// End:0x2E9
			if((AttackSquad != none) && int(DominationPoint(AttackSquad.SquadObjective).PrimaryTeam) == int(Picked))
			{
				AttackSquad.AddBot(B);				
			}
			else
			{
				O = Objectives;
				J0x2F4:

				// End:0x34C [Loop If]
				if(O != none)
				{
					// End:0x335
					if((DominationPoint(O) != none) && int(DominationPoint(O).PrimaryTeam) == int(Picked))
					{
						// [Explicit Break]
						goto J0x34C;
					}
					O = O.NextObjective;
					// [Loop Continue]
					goto J0x2F4;
				}
				J0x34C:

				// End:0x3A1
				if(DominationPoint(O) != none)
				{
					// End:0x380
					if(PrimaryDefender == none)
					{
						PrimaryDefender = AddSquadWithLeader(B, O);						
					}
					else
					{
						// End:0x3A1
						if(AttackSquad == none)
						{
							AttackSquad = AddSquadWithLeader(B, O);
						}
					}
				}
			}
		}
	}
	//return;	
}

defaultproperties
{
	SquadType=Class'UnrealGame.DOMSquadAI'
	OrderList[0]="Attack"
	OrderList[1]="Defend"
	OrderList[2]="Attack"
	OrderList[4]="Defend"
	OrderList[6]="Freelance"
}
