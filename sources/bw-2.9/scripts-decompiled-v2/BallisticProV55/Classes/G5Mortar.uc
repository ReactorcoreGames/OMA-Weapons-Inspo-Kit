class G5Mortar extends G5Rocket;

var Actor Target;
var Vector LastLoc;
var Vector Peak;
var bool bPeaking;
var bool bTrailOff;
var bool bFlyOff;
var() float TurnRate;
var() bool bDamaged;
var G5MortarDamageHull DamageHull;

replication
{
	// Pos:0x000
	reliable if((int(Role) == int(ROLE_Authority)) && bNetInitial)
		LastLoc, Target, 
		bFlyOff;
}

function SetMortarTarget(Actor targ)
{
	local Vector HitLoc, HitNorm, Start, End;
	local Actor t;

	Target = targ;
	// End:0x2D
	if(Target != none)
	{
		LastLoc = Target.Location;		
	}
	else
	{
		Start = Instigator.Location + Instigator.EyePosition();
		End = Start + (Vector(Instigator.GetViewRotation()) * float(20000));
		t = Instigator.Trace(HitLoc, HitNorm, End, Start, true);
		// End:0xB9
		if(t != none)
		{
			LastLoc = HitLoc;			
		}
		else
		{
			LastLoc = End;
		}
	}
	InitMortar();
	//return;	
}

simulated function InitProjectile()
{
	super.InitProjectile();
	// End:0x1C
	if(int(Role) < int(ROLE_Authority))
	{
		InitMortar();
	}
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

simulated function InitMortar()
{
	local Vector HitLoc, HitNorm, Start, End, Mid;

	local Actor t;
	local int i;
	local float Height;

	Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
	Peak = Location;
	Height = 3000.0000000;
	// End:0x40
	if(Target != none)
	{
		Speed *= 0.3500000;
	}
	MaxSpeed *= 0.3500000;
	// End:0x7C
	if((ONSTreadCraft(Target) != none) || ONSWheeledCraft(Target) != none)
	{
		Height = 2000.0000000;		
	}
	else
	{
		// End:0xA3
		if(ONSHoverCraft(Target) != none)
		{
			TurnRate *= 1.2500000;
			MaxSpeed *= float(3);
		}
	}
	Start = Location + ((Vector(Rotation) * Speed) * 0.2000000);
	Mid = Location + ((LastLoc - Location) * 0.5000000);
	End = Mid + (vect(0.0000000, 0.0000000, 1.0000000) * Height);
	t = Trace(HitLoc, HitNorm, End, Start, true);
	// End:0x150
	if(t == none)
	{
		HitLoc = End;
		HitNorm = vect(0.0000000, 0.0000000, -1.0000000);		
	}
	else
	{
		// End:0x192
		if((HitLoc.Z - Mid.Z) < Height)
		{
			Height = (HitLoc.Z - Mid.Z) - float(50);
		}
	}
	i = 0;
	J0x199:

	// End:0x217 [Loop If]
	if(i < 10)
	{
		// End:0x1E0
		if(FastTrace(LastLoc, HitLoc))
		{
			Peak = HitLoc - ((HitNorm * Speed) * 0.1000000);
			bPeaking = true;
			// [Explicit Break]
			goto J0x217;
		}
		Height *= 0.7000000;
		HitLoc = Mid + (vect(0.0000000, 0.0000000, 1.0000000) * Height);
		i++;
		// [Loop Continue]
		goto J0x199;
	}
	J0x217:

	Velocity = Normal(LastLoc - Location) * Speed;
	// End:0x27A
	if((int(Role) == int(ROLE_Authority)) && DamageHull == none)
	{
		DamageHull = Spawn(Class'BallisticProV55.G5MortarDamageHull', Instigator,, Location, Rotation);
		DamageHull.SetBase(self);
	}
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
	// End:0x58
	if(Speed > (MaxSpeed / float(2)))
	{
		bCanHitOwner = true;
	}
	// End:0xB3
	if(int(Role) == int(ROLE_Authority))
	{
		// End:0xB3
		if(Target != none)
		{
			// End:0xAB
			if(FastTrace(Location, Target.Location))
			{
				LastLoc = Target.Location;
				bFlyOff = false;				
			}
			else
			{
				bFlyOff = true;
			}
		}
	}
	// End:0x2CC
	if(!bFlyOff)
	{
		// End:0xDC
		if(bPeaking)
		{
			V = Peak - Location;			
		}
		else
		{
			V = LastLoc - Location;
			MaxSpeed = default.MaxSpeed * 2.0000000;
			AccelSpeed = default.AccelSpeed * 2.0000000;
		}
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
		// End:0x292
		if(bPeaking && VSize(V) < ((Speed * 1.2000000) * ((Acos(Normal(Velocity) Dot Normal(LastLoc - Peak)) * (float(32768) / 3.1415930)) / TurnRate)))
		{
			bPeaking = false;			
		}
		else
		{
			// End:0x2CC
			if((!bPeaking && Target == none) && VSize(V) < (Speed * 0.1000000))
			{
				bFlyOff = true;
			}
		}
	}
	R = Rotation;
	R = Rotator(Velocity);
	R.Roll = Rotation.Roll;
	SetRotation(R);
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

simulated function ApplyImpactEffect(Actor Other, Vector HitLocation)
{
	// End:0x35
	if((Instigator == none) || Instigator.Controller == none)
	{
		Other.SetDelayedDamageInstigatorController(InstigatorController);
	}
	// End:0x79
	if(!bArmed)
	{
		Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Other, ImpactDamage, Instigator, HitLocation, ImpactMomentumTransfer * Normal(Velocity), ImpactDamageType);		
	}
	else
	{
		Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Other, Damage, Instigator, HitLocation, MomentumTransfer * Normal(Velocity), MyDamageType);
	}
	//return;	
}

simulated function bool Impact(Actor Other, Vector HitLocation)
{
	// End:0x0B
	if(bArmed)
	{
		return false;
	}
	Destroy();
	return true;
	//return;	
}

singular simulated function HitWall(Vector HitNormal, Actor Wall)
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
	MakeNoise(1.0000000);
	Explode(Location + (ExploWallOut * HitNormal), HitNormal);
	HurtWall = none;
	//return;	
}

defaultproperties
{
	TurnRate=49152.0000000
	MyRadiusDamageType=Class'BallisticProV55.DTG5MortarRadius'
	AccelSpeed=850.0000000
	Speed=4000.0000000
	MaxSpeed=6000.0000000
	DamageRadius=378.0000000
	MyDamageType=Class'BallisticProV55.DTG5Mortar'
	LifeSpan=0.0000000
	bFullVolume=true
	bNetNotify=true
}
