class WallPenetrationUtil extends Actor
	notplaceable;

struct TraceInfo
{
	var() Vector Start;
	var() Vector End;
	var() Vector HitNormal;
	var() Vector HitLocation;
	var() Vector Extent;
	var() Material HitMaterial;
	var() Actor HitActor;
};

static function bool IsBackface(Vector Norm, Vector Dir)
{
	return (Normal(Dir) Dot Normal(Norm)) > 0.0000000;
	//return;	
}

static function bool PointInSolid(Actor Tracer, Vector V)
{
	return !Tracer.FastTrace(V, V + vect(1.0000000, 1.0000000, 1.0000000));
	//return;	
}

static function TraceInfo GetTraceInfo(Actor Tracer, Vector End, Vector Start, optional bool bTraceActors, optional Vector Extent)
{
	local TraceInfo TI;

	TI.Start = Start;
	TI.End = End;
	TI.Extent = Extent;
	TI.HitActor = Tracer.Trace(TI.HitLocation, TI.HitNormal, TI.End, TI.Start, bTraceActors, TI.Extent, TI.HitMaterial);
	// End:0xAE
	if(TI.HitActor == none)
	{
		TI.HitLocation = TI.End;
	}
	return TI;
	//return;	
}

static function int GetSurfaceType(Actor Other, Material HitMaterial)
{
	local int Surf;

	// End:0x1B
	if(Vehicle(Other) != none)
	{
		Surf = 3;		
	}
	else
	{
		// End:0x3F
		if(HitMaterial == none)
		{
			Surf = int(Other.SurfaceType);			
		}
		else
		{
			Surf = int(HitMaterial.SurfaceType);
		}
	}
	return Surf;
	//return;	
}

static function bool GoThroughWall(Actor Source, Actor Instigator, Vector EntryLocation, Vector EntryNormal, float MaxWallDepth, Vector Dir, out Vector ExitLocation, out Vector ExitNormal, optional out Material ExitMat)
{
	local TraceInfo TBack, TFore;
	local float CheckDist;
	local Vector Test, HLoc, HNorm;
	local Pawn A;

	// End:0x0F
	if(MaxWallDepth <= float(0))
	{
		return false;
	}
	// End:0x13A
	foreach Source.CollidingActors(Class'Engine.Pawn', A, MaxWallDepth, EntryLocation)
	{
		// End:0x88
		if(((A == none) || A == Instigator) || A.TraceThisActor(HLoc, HNorm, EntryLocation + (Dir * MaxWallDepth), EntryLocation))
		{
			continue;			
		}
		TBack = GetTraceInfo(Source, EntryLocation, HLoc, false);
		// End:0x113
		if(TBack.HitActor != none)
		{
			// End:0x110
			if(VSize(TBack.HitLocation - EntryLocation) <= MaxWallDepth)
			{
				ExitLocation = TBack.HitLocation + (Dir * float(1));
				ExitNormal = TBack.HitNormal;
				ExitMat = TBack.HitMaterial;				
				return true;
			}
			// End:0x139
			continue;
		}
		ExitLocation = EntryLocation + (Dir * float(48));
		ExitNormal = Dir;		
		return true;		
	}	
	CheckDist = MaxWallDepth;
	J0x146:

	// End:0x3B3 [Loop If]
	if(CheckDist > float(0))
	{
		Test = EntryLocation + (Dir * CheckDist);
		// End:0x182
		if(PointInSolid(Source, Test))
		{			
		}
		else
		{
			TBack = GetTraceInfo(Source, Test - (Dir * CheckDist), Test, true);
			// End:0x1BE
			if(TBack.HitActor == none)
			{
				return false;
			}
			// End:0x227
			if(!TBack.HitActor.bWorldGeometry && Mover(TBack.HitActor) == none)
			{
				ExitLocation = TBack.HitLocation - (Dir * TBack.HitActor.CollisionRadius);
				ExitNormal = Dir;
				return true;
			}
			// End:0x2A1
			if((VSize(TBack.HitLocation - TBack.Start) > 0.5000000) && IsBackface(TBack.HitNormal, Dir))
			{
				ExitLocation = TBack.HitLocation + (Dir * float(1));
				ExitNormal = TBack.HitNormal;
				ExitMat = TBack.HitMaterial;
				return true;
			}
			TFore = GetTraceInfo(Source, Test + (Dir * float(2000)), Test, true);
			// End:0x39C
			if(VSize(TFore.HitLocation - TFore.Start) > 0.5000000)
			{
				// End:0x33F
				if(TFore.HitActor == none)
				{
					ExitLocation = TBack.HitLocation + (Dir * float(1));
					ExitNormal = -TBack.HitNormal;
					ExitMat = TBack.HitMaterial;
					return true;
				}
				// End:0x35C
				if(IsBackface(TFore.HitNormal, Dir))
				{
					return false;					
				}
				else
				{
					ExitLocation = TBack.HitLocation + (Dir * float(1));
					ExitNormal = -TBack.HitNormal;
					ExitMat = TBack.HitMaterial;
					return true;
				}
			}
			return false;
		}
		CheckDist -= (MaxWallDepth / float(4));
		// [Loop Continue]
		goto J0x146;
	}
	return false;
	//return;	
}

