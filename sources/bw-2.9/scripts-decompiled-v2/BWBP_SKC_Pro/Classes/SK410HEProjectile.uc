class SK410HEProjectile extends BallisticGrenade;

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
		DampenFactor *= 0.0100000;
		DampenFactorParallel *= 0.0100000;
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
		// End:0x1FC
		if((((((Pawn(Wall) == none) && int(Level.NetMode) != int(NM_DedicatedServer)) && Speed > float(100)) && !Level.bDropDetail) && int(Level.DetailMode) != int(0)) && EffectIsRelevant(Location, false))
		{
			// End:0x1C3
			if(ImpactSound != none)
			{
				PlaySound(ImpactSound, 1, 1.5000000);
			}
			// End:0x1FC
			if(ImpactManager != none)
			{
				ImpactManager.static.StartSpawn(Location, HitNormal, int(Wall.SurfaceType), Owner);
			}
		}
	}
	//return;	
}

function TargetedHurtRadius(float DamageAmount, float DamageRadius, Class<DamageType> DamageType, float Momentum, Vector HitLocation, optional Actor Victim)
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
	// End:0x36
	if(Victim == none)
	{
		DamageAmount *= 0.5000000;
		DamageRadius *= 0.7500000;
	}
	// End:0x283
	foreach CollidingActors(Class'Engine.Actor', Victims, DamageRadius, HitLocation)
	{
		// End:0x282
		if(((((Victims != self) && int(Victims.Role) == int(ROLE_Authority)) && !Victims.IsA('FluidSurfaceInfo')) && Victims != Victim) && Victims != HurtWall)
		{
			// End:0xCF
			if(!FastTrace(Victims.Location, Location))
			{
				continue;				
			}
			Dir = Victims.Location;
			// End:0x139
			if(Victims.Location.Z > HitLocation.Z)
			{
				Dir.Z = FMax(HitLocation.Z, Dir.Z - Victims.CollisionHeight);				
			}
			else
			{
				Dir.Z = FMin(HitLocation.Z, Dir.Z + Victims.CollisionHeight);
			}
			Dir -= HitLocation;
			dist = FMax(1.0000000, VSize(Dir));
			Dir = Dir / dist;
			damageScale = 1.0000000 - FMax(0.0000000, (dist - Victims.CollisionRadius) / DamageRadius);
			// End:0x201
			if((Instigator == none) || Instigator.Controller == none)
			{
				Victims.SetDelayedDamageInstigatorController(InstigatorController);
			}
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Victims, Square(damageScale) * DamageAmount, Instigator, Victims.Location - ((0.5000000 * (Victims.CollisionHeight + Victims.CollisionRadius)) * Dir), GetMomentumVector((damageScale * 0.6000000) * Dir), DamageType);
		}		
	}	
	bHurtEntry = false;
	//return;	
}

defaultproperties
{
	ArmedDetonateOn=1
	bNoInitialSpin=true
	bAlignToVelocity=true
	DetonateDelay=0.1500000
	ImpactDamage=80
	ImpactDamageType=Class'BWBP_SKC_Pro.DT_SK410Slug'
	WeaponClass=Class'BWBP_SKC_Pro.SK410Shotgun'
	ImpactManager=Class'BWBP_SKC_Pro.IM_SlugHE'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	TrailClass=Class'BWBP_SKC_Pro.SK410FireTrail'
	TrailOffset=(X=-8.0000000,Y=0.0000000,Z=0.0000000)
	ModeIndex=1
	MyRadiusDamageType=Class'BWBP_SKC_Pro.DT_SK410Slug'
	ShakeRadius=512.0000000
	MotionBlurRadius=128.0000000
	AccelSpeed=3000.0000000
	Speed=8000.0000000
	MaxSpeed=15000.0000000
	Damage=50.0000000
	DamageRadius=256.0000000
	MomentumTransfer=100000.0000000
	MyDamageType=Class'BWBP_SKC_Pro.DT_SK410Slug'
	LightHue=180
	LightSaturation=100
	LightBrightness=160.0000000
	LightRadius=8.0000000
	StaticMesh=StaticMesh'BWBP_SKC_Static.Bulldog.Frag12Proj'
	LifeSpan=16.0000000
	DrawScale=2.0000000
}
