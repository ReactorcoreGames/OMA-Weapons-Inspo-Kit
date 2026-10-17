class ScarabMicroClusterFlak extends BallisticGrenade;

const EXP_LIFE_TIME = 0.35f;

var float ZBonus;
var bool bDetonating;
var Range DetonateDelayRange;

simulated function PostNetBeginPlay()
{
	local PlayerController PC;

	Acceleration = Normal(Velocity) * AccelSpeed;
	// End:0x2F
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		return;
	}
	InitEffects();
	// End:0x75
	if(Level.bDropDetail || int(Level.DetailMode) == int(0))
	{
		bDynamicLight = false;
		LightType = 0;		
	}
	else
	{
		PC = Level.GetLocalPlayerController();
		// End:0xCC
		if(((PC == none) || Instigator == none) || PC != Instigator.Controller)
		{
			bDynamicLight = false;
			LightType = 0;
		}
	}
	//return;	
}

simulated event Timer()
{
	// End:0x39
	if(StartDelay > float(0))
	{
		StartDelay = 0.0000000;
		bHidden = false;
		SetPhysics(default.Physics);
		InitProjectile();
		SetTimer(0.1500000, false);
		return;
	}
	// End:0xBD
	if(HitActor != none)
	{
		// End:0x79
		if((Instigator == none) || Instigator.Controller == none)
		{
			HitActor.SetDelayedDamageInstigatorController(InstigatorController);
		}
		Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(HitActor, Damage, Instigator, Location, MomentumTransfer * (HitActor.Location - Location), MyDamageType);
	}
	// End:0xE1
	if(bDetonating)
	{
		Explode(Location, vect(0.0000000, 0.0000000, 1.0000000));		
	}
	else
	{
		// End:0xF2
		if(!bCollideActors)
		{
			SetCollision(true, true, true);
		}
	}
	//return;	
}

simulated function InitProjectile()
{
	// End:0x25
	if((RandomSpin != float(0)) && !bNoInitialSpin)
	{
		RandSpin(RandomSpin);
	}
	// End:0x65
	if((int(DetonateOn) == int(2)) || int(DetonateOn) == int(0))
	{
		DetonateDelay = Lerp(FRand(), DetonateDelayRange.Min, DetonateDelayRange.Max);
	}
	//return;	
}

simulated function InitEffects()
{
	local Vector X, Y, Z;

	bDynamicLight = default.bDynamicLight;
	// End:0x12D
	if(((int(Level.NetMode) != int(NM_DedicatedServer)) && TrailClass != none) && Trail == none)
	{
		GetAxes(Rotation, X, Y, Z);
		Trail = Spawn(TrailClass, self,, ((Location + (X * TrailOffset.X)) + (Y * TrailOffset.Y)) + (Z * TrailOffset.Z), Rotation);
		// End:0xE7
		if(LonghornGrenadeTrail(Trail) != none)
		{
			// End:0xE7
			if(Instigator != none)
			{
				LonghornGrenadeTrail(Trail).SetupColor(Instigator.GetTeamNum());
			}
		}
		// End:0x115
		if(Emitter(Trail) != none)
		{
			Class'BCoreProV55.BallisticEmitter'.static.ScaleEmitter(Emitter(Trail), DrawScale);
		}
		// End:0x12D
		if(Trail != none)
		{
			Trail.SetBase(self);
		}
	}
	//return;	
}

simulated function ApplyImpactEffect(Actor Other, Vector HitLocation)
{
	// End:0x35
	if((Instigator == none) || Instigator.Controller == none)
	{
		Other.SetDelayedDamageInstigatorController(InstigatorController);
	}
	// End:0xB7
	if(((int(PlayerImpactType) == int(1)) || int(DetonateOn) == int(1)) || ((default.LifeSpan - LifeSpan) > 0.3500000) && !bHasImpacted)
	{
		Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Other, float(ImpactDamage), Instigator, HitLocation, MomentumTransfer * Normal(Velocity), ImpactDamageType);		
	}
	else
	{
		// End:0x11E
		if((int(PlayerImpactType) == int(0)) || (int(PlayerImpactType) == int(2)) && VSize(Velocity) < MinStickVelocity)
		{
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Other, float(ImpactDamage), Instigator, HitLocation, Velocity, ImpactDamageType);			
		}
		else
		{
			// End:0x16A
			if((int(PlayerImpactType) == int(2)) && Base == none)
			{
				Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Other, float(ImpactDamage), Instigator, HitLocation, Velocity, ImpactDamageType);
			}
		}
	}
	//return;	
}

simulated event ProcessTouch(Actor Other, Vector HitLocation)
{
	local float boneDist;

	// End:0x12
	if(!CanTouch(Other))
	{
		return;
	}
	// End:0x93
	if(Pawn(Other) != none)
	{
		Velocity *= 0.5000000;
		// End:0x93
		if((int(Pawn(Other).Physics) == int(2)) && Other != Instigator)
		{
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Other, float(ImpactDamage) * 0.5000000, Instigator, HitLocation, Velocity, ImpactDamageType);
		}
	}
	// End:0xFF
	if(((int(PlayerImpactType) == int(1)) || int(DetonateOn) == int(1)) || ((default.LifeSpan - LifeSpan) > 0.3500000) && !bHasImpacted)
	{
		Explode(HitLocation, Normal(HitLocation - Other.Location));		
	}
	else
	{
		// End:0x159
		if((int(PlayerImpactType) == int(0)) || (int(PlayerImpactType) == int(2)) && VSize(Velocity) < MinStickVelocity)
		{
			HitWall(Normal(HitLocation - Other.Location), Other);			
		}
		else
		{
			// End:0x21C
			if((int(PlayerImpactType) == int(2)) && Base == none)
			{
				SetPhysics(0);
				// End:0x19C
				if(int(DetonateOn) == int(2))
				{
					bDetonating = true;
					SetTimer(DetonateDelay, false);
				}
				// End:0x1F7
				if((Other != Instigator) && int(Other.DrawType) == int(2))
				{
					Other.AttachToBone(self, Other.GetClosestBone(Location, Velocity, boneDist));					
				}
				else
				{
					SetBase(Other);
				}
				SetRotation(Rotator(Velocity));
				Velocity = vect(0.0000000, 0.0000000, 0.0000000);
			}
		}
	}
	// End:0x246
	if((Instigator != none) && Instigator.GetTeamNum() == 1)
	{
		LightHue = 160;
	}
	//return;	
}

simulated event HitWall(Vector HitNormal, Actor Wall)
{
	local Vector VNorm;

	// End:0x4A
	if((int(DetonateOn) == int(1)) || ((default.LifeSpan - LifeSpan) > 0.3500000) && !bHasImpacted)
	{
		Explode(Location, HitNormal);
		return;		
	}
	else
	{
		// End:0x78
		if((int(DetonateOn) == int(2)) && !bHasImpacted)
		{
			bDetonating = true;
			SetTimer(DetonateDelay, false);
		}
	}
	// End:0xA0
	if(Pawn(Wall) != none)
	{
		DampenFactor *= 0.5000000;
		DampenFactorParallel *= 0.5000000;
	}
	bCanHitOwner = true;
	bHasImpacted = true;
	VNorm = (Velocity Dot HitNormal) * HitNormal;
	Velocity = (-VNorm * DampenFactor) + ((Velocity - VNorm) * DampenFactorParallel);
	// End:0x10A
	if(RandomSpin != float(0))
	{
		RandSpin(100000.0000000);
	}
	Speed = VSize(Velocity);
	// End:0x17E
	if((Speed < float(50)) || (Velocity.Z < float(8)) && HitNormal.Z > 0.9000000)
	{
		bBounce = false;
		SetPhysics(0);
		// End:0x17B
		if((Trail != none) && !TrailWhenStill)
		{
			DestroyEffects();
		}		
	}
	else
	{
		// End:0x249
		if((((((Pawn(Wall) == none) && int(Level.NetMode) != int(NM_DedicatedServer)) && Speed > float(100)) && !Level.bDropDetail) && int(Level.DetailMode) != int(0)) && EffectIsRelevant(Location, false))
		{
			// End:0x210
			if(ImpactSound != none)
			{
				PlaySound(ImpactSound, 1);
			}
			// End:0x249
			if(ImpactManager != none)
			{
				ImpactManager.static.StartSpawn(Location, HitNormal, int(Wall.SurfaceType), Owner);
			}
		}
	}
	//return;	
}

simulated function TargetedHurtRadius(float DamageAmount, float DamageRadius, Class<DamageType> DamageType, float Momentum, Vector HitLocation, optional Actor Victim)
{
	local Actor Victims;
	local float damageScale, dist;
	local Vector Dir, NewMomentum;

	// End:0x0B
	if(bHurtEntry)
	{
		return;
	}
	bHurtEntry = true;
	// End:0x27E
	foreach VisibleCollidingActors(Class'Engine.Actor', Victims, DamageRadius, HitLocation)
	{
		// End:0x27D
		if(((((Victims != self) && int(Victims.Role) == int(ROLE_Authority)) && !Victims.IsA('FluidSurfaceInfo')) && Victims != Victim) && Victims != HurtWall)
		{
			Dir = Victims.Location;
			// End:0xF7
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
			// End:0x1C2
			if(!bHasImpacted)
			{
				damageScale *= (float(1) + (FMin(default.LifeSpan - (LifeSpan + 0.3500000), 2.0000000) * 0.6500000));
			}
			// End:0x1F7
			if((Instigator == none) || Instigator.Controller == none)
			{
				Victims.SetDelayedDamageInstigatorController(InstigatorController);
			}
			NewMomentum = (damageScale * Momentum) * Dir;
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Victims, Square(damageScale) * DamageAmount, Instigator, Victims.Location - ((0.5000000 * (Victims.CollisionHeight + Victims.CollisionRadius)) * Dir), NewMomentum, DamageType);
		}		
	}	
	bHurtEntry = false;
	//return;	
}

defaultproperties
{
	DetonateDelayRange=(Min=0.7500000,Max=1.2500000)
	DetonateOn=2
	PlayerImpactType=1
	DampenFactor=0.1000000
	bAlignToVelocity=true
	ImpactDamage=45
	ImpactDamageType=Class'BWBP_APC_Pro.DTScarabGrenadeCluster'
	bApplyParams=false
	WeaponClass=Class'BWBP_APC_Pro.ScarabGrenade'
	ImpactManager=Class'BWBP_SKC_Pro.IM_LonghornCluster'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	TrailClass=Class'BWBP_SKC_Pro.LonghornGrenadeTrailSmall'
	MyRadiusDamageType=Class'BWBP_APC_Pro.DTScarabGrenadeCluster'
	ShakeRadius=512.0000000
	MotionBlurRadius=384.0000000
	MotionBlurFactor=3.0000000
	MotionBlurTime=1.0000000
	Speed=500.0000000
	MaxSpeed=1500.0000000
	Damage=50.0000000
	DamageRadius=150.0000000
	MomentumTransfer=15000.0000000
	MyDamageType=Class'BWBP_APC_Pro.DTScarabGrenadeCluster'
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
	bCollideActors=false
	bIgnoreTerminalVelocity=true
	RotationRate=(Pitch=0,Yaw=0,Roll=32768)
}
