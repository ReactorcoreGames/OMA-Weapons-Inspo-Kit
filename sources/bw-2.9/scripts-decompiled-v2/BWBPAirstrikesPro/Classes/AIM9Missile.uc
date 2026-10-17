class AIM9Missile extends AIM9Rocket;

var(Lock) float LockTime;
var(Lock) Range LockDelay;
var(Lock) bool bLocked;
var(Lock) float MaxLockRange;
var(Lock) bool bSelfDestruct;

static final function float Relate(float RelativeValue, Range R)
{
	return R.Min + ((R.Max - R.Min) * RelativeValue);
	//return;	
}

event PostNetBeginPlay()
{
	super(Actor).PostNetBeginPlay();
	SetLockTime();
	//return;	
}

function SetLockTime()
{
	LockTime = Level.TimeSeconds + Relate(FRand(), LockDelay);
	//return;	
}

event Tick(float DeltaTime)
{
	super(AIM9RocketBase).Tick(DeltaTime);
	CheckLock();
	//return;	
}

function CheckLock()
{
	// End:0x5A
	if(((GetTarget()) == none) && Level.TimeSeconds > LockTime)
	{
		Lock();
		// End:0x5A
		if(bSelfDestruct && (GetTarget()) == none)
		{
			TakeDamage(20000, none, Location, Velocity, none);
		}
	}
	//return;	
}

function Lock()
{
	LockTarget = AcquirePawn();
	//return;	
}

function Vehicle AcquireVehicle()
{
	local Vehicle V, Best;
	local float CurrentDistance, ShortestDistance;

	ShortestDistance = MaxLockRange;
	V = Level.Game.VehicleList;
	J0x28:

	// End:0xEF [Loop If]
	if(V != none)
	{
		// End:0xD8
		if(((Instigator.GetTeamNum() != V.GetTeamNum()) && V.Health > 0) && !V.IsVehicleEmpty())
		{
			CurrentDistance = VSize(V.Location - Location);
			// End:0xD8
			if(CurrentDistance < ShortestDistance)
			{
				// End:0xD8
				if(FastTrace(V.Location))
				{
					Best = V;
					ShortestDistance = CurrentDistance;
				}
			}
		}
		V = V.NextVehicle;
		// [Loop Continue]
		goto J0x28;
	}
	return Best;
	//return;	
}

function Pawn AcquirePawn()
{
	local Pawn Target;
	local float Aim, Distance;

	// End:0x57
	if((Instigator != none) && Instigator.Controller != none)
	{
		Target = Instigator.Controller.PickTarget(Aim, Distance, Vector(Rotation), Location, MaxLockRange);
	}
	return Target;
	//return;	
}

defaultproperties
{
	LockDelay=(Min=0.0100000,Max=0.0200000)
	MaxLockRange=30000.0000000
}
