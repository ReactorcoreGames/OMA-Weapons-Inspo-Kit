class M763GasCollider extends Actor
	placeable;

var AvoidMarker Fear;

function PostBeginPlay()
{
	super.PostBeginPlay();
	// End:0x52
	if(int(Level.NetMode) != int(NM_Client))
	{
		Fear = Spawn(Class'Engine.AvoidMarker');
		Fear.SetCollisionSize(200.0000000, 200.0000000);
		Fear.StartleBots();
	}
	//return;	
}

function Reset()
{
	Destroy();
	//return;	
}

function Destroyed()
{
	// End:0x17
	if(Fear != none)
	{
		Fear.Destroy();
	}
	super.Destroyed();
	//return;	
}

function PhysicsVolumeChange(PhysicsVolume NewVolume)
{
	// End:0x15
	if(NewVolume.bWaterVolume)
	{
		Destroy();
	}
	//return;	
}

defaultproperties
{
	bHidden=true
	LifeSpan=6.0000000
	CollisionRadius=150.0000000
	CollisionHeight=150.0000000
	bCollideActors=true
	bUseCylinderCollision=true
}
