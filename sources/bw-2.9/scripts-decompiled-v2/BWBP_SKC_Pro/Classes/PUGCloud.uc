class PUGCloud extends BallisticEmitter;

var AvoidMarker Fear;
var PUGCloudControl MyControl;
var float Density;

simulated function PostBeginPlay()
{
	super.PostBeginPlay();
	MyControl = PUGCloudControl(Owner);
	// End:0xA1
	if(int(Level.NetMode) != int(NM_Client))
	{
		Fear = Spawn(Class'Engine.AvoidMarker');
		Fear.SetCollisionSize(200.0000000, 200.0000000);
		Fear.StartleBots();
		// End:0xA1
		if(int(Level.NetMode) == int(NM_DedicatedServer))
		{
			Emitters[0].Disabled = true;
			Emitters[1].Disabled = true;
		}
	}
	//return;	
}

function Reset()
{
	Destroy();
	//return;	
}

simulated function Terminate(float Delay)
{
	SetTimer(Delay, false);
	//return;	
}

simulated function Timer()
{
	// End:0x23
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		GotoState('DSDying');		
	}
	else
	{
		Kill();
	}
	//return;	
}

simulated function Destroyed()
{
	// End:0x1B
	if(MyControl != none)
	{
		MyControl.CloudDie(self);
	}
	// End:0x32
	if(Fear != none)
	{
		Fear.Destroy();
	}
	super(Actor).Destroyed();
	//return;	
}

simulated function PhysicsVolumeChange(PhysicsVolume NewVolume)
{
	// End:0x18
	if(NewVolume.bWaterVolume)
	{
		Kill();
	}
	//return;	
}

state DSDying
{Begin:

	Sleep(3.0000000);
	Destroy();
	stop;					
}

defaultproperties
{
	Density=1.0000000
	Emitters[0]=SpriteEmitter'BallisticProV55.T10Cloud.SpriteEmitter1'
	Emitters[1]=SpriteEmitter'BallisticProV55.T10Cloud.SpriteEmitter0'
	AutoDestroy=true
	CollisionRadius=192.0000000
	CollisionHeight=192.0000000
	bCollideActors=true
	bUseCylinderCollision=true
	bNotOnDedServer=false
}
