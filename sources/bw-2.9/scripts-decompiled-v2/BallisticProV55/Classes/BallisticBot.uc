class BallisticBot extends xBot
	config(User);

function MaySlideToMoveTarget()
{
	local Vector Dir, NewDir;
	local float dist, newdist;
	local Actor OldMoveTarget;

	// End:0x3B
	if((int(Pawn.Physics) != int(1)) || (FRand() > 0.8500000) && RoadPathNode(MoveTarget) == none)
	{
		return;
	}
	// End:0x6E
	if((bTranslocatorHop || Focus != MoveTarget) && (Skill + Tactics) < float(4))
	{
		return;
	}
	Dir = MoveTarget.Location - Pawn.Location;
	dist = VSize(Dir);
	OldMoveTarget = MoveTarget;
	// End:0x1F8
	if((dist < float(600)) || Dir.Z < float(0))
	{
		// End:0x126
		if((((PathNode(MoveTarget) == none) && PlayerStart(MoveTarget) == none) || MoveTarget != RouteCache[0]) || RouteCache[0] == none)
		{
			// End:0x123
			if(dist < float(100))
			{
				return;
			}			
		}
		else
		{
			// End:0x1F8
			if(RouteCache[1] != none)
			{
				// End:0x177
				if((Pawn.Location.Z + 35.0000000) < RouteCache[1].Location.Z)
				{
					// End:0x177
					if(dist < float(100))
					{
						return;
					}
				}
				NewDir = RouteCache[1].Location - Pawn.Location;
				newdist = VSize(NewDir);
				// End:0x1E8
				if((newdist > float(400)) && CanMakePathTo(RouteCache[1]))
				{
					dist = newdist;
					MoveTarget = RouteCache[1];					
				}
				else
				{
					// End:0x1F8
					if(dist < float(100))
					{
						return;
					}
				}
			}
		}
	}
	// End:0x212
	if(Focus == OldMoveTarget)
	{
		Focus = MoveTarget;
	}
	Destination = MoveTarget.Location;
	BallisticPawn(Pawn).StartSlide();
	//return;	
}

function bool CanSprint()
{
	// End:0x7B
	if((BallisticPawn(Pawn) != none) && BallisticPawn(Pawn).Sprinter != none)
	{
		// End:0x7B
		if(((Skill > (float(1) + (4.5000000 * FRand()))) && BallisticPawn(Pawn).Sprinter.Stamina >= 20.0000000) && FRand() > 0.2000000)
		{
			return true;
		}
	}
	return false;
	//return;	
}

state Roaming
{
	event NotifyPostLanded()
	{
		super(Bot).NotifyPostLanded();
		//return;		
	}

	function EndState()
	{
		super(Object).EndState();
		Jumpiness -= 0.3000000;
		// End:0x5A
		if((BallisticPawn(Pawn) != none) && BallisticPawn(Pawn).Sprinter != none)
		{
			BallisticPawn(Pawn).Sprinter.StopSprint();
		}
		//return;		
	}
Begin:

	SwitchToBestWeapon();
	WaitForLanding();
	// End:0xF3
	if(((Pawn.bCanPickupInventory && InventorySpot(MoveTarget) != none) && int(Squad.PriorityObjective(self)) == 0) && Vehicle(Pawn) == none)
	{
		MoveTarget = InventorySpot(MoveTarget).GetMoveTargetFor(self, 5.0000000);
		// End:0xF3
		if((Pickup(MoveTarget) != none) && !Pickup(MoveTarget).ReadyToPickup(0.0000000))
		{
			CampTime = MoveTarget.LatentFloat;
			GoalString = "Short wait for inventory " $ string(MoveTarget);
			GotoState('RestFormation', 'ShortWait');
		}
	}
	MoveToward(MoveTarget, FaceActor(1.0000000), GetDesiredOffset(), ShouldStrafeTo(MoveTarget));
	// End:0x149
	if(CanSprint())
	{
		BallisticPawn(Pawn).Sprinter.StartSprint();
		Jumpiness += 0.3000000;
	}
DoneRoaming:


	WaitForLanding();
	WhatToDoNext(12);
	// End:0x176
	if(bSoaking)
	{
		SoakStop("STUCK IN ROAMING!");
	}
	stop;		
}

state Fallback
{
	event NotifyPostLanded()
	{
		super(Bot).NotifyPostLanded();
		//return;		
	}

	function EndState()
	{
		super(Object).EndState();
		Jumpiness -= 0.3000000;
		// End:0x5A
		if((BallisticPawn(Pawn) != none) && BallisticPawn(Pawn).Sprinter != none)
		{
			BallisticPawn(Pawn).Sprinter.StopSprint();
		}
		//return;		
	}
Begin:

	WaitForLanding();
moving:


	// End:0x59
	if((Pawn.bCanPickupInventory && InventorySpot(MoveTarget) != none) && Vehicle(Pawn) == none)
	{
		MoveTarget = InventorySpot(MoveTarget).GetMoveTargetFor(self, 0.0000000);
	}
	MoveToward(MoveTarget, FaceActor(1.0000000), GetDesiredOffset(), ShouldStrafeTo(MoveTarget));
	// End:0xAF
	if(CanSprint())
	{
		BallisticPawn(Pawn).Sprinter.StartSprint();
		Jumpiness += 0.3000000;
	}
	WhatToDoNext(14);
	// End:0xDA
	if(bSoaking)
	{
		SoakStop("STUCK IN FALLBACK!");
	}
	GoalString = GoalString $ " STUCK IN FALLBACK!";
	stop;				
}

defaultproperties
{
	PawnClass=Class'BallisticProV55.BallisticPawn'
}
