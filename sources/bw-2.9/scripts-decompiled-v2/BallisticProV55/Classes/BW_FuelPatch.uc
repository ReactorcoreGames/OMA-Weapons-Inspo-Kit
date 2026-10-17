class BW_FuelPatch extends BallisticEmitter;

var() float Fuel;
var() float MaxFuel;
var() float DrainRate;
var() int Extent;
var byte NetFuel;
var() bool bCanIgnite;
var() bool bCanFeed;
var bool bIgnited;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		NetFuel, bIgnited;
}

function Reset()
{
	Destroy();
	//return;	
}

simulated event PostNetReceive()
{
	Fuel = float(NetFuel);
	FuelChanged();
	//return;	
}

simulated function Ignite(Pawn EventInstigator)
{
	bIgnited = true;
	//return;	
}

function SetFuel(float Amount)
{
	Fuel = Amount;
	NetFuel = byte(Fuel);
	FuelChanged();
	//return;	
}

function AddFuel(float Amount)
{
	SetFuel(FMin(Fuel + Amount, MaxFuel));
	//return;	
}

simulated function FuelChanged()
{
	//return;	
}

simulated function FuelOut()
{
	SetTimer(0.0000000, false);
	Kill();
	//return;	
}

simulated event PostBeginPlay()
{
	super.PostBeginPlay();
	SetTimer(0.5000000, true);
	//return;	
}

simulated event Timer()
{
	Fuel -= (TimerRate * DrainRate);
	FuelChanged();
	// End:0x2C
	if(Fuel <= float(0))
	{
		FuelOut();
	}
	//return;	
}

defaultproperties
{
	Fuel=10.0000000
	MaxFuel=100.0000000
	DrainRate=1.0000000
	Extent=48
	bCanIgnite=true
	bCanFeed=true
	bNetNotify=true
}
