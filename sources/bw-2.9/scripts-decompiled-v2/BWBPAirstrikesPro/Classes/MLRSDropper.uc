class MLRSDropper extends Actor
	notplaceable;

var Class<Projectile> BombClass;
var float DropDelay;
var int BombsLeft;
var int DispersionRadius;

simulated function PostBeginPlay()
{
	super.PostBeginPlay();
	// End:0x40
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		Level.GetLocalPlayerController().PlayStatusAnnouncement('Incoming_air', 0, true);
	}
	SetTimer(DropDelay, false);
	//return;	
}

function Timer()
{
	GotoState('Bombard');
	//return;	
}

state Bombard
{
	function Timer()
	{
		local Vector Displacement;

		Displacement.X = float(Rand(DispersionRadius * 2) - DispersionRadius) * Sqrt(FRand());
		Displacement.Y = float(Rand(DispersionRadius * 2) - DispersionRadius) * Sqrt(FRand());
		Spawn(BombClass,,, (Location + Displacement) - ((CollisionHeight + BombClass.default.CollisionHeight) * vect(0.0000000, 0.0000000, 2.0000000)), Rotator(vect(0.0000000, 0.0000000, -1.0000000)));
		BombsLeft--;
		// End:0xAA
		if(BombsLeft < 1)
		{
			Destroy();
		}
		//return;		
	}
Begin:

	SetTimer(0.7500000, true);
	stop;			
}

defaultproperties
{
	BombClass=Class'BWBPAirstrikesPro.MLRSProjectile'
	DropDelay=6.0000000
	BombsLeft=12
	DispersionRadius=3072
	bHidden=true
	bAlwaysRelevant=true
}
