class RCS715GroundFire extends BallisticEmitter;

const BURNINTERVAL = 0.2;

var float BurnTime;
var float Damage;
var() Class<DamageType> DamageType;
var AvoidMarker Fear;
var Controller InstigatorController;
var RCS715FireControl FireControl;

function Reset()
{
	Destroy();
	//return;	
}

simulated function Tick(float dt)
{
	super(Actor).Tick(dt);
	// End:0x1E
	if(BurnTime == float(666))
	{
		return;
	}
	BurnTime -= dt;
	// End:0x48
	if(BurnTime <= float(0))
	{
		Kill();
		BurnTime = 666.0000000;
	}
	//return;	
}

singular simulated event BaseChange()
{
	// End:0x13
	if(Mover(Base) != none)
	{
		Destroy();
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
	SetCollisionSize(72.0000000, 72.0000000);
	Fear = Spawn(Class'Engine.AvoidMarker');
	Fear.SetCollisionSize(120.0000000, 120.0000000);
	Fear.StartleBots();
	//return;	
}

function PostBeginPlay()
{
	super.PostBeginPlay();
	// End:0x33
	if(int(Level.NetMode) != int(NM_Client))
	{
		SetTimer(0.2000000 + (FRand() * 0.5000000), true);
	}
	BurnTime -= (float(4) * FRand());
	// End:0x95
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		Emitters[0].Disabled = true;
		Emitters[1].Disabled = true;
		Emitters[2].Disabled = true;
	}
	//return;	
}

function Timer()
{
	local Actor A;

	// End:0x2F
	if((int(Level.NetMode) == int(NM_DedicatedServer)) && BurnTime == float(666))
	{
		Destroy();
	}
	// End:0x43
	if(PhysicsVolume.bWaterVolume)
	{
		return;
	}
	// End:0xFD
	foreach TouchingActors(Class'Engine.Actor', A)
	{
		// End:0x88
		if((Instigator == none) || Instigator.Controller == none)
		{
			A.SetDelayedDamageInstigatorController(InstigatorController);
		}
		// End:0xBE
		if(Pawn(A) != none)
		{
			FireControl.TryDamage(Pawn(A), 0.2000000, DamageType);
			// End:0xFC
			continue;
		}
		Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(A, Damage, Instigator, A.Location, vect(0.0000000, 0.0000000, 0.0000000), DamageType);		
	}	
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

defaultproperties
{
	BurnTime=5.0000000
	Damage=5.0000000
	DamageType=Class'BWBP_OP_Pro.DT_RCS715Burned'
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
