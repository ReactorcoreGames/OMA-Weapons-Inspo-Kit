class PumaProjectileImpact extends BallisticGrenade;

simulated event Timer()
{
	// End:0x45
	if(StartDelay > float(0))
	{
		StartDelay = 0.0000000;
		bHidden = false;
		SetPhysics(default.Physics);
		SetCollision(default.bCollideActors, default.bBlockActors, default.bBlockPlayers);
		InitProjectile();
		return;
	}
	// End:0xC9
	if(HitActor != none)
	{
		// End:0x85
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
	// End:0x3A
	if(bAlignToVelocity && (RandomSpin == float(0)) || bNoInitialSpin && !bHasImpacted)
	{
		SetRotation(Rotator(Velocity));
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
	ImpactDamage=70
	ImpactDamageType=Class'BWBP_SKC_Pro.DT_PUMAGrenade'
	WeaponClass=Class'BWBP_SKC_Pro.PumaRepeater'
	ImpactManager=Class'BWBP_SKC_Pro.IM_PumaDet'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	TrailClass=Class'BWBP_SKC_Pro.PumaProjTrail'
	MyRadiusDamageType=Class'BWBP_SKC_Pro.DT_PUMARadius'
	ShakeRadius=350.0000000
	MotionBlurRadius=250.0000000
	Speed=6500.0000000
	Damage=60.0000000
	DamageRadius=300.0000000
	MomentumTransfer=10000.0000000
	MyDamageType=Class'BWBP_SKC_Pro.DT_PUMAGrenade'
	LightHue=180
	LightSaturation=100
	LightBrightness=160.0000000
	LightRadius=8.0000000
	StaticMesh=StaticMesh'BWBP_SKC_Static.Bulldog.Frag12Proj'
	LifeSpan=16.0000000
	DrawScale=2.0000000
}
