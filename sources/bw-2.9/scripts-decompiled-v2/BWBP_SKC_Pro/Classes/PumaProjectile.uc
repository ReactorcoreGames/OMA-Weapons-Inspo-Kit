class PumaProjectile extends BallisticGrenade;

var bool bPrimed;

simulated function PostBeginPlay()
{
	SetTimer(0.1000000, false);
	super.PostBeginPlay();
	//return;	
}

simulated event Timer()
{
	// End:0x15
	if(!bPrimed)
	{
		bPrimed = true;
		return;
	}
	// End:0x5A
	if(StartDelay > float(0))
	{
		StartDelay = 0.0000000;
		bHidden = false;
		SetPhysics(default.Physics);
		SetCollision(default.bCollideActors, default.bBlockActors, default.bBlockPlayers);
		InitProjectile();
		return;
	}
	// End:0xDE
	if(HitActor != none)
	{
		// End:0x9A
		if((Instigator == none) || Instigator.Controller == none)
		{
			HitActor.SetDelayedDamageInstigatorController(InstigatorController);
		}
		Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(HitActor, Damage, Instigator, Location, MomentumTransfer * (HitActor.Location - Location), MyDamageType);
	}
	Explode(Location, vect(0.0000000, 0.0000000, 1.0000000));
	//return;	
}

simulated event Tick(float dt)
{
	local Actor Target;

	// End:0x3A
	if(bAlignToVelocity && (RandomSpin == float(0)) || bNoInitialSpin && !bHasImpacted)
	{
		SetRotation(Rotator(Velocity));
	}
	// End:0x8E
	foreach VisibleCollidingActors(Class'Engine.Actor', Target, DamageRadius - float(70), Location)
	{
		// End:0x8D
		if((Target.bCanBeDamaged && Target != self) && bPrimed)
		{
			SetTimer(0.0100000, false);
		}		
	}	
	//return;	
}

simulated function TargetedHurtRadius(float DamageAmount, float DamageRadius, Class<DamageType> DamageType, float Momentum, Vector HitLocation, optional Actor Victim)
{
	local Actor Victims;
	local float damageScale, dist;
	local Vector Dir;

	// End:0x0B
	if(bHurtEntry)
	{
		return;
	}
	bHurtEntry = true;
	// End:0x1AD
	foreach VisibleCollidingActors(Class'Engine.Actor', Victims, DamageRadius, HitLocation)
	{
		// End:0x1AC
		if(((((Victims != self) && int(Victims.Role) == int(ROLE_Authority)) && !Victims.IsA('FluidSurfaceInfo')) && Victims != Victim) && Victims != HurtWall)
		{
			Dir = Victims.Location - HitLocation;
			dist = FMax(1.0000000, VSize(Dir));
			Dir = Dir / dist;
			damageScale = 1.0000000 - FMin(0.6000000, (dist - Victims.CollisionRadius) / DamageRadius);
			// End:0x133
			if((Instigator == none) || Instigator.Controller == none)
			{
				Victims.SetDelayedDamageInstigatorController(InstigatorController);
			}
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Victims, damageScale * DamageAmount, Instigator, Victims.Location - ((0.5000000 * (Victims.CollisionHeight + Victims.CollisionRadius)) * Dir), (damageScale * Momentum) * Dir, DamageType);
		}		
	}	
	bHurtEntry = false;
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
		// End:0x53
		if((int(DetonateOn) == int(2)) && !bHasImpacted)
		{
			bPrimed = true;
			SetTimer(DetonateDelay, false);
		}
	}
	// End:0x7B
	if(Pawn(Wall) != none)
	{
		DampenFactor *= 0.5000000;
		DampenFactorParallel *= 0.5000000;
	}
	bCanHitOwner = true;
	bHasImpacted = true;
	VNorm = (Velocity Dot HitNormal) * HitNormal;
	Velocity = (-VNorm * DampenFactor) + ((Velocity - VNorm) * DampenFactorParallel);
	// End:0xE5
	if(RandomSpin != float(0))
	{
		RandSpin(100000.0000000);
	}
	Speed = VSize(Velocity);
	// End:0x12E
	if(Speed < float(20))
	{
		bBounce = false;
		SetPhysics(0);
		// End:0x12B
		if((Trail != none) && !TrailWhenStill)
		{
			DestroyEffects();
		}		
	}
	else
	{
		// End:0x1F9
		if((((((Pawn(Wall) == none) && int(Level.NetMode) != int(NM_DedicatedServer)) && Speed > float(100)) && !Level.bDropDetail) && int(Level.DetailMode) != int(0)) && EffectIsRelevant(Location, false))
		{
			// End:0x1C0
			if(ImpactSound != none)
			{
				PlaySound(ImpactSound, 1);
			}
			// End:0x1F9
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
	ArmedDetonateOn=2
	ArmedPlayerImpactType=1
	bNoInitialSpin=true
	bAlignToVelocity=true
	DetonateDelay=0.0500000
	ImpactDamage=90
	ImpactDamageType=Class'BWBP_SKC_Pro.DT_PUMAGrenade'
	WeaponClass=Class'BWBP_SKC_Pro.PumaRepeater'
	ImpactManager=Class'BWBP_SKC_Pro.IM_PumaDet'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	TrailClass=Class'BWBP_SKC_Pro.PumaProjTrailCorona'
	MyRadiusDamageType=Class'BWBP_SKC_Pro.DT_PUMARadius'
	ShakeRadius=300.0000000
	ShakeRotTime=1.0000000
	MotionBlurRadius=200.0000000
	MotionBlurFactor=2.0000000
	MotionBlurTime=1.0000000
	Speed=6500.0000000
	Damage=75.0000000
	DamageRadius=300.0000000
	MomentumTransfer=10000.0000000
	MyDamageType=Class'BWBP_SKC_Pro.DT_PUMAGrenade'
	ImpactSound=Sound'BW_Core_WeaponSound.MRS38.RSS-ElectroHit1'
	LightHue=180
	LightSaturation=100
	LightBrightness=160.0000000
	LightRadius=8.0000000
	StaticMesh=StaticMesh'BWBP_SKC_Static.Bulldog.Frag12Proj'
	LifeSpan=16.0000000
	DrawScale=1.5000000
}
