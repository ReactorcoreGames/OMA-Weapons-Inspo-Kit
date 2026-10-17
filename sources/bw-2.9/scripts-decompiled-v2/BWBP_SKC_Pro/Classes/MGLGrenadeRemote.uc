class MGLGrenadeRemote extends BallisticGrenade;

var bool bReady;

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
	bReady = true;
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
	SetTimer(DetonateDelay, false);
	//return;	
}

function RemoteDetonate()
{
	// End:0x21
	if(bReady)
	{
		Explode(Location, vect(0.0000000, 0.0000000, 1.0000000));
	}
	//return;	
}

defaultproperties
{
	ArmedDetonateOn=5
	ArmedPlayerImpactType=1
	ReflectImpactManager=Class'BallisticProV55.IM_GunHit'
	DampenFactorParallel=0.3000000
	bNoInitialSpin=true
	bAlignToVelocity=true
	DetonateDelay=0.3500000
	ImpactDamage=60
	ImpactDamageType=Class'BWBP_SKC_Pro.DTMGLGrenade'
	WeaponClass=Class'BWBP_SKC_Pro.MGLauncher'
	ImpactManager=Class'BWBP_SKC_Pro.IM_MGLGrenade'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	TrailClass=Class'BWBP_SKC_Pro.MGLNadeTrail'
	ModeIndex=1
	MyRadiusDamageType=Class'BWBP_SKC_Pro.DTMGLGrenadeRadius'
	WallPenetrationForce=64.0000000
	ShakeRadius=512.0000000
	MotionBlurRadius=400.0000000
	MotionBlurFactor=3.0000000
	MotionBlurTime=4.0000000
	Speed=4500.0000000
	Damage=140.0000000
	DamageRadius=768.0000000
	MyDamageType=Class'BWBP_SKC_Pro.DTMGLGrenadeRadius'
	ImpactSound=Sound'BWBP_SKC_Sounds.Misc.FLAK-GrenadeBounce'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.M900.M900Grenade'
	bNetTemporary=false
	bUpdateSimulatedPosition=true
}
