class W54Dropper extends Actor
	notplaceable;

var Class<Projectile> BombClass;
var float DropDelay;

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
	Spawn(BombClass,,, Location - ((CollisionHeight + BombClass.default.CollisionHeight) * vect(0.0000000, 0.0000000, 2.0000000)), Rotator(vect(0.0000000, 0.0000000, -1.0000000)));
	Destroy();
	//return;	
}

defaultproperties
{
	BombClass=Class'BWBPAirstrikesPro.W54Projectile'
	DropDelay=4.0000000
	bHidden=true
	bAlwaysRelevant=true
}
