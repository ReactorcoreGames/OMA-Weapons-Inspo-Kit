class G5SeekerRocket extends G5Rocket;

var Vector LastLoc;
var() float TurnRate;
var() bool bSeeking;
var bool bHasImpacted;
var G5MortarDamageHull DamageHull;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		LastLoc, bSeeking;
}

simulated function InitProjectile()
{
	super.InitProjectile();
	// End:0x4E
	if((int(Role) == int(ROLE_Authority)) && DamageHull == none)
	{
		DamageHull = Spawn(Class'BallisticProV55.G5MortarDamageHull', Instigator,, Location, Rotation);
		DamageHull.SetBase(self);
	}
	//return;	
}

event TakeDamage(int Damage, Pawn EventInstigator, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType)
{
	// End:0x2D
	if((Class<BallisticDamageType>(DamageType) != none) && !Class<BallisticDamageType>(DamageType).default.bDetonatesBombs)
	{
		return;
	}
	// End:0x3B
	if(Damage < 5)
	{
		return;
	}
	Explode(Location, Normal(Velocity));
	//return;	
}

simulated function bool CanTouch(Actor Other)
{
	// End:0x30
	if((G5MortarDamageHull(Other) != none) && (Other == DamageHull) || DamageHull == none)
	{
		return false;
	}
	return super(BallisticProjectile).CanTouch(Other);
	//return;	
}

function HitWall(Vector HitNormal, Actor Wall)
{
	// End:0x30
	if((G5MortarDamageHull(Wall) != none) && (Wall == DamageHull) || DamageHull == none)
	{
		return;
	}
	// End:0x61
	if(DamageHull != none)
	{
		DamageHull.SetBase(none);
		DamageHull.SetOwner(none);
		DamageHull.Destroy();
	}
	// End:0x16D
	if(!Wall.bStatic && !Wall.bWorldGeometry)
	{
		// End:0xC0
		if((Instigator == none) || Instigator.Controller == none)
		{
			Wall.SetDelayedDamageInstigatorController(InstigatorController);
		}
		Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Wall, Damage, Instigator, Location, MomentumTransfer * Normal(Velocity), MyDamageType);
		// End:0x162
		if(((DamageRadius > float(0)) && Vehicle(Wall) != none) && Vehicle(Wall).Health > 0)
		{
			Vehicle(Wall).DriverRadiusDamage(Damage, DamageRadius, InstigatorController, MyDamageType, MomentumTransfer, Location);
		}
		HurtWall = Wall;
	}
	// End:0x219
	if(!bArmed)
	{
		// End:0x1A7
		if(!Level.bDropDetail && FRand() < 0.4000000)
		{
			PlaySound(ImpactSounds[Rand(6)]);
		}
		Velocity = 0.4500000 * (Velocity - ((1.3300000 * HitNormal) * (Velocity Dot HitNormal)));
		SetRotation(Rotator(Velocity));
		AccelSpeed *= 0.7500000;
		Acceleration = AccelSpeed * Normal(Velocity);
		bHasImpacted = true;
		bSeeking = false;
		MakeNoise(1.0000000);
		return;
	}
	MakeNoise(1.0000000);
	Damage *= (float(1) + FClamp(default.LifeSpan - (LifeSpan + ArmingDelay), 0.0000000, 0.5000000));
	Explode(Location + (ExploWallOut * HitNormal), HitNormal);
	HurtWall = none;
	//return;	
}

simulated event Destroyed()
{
	// End:0x17
	if(DamageHull != none)
	{
		DamageHull.Destroy();
	}
	super(BallisticProjectile).Destroyed();
	//return;	
}

function SetTargetLocation(Vector loc)
{
	// End:0x0B
	if(bHasImpacted)
	{
		return;
	}
	LastLoc = loc;
	bSeeking = true;
	//return;	
}

simulated function Tick(float dt)
{
	local Vector V, X, Y, Z;
	local Rotator R, AxisDir;
	local float TurnNeeded;

	// End:0x0C
	if(bExploded)
	{
		Destroy();
	}
	// End:0x3B
	if(Speed < MaxSpeed)
	{
		Speed = FMin(MaxSpeed, Speed + (AccelSpeed * dt));
	}
	// End:0x1AE
	if(bSeeking)
	{
		V = LastLoc - Location;
		X = Normal(Velocity);
		Y = Normal(V Cross Velocity);
		Z = Normal(X Cross Y);
		AxisDir = OrthoRotation(X, Y, Z);
		TurnNeeded = Acos(Normal(V) Dot Normal(Velocity)) * (float(32768) / 3.1415930);
		R.Pitch = int(FMin(TurnRate * dt, TurnNeeded));
		GetAxes(R, X, Y, Z);
		X = X >> AxisDir;
		Y = Y >> AxisDir;
		Z = Z >> AxisDir;
		R = OrthoRotation(X, Y, Z);
		Velocity = Normal(Vector(R)) * Speed;
		// End:0x1AE
		if(((Normal(Velocity) Dot Normal(V)) > 0.6000000) && VSize(V) < (Speed * 0.1000000))
		{
			bSeeking = false;
		}
	}
	R = Rotation;
	R = Rotator(Velocity);
	R.Roll = Rotation.Roll;
	SetRotation(R);
	//return;	
}

defaultproperties
{
	TurnRate=20000.0000000
	ImpactDamage=45.0000000
	WallPenetrationForce=0.0000000
	AccelSpeed=2500.0000000
	Speed=500.0000000
	MaxSpeed=6500.0000000
	LifeSpan=0.0000000
}
