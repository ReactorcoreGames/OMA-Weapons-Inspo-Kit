class DMSquad extends SquadAI
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

function AssignCombo(Bot B)
{
	// End:0x41
	if((B.Enemy != none) && B.EnemyVisible())
	{
		B.TryCombo("DMRandom");
	}
	//return;	
}

function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
{
	local string EnemyList;
	local int i;

	Canvas.SetDrawColor(byte(255), byte(255), byte(255));
	EnemyList = "     Enemies: ";
	i = 0;
	J0x38:

	// End:0x81 [Loop If]
	if(i < 8)
	{
		// End:0x77
		if(Enemies[i] != none)
		{
			EnemyList = EnemyList @ Enemies[i].GetHumanReadableName();
		}
		i++;
		// [Loop Continue]
		goto J0x38;
	}
	Canvas.DrawText(EnemyList, false);
	YPos += YL;
	Canvas.SetPos(4.0000000, YPos);
	//return;	
}

function bool IsDefending(Bot B)
{
	return false;
	//return;	
}

function AddBot(Bot B)
{
	super.AddBot(B);
	SquadLeader = B;
	//return;	
}

function RemoveBot(Bot B)
{
	// End:0x16
	if(B.Squad != self)
	{
		return;
	}
	Destroy();
	//return;	
}

function bool ShouldDeferTo(Controller C)
{
	return false;
	//return;	
}

function bool CheckSquadObjectives(Bot B)
{
	return false;
	//return;	
}

function bool WaitAtThisPosition(Pawn P)
{
	return false;
	//return;	
}

function bool NearFormationCenter(Pawn P)
{
	return true;
	//return;	
}

function bool BeDevious()
{
	return (SquadMembers.Skill >= float(4)) && FRand() < (0.6500000 - (0.1500000 * float(Level.Game.NumBots)));
	//return;	
}

function name GetOrders()
{
	return CurrentOrders;
	//return;	
}

function bool SetEnemy(Bot B, Pawn NewEnemy)
{
	local bool bResult;

	// End:0x78
	if((((NewEnemy == none) || NewEnemy.Health <= 0) || NewEnemy.Controller == none) || (Bot(NewEnemy.Controller) != none) && Bot(NewEnemy.Controller).Squad == self)
	{
		return false;
	}
	AddEnemy(NewEnemy);
	bResult = FindNewEnemyFor(B, (B.Enemy != none) && B.LineOfSightTo(SquadMembers.Enemy));
	// End:0x105
	if(bResult && B.Enemy == NewEnemy)
	{
		B.AcquireTime = Level.TimeSeconds;
	}
	return bResult;
	//return;	
}

function bool FriendlyToward(Pawn Other)
{
	return false;
	//return;	
}

function bool AssignSquadResponsibility(Bot B)
{
	local Pawn PlayerPawn;
	local PlayerController C;
	local Actor MoveTarget;

	AssignCombo(B);
	// End:0x3B0
	if(B.Enemy == none)
	{
		// End:0x262
		if(((B.Skill > float(5)) && Level.Game.NumBots == 1) && (B.Pawn.Weapon.AIRating > 0.7000000) || B.Pawn.Weapon.bSniping)
		{
			// End:0x261
			foreach __NFUN_325__(Class'Engine.PlayerController', C)
			{
				// End:0x260
				if(C.Pawn != none)
				{
					PlayerPawn = C.Pawn;
					// End:0x1E0
					if(((Level.TimeSeconds - C.Pawn.noise1time) < float(5)) || (Level.TimeSeconds - C.Pawn.noise2time) < float(5))
					{
						B.bHuntPlayer = true;
						// End:0x1DA
						if(((Level.TimeSeconds - C.Pawn.noise1time) < float(2)) || (Level.TimeSeconds - C.Pawn.noise2time) < float(2))
						{
							B.LastKnownPosition = C.Pawn.Location;
						}
						// End:0x261
						break;
						// End:0x260
						continue;
					}
					// End:0x260
					if((VSize(B.LastKnownPosition - C.Pawn.Location) < float(800)) || VSize(B.LastKillerPosition - C.Pawn.Location) < float(800))
					{
						B.bHuntPlayer = true;
						// End:0x261
						break;
					}
				}				
			}			
		}
		// End:0x2A1
		if(B.FindInventoryGoal(InventorySearchWeight(B)))
		{
			B.bHuntPlayer = false;
			B.SetAttractionState();
			return true;
		}
		// End:0x3A0
		if(B.bHuntPlayer)
		{
			B.bHuntPlayer = false;
			B.GoalString = "Hunt Player";
			// End:0x302
			if(B.actorReachable(PlayerPawn))
			{
				MoveTarget = PlayerPawn;				
			}
			else
			{
				MoveTarget = B.FindPathToward(PlayerPawn, B.Pawn.bCanPickupInventory && Vehicle(B.Pawn) == none);
			}
			// End:0x3A0
			if(MoveTarget != none)
			{
				B.MoveTarget = MoveTarget;
				// End:0x38F
				if(B.CanSee(PlayerPawn))
				{
					SetEnemy(B, PlayerPawn);
				}
				B.SetAttractionState();
				return true;
			}
		}
		return B.FindRoamDest();
	}
	return false;
	//return;	
}

function float InventorySearchWeight(Bot B)
{
	local Inventory Inv;

	Inv = B.Pawn.Inventory;
	J0x1D:

	// End:0x76 [Loop If]
	if(Inv != none)
	{
		// End:0x5F
		if((Weapon(Inv) != none) && Weapon(Inv).AmmoStatus(0) < 0.5000000)
		{
			return 0.0000000;
		}
		Inv = Inv.Inventory;
		// [Loop Continue]
		goto J0x1D;
	}
	return 0.0001650;
	//return;	
}

defaultproperties
{
	CurrentOrders="Freelance"
}
