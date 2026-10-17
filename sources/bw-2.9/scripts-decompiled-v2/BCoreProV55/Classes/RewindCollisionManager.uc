class RewindCollisionManager extends Object;

var LevelInfo Level;
var array<UnlaggedPawnCollision> Collisions;
var int StackCount;

final function RegisterPawn(xPawn Pawn)
{
	local int Index;

	Index = 0;
	J0x07:

	// End:0x41 [Loop If]
	if((Index < Collisions.Length) && Collisions[Index].UnlaggedPawn != Pawn)
	{
		++Index;
		// [Loop Continue]
		goto J0x07;
	}
	// End:0x53
	if(Index < Collisions.Length)
	{
		return;
	}
	Collisions.Insert(Collisions.Length, 1);
	Collisions[Index] = Pawn.Spawn(Class'BCoreProV55.UnlaggedPawnCollision');
	Collisions[Index].UnlaggedPawn = Pawn;
	//return;	
}

final function UnregisterPawn(xPawn Pawn)
{
	local int Index;

	Index = 0;
	J0x07:

	// End:0x41 [Loop If]
	if((Index < Collisions.Length) && Collisions[Index].UnlaggedPawn != Pawn)
	{
		++Index;
		// [Loop Continue]
		goto J0x07;
	}
	// End:0x7D
	if(Index < Collisions.Length)
	{
		// End:0x71
		if(StackCount > 0)
		{
			Collisions[Index].DisableUnlag();
		}
		Collisions.Remove(Index, 1);
	}
	//return;	
}

final function RewindCollisions(Actor Requester, float latency)
{
	local int i;

	// End:0x36
	if((int(Level.NetMode) != int(NM_DedicatedServer)) && int(Level.NetMode) != int(NM_ListenServer))
	{
		return;
	}
	// End:0x9A
	if(StackCount == 0)
	{
		i = 0;
		J0x48:

		// End:0x9A [Loop If]
		if(i < Collisions.Length)
		{
			// End:0x90
			if(Collisions[i].UnlaggedPawn != Requester)
			{
				Collisions[i].EnableUnlag(latency);
			}
			++i;
			// [Loop Continue]
			goto J0x48;
		}
	}
	++StackCount;
	//return;	
}

final function RestoreCollisions()
{
	local int i;

	// End:0x43
	if((StackCount == 0) || (int(Level.NetMode) != int(NM_DedicatedServer)) && int(Level.NetMode) != int(NM_ListenServer))
	{
		return;
	}
	--StackCount;
	// End:0x8B
	if(StackCount == 0)
	{
		i = 0;
		J0x5C:

		// End:0x8B [Loop If]
		if(i < Collisions.Length)
		{
			Collisions[i].DisableUnlag();
			++i;
			// [Loop Continue]
			goto J0x5C;
		}
	}
	//return;	
}

