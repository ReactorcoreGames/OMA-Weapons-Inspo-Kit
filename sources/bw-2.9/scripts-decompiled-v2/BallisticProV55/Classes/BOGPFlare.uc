class BOGPFlare extends BallisticGrenade;

var() Class<BCImpactManager> FizzleImpactManager;
var() float FallSpeed;
var() float FallOffDistance;
var() float IgniteRadius;
var Vector VelocityDir;
var Vector FallStart;
var float FallOff;
var float FallingSpeed;
var float LastIgniteCheckTime;
var float DieTime;
var bool bColored;

simulated function InitProjectile()
{
	super(BallisticProjectile).InitProjectile();
	FallStart = Location;
	DieTime = Level.TimeSeconds + float(1);
	// End:0x54
	if((Instigator != none) && Instigator.GetTeamNum() == 1)
	{
		LightHue = 160;
	}
	VelocityDir = Normal(Velocity);
	//return;	
}

simulated event Tick(float dt)
{
	local float dist;

	dist = VSize(Location - FallStart);
	FallOff = FMin(1.0000000, dist / FallOffDistance);
	FallingSpeed += ((FallSpeed * dt) * FallOff);
	Velocity = ((Speed * FMax(0.1000000, 1.0000000 - FallOff)) * VelocityDir) + (FMin(512.0000000, FallingSpeed) * vect(0.0000000, 0.0000000, -1.0000000));
	// End:0xA9
	if(Level.TimeSeconds >= DieTime)
	{
		FizzleOut();
	}
	// End:0xFE
	if(((int(Role) != int(ROLE_Authority)) && !bColored) && Instigator != none)
	{
		bColored = true;
		BOGPFlareTrail(Trail).SetupColor(Instigator.GetTeamNum());
	}
	super.Tick(dt);
	//return;	
}

simulated function ApplyImpactEffect(Actor Other, Vector HitLocation)
{
	local Vector Dummy;

	// End:0xB0
	if(Pawn(Other) != none)
	{
		// End:0x55
		if(Level.Game.ReduceDamage(int(Damage), Pawn(Other), Instigator, HitLocation, Dummy, ImpactDamageType) <= 0)
		{
			return;
		}
		IgniteActor(Other);
		HitActor = Other;
		Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Other, float(Max(5, int(float(ImpactDamage) * (1.0000000 - FallOff)))), Instigator, HitLocation, Velocity, ImpactDamageType);
	}
	//return;	
}

simulated function FizzleOut()
{
	// End:0x8C
	if((ImpactManager != none) && int(Level.NetMode) != int(NM_DedicatedServer))
	{
		// End:0x65
		if(Instigator == none)
		{
			FizzleImpactManager.static.StartSpawn(Location, vect(0.0000000, 0.0000000, 0.0000000), 0, Level.GetLocalPlayerController());			
		}
		else
		{
			FizzleImpactManager.static.StartSpawn(Location, vect(0.0000000, 0.0000000, 0.0000000), 0, Instigator);
		}
	}
	Destroy();
	//return;	
}

simulated function InitEffects()
{
	local Vector X, Y, Z;

	bDynamicLight = default.bDynamicLight;
	// End:0x135
	if(((int(Level.NetMode) != int(NM_DedicatedServer)) && TrailClass != none) && Trail == none)
	{
		GetAxes(Rotation, X, Y, Z);
		Trail = Spawn(TrailClass, self,, ((Location + (X * TrailOffset.X)) + (Y * TrailOffset.Y)) + (Z * TrailOffset.Z), Rotation);
		// End:0xEF
		if(BOGPFlareTrail(Trail) != none)
		{
			// End:0xEF
			if(Instigator != none)
			{
				bColored = true;
				BOGPFlareTrail(Trail).SetupColor(Instigator.GetTeamNum());
			}
		}
		// End:0x11D
		if(Emitter(Trail) != none)
		{
			Class'BCoreProV55.BallisticEmitter'.static.ScaleEmitter(Emitter(Trail), DrawScale);
		}
		// End:0x135
		if(Trail != none)
		{
			Trail.SetBase(self);
		}
	}
	//return;	
}

simulated function IgniteActor(Actor A)
{
	local BOGPFlareActorBurner PF;

	PF = Spawn(Class'BallisticProV55.BOGPFlareActorBurner', self,, A.Location);
	PF.Instigator = Instigator;
	// End:0x82
	if(((int(Role) == int(ROLE_Authority)) && Instigator != none) && Instigator.Controller != none)
	{
		PF.InstigatorController = Instigator.Controller;
	}
	PF.Initialize(A);
	//return;	
}

simulated function TargetedHurtRadius(float DamageAmount, float DamageRadius, Class<DamageType> DamageType, float Momentum, Vector HitLocation, optional Actor Victim)
{
	local Actor Victims;
	local float damageScale, dist;
	local Vector Dir, Dummy;
	local BW_FuelPatch Patch;

	// End:0x0B
	if(bHurtEntry)
	{
		return;
	}
	bHurtEntry = true;
	// End:0x233
	foreach VisibleCollidingActors(Class'Engine.Actor', Victims, DamageRadius, HitLocation)
	{
		// End:0x232
		if((((((Victims != self) && int(Victims.Role) == int(ROLE_Authority)) && BW_FuelPatch(Victims) == none) && !Victims.IsA('FluidSurfaceInfo')) && Victims != Victim) && Victims != HurtWall)
		{
			Dir = Victims.Location - HitLocation;
			dist = FMax(1.0000000, VSize(Dir));
			Dir = Dir / dist;
			damageScale = 1.0000000 - FMax(0.0000000, (dist - Victims.CollisionRadius) / DamageRadius);
			// End:0x145
			if((Instigator == none) || Instigator.Controller == none)
			{
				Victims.SetDelayedDamageInstigatorController(InstigatorController);
			}
			// End:0x19E
			if((xPawn(Victims) != none) && Level.Game.ReduceDamage(int(Damage), xPawn(Victims), Instigator, HitLocation, Dummy, DamageType) <= 0)
			{
				continue;				
			}
			// End:0x1B9
			if(xPawn(Victims) != none)
			{
				IgniteActor(Victims);
			}
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Victims, damageScale * DamageAmount, Instigator, Victims.Location - ((0.5000000 * (Victims.CollisionHeight + Victims.CollisionRadius)) * Dir), (damageScale * Momentum) * Dir, DamageType);
		}		
	}	
	// End:0x26E
	foreach VisibleCollidingActors(Class'BallisticProV55.BW_FuelPatch', Patch, IgniteRadius, HitLocation)
	{
		// End:0x26D
		if(Patch != none)
		{
			Patch.Ignite(Instigator);
		}		
	}	
	bHurtEntry = false;
	//return;	
}

simulated function PhysicsVolumeChange(PhysicsVolume NewVolume)
{
	// End:0x15
	if(NewVolume.bWaterVolume)
	{
		Destroy();
	}
	//return;	
}

defaultproperties
{
	FizzleImpactManager=Class'BallisticProV55.IM_BOGPFlareFizzle'
	FallSpeed=460.0000000
	FallOffDistance=4600.0000000
	IgniteRadius=256.0000000
	ArmedDetonateOn=1
	bNoInitialSpin=true
	bAlignToVelocity=true
	DetonateDelay=0.0000000
	ImpactDamage=40
	ImpactDamageType=Class'BallisticProV55.DTBOGPFlare'
	WeaponClass=Class'BallisticProV55.BOGPPistol'
	ImpactManager=Class'BallisticProV55.IM_BOGPFlareScorch'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	TrailClass=Class'BallisticProV55.BOGPFlareTrail'
	MyRadiusDamageType=Class'BallisticProV55.DTBOGPFlareBurn'
	ShakeRadius=0.0000000
	MotionBlurRadius=0.0000000
	MotionBlurFactor=0.0000000
	MotionBlurTime=0.0000000
	TossZ=0.0000000
	MyDamageType=Class'BallisticProV55.DTBOGPFlareBurn'
	LightType=1
	LightEffect=21
	LightHue=25
	LightSaturation=128
	LightBrightness=256.0000000
	LightRadius=32.0000000
	bDynamicLight=true
	LifeSpan=0.0000000
	DrawScale=0.3000000
	bIgnoreTerminalVelocity=true
}
