class A500Projectile extends BallisticProjectile;

var() float FallSpeed;
var() float FallOffDistance;
var Vector FallStart;
var float FallOff;
var float FallingSpeed;

simulated function InitProjectile()
{
	super.InitProjectile();
	FallStart = Location;
	//return;	
}

simulated event Tick(float dt)
{
	SetRotation(Rotator(Velocity));
	super(Actor).Tick(dt);
	//return;	
}

simulated function ApplyImpactEffect(Actor Other, Vector HitLocation)
{
	local Vector ClosestLocation, BoneTestLocation, Temp;

	// End:0xB4
	if(xPawn(Other) != none)
	{
		ClosestLocation = Other.Location;
		ClosestLocation.Z += HitLocation - Other.Location.Z;
		Temp = Normal(Velocity);
		Temp *= VSize(ClosestLocation - HitLocation);
		BoneTestLocation = Temp;
		BoneTestLocation *= (Normal(ClosestLocation - HitLocation) Dot Normal(Temp));
		BoneTestLocation += HitLocation;
		DoDamage(Other, BoneTestLocation);		
	}
	else
	{
		DoDamage(Other, HitLocation);
	}
	//return;	
}

function DoDamage(Actor Other, Vector HitLocation)
{
	local A500HPReducer hpReducer;

	super.DoDamage(Other, HitLocation);
	// End:0xE4
	if(((Pawn(Other) != none) && Pawn(Other).Health > 0) && Vehicle(Other) == none)
	{
		hpReducer = A500HPReducer(Pawn(Other).FindInventoryType(Class'BallisticProV55.A500HPReducer'));
		// End:0xD3
		if(hpReducer == none)
		{
			Pawn(Other).CreateInventory("BallisticProV55.A500HPReducer");
			hpReducer = A500HPReducer(Pawn(Other).FindInventoryType(Class'BallisticProV55.A500HPReducer'));
		}
		hpReducer.AddStack(4);
	}
	//return;	
}

singular simulated function HitWall(Vector HitNormal, Actor Wall)
{
	local PlayerController PC;

	// End:0x149
	if(int(Role) == int(ROLE_Authority))
	{
		// End:0x141
		if(!Wall.bStatic && !Wall.bWorldGeometry)
		{
			// End:0x6F
			if((Instigator == none) || Instigator.Controller == none)
			{
				Wall.SetDelayedDamageInstigatorController(InstigatorController);
			}
			Wall.TakeDamage(Max(3, int(Damage * (1.0000000 - FallOff))), Instigator, Location, MomentumTransfer * Normal(Velocity), MyDamageType);
			// End:0x136
			if(((DamageRadius > float(0)) && Vehicle(Wall) != none) && Vehicle(Wall).Health > 0)
			{
				Vehicle(Wall).DriverRadiusDamage(float(Max(5, int(Damage * (1.0000000 - FallOff)))), DamageRadius, InstigatorController, MyDamageType, MomentumTransfer, Location);
			}
			HurtWall = Wall;
		}
		MakeNoise(1.0000000);
	}
	Explode(Location + (ExploWallOut * HitNormal), HitNormal);
	// End:0x282
	if((ExplosionDecal != none) && int(Level.NetMode) != int(NM_DedicatedServer))
	{
		// End:0x26A
		if(ExplosionDecal.default.CullDistance != float(0))
		{
			PC = Level.GetLocalPlayerController();
			// End:0x1FA
			if(!PC.BeyondViewDistance(Location, ExplosionDecal.default.CullDistance))
			{
				Spawn(ExplosionDecal, self,, Location, Rotator(-HitNormal));				
			}
			else
			{
				// End:0x267
				if(((Instigator != none) && PC == Instigator.Controller) && !PC.BeyondViewDistance(Location, 2.0000000 * ExplosionDecal.default.CullDistance))
				{
					Spawn(ExplosionDecal, self,, Location, Rotator(-HitNormal));
				}
			}			
		}
		else
		{
			Spawn(ExplosionDecal, self,, Location, Rotator(-HitNormal));
		}
	}
	HurtWall = none;
	//return;	
}

simulated event Landed(Vector HitNormal)
{
	Explode(Location + (ExploWallOut * HitNormal), HitNormal);
	//return;	
}

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
	// End:0x0B
	if(bExploded)
	{
		return;
	}
	// End:0x5A
	if((ImpactManager != none) && int(Level.NetMode) != int(NM_DedicatedServer))
	{
		ImpactManager.static.StartSpawn(HitLocation, HitNormal, 1, Level.GetLocalPlayerController());
	}
	BlowUp(HitLocation);
	bExploded = true;
	// End:0xB4
	if(bTearOnExplode && (int(Level.NetMode) == int(NM_DedicatedServer)) || int(Level.NetMode) == int(NM_ListenServer))
	{
		bTearOff = true;
	}
	Destroy();
	//return;	
}

defaultproperties
{
	WeaponClass=Class'BallisticProV55.A500Reptile'
	ImpactManager=Class'BallisticProV55.IM_A500Projectile'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	TrailClass=Class'BallisticProV55.A500ProjectileTrail'
	bRandomStartRotation=false
	DamageTypeHead=Class'BallisticProV55.DTA500BlastHead'
	MyRadiusDamageType=Class'BallisticProV55.DTA500Blast'
	MyDamageType=Class'BallisticProV55.DTA500Blast'
	LightType=1
	LightEffect=21
	LightHue=54
	LightSaturation=100
	LightBrightness=150.0000000
	LightRadius=4.0000000
	bDynamicLight=true
	Physics=2
	LifeSpan=8.0000000
	CollisionRadius=1.0000000
	CollisionHeight=1.0000000
	bFixedRotationDir=true
	bIgnoreTerminalVelocity=true
	RotationRate=(Pitch=0,Yaw=0,Roll=16384)
}
