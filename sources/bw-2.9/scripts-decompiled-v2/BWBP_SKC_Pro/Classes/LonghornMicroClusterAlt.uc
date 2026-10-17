class LonghornMicroClusterAlt extends BallisticGrenade;

var float ZBonus;
var int ImpactCount;
var Emitter Flare;
var Class<Emitter> FlareClass;
var bool bFlareKilled;

simulated function InitEffects()
{
	local Vector X, Y, Z;

	bDynamicLight = default.bDynamicLight;
	// End:0x1B3
	if(((int(Level.NetMode) != int(NM_DedicatedServer)) && TrailClass != none) && Trail == none)
	{
		GetAxes(Rotation, X, Y, Z);
		Trail = Spawn(TrailClass, self,, ((Location + (X * TrailOffset.X)) + (Y * TrailOffset.Y)) + (Z * TrailOffset.Z), Rotation);
		Flare = Spawn(FlareClass, self,, ((Location + (X * TrailOffset.X)) + (Y * TrailOffset.Y)) + (Z * TrailOffset.Z), Rotation);
		// End:0x13C
		if((Instigator != none) && LonghornGrenadeTrailAlt(Trail) != none)
		{
			LonghornGrenadeTrailAlt(Trail).SetupColor(Instigator.GetTeamNum());
		}
		// End:0x182
		if(Trail != none)
		{
			// End:0x175
			if(Emitter(Trail) != none)
			{
				Class'BCoreProV55.BallisticEmitter'.static.ScaleEmitter(Emitter(Trail), DrawScale);
			}
			Trail.SetBase(self);
		}
		// End:0x1B3
		if(Flare != none)
		{
			Class'BCoreProV55.BallisticEmitter'.static.ScaleEmitter(Flare, DrawScale);
			Flare.SetBase(self);
		}
	}
	//return;	
}

simulated event HitWall(Vector HitNormal, Actor Wall)
{
	local Vector VNorm;

	bCanHitOwner = true;
	bHasImpacted = true;
	VNorm = (Velocity Dot HitNormal) * HitNormal;
	Velocity = (-VNorm * DampenFactor) + ((Velocity - VNorm) * DampenFactorParallel);
	// End:0x6A
	if(RandomSpin != float(0))
	{
		RandSpin(100000.0000000);
	}
	Speed = VSize(Velocity);
	// End:0x9E
	if(Speed < float(10))
	{
		bBounce = false;
		SetPhysics(0);
		DestroyEffects();
		Destroy();		
	}
	else
	{
		// End:0x169
		if((((((Pawn(Wall) == none) && int(Level.NetMode) != int(NM_DedicatedServer)) && Speed > float(100)) && !Level.bDropDetail) && int(Level.DetailMode) != int(0)) && EffectIsRelevant(Location, false))
		{
			// End:0x130
			if(ImpactSound != none)
			{
				PlaySound(ImpactSound, 1);
			}
			// End:0x169
			if(ImpactManager != none)
			{
				ImpactManager.static.StartSpawn(Location, HitNormal, int(Wall.SurfaceType), Owner);
			}
		}
	}
	//return;	
}

simulated function ProcessTouch(Actor Other, Vector HitLocation)
{
	// End:0x3C
	if((Other == none) || !bCanHitOwner && (Other == Instigator) || Other == Owner)
	{
		return;
	}
	// End:0x58
	if(Pawn(Other) != none)
	{
		Velocity *= 0.8000000;
	}
	// End:0x122
	if((int(Role) == int(ROLE_Authority)) && HitActor == none)
	{
		HitActor = Other;
		// End:0xE7
		if((default.LifeSpan - LifeSpan) > ArmingDelay)
		{
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Other, Damage, Instigator, HitLocation, MomentumTransfer * Normal(Velocity), MyDamageType);
			Explode(HitLocation, vect(0.0000000, 0.0000000, 1.0000000));			
		}
		else
		{
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Other, float(ImpactDamage), Instigator, HitLocation, MomentumTransfer * Normal(Velocity), ImpactDamageType);
			Destroy();
		}
	}
	//return;	
}

simulated function DestroyEffects()
{
	// End:0x22
	if(Flare != none)
	{
		Flare.Kill();
		bFlareKilled = true;
	}
	// End:0x46
	if(Emitter(Trail) != none)
	{
		Emitter(Trail).Kill();
	}
	//return;	
}

simulated function Destroyed()
{
	// End:0x24
	if((Flare != none) && !bFlareKilled)
	{
		Flare.Destroy();
	}
	// End:0x48
	if(Emitter(Trail) != none)
	{
		Emitter(Trail).Kill();
	}
	super(BallisticProjectile).Destroyed();
	//return;	
}

defaultproperties
{
	FlareClass=Class'BWBP_SKC_Pro.LonghornClusterFlare'
	ArmedDetonateOn=2
	ArmedPlayerImpactType=1
	DampenFactor=0.1000000
	DampenFactorParallel=0.2500000
	bAlignToVelocity=true
	ArmingDelay=0.1000000
	DetonateDelay=1.2500000
	ImpactDamage=23
	ImpactDamageType=Class'BWBP_SKC_Pro.DT_LonghornShotDirect'
	WeaponClass=Class'BWBP_SKC_Pro.LonghornLauncher'
	ImpactManager=Class'BWBP_SKC_Pro.IM_LonghornCluster'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	TrailClass=Class'BWBP_SKC_Pro.LonghornGrenadeTrailAlt'
	ModeIndex=1
	MyRadiusDamageType=Class'BWBP_SKC_Pro.DT_LonghornShotRadius'
	ShakeRadius=512.0000000
	MotionBlurRadius=384.0000000
	MotionBlurFactor=3.0000000
	MotionBlurTime=1.0000000
	Speed=7500.0000000
	MaxSpeed=7500.0000000
	MyDamageType=Class'BWBP_SKC_Pro.DT_LonghornShotRadius'
	LightType=1
	LightEffect=21
	LightHue=25
	LightSaturation=192
	LightBrightness=32.0000000
	LightRadius=4.0000000
	StaticMesh=StaticMesh'BWBP_SKC_Static.Longhorn.ClusterProj'
	bDynamicLight=true
	LifeSpan=20.0000000
	DrawScale=0.5000000
	RotationRate=(Pitch=0,Yaw=0,Roll=32768)
}
