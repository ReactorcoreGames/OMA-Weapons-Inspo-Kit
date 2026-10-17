class TracerProjectile extends Projectile;

var xEmitter Trail;

simulated function Destroyed()
{
	// End:0x1C
	if(Trail != none)
	{
		Trail.mRegen = false;
	}
	super(Actor).Destroyed();
	//return;	
}

simulated function bool CanSplash()
{
	return bReadyToSplash && int(Level.NetMode) != int(NM_Standalone);
	//return;	
}

simulated function PostNetBeginPlay()
{
	local PlayerController PC;
	local Vector Dir, LinePos, LineDir, OldLocation;

	// End:0x39
	if((int(Level.NetMode) == int(NM_Client)) && Level.GetLocalPlayerController() == Owner)
	{
		Destroy();
		return;
	}
	// End:0x89
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		// End:0x89
		if(!PhysicsVolume.bWaterVolume)
		{
			Trail = Spawn(Class'XEffects.FlakTrail', self);
			Trail.LifeSpan = LifeSpan;
		}
	}
	Velocity = Vector(Rotation) * Speed;
	super(Actor).PostNetBeginPlay();
	PC = Level.GetLocalPlayerController();
	// End:0x19D
	if((PC != none) && PC.Pawn != none)
	{
		Dir = Normal(Velocity);
		LinePos = Location + ((Dir Dot (PC.Pawn.Location - Location)) * Dir);
		LineDir = PC.Pawn.Location - LinePos;
		// End:0x19D
		if(VSize(LineDir) < float(150))
		{
			OldLocation = Location;
			SetLocation(LinePos);
			// End:0x185
			if(FRand() < 0.5000000)
			{
				PlaySound(Sound'XEffects.Impact3Snd',,,, 80.0000000);				
			}
			else
			{
				PlaySound(Sound'XEffects.Impact7Snd',,,, 80.0000000);
			}
			SetLocation(OldLocation);
		}
	}
	//return;	
}

singular simulated function Touch(Actor Other)
{
	//return;	
}

simulated function ProcessTouch(Actor Other, Vector HitLocation)
{
	//return;	
}

simulated function Landed(Vector HitNormal)
{
	Destroy();
	//return;	
}

simulated function HitWall(Vector HitNormal, Actor Wall)
{
	Destroy();
	//return;	
}

defaultproperties
{
	Speed=20000.0000000
	MaxSpeed=20000.0000000
	DrawType=8
	StaticMesh=StaticMesh'WeaponStaticMesh.FlakChunk'
	bReplicateInstigator=false
	LifeSpan=2.0000000
	DrawScale=5.0000000
	Style=5
	bOwnerNoSee=true
}
