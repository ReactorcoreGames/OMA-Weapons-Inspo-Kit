class BallisticKHandGrenadeProjectile extends BallisticKGrenade;

var float NewDetonateDelay;
var float NewSpeed;
var() int FireModeNum;
var Vector NetLocation;
var Vector NetKickForce;
var Vector LastLocation;
var Vector LastKickForce;
var Rotator NetRotation;
var Rotator LastRotation;
var bool bPineappleInitialized;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		NewDetonateDelay, NewSpeed;

	// Pos:0x00D
	reliable if(int(Role) == int(ROLE_Authority))
		NetKickForce, NetLocation, 
		NetRotation;
}

simulated event Timer()
{
	// End:0x3D
	if((int(Role) < int(ROLE_Authority)) && (NewSpeed == default.NewSpeed) || NewDetonateDelay == default.NewDetonateDelay)
	{
		SetTimer(0.1000000, false);
		return;
	}
	// End:0x82
	if(StartDelay > float(0))
	{
		StartDelay = 0.0000000;
		bHidden = false;
		SetPhysics(default.Physics);
		SetCollision(default.bCollideActors, default.bBlockActors, default.bBlockPlayers);
		InitProjectile();
		return;
	}
	// End:0x106
	if(HitActor != none)
	{
		// End:0xC2
		if((Instigator == none) || Instigator.Controller == none)
		{
			HitActor.SetDelayedDamageInstigatorController(InstigatorController);
		}
		Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(HitActor, Damage, Instigator, Location, MomentumTransfer * (HitActor.Location - Location), MyDamageType);
	}
	Explode(Location, vect(0.0000000, 0.0000000, 1.0000000));
	//return;	
}

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
	// End:0x18
	if(ShakeRadius > float(0))
	{
		ShakeView(HitLocation);
	}
	BlowUp(HitLocation);
	// End:0x84
	if(ImpactManager != none)
	{
		// End:0x65
		if(Instigator == none)
		{
			ImpactManager.static.StartSpawn(HitLocation, HitNormal, 0, Level.GetLocalPlayerController());			
		}
		else
		{
			ImpactManager.static.StartSpawn(HitLocation, HitNormal, 0, Instigator);
		}
	}
	// End:0xCA
	if((int(Level.NetMode) == int(NM_DedicatedServer)) || int(Level.NetMode) == int(NM_ListenServer))
	{
		bTearOff = true;
		GotoState('NetTrapped');		
	}
	else
	{
		Destroy();
	}
	//return;	
}

simulated event PostBeginPlay()
{
	local Rotator R;

	super(BallisticGrenade).PostBeginPlay();
	R = Rotation;
	R.Roll = -8192;
	SetRotation(R);
	//return;	
}

function SetThrowPowerAndDelay(float PSpeed, float PDelay)
{
	PDelay = FMax(PDelay, 0.1000000);
	Speed = PSpeed;
	DetonateDelay = PDelay;
	NewSpeed = Speed;
	NewDetonateDelay = DetonateDelay;
	// End:0x5E
	if(DetonateDelay <= StartDelay)
	{
		StartDelay = DetonateDelay / float(2);
	}
	//return;	
}

simulated function InitProjectile()
{
	bPineappleInitialized = true;
	super.InitProjectile();
	//return;	
}

simulated event PostNetReceive()
{
	super(Actor).PostNetReceive();
	// End:0x20
	if(NewSpeed != default.NewSpeed)
	{
		Speed = NewSpeed;
	}
	// End:0x4B
	if((NewDetonateDelay != default.NewDetonateDelay) && DetonateDelay != NewDetonateDelay)
	{
		DetonateDelay = NewDetonateDelay;
	}
	// End:0x8B
	if((!bPineappleInitialized && NewSpeed != default.NewSpeed) && NewDetonateDelay != default.NewDetonateDelay)
	{
		// End:0x8B
		if(StartDelay == float(0))
		{
			InitProjectile();
		}
	}
	// End:0xB7
	if(NetLocation != LastLocation)
	{
		LastLocation = NetLocation;
		SetPhysics(0);
		SetLocation(NetLocation);
		SetPhysics(13);
	}
	// End:0xD9
	if(NetRotation != LastRotation)
	{
		LastRotation = NetRotation;
		SetRotation(NetRotation);
	}
	// End:0xFE
	if(NetKickForce != LastKickForce)
	{
		LastKickForce = NetKickForce;
		KickPineapple(NetKickForce);
	}
	//return;	
}

simulated event Tick(float dt)
{
	super.Tick(dt);
	// End:0x82
	if((StartDelay == float(0)) && (int(Level.NetMode) == int(NM_ListenServer)) || int(Level.NetMode) == int(NM_DedicatedServer))
	{
		// End:0x68
		if(Location != NetLocation)
		{
			NetLocation = Location;
		}
		// End:0x82
		if(Rotation != NetRotation)
		{
			NetRotation = Rotation;
		}
	}
	//return;	
}

simulated event PostNetBeginPlay()
{
	// End:0x20
	if(DetonateDelay <= StartDelay)
	{
		StartDelay = DetonateDelay / float(2);
	}
	DetonateDelay -= StartDelay;
	super(BallisticProjectile).PostNetBeginPlay();
	//return;	
}

simulated function KickPineapple(Vector Force)
{
	local Vector V;

	// End:0x15
	if(int(Physics) != int(13))
	{
		SetPhysics(13);
	}
	KGetCOMPosition(V);
	KAddImpulse(Force * float(50), V);
	//return;	
}

function UsedBy(Pawn User)
{
	local Vector Force;

	Force = Normal((Location - User.Location) * vect(1.0000000, 1.0000000, 0.0000000)) * float(320 + Rand(100));
	Force.Z = 50.0000000 + float(Rand(250));
	Force += User.Velocity;
	NetKickForce = Force;
	KickPineapple(Force);
	//return;	
}

event TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType)
{
	// End:0x15
	if(VSize(Momentum) < float(2000))
	{
		return;
	}
	NetKickForce = Momentum / float(75);
	// End:0x41
	if(Base != none)
	{
		NetKickForce.Z += float(250);
	}
	KickPineapple(NetKickForce);
	//return;	
}

simulated event ProcessTouch(Actor Other, Vector HitLocation)
{
	local Vector PineappleDir;

	super.ProcessTouch(Other, HitLocation);
	// End:0xF4
	if(((!bDeleteMe && Pawn(Other) != none) && Bot(Pawn(Other).Controller) != none) && Pawn(Other).Health > 0)
	{
		PineappleDir = Normal(Location - Other.Location);
		// End:0xF4
		if((Bot(Pawn(Other).Controller).Skill * (((Vector(Other.Rotation) Dot PineappleDir) + 0.4000000) - (PineappleDir.Z * 0.4000000))) > float(Rand(9)))
		{
			UsedBy(Pawn(Other));
		}
	}
	//return;	
}

defaultproperties
{
	NewDetonateDelay=-0.1200000
	NewSpeed=-0.1200000
	DampenFactorParallel=0.8000000
	bNoInitialSpin=true
	bRandomStartRotation=false
	StartDelay=0.3000000
	NetTrappedDelay=1.0000000
	bNetTemporary=false
	LifeSpan=6.0000000
	DrawScale=0.2000000
	bProjTarget=true
	bNetNotify=true
	RotationRate=(Pitch=0,Yaw=0,Roll=0)
}
