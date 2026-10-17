class ONSTeamAI extends TeamAI
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var ONSPowerCore FinalCore;
var bool bAllNodesTaken;

function Reset()
{
	super.Reset();
	bAllNodesTaken = false;
	//return;	
}

function SetObjectiveLists()
{
	local GameObjective O;
	local ONSPowerCore Core;

	super.SetObjectiveLists();
	O = Objectives;
	J0x11:

	// End:0xAD [Loop If]
	if(O != none)
	{
		Core = ONSPowerCore(O);
		// End:0x96
		if((((Core != none) && Core.bFinalCore) && int(Core.CoreStage) == 0) && int(Core.DefenderTeamIndex) == Team.TeamIndex)
		{
			FinalCore = Core;
			// [Explicit Break]
			goto J0xAD;
		}
		O = O.NextObjective;
		// [Loop Continue]
		goto J0x11;
	}
	J0xAD:

	// End:0xD4
	if(FinalCore == none)
	{
		Warn("Couldn't find PowerCore!");
	}
	//return;	
}

function ReAssessStrategy()
{
	local GameObjective O;

	// End:0x0D
	if(FreelanceSquad == none)
	{
		return;
	}
	// End:0x44
	if((FinalCore == none) || ONSTeamAI(EnemyTeam.AI).FinalCore == none)
	{
		super.ReAssessStrategy();
		return;
	}
	// End:0x12E
	if((FinalCore.PoweredBy(byte(EnemyTeam.TeamIndex)) || ONSTeamAI(EnemyTeam.AI).FinalCore.PoweredBy(byte(Team.TeamIndex))) || Level.Game.bOverTime && FinalCore.Health < ONSTeamAI(EnemyTeam.AI).FinalCore.Health)
	{
		FreelanceSquad.bFreelanceAttack = true;
		FreelanceSquad.bFreelanceDefend = false;
		O = GetPriorityAttackObjectiveFor(FreelanceSquad);		
	}
	else
	{
		// End:0x1B4
		if(Level.Game.bOverTime && FinalCore.Health > ONSTeamAI(EnemyTeam.AI).FinalCore.Health)
		{
			FreelanceSquad.bFreelanceAttack = false;
			FreelanceSquad.bFreelanceDefend = true;
			O = GetLeastDefendedObjective();			
		}
		else
		{
			FreelanceSquad.bFreelanceAttack = false;
			FreelanceSquad.bFreelanceDefend = false;
			O = GetPriorityFreelanceObjective();
		}
	}
	// End:0x21C
	if((O != none) && O != FreelanceSquad.SquadObjective)
	{
		FreelanceSquad.SetObjective(O, true);
	}
	//return;	
}

function CriticalObjectiveWarning(GameObjective AttackedObjective, Pawn EventInstigator)
{
	local SquadAI S;
	local Bot M;
	local bool bFoundDefense;

	S = Squads;
	J0x0B:

	// End:0x185 [Loop If]
	if(S != none)
	{
		// End:0x16E
		if(S.SquadObjective == AttackedObjective)
		{
			bFoundDefense = true;
			// End:0x16E
			if(EventInstigator != none)
			{
				S.CriticalObjectiveWarning(EventInstigator);
				M = S.SquadMembers;
				J0x69:

				// End:0x16E [Loop If]
				if(M != none)
				{
					// End:0x157
					if(((((M.Enemy == none) || M.Enemy == EventInstigator) && Vehicle(M.Pawn) != none) && M.Pawn.bStationary) && !FastTrace(EventInstigator.Location + (EventInstigator.CollisionHeight * vect(0.0000000, 0.0000000, 1.0000000)), M.Pawn.Location))
					{
						Vehicle(M.Pawn).KDriverLeave(false);
						M.WhatToDoNext(67);
					}
					M = M.NextSquadMember;
					// [Loop Continue]
					goto J0x69;
				}
			}
		}
		S = S.NextSquad;
		// [Loop Continue]
		goto J0x0B;
	}
	// End:0x286
	if(!bFoundDefense)
	{
		S = Squads;
		J0x19B:

		// End:0x286 [Loop If]
		if(S != none)
		{
			// End:0x26F
			if(((S.GetOrders() == 'Defend') || S.bFreelanceDefend) && (ONSPowerCore(S.SquadObjective) == none) || !ONSPowerCore(S.SquadObjective).bUnderAttack && int(ONSPowerCore(S.SquadObjective).CoreStage) != 4)
			{
				S.SetObjective(AttackedObjective, true);
				// End:0x26D
				if(EventInstigator != none)
				{
					S.CriticalObjectiveWarning(EventInstigator);
				}
				return;
			}
			S = S.NextSquad;
			// [Loop Continue]
			goto J0x19B;
		}
	}
	//return;	
}

function FindNewObjectives(GameObjective DisabledObjective)
{
	local SquadAI S;
	local Bot M;
	local ONSPowerCore Core, DisabledCore;
	local GameObjective O;
	local int i;
	local bool bHasVulnerableNode;

	O = Team.AI.Objectives;
	J0x1D:

	// End:0xC6 [Loop If]
	if(O != none)
	{
		Core = ONSPowerCore(O);
		// End:0xAF
		if((((Core != none) && int(Core.CoreStage) == 0) && int(Core.DefenderTeamIndex) == Team.TeamIndex) && Core.PoweredBy(byte(EnemyTeam.TeamIndex)))
		{
			bHasVulnerableNode = true;
			// [Explicit Break]
			goto J0xC6;
		}
		O = O.NextObjective;
		// [Loop Continue]
		goto J0x1D;
	}
	J0xC6:

	S = Squads;
	J0xD1:

	// End:0x49D [Loop If]
	if(S != none)
	{
		S.GetOrders();
		Core = ONSPowerCore(S.SquadObjective);
		// End:0x2A1
		if(((S.CurrentOrders == 'Attack') || S.bFreelanceAttack) || !bHasVulnerableNode && (S.CurrentOrders == 'Defend') || S.bFreelanceDefend)
		{
			// End:0x22D
			if((((Core == none) || Core.bDisabled) || (int(Core.DefenderTeamIndex) == Team.TeamIndex) && int(Core.CoreStage) == 0) || !Core.PoweredBy(byte(Team.TeamIndex)) && bHasVulnerableNode || !Core.LinkedToCoreConstructingFor(byte(Team.TeamIndex)))
			{
				FindNewObjectiveFor(S, false);				
			}
			else
			{
				// End:0x29E
				if(int(Core.CoreStage) == 1)
				{
					M = S.SquadMembers;
					J0x257:

					// End:0x29E [Loop If]
					if(M != none)
					{
						// End:0x287
						if(M.IsInState('RangedAttack'))
						{
							M.WhatToDoNext(66);
						}
						M = M.NextSquadMember;
						// [Loop Continue]
						goto J0x257;
					}
				}
			}			
		}
		else
		{
			// End:0x47A
			if((S.CurrentOrders == 'Defend') || S.bFreelanceDefend)
			{
				// End:0x377
				if(((Core == none) || Core.bDisabled) || ((int(Core.CoreStage) != 4) && int(Core.CoreStage) != 1) && (int(Core.DefenderTeamIndex) != Team.TeamIndex) || !Core.PoweredBy(byte(EnemyTeam.TeamIndex)))
				{
					FindNewObjectiveFor(S, false);					
				}
				else
				{
					DisabledCore = ONSPowerCore(DisabledObjective);
					// End:0x477
					if((DisabledCore != none) && int(DisabledCore.CoreStage) == 0)
					{
						i = 0;
						J0x3B1:

						// End:0x477 [Loop If]
						if(i < DisabledCore.PowerLinks.Length)
						{
							// End:0x46D
							if((int(DisabledCore.PowerLinks[i].DefensePriority) > int(Core.DefensePriority)) && (DisabledCore.PowerLinks[i].DefenseSquad == none) || DisabledCore.PowerLinks[i].DefenseSquad.Team != Team)
							{
								S.SetObjective(DisabledCore, true);
								// [Explicit Break]
								goto J0x477;
							}
							i++;
							// [Loop Continue]
							goto J0x3B1;
						}
					}
				}
				J0x477:
				
			}
			else
			{
				FindNewObjectiveFor(S, false);
			}
		}
		S = S.NextSquad;
		// [Loop Continue]
		goto J0xD1;
	}
	//return;	
}

function bool ObjectiveCovered(GameObjective O)
{
	local SquadAI S;

	S = Squads;
	J0x0B:

	// End:0x47 [Loop If]
	if(S != none)
	{
		// End:0x30
		if(S.SquadObjective == O)
		{
			return true;
		}
		S = S.NextSquad;
		// [Loop Continue]
		goto J0x0B;
	}
	return false;
	//return;	
}

function GameObjective GetPriorityAttackObjectiveFor(SquadAI AttackSquad)
{
	local GameObjective O, NextPickedObjective;
	local ONSPowerCore Core;
	local array<ONSPowerCore> NextCores;
	local int i, j;
	local bool bAlreadyInList, bPickedObjectiveCovered, bTestObjectiveCovered;

	PickedObjective = none;
	O = Objectives;
	J0x12:

	// End:0x2D2 [Loop If]
	if(O != none)
	{
		Core = ONSPowerCore(O);
		// End:0x2BB
		if((((Core != none) && !Core.bDisabled) && (int(Core.DefenderTeamIndex) != Team.TeamIndex) || int(Core.CoreStage) != 0) && Core.PoweredBy(byte(Team.TeamIndex)))
		{
			// End:0x1FF
			if((int(Core.DefenderTeamIndex) == Team.TeamIndex) || (int(Core.CoreStage) != 0) && int(Core.CoreStage) != 2)
			{
				i = 0;
				J0x10A:

				// End:0x1FF [Loop If]
				if(i < Core.PowerLinks.Length)
				{
					// End:0x1F5
					if((int(Core.PowerLinks[i].CoreStage) == 4) || int(Core.PowerLinks[i].CoreStage) == 2)
					{
						bAlreadyInList = false;
						j = 0;
						J0x180:

						// End:0x1C9 [Loop If]
						if(j < NextCores.Length)
						{
							// End:0x1BF
							if(NextCores[j] == Core.PowerLinks[i])
							{
								bAlreadyInList = true;
								// [Explicit Break]
								goto J0x1C9;
							}
							j++;
							// [Loop Continue]
							goto J0x180;
						}
						J0x1C9:

						// End:0x1F5
						if(!bAlreadyInList)
						{
							NextCores[NextCores.Length] = Core.PowerLinks[i];
						}
					}
					i++;
					// [Loop Continue]
					goto J0x10A;
				}
			}
			bTestObjectiveCovered = ObjectiveCovered(Core);
			// End:0x2BB
			if(((PickedObjective == none) || !bTestObjectiveCovered && bPickedObjectiveCovered || int(PickedObjective.DefensePriority) < int(Core.DefensePriority)) || ((int(PickedObjective.DefensePriority) == int(Core.DefensePriority)) && bPickedObjectiveCovered == bTestObjectiveCovered) && FRand() < 0.5000000)
			{
				PickedObjective = Core;
				bPickedObjectiveCovered = bTestObjectiveCovered;
			}
		}
		O = O.NextObjective;
		// [Loop Continue]
		goto J0x12;
	}
	// End:0x3C0
	if((PickedObjective != none) && ObjectiveCovered(PickedObjective))
	{
		i = 0;
		J0x2F4:

		// End:0x3AA [Loop If]
		if(i < NextCores.Length)
		{
			// End:0x3A0
			if(!ObjectiveCovered(NextCores[i]) && ((NextPickedObjective == none) || int(NextPickedObjective.DefensePriority) < int(NextCores[i].DefensePriority)) || (int(NextPickedObjective.DefensePriority) == int(NextCores[i].DefensePriority)) && FRand() < 0.5000000)
			{
				NextPickedObjective = NextCores[i];
			}
			i++;
			// [Loop Continue]
			goto J0x2F4;
		}
		// End:0x3C0
		if(NextPickedObjective != none)
		{
			PickedObjective = NextPickedObjective;
		}
	}
	return PickedObjective;
	//return;	
}

function GameObjective GetLeastDefendedObjective()
{
	local GameObjective O, Best;

	O = Objectives;
	J0x0B:

	// End:0x133 [Loop If]
	if(O != none)
	{
		// End:0x11C
		if(((((ONSPowerCore(O) != none) && int(ONSPowerCore(O).CoreStage) == 0) && int(O.DefenderTeamIndex) == Team.TeamIndex) && ONSPowerCore(O).PoweredBy(byte(EnemyTeam.TeamIndex))) && ((Best == none) || int(Best.DefensePriority) < int(O.DefensePriority)) || (int(Best.DefensePriority) == int(O.DefensePriority)) && Best.GetNumDefenders() > O.GetNumDefenders())
		{
			Best = O;
		}
		O = O.NextObjective;
		// [Loop Continue]
		goto J0x0B;
	}
	// End:0x14B
	if(Best == none)
	{
		Best = GetPriorityAttackObjectiveFor(none);
	}
	return Best;
	//return;	
}

function GameObjective GetMostDefendedObjective()
{
	local GameObjective O, Best;

	O = Objectives;
	J0x0B:

	// End:0x133 [Loop If]
	if(O != none)
	{
		// End:0x11C
		if(((((ONSPowerCore(O) != none) && int(ONSPowerCore(O).CoreStage) == 0) && int(O.DefenderTeamIndex) == Team.TeamIndex) && ONSPowerCore(O).PoweredBy(byte(EnemyTeam.TeamIndex))) && ((Best == none) || int(Best.DefensePriority) < int(O.DefensePriority)) || (int(Best.DefensePriority) == int(O.DefensePriority)) && Best.GetNumDefenders() < O.GetNumDefenders())
		{
			Best = O;
		}
		O = O.NextObjective;
		// [Loop Continue]
		goto J0x0B;
	}
	// End:0x14B
	if(Best == none)
	{
		Best = GetPriorityAttackObjectiveFor(none);
	}
	return Best;
	//return;	
}

function bool PutOnDefense(Bot B)
{
	local GameObjective O;

	O = GetLeastDefendedObjective();
	// End:0xAE
	if(O != none)
	{
		// End:0x8F
		if((O.DefenseSquad == none) || O.DefenseSquad.Team != Team)
		{
			O.DefenseSquad = AddSquadWithLeader(B, O);
			ONSSquadAI(O.DefenseSquad).bDefendingSquad = true;			
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

function bool OverrideCheckSpecialVehicleObjectives(Bot B)
{
	// End:0x0B
	if(bAllNodesTaken)
	{
		return false;
	}
	// End:0x25
	if(B.Squad == FreelanceSquad)
	{
		return true;
	}
	//return;	
}

function bool IsFastFreelanceObjective(ONSPowerCore Core)
{
	return ((Core != none) && int(Core.CoreStage) == 4) && Core.PoweredBy(byte(Team.TeamIndex)) || Core.LinkedToCoreConstructingFor(byte(Team.TeamIndex));
	//return;	
}

function float CoreAvailabilityScore(ONSPowerCore Core)
{
	// End:0x16
	if(!IsFastFreelanceObjective(Core))
	{
		return -1.0000000;
	}
	// End:0x44
	if(Core.PoweredBy(byte(int(1) - Team.TeamIndex)))
	{
		return 1.0000000;
	}
	// End:0x72
	if(Core.LinkedToCoreConstructingFor(byte(int(1) - Team.TeamIndex)))
	{
		return 2.0000000;
	}
	// End:0x8D
	if(Core.LinkedNodes.Length == 1)
	{
		return 3.0000000;
	}
	return 4.0000000;
	//return;	
}

function GameObjective FindFastFreelanceObjective()
{
	local GameObjective O;
	local ONSPowerCore OPC, Best;
	local float BestRating, NewRating, BestScore, NewScore;

	// End:0x38
	if((FreelanceSquad != none) && IsFastFreelanceObjective(ONSPowerCore(FreelanceSquad.SquadObjective)))
	{
		return FreelanceSquad.SquadObjective;
	}
	O = Objectives;
	J0x43:

	// End:0xFD [Loop If]
	if(O != none)
	{
		OPC = ONSPowerCore(O);
		NewScore = CoreAvailabilityScore(OPC);
		// End:0xE6
		if(NewScore >= BestScore)
		{
			// End:0x94
			if(BestScore < NewScore)
			{
				Best = none;
			}
			NewRating = OPC.RateCore();
			// End:0xE6
			if((Best == none) || NewRating > BestRating)
			{
				Best = OPC;
				BestRating = NewRating;
				BestScore = NewScore;
			}
		}
		O = O.NextObjective;
		// [Loop Continue]
		goto J0x43;
	}
	// End:0x110
	if(Best == none)
	{
		bAllNodesTaken = true;
	}
	return Best;
	//return;	
}

function GameObjective GetPriorityFreelanceObjective()
{
	local GameObjective O, Best;
	local ONSPowerCore Core;

	// End:0x28
	if(!bAllNodesTaken)
	{
		Best = FindFastFreelanceObjective();
		// End:0x28
		if(!bAllNodesTaken)
		{
			return Best;
		}
	}
	O = Objectives;
	J0x33:

	// End:0x143 [Loop If]
	if(O != none)
	{
		Core = ONSPowerCore(O);
		// End:0x12C
		if(((((Core != none) && ((int(Core.CoreStage) == 4) || int(Core.CoreStage) == 2) || int(Core.CoreStage) == 5) && int(Core.DefenderTeamIndex) != Team.TeamIndex) && Core.PoweredBy(byte(EnemyTeam.TeamIndex))) && (Best == none) || int(Best.DefensePriority) < int(Core.DefensePriority))
		{
			Best = O;
		}
		O = O.NextObjective;
		// [Loop Continue]
		goto J0x33;
	}
	// End:0x15B
	if(Best == none)
	{
		Best = GetPriorityAttackObjectiveFor(none);
	}
	return Best;
	//return;	
}

defaultproperties
{
	SquadType=Class'Onslaught.ONSSquadAI'
	OrderList[0]="Attack"
	OrderList[4]="Defend"
	OrderList[6]="Attack"
	OrderList[7]="Attack"
}
