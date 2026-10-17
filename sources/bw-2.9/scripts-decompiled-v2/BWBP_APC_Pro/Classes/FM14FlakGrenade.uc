class FM14FlakGrenade extends BallisticGrenade;

simulated function PostNetBeginPlay()
{
	super(BallisticProjectile).PostNetBeginPlay();
	SetTimer(ArmingDelay, false);
	//return;	
}

simulated function bool Impact(Actor Other, Vector HitLocation)
{
	flakcount = 0;
	super.Impact(Other, HitLocation);
	return true;
	//return;	
}

simulated function Timer()
{
	// End:0x15
	if(StartDelay > float(0))
	{
		super.Timer();
		return;
	}
	// End:0x2B
	if(!bHasImpacted)
	{
		DetonateOn = 1;		
	}
	else
	{
		Explode(Location, vect(0.0000000, 0.0000000, 1.0000000));
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
		DampenFactor *= 0.2000000;
		DampenFactorParallel *= 0.2000000;
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
	Speed = VSize(Velocity / float(2));
	// End:0x12C
	if(Speed < float(20))
	{
		bBounce = false;
		SetPhysics(0);
		// End:0x129
		if((Trail != none) && !TrailWhenStill)
		{
			DestroyEffects();
		}		
	}
	else
	{
		// End:0x237
		if((((((Pawn(Wall) == none) && int(Level.NetMode) != int(NM_DedicatedServer)) && Speed > float(100)) && !Level.bDropDetail) && int(Level.DetailMode) != int(0)) && EffectIsRelevant(Location, false))
		{
			// End:0x1C3
			if(ImpactSound != none)
			{
				PlaySound(ImpactSound, 1, 1.5000000);
			}
			// End:0x209
			if(Instigator == none)
			{
				ReflectImpactManager.static.StartSpawn(Location, HitNormal, int(Wall.SurfaceType), Level.GetLocalPlayerController());				
			}
			else
			{
				ReflectImpactManager.static.StartSpawn(Location, HitNormal, int(Wall.SurfaceType), Instigator);
			}
		}
	}
	//return;	
}

defaultproperties
{
	ReflectImpactManager=Class'BallisticProV55.IM_GunHit'
	bNoInitialSpin=true
	bAlignToVelocity=true
	ArmingDelay=0.3000000
	DetonateDelay=8.0000000
	flakcount=20
	FlakClass=Class'BWBP_APC_Pro.FM14Dart'
	ImpactDamage=105
	ImpactDamageType=Class'BWBP_APC_Pro.DTFM14Grenade'
	WeaponClass=Class'BWBP_APC_Pro.FM14Shotgun'
	ImpactManager=Class'BallisticProV55.IM_M50Grenade'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	TrailClass=Class'BallisticProV55.M50GrenadeTrail'
	TrailOffset=(X=-8.0000000,Y=0.0000000,Z=0.0000000)
	ModeIndex=1
	MyRadiusDamageType=Class'BWBP_APC_Pro.DTFM14GrenadeRadius'
	WallPenetrationForce=128.0000000
	ShakeRadius=512.0000000
	MotionBlurRadius=384.0000000
	MotionBlurFactor=3.0000000
	MotionBlurTime=4.0000000
	Speed=3500.0000000
	Damage=15.0000000
	DamageRadius=32.0000000
	MyDamageType=Class'BallisticProV55.DTM50GrenadeRadius'
	ImpactSound=SoundGroup'BW_Core_WeaponSound.NRP57.NRP57-Concrete'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.M900.M900Grenade'
	bIgnoreTerminalVelocity=true
}
