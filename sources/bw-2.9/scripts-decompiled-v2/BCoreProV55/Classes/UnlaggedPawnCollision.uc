class UnlaggedPawnCollision extends Actor
	notplaceable;

const LADDER_SANITY_DIST = 128;

struct SavedRotation
{
	var Rotator Rotation;
	var float Time;
};

var() float MaxUnlagTime;
var xPawn UnlaggedPawn;
var bool bUnlagged;
var float LastLocationUpdateTime;
var InterpCurve LocX;
var InterpCurve LocY;
var InterpCurve LocZ;
var InterpCurve CollRadius;
var InterpCurve CollHeight;
var array<SavedRotation> Rotations;
var bool PawnCollideActors;
var bool PawnBlockActors;
var bool PawnBlockPlayers;

function Tick(float DeltaTime)
{
	// End:0x11
	if(UnlaggedPawn != none)
	{
		UpdateUnlagLocation();
	}
	//return;	
}

final function bool HasCompatiblePhysics(xPawn P)
{
	return (((int(P.Physics) == int(1)) || int(P.Physics) == int(2)) || int(P.Physics) == int(11)) || int(P.Physics) == int(4);
	//return;	
}

final function UpdateUnlagLocation()
{
	local int i;

	// End:0x42
	if(((LastLocationUpdateTime == Level.TimeSeconds) || !UnlaggedPawn.bCollideActors) || !HasCompatiblePhysics(UnlaggedPawn))
	{
		return;
	}
	LastLocationUpdateTime = Level.TimeSeconds;
	J0x56:

	// End:0xCF [Loop If]
	if((LocX.Points.Length > 1) && LocX.Points[1].InVal < (LastLocationUpdateTime - MaxUnlagTime))
	{
		LocX.Points.Remove(0, 1);
		LocY.Points.Remove(0, 1);
		LocZ.Points.Remove(0, 1);
		CollRadius.Points.Remove(0, 1);
		CollHeight.Points.Remove(0, 1);
		// [Loop Continue]
		goto J0x56;
	}
	J0xCF:

	// End:0x105 [Loop If]
	if((Rotations.Length > 1) && Rotations[1].Time < (LastLocationUpdateTime - MaxUnlagTime))
	{
		Rotations.Remove(0, 1);
		// [Loop Continue]
		goto J0xCF;
	}
	i = LocX.Points.Length;
	LocX.Points.Length = i + 1;
	LocX.Points[i].InVal = LastLocationUpdateTime;
	LocX.Points[i].OutVal = UnlaggedPawn.Location.X;
	LocY.Points.Length = i + 1;
	LocY.Points[i].InVal = LastLocationUpdateTime;
	LocY.Points[i].OutVal = UnlaggedPawn.Location.Y;
	LocZ.Points.Length = i + 1;
	LocZ.Points[i].InVal = LastLocationUpdateTime;
	LocZ.Points[i].OutVal = UnlaggedPawn.Location.Z;
	CollRadius.Points.Length = i + 1;
	CollRadius.Points[i].InVal = LastLocationUpdateTime;
	CollRadius.Points[i].OutVal = UnlaggedPawn.CollisionRadius;
	CollHeight.Points.Length = i + 1;
	CollHeight.Points[i].InVal = LastLocationUpdateTime;
	CollHeight.Points[i].OutVal = UnlaggedPawn.CollisionHeight;
	i = Rotations.Length;
	Rotations.Length = i + 1;
	Rotations[i].Rotation = UnlaggedPawn.Rotation;
	Rotations[i].Time = LastLocationUpdateTime;
	//return;	
}

final function EnableUnlag(float PingTime)
{
	local Vector UnlaggedLocation;
	local float UnlagTime;
	local Range UnlagTimeRange;
	local float UnlaggedRadius, UnlaggedHeight;
	local int i;

	// End:0x54
	if((((int(Level.NetMode) == int(NM_Standalone)) || UnlaggedPawn == none) || !UnlaggedPawn.bCollideActors) || UnlaggedPawn.Health <= 0)
	{
		return;
	}
	UpdateUnlagLocation();
	InterpCurveGetInputDomain(LocX, UnlagTimeRange.Min, UnlagTimeRange.Max);
	UnlagTime = FClamp(Level.TimeSeconds - PingTime, Level.TimeSeconds - MaxUnlagTime, UnlagTimeRange.Max);
	UnlaggedRadius = InterpCurveEval(CollRadius, UnlagTime);
	UnlaggedHeight = InterpCurveEval(CollHeight, UnlagTime);
	UnlagTime = FClamp(Level.TimeSeconds - PingTime, UnlagTimeRange.Min, UnlagTimeRange.Max);
	UnlaggedLocation.X = InterpCurveEval(LocX, UnlagTime);
	UnlaggedLocation.Y = InterpCurveEval(LocY, UnlagTime);
	UnlaggedLocation.Z = InterpCurveEval(LocZ, UnlagTime);
	SetLocation(UnlaggedLocation);
	SetCollisionSize(UnlaggedRadius, UnlaggedHeight);
	// End:0x196
	if((UnlaggedRadius == float(0)) || UnlaggedHeight == float(0))
	{
		return;
	}
	// End:0x1D3
	if((int(UnlaggedPawn.Physics) == int(11)) && VSize(Location - UnlaggedPawn.Location) > float(128))
	{
		return;
	}
	SetCollision(true, true, true);
	UnlaggedPawn.bBlockZeroExtentTraces = false;
	UnlaggedPawn.bBlockNonZeroExtentTraces = false;
	i = 0;
	J0x202:

	// End:0x23B [Loop If]
	if((i < (Rotations.Length - 1)) && Rotations[i].Time >= UnlagTime)
	{
		++i;
		// [Loop Continue]
		goto J0x202;
	}
	SetRotation(Rotations[i].Rotation);
	bUnlagged = true;
	//return;	
}

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType)
{
	// End:0x1A
	if(!bUnlagged || UnlaggedPawn == none)
	{
		return;
	}
	UnlaggedPawn.TakeDamage(Damage, instigatedBy, HitLocation, Momentum, DamageType);
	//return;	
}

final function DisableUnlag()
{
	// End:0x1B
	if(int(Level.NetMode) == int(NM_Standalone))
	{
		return;
	}
	// End:0x28
	if(!bUnlagged)
	{
		return;
	}
	UnlaggedPawn.bBlockZeroExtentTraces = true;
	UnlaggedPawn.bBlockNonZeroExtentTraces = true;
	SetCollision(false, false, false);
	bUnlagged = false;
	//return;	
}

defaultproperties
{
	MaxUnlagTime=1.0000000
	bHidden=true
	RemoteRole=0
}
