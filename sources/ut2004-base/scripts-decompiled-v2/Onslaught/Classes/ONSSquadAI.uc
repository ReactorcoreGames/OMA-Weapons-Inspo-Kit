class ONSSquadAI extends SquadAI
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var bool bDefendingSquad;
var float LastFailedNodeTeleportTime;
var float MaxObjectiveGetOutDist;

function Reset()
{
	super.Reset();
	bDefendingSquad = false;
	//return;	
}

function name GetOrders()
{
	local name NewOrders;

	// End:0x1E
	if(PlayerController(SquadLeader) != none)
	{
		NewOrders = 'Human';		
	}
	else
	{
		// End:0x4F
		if((bFreelance && !bFreelanceAttack) && !bFreelanceDefend)
		{
			NewOrders = 'Freelance';			
		}
		else
		{
			// End:0x94
			if((bDefendingSquad || bFreelanceDefend) || (SquadObjective != none) && SquadObjective.DefenseSquad == self)
			{
				NewOrders = 'Defend';				
			}
			else
			{
				NewOrders = 'Attack';
			}
		}
	}
	// End:0xD2
	if(NewOrders != CurrentOrders)
	{
		CurrentOrders = NewOrders;
		NetUpdateTime = Level.TimeSeconds - float(1);
	}
	return CurrentOrders;
	//return;	
}

function byte PriorityObjective(Bot B)
{
	local ONSPowerCore Core;

	// End:0x6A
	if((GetOrders()) == 'Defend')
	{
		Core = ONSPowerCore(SquadObjective);
		// End:0x67
		if(((Core != none) && int(Core.DefenderTeamIndex) == Team.TeamIndex) && Core.bUnderAttack)
		{
			return 1;
		}		
	}
	else
	{
		// End:0x111
		if(CurrentOrders == 'Attack')
		{
			Core = ONSPowerCore(SquadObjective);
			// End:0x111
			if(Core != none)
			{
				// End:0xD9
				if(Core.bFinalCore)
				{
					// End:0xD6
					if((B.Enemy != none) && Core.BotNearObjective(B))
					{
						return 1;
					}					
				}
				else
				{
					// End:0x111
					if(VSize(B.Pawn.Location - Core.Location) < float(1000))
					{
						return 1;
					}
				}
			}
		}
	}
	return 0;
	//return;	
}

function SetDefenseScriptFor(Bot B)
{
	local ONSPowerCore Core;

	Core = ONSPowerCore(SquadObjective);
	// End:0x7E
	if((Core == none) || (int(Core.DefenderTeamIndex) == Team.TeamIndex) && (int(Core.CoreStage) == 2) || int(Core.CoreStage) == 0)
	{
		super.SetDefenseScriptFor(B);
		return;
	}
	// End:0xA1
	if(B.GoalScript != none)
	{
		B.FreeScript();
	}
	//return;	
}

function float MaxVehicleDist(Pawn P)
{
	// End:0x23
	if(((GetOrders()) != 'Attack') || SquadObjective == none)
	{
		return 3000.0000000;
	}
	return FMin(3000.0000000, VSize(P.Location - SquadObjective.Location));
	//return;	
}

function bool FindPathToObjective(Bot B, Actor O)
{
	local Vehicle OldVehicle;

	// End:0x1D
	if(B.Pawn.bStationary)
	{
		return false;
	}
	// End:0x62
	if(O == none)
	{
		O = SquadObjective;
		// End:0x62
		if(O == none)
		{
			B.GoalString = "No SquadObjective";
			return false;
		}
	}
	// End:0x4D3
	if((ONSPowerNode(O) != none) && (int(ONSPowerNode(O).CoreStage) != 0) || int(ONSPowerCore(O).DefenderTeamIndex) == Team.TeamIndex)
	{
		B.MoveTarget = none;
		// End:0x2D0
		if((((Vehicle(B.Pawn) != none) && (B.Pawn.Location.Z - O.Location.Z) < float(500)) && VSize(B.Pawn.Location - O.Location) < Vehicle(B.Pawn).ObjectiveGetOutDist) && B.LineOfSightTo(O))
		{
			// End:0x1A5
			if(Vehicle(B.Pawn).bKeyVehicle)
			{
				return false;
			}
			OldVehicle = Vehicle(B.Pawn);
			B.DirectionHint = Normal(O.Location - OldVehicle.Location);
			Vehicle(B.Pawn).KDriverLeave(false);
			// End:0x2D0
			if(Vehicle(B.Pawn) == none)
			{
				// End:0x276
				if(ONSChopperCraft(OldVehicle) != none)
				{
					OldVehicle.KAddImpulse(ONSChopperCraft(OldVehicle).PushForce * Vector(OldVehicle.Rotation), OldVehicle.Location);
				}
				// End:0x2D0
				if((int(B.Pawn.Physics) == int(2)) && B.DoWaitForLanding())
				{
					B.Pawn.Velocity.Z = 0.0000000;
					return true;
				}
			}
		}
		// End:0x4AB
		if(B.actorReachable(O))
		{
			// End:0x321
			if((Vehicle(B.Pawn) != none) && Vehicle(B.Pawn).bKeyVehicle)
			{
				return false;
			}
			// End:0x3CF
			if((Vehicle(B.Pawn) != none) && (B.Pawn.Location.Z - O.Location.Z) < float(500))
			{
				B.DirectionHint = Normal(O.Location - B.Pawn.Location);
				Vehicle(B.Pawn).KDriverLeave(false);
			}
			// End:0x40E
			if(B.Pawn.ReachedDestination(O))
			{
				O.Touch(B.Pawn);
				return false;
			}
			// End:0x43C
			if(OldVehicle != none)
			{
				OldVehicle.TeamUseTime = Level.TimeSeconds + float(6);
			}
			B.RouteGoal = O;
			B.RouteCache[0] = none;
			B.GoalString = "almost at " $ string(O);
			B.MoveTarget = O;
			B.SetAttractionState();
			return true;
		}
		// End:0x4D3
		if(OldVehicle != none)
		{
			OldVehicle.UsedBy(B.Pawn);
		}
	}
	// End:0x4E8
	if(super.FindPathToObjective(B, O))
	{
		return true;
	}
	// End:0x63D
	if(((Vehicle(B.Pawn) != none) && !Vehicle(B.Pawn).bKeyVehicle) && (B.Enemy == none) || !B.EnemyVisible())
	{
		// End:0x5B6
		if(B.Pawn.HasWeapon() && Vehicle(B.Pawn).MaxDesireability > 0.5000000)
		{
			Vehicle(B.Pawn).bDefensive = true;			
		}
		else
		{
			Vehicle(B.Pawn).VehicleLostTime = Level.TimeSeconds + float(20);
		}
		B.DirectionHint = Normal(O.Location - B.Pawn.Location);
		Vehicle(B.Pawn).KDriverLeave(false);
	}
	return false;
	//return;	
}

function bool CheckVehicle(Bot B)
{
	local ONSPowerCore Nearest, Best, Core;
	local GameObjective O;
	local float NewRating, BestRating;
	local byte SourceDist;
	local Weapon SuperWeap;
	local int i;
	local Vehicle V;

	// End:0x613
	if(((ONSVehicle(B.Pawn) != none) && ((B.Skill + B.Tactics) >= float(3)) || ONSVehicle(B.Pawn).bKeyVehicle) && ONSVehicle(B.Pawn).IsArtillery())
	{
		// End:0x57B
		if(ONSVehicle(B.Pawn).IsDeployed())
		{
			// End:0x169
			if(((((SquadObjective != none) && int(SquadObjective.DefenderTeamIndex) != Team.TeamIndex) && ONSPowerCore(SquadObjective) != none) && ONSPowerCore(SquadObjective).LegitimateTargetOf(B)) && B.Pawn.CanAttack(SquadObjective))
			{
				B.DoRangedAttackOn(SquadObjective);
				B.GoalString = "Artillery Attack Objective";
				return true;
			}
			// End:0x1EE
			if((B.Enemy != none) && B.Pawn.CanAttack(B.Enemy))
			{
				B.DoRangedAttackOn(B.Enemy);
				B.GoalString = "Artillery Attack Enemy";
				return true;
			}
			i = 0;
			J0x1F5:

			// End:0x2AD [Loop If]
			if(i < 8)
			{
				// End:0x2A3
				if(((Enemies[i] != none) && Enemies[i] != B.Enemy) && B.Pawn.CanAttack(Enemies[i]))
				{
					B.DoRangedAttackOn(Enemies[i]);
					B.GoalString = "Artillery Attack Squad Enemy";
					return true;
				}
				i++;
				// [Loop Continue]
				goto J0x1F5;
			}
			O = Team.AI.Objectives;
			J0x2CA:

			// End:0x3CD [Loop If]
			if(O != none)
			{
				Core = ONSPowerCore(O);
				// End:0x3B6
				if(((((Core != none) && Core.PoweredBy(byte(Team.TeamIndex))) && int(Core.DefenderTeamIndex) != Team.TeamIndex) && Core.LegitimateTargetOf(B)) && B.Pawn.CanAttack(Core))
				{
					B.DoRangedAttackOn(Core);
					B.GoalString = "Artillery Attack Other Node";
					return true;
				}
				O = O.NextObjective;
				// [Loop Continue]
				goto J0x2CA;
			}
			V = Level.Game.VehicleList;
			J0x3EA:

			// End:0x4ED [Loop If]
			if(V != none)
			{
				// End:0x4D6
				if(((((V.Controller != none) && !V.bCanFly) && V.ImportantVehicle() || V.IsArtillery()) && !V.Controller.SameTeamAs(B)) && B.Pawn.CanAttack(V))
				{
					B.DoRangedAttackOn(V);
					B.GoalString = "Artillery Attack important vehicle";
					return true;
				}
				V = V.NextVehicle;
				// [Loop Continue]
				goto J0x3EA;
			}
			// End:0x578
			if((VSize(B.Pawn.Location - SquadObjective.Location) > Vehicle(B.Pawn).ObjectiveGetOutDist) || !B.Pawn.CanAttack(SquadObjective))
			{
				ONSVehicle(B.Pawn).MayUndeploy();
			}			
		}
		else
		{
			// End:0x613
			if((!B.Pawn.IsFiring() && B.Enemy != none) && B.Pawn.CanAttack(B.Enemy))
			{
				B.Focus = B.Enemy;
				B.FireWeaponAt(B.Enemy);
			}
		}
	}
	// End:0x8E4
	if(SquadObjective != none)
	{
		// End:0x769
		if((GetOrders()) == 'Attack')
		{
			// End:0x766
			if(((ONSPowerCore(SquadObjective) != none) && ONSPowerCore(SquadObjective).PoweredBy(byte(int(1) - Team.TeamIndex))) && (Vehicle(B.Pawn) == none) || !Vehicle(B.Pawn).bKeyVehicle)
			{
				SuperWeap = B.HasSuperWeapon();
				// End:0x766
				if((SuperWeap != none) && B.LineOfSightTo(SquadObjective))
				{
					// End:0x751
					if(Vehicle(B.Pawn) != none)
					{
						B.DirectionHint = Normal(SquadObjective.Location - B.Pawn.Location);
						Vehicle(B.Pawn).KDriverLeave(false);
					}
					return SquadObjective.TellBotHowToDisable(B);
				}
			}			
		}
		else
		{
			// End:0x8E4
			if((((((Vehicle(B.Pawn) != none) && (GetOrders()) == 'Defend') && !Vehicle(B.Pawn).bDefensive) && VSize(B.Pawn.Location - SquadObjective.Location) < float(1600)) && !Vehicle(B.Pawn).bKeyVehicle) && ((B.Enemy == none) || (Level.TimeSeconds - B.LastSeenTime) > float(4)) || !Vehicle(B.Pawn).ImportantVehicle() && !B.EnemyVisible())
			{
				B.DirectionHint = Normal(SquadObjective.Location - B.Pawn.Location);
				Vehicle(B.Pawn).KDriverLeave(false);
				return false;
			}
		}
	}
	// End:0xB77
	if((Vehicle(B.Pawn) == none) && ONSPowerCore(SquadObjective) != none)
	{
		// End:0xA88
		if(int(ONSPowerCore(SquadObjective).CoreStage) == 0)
		{
			// End:0xA88
			if((((((GetOrders()) == 'Defend') && (B.Enemy == none) || !B.EnemyVisible() && (Level.TimeSeconds - B.LastSeenTime) > float(3)) && VSize(B.Pawn.Location - SquadObjective.Location) < (GetMaxObjectiveGetOutDist())) && ONSPowerCore(SquadObjective).Health < ONSPowerCore(SquadObjective).DamageCapacity) && ((B.Pawn.Weapon != none) && B.Pawn.Weapon.CanHeal(SquadObjective)) || (B.Pawn.PendingWeapon != none) && B.Pawn.PendingWeapon.CanHeal(SquadObjective))
			{
				return false;
			}
		}
		// End:0xB06
		if(int(ONSPowerCore(SquadObjective).CoreStage) == 2)
		{
			// End:0xB06
			if(((B.Enemy == none) || !B.EnemyVisible()) && VSize(B.Pawn.Location - SquadObjective.Location) < (GetMaxObjectiveGetOutDist()))
			{
				return false;
			}
		}
		// End:0xB77
		if(((int(ONSPowerCore(SquadObjective).CoreStage) == 4) || int(ONSPowerCore(SquadObjective).CoreStage) == 1) && VSize(B.Pawn.Location - SquadObjective.Location) < (GetMaxObjectiveGetOutDist()))
		{
			return false;
		}
	}
	// End:0xB87
	if(super.CheckVehicle(B))
	{
		return true;
	}
	// End:0xC64
	if(((((((Vehicle(B.Pawn) != none) || (B.Enemy != none) && B.EnemyVisible()) || LastFailedNodeTeleportTime > (Level.TimeSeconds - float(20))) || ONSPowerCore(SquadObjective) == none) || ONSPlayerReplicationInfo(B.PlayerReplicationInfo) == none) || ONSPowerCore(SquadObjective).HasUsefulVehicles(B)) || (B.Skill + B.Tactics) < (float(2) + FRand()))
	{
		return false;
	}
	// End:0xFC7
	if((VSize(B.Pawn.Location - SquadObjective.Location) > float(5000)) && !B.LineOfSightTo(SquadObjective))
	{
		// End:0xE8E
		if((ONSPowerCore(B.RouteGoal) != none) && ONSPlayerReplicationInfo(B.PlayerReplicationInfo).GetCurrentNode() == B.RouteGoal)
		{
			SourceDist = ONSPowerCore(B.RouteGoal).FinalCoreDistance[int(Abs(1.0000000 - float(Team.TeamIndex)))];
			O = Team.AI.Objectives;
			J0xD57:

			// End:0xE48 [Loop If]
			if(O != none)
			{
				// End:0xE31
				if((O != B.RouteGoal) && ONSOnslaughtGame(Level.Game).ValidSpawnPoint(ONSPowerCore(O), Team.TeamIndex))
				{
					NewRating = ONSPowerCore(O).TeleportRating(B, byte(Team.TeamIndex), SourceDist);
					// End:0xE31
					if((NewRating > BestRating) || (NewRating == BestRating) && FRand() < 0.5000000)
					{
						Best = ONSPowerCore(O);
						BestRating = NewRating;
					}
				}
				O = O.NextObjective;
				// [Loop Continue]
				goto J0xD57;
			}
			// End:0xE78
			if(Best != none)
			{
				ONSPlayerReplicationInfo(B.PlayerReplicationInfo).TeleportTo(Best);				
			}
			else
			{
				LastFailedNodeTeleportTime = Level.TimeSeconds;
			}
			return false;
		}
		Nearest = ONSPowerCore(SquadObjective).ClosestTo(B.Pawn);
		// End:0xF37
		if((((Nearest == none) || int(Nearest.CoreStage) != 0) || int(Nearest.DefenderTeamIndex) != Team.TeamIndex) || VSize(Nearest.Location - B.Pawn.Location) > float(2000))
		{
			return false;
		}
		B.MoveTarget = B.FindPathToward(Nearest, false);
		// End:0xFC7
		if(B.MoveTarget != none)
		{
			B.RouteGoal = Nearest;
			B.GoalString = "Node teleport from " $ string(B.RouteGoal);
			B.SetAttractionState();
			return true;
		}
	}
	return false;
	//return;	
}

function BotEnteredVehicle(Bot B)
{
	local Bot SquadMate, Best;
	local float BestDist, newdist;

	super.BotEnteredVehicle(B);
	// End:0xAC
	if((((!Level.Game.JustStarted(20.0000000) || ONSVehicle(B.Pawn) == none) || !ONSVehicle(B.Pawn).FastVehicle()) || self == Team.AI.FreelanceSquad) || Team.AI.FreelanceSquad == none)
	{
		return;
	}
	// End:0xF5
	if(int(Level.NetMode) == int(NM_Standalone))
	{
		// End:0xF2
		if(Level.GetLocalPlayerController().PlayerReplicationInfo.Team == Team)
		{
			return;
		}		
	}
	else
	{
		// End:0x119
		if(!UnrealMPGameInfo(Level.Game).bPlayersVsBots)
		{
			return;
		}
	}
	SquadMate = Team.AI.FreelanceSquad.SquadMembers;
	J0x13F:

	// End:0x273 [Loop If]
	if(SquadMate != none)
	{
		// End:0x18A
		if((ONSVehicle(SquadMate.Pawn) != none) && ONSVehicle(SquadMate.Pawn).FastVehicle())
		{
			return;			
		}
		else
		{
			// End:0x1F4
			if(Best == none)
			{
				Best = SquadMate;
				// End:0x1E6
				if(Best.Pawn != none)
				{
					BestDist = VSize(Best.Pawn.Location - SquadObjective.Location);					
				}
				else
				{
					BestDist = 1000000.0000000;
				}				
			}
			else
			{
				// End:0x25C
				if(SquadMate.Pawn != none)
				{
					newdist = VSize(SquadMate.Pawn.Location - SquadObjective.Location);
					// End:0x25C
					if(newdist < BestDist)
					{
						Best = SquadMate;
						BestDist = newdist;
					}
				}
			}
		}
		SquadMate = SquadMate.NextSquadMember;
		// [Loop Continue]
		goto J0x13F;
	}
	SwitchBots(B, Best);
	//return;	
}

function float VehicleDesireability(Vehicle V, Bot B)
{
	local float rating;

	// End:0x27B
	if(CurrentOrders == 'Defend')
	{
		// End:0x71
		if(((SquadObjective == none) || VSize(SquadObjective.Location - B.Pawn.Location) < float(2000)) && super.VehicleDesireability(V, B) <= float(0))
		{
			return 0.0000000;
		}
		// End:0xCB
		if(((float(V.Health) < (V.HealthMax * 0.1250000)) && B.Enemy != none) && B.EnemyVisible())
		{
			return 0.0000000;
		}
		rating = V.BotDesireability(self, Team.TeamIndex, SquadObjective);
		// End:0x107
		if(rating <= float(0))
		{
			return 0.0000000;
		}
		// End:0x239
		if(V.bDefensive)
		{
			// End:0x208
			if(ONSPowerCore(SquadObjective) != none)
			{
				// End:0x1DF
				if(((V.bStationary && B.Enemy != none) && ONSPowerCore(SquadObjective).LastDamagedBy == B.Enemy.PlayerReplicationInfo) && !FastTrace(B.Enemy.Location + (B.Enemy.CollisionHeight * vect(0.0000000, 0.0000000, 1.0000000)), V.Location))
				{
					return 0.0000000;
				}
				// End:0x208
				if(ONSPowerCore(SquadObjective).ClosestTo(V) != SquadObjective)
				{
					return 0.0000000;
				}
			}
			// End:0x239
			if((ONSStationaryWeaponPawn(V) != none) && !ONSStationaryWeaponPawn(V).bPowered)
			{
				return 0.0000000;
			}
		}
		// End:0x275
		if(V.SpokenFor(B))
		{
			return rating * V.NewReservationCostMultiplier(B.Pawn);
		}
		return rating;
	}
	return super.VehicleDesireability(V, B);
	//return;	
}

function bool CheckSpecialVehicleObjectives(Bot B)
{
	local ONSPowerCore Core;
	local SquadAI S;

	// End:0x27
	if(ONSTeamAI(Team.AI).OverrideCheckSpecialVehicleObjectives(B))
	{
		return false;
	}
	// End:0x3E
	if(Size > 1)
	{
		return super.CheckSpecialVehicleObjectives(B);
	}
	Core = ONSPowerCore(SquadObjective);
	// End:0xA4
	if(((Core == none) || int(Core.CoreStage) != 4) || !Core.PoweredBy(byte(Team.TeamIndex)))
	{
		return super.CheckSpecialVehicleObjectives(B);
	}
	S = Team.AI.Squads;
	J0xC1:

	// End:0x114 [Loop If]
	if(S != none)
	{
		// End:0xFD
		if((S != self) && S.SquadObjective == Core)
		{
			return super.CheckSpecialVehicleObjectives(B);
		}
		S = S.NextSquad;
		// [Loop Continue]
		goto J0xC1;
	}
	return false;
	//return;	
}

function float GetMaxObjectiveGetOutDist()
{
	local SVehicleFactory F;

	// End:0x59
	if(MaxObjectiveGetOutDist == 0.0000000)
	{
		// End:0x58
		foreach DynamicActors(Class'Engine.SVehicleFactory', F)
		{
			// End:0x57
			if(F.VehicleClass != none)
			{
				MaxObjectiveGetOutDist = FMax(MaxObjectiveGetOutDist, F.VehicleClass.default.ObjectiveGetOutDist);
			}			
		}		
	}
	return MaxObjectiveGetOutDist;
	//return;	
}

function bool CheckSquadObjectives(Bot B)
{
	local bool bResult;

	// End:0xB0
	if((B.Enemy != none) && B.Enemy == ONSTeamAI(Team.AI).FinalCore.LastAttacker)
	{
		// End:0xAE
		if(B.NeedWeapon() && B.FindInventoryGoal(0.0000000))
		{
			B.GoalString = "Need weapon or ammo";
			B.SetAttractionState();
			return true;
		}
		return false;
	}
	// End:0x131
	if(!ONSTeamAI(Team.AI).bAllNodesTaken && self == Team.AI.FreelanceSquad)
	{
		// End:0x131
		if(int(ONSPowerCore(SquadObjective).DefenderTeamIndex) == Team.TeamIndex)
		{
			Team.AI.ReAssessStrategy();
		}
	}
	bResult = super.CheckSquadObjectives(B);
	// End:0x243
	if(((!bResult && CurrentOrders == 'Freelance') && B.Enemy == none) && ONSPowerCore(SquadObjective) != none)
	{
		// End:0x1F2
		if(ONSPowerCore(SquadObjective).PoweredBy(byte(Team.TeamIndex)))
		{
			B.GoalString = "Disable Objective " $ string(SquadObjective);
			return SquadObjective.TellBotHowToDisable(B);			
		}
		else
		{
			// End:0x243
			if(!B.LineOfSightTo(SquadObjective))
			{
				B.GoalString = "Harass enemy at " $ string(SquadObjective);
				return FindPathToObjective(B, SquadObjective);
			}
		}
	}
	return bResult;
	//return;	
}

function float ModifyThreat(float Current, Pawn NewThreat, bool bThreatVisible, Bot B)
{
	// End:0x18B
	if((((NewThreat.PlayerReplicationInfo != none) && ONSPowerCore(SquadObjective) != none) && ONSPowerCore(SquadObjective).LastDamagedBy == NewThreat.PlayerReplicationInfo) && ONSPowerCore(SquadObjective).bUnderAttack)
	{
		// End:0xA2
		if(NewThreat == ONSTeamAI(Team.AI).FinalCore.LastAttacker)
		{
			return Current + float(6);
		}
		// End:0xBA
		if(!bThreatVisible)
		{
			return Current + 0.5000000;
		}
		// End:0x17B
		if((((VSize(B.Pawn.Location - NewThreat.Location) < float(2000)) || B.Pawn.IsA('Vehicle')) || B.Pawn.Weapon.bSniping) || float(ONSPowerCore(SquadObjective).Health) < (float(ONSPowerCore(SquadObjective).DamageCapacity) * 0.5000000))
		{
			return Current + float(6);			
		}
		else
		{
			return Current + 1.5000000;
		}		
	}
	else
	{
		return Current;
	}
	//return;	
}

function bool MustKeepEnemy(Pawn E)
{
	// End:0x98
	if((E.PlayerReplicationInfo != none) && ONSPowerCore(SquadObjective) != none)
	{
		// End:0x67
		if(ONSPowerCore(SquadObjective).bUnderAttack && ONSPowerCore(SquadObjective).LastDamagedBy == E.PlayerReplicationInfo)
		{
			return true;
		}
		// End:0x98
		if(E == ONSTeamAI(Team.AI).FinalCore.LastAttacker)
		{
			return true;
		}
	}
	return false;
	//return;	
}

function MergeWith(SquadAI S)
{
	// End:0x45
	if(SquadObjective != S.SquadObjective)
	{
		SquadObjective = S.SquadObjective;
		NetUpdateTime = Level.TimeSeconds - float(1);
	}
	//return;	
}

defaultproperties
{
	GatherThreshold=0.0000000
	MaxSquadSize=3
	bAddTransientCosts=true
}
