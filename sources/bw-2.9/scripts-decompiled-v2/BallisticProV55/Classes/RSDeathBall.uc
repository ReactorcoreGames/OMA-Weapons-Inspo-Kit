class RSDeathBall extends BallisticProjectile;

var Vector LastLoc;
var Actor Target;
var() bool bSeeking;
var() bool bDamaged;
var() int Health;
var float NextSeekerTime;
var bool bIsEvil;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		LastLoc, bDamaged, 
		bSeeking;
}

simulated function PostNetBeginPlay()
{
	super.PostNetBeginPlay();
	Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
	//return;	
}

event TakeDamage(int Damage, Pawn EventInstigator, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType)
{
	// End:0x0D
	if(Health < 1)
	{
		return;
	}
	// End:0x3A
	if((Class<BallisticDamageType>(DamageType) != none) && !Class<BallisticDamageType>(DamageType).default.bDetonatesBombs)
	{
		return;
	}
	// End:0x5E
	if((Class<DT_RSNovaLightning>(DamageType) != none) || Class<DT_RSDarkPlasma>(DamageType) != none)
	{
		return;
	}
	Health -= Damage;
	// End:0x77
	if(Health > 0)
	{
		return;
	}
	bDamaged = true;
	SetTimer(0.1000000, false);
	bTearOff = true;
	//return;	
}

simulated event PostNetReceive()
{
	super(Actor).PostNetReceive();
	// End:0x2E
	if(bDamaged && !bExploded)
	{
		Explode(Location, Normal(Velocity));
	}
	//return;	
}

simulated function Timer()
{
	// End:0x1E
	if(bDamaged)
	{
		Explode(Location, Normal(Velocity));		
	}
	else
	{
		// End:0x34
		if(StartDelay > float(0))
		{
			super.Timer();			
		}
		else
		{
			// End:0x6C
			if(Target != none)
			{
				// End:0x6C
				if(FastTrace(Target.Location, Location))
				{
					LastLoc = Target.Location;
				}
			}
		}
	}
	//return;	
}

simulated function DoDamage(Actor Other, Vector HitLocation)
{
	local Class<DamageType> dt;
	local float Dmg;
	local bool bWasAlive;

	// End:0x35
	if((Instigator == none) || Instigator.Controller == none)
	{
		Other.SetDelayedDamageInstigatorController(InstigatorController);
	}
	// End:0x6B
	if((xPawn(Other) != none) && Pawn(Other).Health > 0)
	{
		bWasAlive = true;		
	}
	else
	{
		// End:0xC2
		if(((Vehicle(Other) != none) && Vehicle(Other).Driver != none) && Vehicle(Other).Driver.Health > 0)
		{
			bWasAlive = true;
		}
	}
	// End:0x120
	if(bUsePositionalDamage)
	{
		Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(GetDamageVictim(Other, HitLocation, Normal(Velocity), Dmg, dt), Dmg, Instigator, HitLocation, MomentumTransfer * Normal(Velocity), dt);		
	}
	else
	{
		Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Other, Damage, Instigator, HitLocation, MomentumTransfer * Normal(Velocity), MyDamageType);
	}
	// End:0x1CE
	if(bWasAlive && Pawn(Other).Health <= 0)
	{
		// End:0x1AA
		if(bIsEvil)
		{
			Class'BallisticProV55.RSDarkSoul'.static.SpawnSoul(HitLocation, Instigator, Pawn(Other), self);			
		}
		else
		{
			Class'BallisticProV55.RSNovaSoul'.static.SpawnSoul(HitLocation, Instigator, Pawn(Other), self);
		}
	}
	//return;	
}

simulated function bool CanTouch(Actor Other)
{
	// End:0x48
	if((((RSDarkProjectile(Other) != none) || RSDarkFastProjectile(Other) != none) || RSNovaProjectile(Other) != none) || RSNovaFastProjectile(Other) != none)
	{
		return false;
	}
	return super.CanTouch(Other);
	//return;	
}

singular simulated function HitWall(Vector HitNormal, Actor Wall)
{
	// End:0x124
	if(int(Role) == int(ROLE_Authority))
	{
		// End:0x11C
		if(!Wall.bStatic && !Wall.bWorldGeometry)
		{
			// End:0x6F
			if((Instigator == none) || Instigator.Controller == none)
			{
				Wall.SetDelayedDamageInstigatorController(InstigatorController);
			}
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Wall, Damage, Instigator, Location, MomentumTransfer * Normal(Velocity), MyDamageType);
			// End:0x111
			if(((DamageRadius > float(0)) && Vehicle(Wall) != none) && Vehicle(Wall).Health > 0)
			{
				Vehicle(Wall).DriverRadiusDamage(Damage, DamageRadius, InstigatorController, MyDamageType, MomentumTransfer, Location);
			}
			HurtWall = Wall;
		}
		MakeNoise(1.0000000);
	}
	Explode(Location + (ExploWallOut * HitNormal), HitNormal);
	HurtWall = none;
	//return;	
}

function SetTarget(Actor t, bool bEvil)
{
	bIsEvil = bEvil;
	// End:0x48
	if(t != none)
	{
		SetTimer(0.1000000, true);
		Target = t;
		LastLoc = t.Location;
		bSeeking = true;
	}
	//return;	
}

simulated function Tick(float dt)
{
	local Vector V;
	local Rotator R;

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
	super(Actor).Tick(dt);
	// End:0x10E
	if(bSeeking && Level.TimeSeconds >= NextSeekerTime)
	{
		V = Normal(LastLoc - Location) * Speed;
		Velocity = Normal(Velocity + (V * 0.3500000)) * Speed;
		NextSeekerTime += 0.1000000;
		// End:0x10B
		if(((Normal(Velocity) Dot Normal(V)) > 0.6000000) && VSize(V) < (Speed * 0.1000000))
		{
			bSeeking = false;
		}		
	}
	else
	{
		Velocity = Normal(Velocity) * Speed;
	}
	R = Rotation;
	R = Rotator(Velocity);
	R.Roll = Rotation.Roll;
	SetRotation(R);
	//return;	
}

defaultproperties
{
	Health=50
	bApplyParams=false
	WeaponClass=Class'BallisticProV55.RSDarkStar'
	ImpactManager=Class'BallisticProV55.IM_RSDarkProjectile'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	TrailClass=Class'BallisticProV55.RSDeathBallTrail'
	bRandomStartRotation=false
	MyRadiusDamageType=Class'BallisticProV55.DT_RSDeathBall'
	ShakeRadius=1024.0000000
	ShakeRotMag=(X=512.0000000,Y=400.0000000,Z=256.0000000)
	ShakeRotRate=(X=3000.0000000,Y=2500.0000000,Z=3000.0000000)
	ShakeOffsetMag=(X=20.0000000,Y=30.0000000,Z=30.0000000)
	MotionBlurRadius=512.0000000
	AccelSpeed=100.0000000
	Speed=200.0000000
	MaxSpeed=500.0000000
	Damage=100.0000000
	DamageRadius=128.0000000
	MomentumTransfer=90000.0000000
	MyDamageType=Class'BallisticProV55.DT_RSDeathBall'
	LightType=1
	LightEffect=21
	LightHue=25
	LightSaturation=100
	LightBrightness=200.0000000
	LightRadius=15.0000000
	DrawType=0
	bDynamicLight=true
	bNetTemporary=false
	bUpdateSimulatedPosition=true
	AmbientSound=Sound'BW_Core_WeaponSound.NovaStaff.Nova-Fire1FlyBy'
	LifeSpan=0.0000000
	SoundVolume=255
	SoundRadius=75.0000000
	bNetNotify=true
}
