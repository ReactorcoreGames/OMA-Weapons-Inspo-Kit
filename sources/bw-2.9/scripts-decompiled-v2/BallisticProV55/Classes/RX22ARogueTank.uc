class RX22ARogueTank extends Actor
	notplaceable;

var Vector LeakDir;
var Vector LeakLoc;
var Vector ThrustDir;
var Emitter Flame;
var byte DeathStage;

replication
{
	// Pos:0x000
	reliable if((int(Role) == int(ROLE_Authority)) && bNetDirty)
		DeathStage;
}

function Reset()
{
	Destroy();
	//return;	
}

simulated event PostNetReceive()
{
	// End:0x21
	if((int(DeathStage) != 0) && !GoneOff())
	{
		GotoState('JetPack');
	}
	//return;	
}

function InitRogue(byte Stage)
{
	DeathStage = Stage;
	GotoState('JetPack');
	//return;	
}

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType)
{
	//return;	
}

simulated function bool GoneOff()
{
	return IsInState('JetPack') || IsInState('RocketPack');
	//return;	
}

simulated function AddVelocity(Vector Extra)
{
	Velocity += Extra;
	//return;	
}

simulated function Landed(Vector HitNormal)
{
	HitWall(HitNormal, none);
	//return;	
}

simulated function HitWall(Vector HitNormal, Actor Wall)
{
	local Vector VNorm;
	local float Speed;

	VNorm = (Velocity Dot HitNormal) * HitNormal;
	Velocity = (-VNorm * 0.6000000) + ((Velocity - VNorm) * 0.8000000);
	RotationRate = RotRand(true) * 0.2500000;
	Speed = VSize(Velocity);
	// End:0x84
	if(Speed < float(50))
	{
		bBounce = false;
		SetPhysics(0);
		bCollideWorld = false;
	}
	//return;	
}

simulated event Destroyed()
{
	// End:0x1A
	if(Flame != none)
	{
		Flame.Kill();
	}
	super.Destroyed();
	//return;	
}

simulated state JetPack
{Begin:

	// End:0x79
	if(int(DeathStage) < 5)
	{
		// End:0x70
		if(int(Level.NetMode) != int(NM_DedicatedServer))
		{
			Class'BallisticProV55.IM_Bullet'.static.StartSpawn(LeakLoc, LeakDir, 3, Instigator);
			Flame = Spawn(Class'BallisticProV55.T10Spray', self,, LeakLoc, Rotator(LeakDir));
			Flame.SetBase(self);
		}
		SetTimer(0.1000000, true);
	}
	// End:0xB4
	if(int(DeathStage) < 2)
	{
		AddVelocity(vect(0.0000000, 0.0000000, 400.0000000) + (Vector(Rotation) * float(300)));
		Sleep(0.5000000);
	}
	// End:0xED
	if(int(DeathStage) < 3)
	{
		AddVelocity((Vector(Rotation) * float(400)) + (VRand() * float(400)));
		Sleep(0.5000000);
	}
	// End:0x135
	if(int(DeathStage) < 4)
	{
		AddVelocity((vect(0.0000000, 0.0000000, 400.0000000) + (Vector(Rotation) * float(400))) + (VRand() * float(400)));
		Sleep(0.5000000);
	}
	// End:0x185
	if(int(DeathStage) < 5)
	{
		AddVelocity((Vector(Rotation) * float(400)) + (VRand() * float(400)));
		Sleep(0.5000000);
		// End:0x185
		if(Flame != none)
		{
			Flame.Destroy();
		}
	}
	GotoState('RocketPack');
	stop;				
}

simulated state RocketPack
{
	simulated event Tick(float dt)
	{
		AddVelocity(vect(0.0000000, 0.0000000, 1400.0000000) * dt);
		// End:0xA1
		if(Flame != none)
		{
			Flame.SetLocation(Location - vect(0.0000000, 0.0000000, 16.0000000));
			Flame.SetRotation(Flame.Rotation + (((Rotator(-ThrustDir + (vect(0.0000000, 0.0000000, 1400.0000000) * dt)) - Flame.Rotation) * dt) * float(2)));
		}
		//return;		
	}
Begin:

	AmbientSound = Sound'BW_Core_WeaponSound.RX22A.RX22A-PackBurn';
	SoundVolume = byte(255);
	SoundRadius = 64.0000000;
	// End:0x83
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		Flame = Spawn(Class'BallisticProV55.RX22APackTrail', self,, Location - vect(0.0000000, 0.0000000, 32.0000000), rot(-16384, 0, 0));
		Class'BCoreProV55.BallisticEmitter'.static.ScaleEmitter(Flame, 0.5000000);
	}
	SetTimer(0.1000000, true);
	// End:0xD5
	if(int(DeathStage) < 7)
	{
		PlaySound(Sound'BW_Core_WeaponSound.RX22A.RX22A-PackIgnite', 3, 0.8000000,, 128.0000000);
		ThrustDir = vect(0.0000000, 0.0000000, 1200.0000000);
		AddVelocity(ThrustDir);
		Sleep(0.5000000);
	}
	// End:0x107
	if(int(DeathStage) < 8)
	{
		ThrustDir = VRand() * float(400);
		AddVelocity(ThrustDir);
		Sleep(0.5000000);
	}
	// End:0x139
	if(int(DeathStage) < 9)
	{
		ThrustDir = VRand() * float(400);
		AddVelocity(ThrustDir);
		Sleep(0.5000000);
	}
	// End:0x16B
	if(int(DeathStage) < 10)
	{
		ThrustDir = VRand() * float(400);
		AddVelocity(ThrustDir);
		Sleep(0.5000000);
	}
	// End:0x19D
	if(int(DeathStage) < 11)
	{
		ThrustDir = VRand() * float(400);
		AddVelocity(ThrustDir);
		Sleep(0.5000000);
	}
	// End:0x1CF
	if(int(DeathStage) < 12)
	{
		ThrustDir = VRand() * float(400);
		AddVelocity(ThrustDir);
		Sleep(0.5000000);
	}
	Class'BallisticProV55.IM_GasTankExplode'.static.StartSpawn(Location, vect(0.0000000, 0.0000000, 1.0000000), 0, self);
	// End:0x20C
	if(Flame != none)
	{
		Flame.Kill();
	}
	HurtRadius(300.0000000, 512.0000000, Class'BallisticProV55.DTRX22ATankExplode', 5000.0000000, Location);
	bHidden = true;
	Velocity = vect(0.0000000, 0.0000000, 0.0000000);
	// End:0x261
	if(int(Role) == int(ROLE_Authority))
	{
		Sleep(1.0000000);
		Destroy();
	}
	stop;			
}

defaultproperties
{
	DrawType=8
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.RX22A.FlamerTank'
	Physics=2
	RemoteRole=2
	RelativeLocation=(X=28.0000000,Y=28.0000000,Z=0.0000000)
	RelativeRotation=(Pitch=0,Yaw=-16384,Roll=16384)
	DrawScale=0.2500000
	CollisionRadius=12.0000000
	CollisionHeight=14.0000000
	bCollideWorld=true
	bNetNotify=true
	bBounce=true
	bFixedRotationDir=true
	RotationRate=(Pitch=4096,Yaw=4096,Roll=2048)
}
