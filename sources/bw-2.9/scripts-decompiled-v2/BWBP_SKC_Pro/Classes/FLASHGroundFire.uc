class FLASHGroundFire extends BallisticEmitter;

var float BurnTime;
var AvoidMarker Fear;
var Controller InstigatorController;
var FLASHFireControl FireControl;

function PostBeginPlay()
{
	super.PostBeginPlay();
	BurnTime -= (float(4) * FRand());
	// End:0x68
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		Emitters[0].Disabled = true;
		Emitters[1].Disabled = true;
		Emitters[2].Disabled = true;
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

function Landed(Vector HitNormal)
{
	HitWall(HitNormal, none);
	//return;	
}

function HitWall(Vector HitNormal, Actor Wall)
{
	SetPhysics(0);
	// End:0x20
	if(int(Level.NetMode) == int(NM_Client))
	{
		return;
	}
	bCollideWorld = false;
	SetCollision(true, false, false);
	SetCollisionSize(70.0000000, 100.0000000);
	Fear = Spawn(Class'Engine.AvoidMarker');
	Fear.SetCollisionSize(120.0000000, 120.0000000);
	Fear.StartleBots();
	//return;	
}

simulated function Destroyed()
{
	// End:0x17
	if(Fear != none)
	{
		Fear.Destroy();
	}
	super(Actor).Destroyed();
	//return;	
}

simulated function PhysicsVolumeChange(PhysicsVolume NewVolume)
{
	// End:0x37
	if(NewVolume.bWaterVolume)
	{
		// End:0x31
		if(int(Level.NetMode) == int(NM_DedicatedServer))
		{
			Destroy();			
		}
		else
		{
			Kill();
		}
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
	BurnTime=10.0000000
	Emitters[0]=SpriteEmitter'BallisticProV55.FP7GroundFire.SpriteEmitter1'
	Emitters[1]=SpriteEmitter'BallisticProV55.FP7GroundFire.SpriteEmitter9'
	Emitters[2]=SpriteEmitter'BallisticProV55.FP7GroundFire.SpriteEmitter10'
	AutoDestroy=true
	Physics=2
	CollisionRadius=2.0000000
	CollisionHeight=2.0000000
	bCollideWorld=true
	bUseCylinderCollision=true
	Mass=30.0000000
	bNotOnDedServer=false
}
