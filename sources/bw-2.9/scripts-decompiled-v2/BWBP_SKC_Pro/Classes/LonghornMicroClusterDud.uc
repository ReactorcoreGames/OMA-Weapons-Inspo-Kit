class LonghornMicroClusterDud extends BallisticGrenade;

var Emitter Flare;
var Class<Emitter> FlareClass;
var bool bFlareKilled;

simulated function PostNetBeginPlay()
{
	local PlayerController PC;

	// End:0x1B
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		return;
	}
	InitEffects();
	// End:0x61
	if(Level.bDropDetail || int(Level.DetailMode) == int(0))
	{
		bDynamicLight = false;
		LightType = 0;		
	}
	else
	{
		PC = Level.GetLocalPlayerController();
		// End:0xB8
		if(((PC == none) || Instigator == none) || PC != Instigator.Controller)
		{
			bDynamicLight = false;
			LightType = 0;
		}
	}
	//return;	
}

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

	// End:0x28
	if(Pawn(Wall) != none)
	{
		DampenFactor *= 0.5000000;
		DampenFactorParallel *= 0.5000000;
	}
	bCanHitOwner = true;
	bHasImpacted = true;
	VNorm = (Velocity Dot HitNormal) * HitNormal;
	Velocity = (-VNorm * DampenFactor) + ((Velocity - VNorm) * DampenFactorParallel);
	// End:0x92
	if(RandomSpin != float(0))
	{
		RandSpin(100000.0000000);
	}
	Speed = VSize(Velocity);
	// End:0xC6
	if(Speed < float(10))
	{
		bBounce = false;
		SetPhysics(0);
		DestroyEffects();
		Destroy();		
	}
	else
	{
		// End:0x191
		if((((((Pawn(Wall) == none) && int(Level.NetMode) != int(NM_DedicatedServer)) && Speed > float(100)) && !Level.bDropDetail) && int(Level.DetailMode) != int(0)) && EffectIsRelevant(Location, false))
		{
			// End:0x158
			if(ImpactSound != none)
			{
				PlaySound(ImpactSound, 1);
			}
			// End:0x191
			if(ImpactManager != none)
			{
				ImpactManager.static.StartSpawn(Location, HitNormal, int(Wall.SurfaceType), Owner);
			}
		}
	}
	//return;	
}

simulated function ApplyImpactEffect(Actor Other, Vector HitLocation)
{
	Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Other, float(ImpactDamage), Instigator, HitLocation, MomentumTransfer * Normal(Velocity), ImpactDamageType);
	//return;	
}

simulated function bool Impact(Actor Other, Vector HitLocation)
{
	Destroy();
	return true;
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
	FlareClass=Class'BWBP_SKC_Pro.LonghornClusterFlareDud'
	ArmedDetonateOn=5
	DampenFactorParallel=0.2500000
	bAlignToVelocity=true
	DetonateDelay=1.2500000
	bApplyParams=false
	WeaponClass=Class'BWBP_SKC_Pro.LonghornLauncher'
	ImpactManager=Class'BWBP_SKC_Pro.IM_LonghornCluster'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	MyRadiusDamageType=Class'BWBP_SKC_Pro.DT_LonghornShotRadius'
	ShakeRadius=512.0000000
	MotionBlurRadius=128.0000000
	MotionBlurFactor=1.0000000
	MotionBlurTime=0.0000000
	Speed=750.0000000
	MaxSpeed=750.0000000
	Damage=15.0000000
	DamageRadius=32.0000000
	MomentumTransfer=25000.0000000
	MyDamageType=Class'BWBP_SKC_Pro.DT_LonghornShotDirect'
	LightType=1
	LightEffect=21
	LightHue=25
	LightSaturation=192
	LightBrightness=32.0000000
	LightRadius=4.0000000
	StaticMesh=StaticMesh'BWBP_SKC_Static.Longhorn.ClusterProj'
	bDynamicLight=true
	LifeSpan=3.0000000
	DrawScale=0.5000000
	bCollideActors=false
	RotationRate=(Pitch=0,Yaw=0,Roll=32768)
}
