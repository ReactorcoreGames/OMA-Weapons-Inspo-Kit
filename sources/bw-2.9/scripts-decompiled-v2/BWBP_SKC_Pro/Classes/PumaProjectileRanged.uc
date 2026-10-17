class PumaProjectileRanged extends PumaProjectile;

var float NewDetonateDelay;
var() int FireModeNum;
var() bool bNoFXOnExplode;
var bool bProgramInitialized;

simulated event Timer()
{
	local float NewTimer;

	// End:0x5A
	if(!bPrimed)
	{
		NewTimer = NewDetonateDelay - 0.0500000;
		// End:0x47
		if(NewTimer < 0.0500000)
		{
			Explode(Location, vect(0.0000000, 0.0000000, 1.0000000));			
		}
		else
		{
			SetTimer(NewTimer, false);
		}
		bPrimed = true;
		return;
	}
	Explode(Location, vect(0.0000000, 0.0000000, 1.0000000));
	//return;	
}

simulated event Tick(float dt)
{
	// End:0x3A
	if(bAlignToVelocity && (RandomSpin == float(0)) || bNoInitialSpin && !bHasImpacted)
	{
		SetRotation(Rotator(Velocity));
	}
	//return;	
}

simulated function Destroyed()
{
	local int Surf;

	// End:0xD5
	if(bNoFXOnExplode && !bNoFX)
	{
		// End:0xD5
		if(((EffectIsRelevant(Location, false)) && ImpactManager != none) && int(Level.NetMode) != int(NM_DedicatedServer))
		{
			// End:0x6F
			if(bCheckHitSurface)
			{
				CheckSurface(Location, -Vector(Rotation), Surf);
			}
			// End:0xAE
			if(Instigator == none)
			{
				ImpactManager.static.StartSpawn(Location, -Vector(Rotation), Surf, Level.GetLocalPlayerController());				
			}
			else
			{
				ImpactManager.static.StartSpawn(Location, -Vector(Rotation), Surf, Instigator);
			}
		}
	}
	super(BallisticProjectile).Destroyed();
	//return;	
}

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
	local int Surf;

	// End:0x0B
	if(bExploded)
	{
		return;
	}
	// End:0x32
	if((ShakeRadius > float(0)) || MotionBlurRadius > float(0))
	{
		ShakeView(HitLocation);
	}
	// End:0xDF
	if(!bNoFXOnExplode)
	{
		// End:0xDF
		if((ImpactManager != none) && int(Level.NetMode) != int(NM_DedicatedServer))
		{
			// End:0x81
			if(bCheckHitSurface)
			{
				CheckSurface(HitLocation, HitNormal, Surf);
			}
			// End:0xBC
			if(Instigator == none)
			{
				ImpactManager.static.StartSpawn(HitLocation, HitNormal, Surf, Level.GetLocalPlayerController());				
			}
			else
			{
				ImpactManager.static.StartSpawn(HitLocation, HitNormal, Surf, Instigator);
			}
		}
	}
	BlowUp(HitLocation);
	bExploded = true;
	Destroy();
	//return;	
}

simulated event PostBeginPlay()
{
	super.PostBeginPlay();
	// End:0x1F
	if(int(Role) == int(ROLE_Authority))
	{
		SetTimer(0.0500000, false);
	}
	//return;	
}

simulated function InitProjectile()
{
	InitEffects();
	// End:0x2B
	if((RandomSpin != float(0)) && !bNoInitialSpin)
	{
		RandSpin(RandomSpin);
	}
	//return;	
}

simulated event HitWall(Vector HitNormal, Actor Wall)
{
	local Vector VNorm;

	// End:0x25
	if(int(DetonateOn) == int(1))
	{
		Explode(Location, HitNormal);
		return;		
	}
	else
	{
		// End:0x4B
		if((int(DetonateOn) == int(2)) && !bHasImpacted)
		{
			SetTimer(DetonateDelay, false);
		}
	}
	// End:0x73
	if(Pawn(Wall) != none)
	{
		DampenFactor *= 0.5000000;
		DampenFactorParallel *= 0.5000000;
	}
	bCanHitOwner = true;
	bHasImpacted = true;
	VNorm = (Velocity Dot HitNormal) * HitNormal;
	Velocity = (-VNorm * DampenFactor) + ((Velocity - VNorm) * DampenFactorParallel);
	// End:0xDD
	if(RandomSpin != float(0))
	{
		RandSpin(100000.0000000);
	}
	Speed = VSize(Velocity);
	// End:0x126
	if(Speed < float(20))
	{
		bBounce = false;
		SetPhysics(0);
		// End:0x123
		if((Trail != none) && !TrailWhenStill)
		{
			DestroyEffects();
		}		
	}
	else
	{
		// End:0x1F1
		if((((((Pawn(Wall) == none) && int(Level.NetMode) != int(NM_DedicatedServer)) && Speed > float(100)) && !Level.bDropDetail) && int(Level.DetailMode) != int(0)) && EffectIsRelevant(Location, false))
		{
			// End:0x1B8
			if(ImpactSound != none)
			{
				PlaySound(ImpactSound, 1);
			}
			// End:0x1F1
			if(ImpactManager != none)
			{
				ImpactManager.static.StartSpawn(Location, HitNormal, int(Wall.SurfaceType), Owner);
			}
		}
	}
	//return;	
}

defaultproperties
{
	NewDetonateDelay=0.1000000
	bNoFXOnExplode=true
	ArmedDetonateOn=0
	bNetTemporary=false
}
