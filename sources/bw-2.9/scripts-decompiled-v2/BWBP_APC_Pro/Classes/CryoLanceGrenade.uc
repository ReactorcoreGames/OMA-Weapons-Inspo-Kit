class CryoLanceGrenade extends BallisticGrenade;

var array<Actor> PokedControls;

simulated function PostNetBeginPlay()
{
	super(BallisticProjectile).PostNetBeginPlay();
	SetTimer(0.1500000, false);
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

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
	// End:0x18
	if(ShakeRadius > float(0))
	{
		ShakeView(HitLocation);
	}
	BlowUp(HitLocation);
	// End:0x84
	if(ImpactManager != none)
	{
		// End:0x65
		if(Instigator == none)
		{
			ImpactManager.static.StartSpawn(HitLocation, HitNormal, 0, Level.GetLocalPlayerController());			
		}
		else
		{
			ImpactManager.static.StartSpawn(HitLocation, HitNormal, 0, Instigator);
		}
	}
	Destroy();
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
		// End:0x242
		if((((((Pawn(Wall) == none) && int(Level.NetMode) != int(NM_DedicatedServer)) && Speed > float(100)) && !Level.bDropDetail) && int(Level.DetailMode) != int(0)) && EffectIsRelevant(Location, false))
		{
			// End:0x1C3
			if(ImpactSound != none)
			{
				PlaySound(ImpactSound, 1, 1.5000000);
			}
			// End:0x242
			if(ReflectImpactManager != none)
			{
				// End:0x214
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
	}
	//return;	
}

simulated function ApplyImpactEffect(Actor Other, Vector HitLocation)
{
	super.ApplyImpactEffect(Other, HitLocation);
	// End:0x5F
	if((Pawn(Other) != none) && (int(PlayerImpactType) == int(1)) || int(DetonateOn) == int(1))
	{
		ApplySlowdown(Pawn(Other), Damage / float(8));
	}
	//return;	
}

function TargetedHurtRadius(float DamageAmount, float DamageRadius, Class<DamageType> DamageType, float Momentum, Vector HitLocation, optional Actor Excluded)
{
	local Actor Victims;
	local float damageScale, dist;
	local Vector Dir, Dummy;
	local int i;

	// End:0x0B
	if(bHurtEntry)
	{
		return;
	}
	bHurtEntry = true;
	// End:0x364
	foreach VisibleCollidingActors(Class'Engine.Actor', Victims, DamageRadius, HitLocation)
	{
		// End:0xDD
		if(FP7GroundFire(Victims) != none)
		{
			i = 0;
			J0x44:

			// End:0x83 [Loop If]
			if((i < PokedControls.Length) && FP7GroundFire(Victims).FireControl != PokedControls[i])
			{
				i++;
				// [Loop Continue]
				goto J0x44;
			}
			// End:0xDA
			if(i == PokedControls.Length)
			{
				PokedControls[PokedControls.Length] = FP7GroundFire(Victims).FireControl;
				FP7GroundFire(Victims).FireControl.NotifyPutOut(HitLocation, DamageRadius);
			}
			// End:0x363
			continue;
		}
		// End:0x363
		if(((((Victims != self) && int(Victims.Role) == int(ROLE_Authority)) && !Victims.IsA('FluidSurfaceInfo')) && Victims != Excluded) && Victims != HurtWall)
		{
			Dir = Victims.Location;
			// End:0x1A7
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
			// End:0x26F
			if((Instigator == none) || Instigator.Controller == none)
			{
				Victims.SetDelayedDamageInstigatorController(InstigatorController);
			}
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Victims, Square(damageScale) * DamageAmount, Instigator, Victims.Location - ((0.5000000 * (Victims.CollisionHeight + Victims.CollisionRadius)) * Dir), (damageScale * Momentum) * Dir, DamageType);
			// End:0x363
			if((Pawn(Victims) != none) && Level.Game.ReduceDamage(int(DamageAmount), xPawn(Victims), Instigator, Victims.Location, Dummy, DamageType) > 0)
			{
				ApplySlowdown(Pawn(Victims), Damage / float(8));
			}
		}		
	}	
	bHurtEntry = false;
	//return;	
}

function ApplySlowdown(Pawn Target, float Duration)
{
	Class'BCoreProV55.BCSprintControl'.static.AddSlowTo(Target, 0.7000000, Duration);
	//return;	
}

defaultproperties
{
	DetonateOn=2
	PlayerImpactType=1
	ReflectImpactManager=Class'BallisticProV55.IM_GunHit'
	bNoInitialSpin=true
	bAlignToVelocity=true
	DetonateDelay=1.0000000
	ImpactDamage=50
	ImpactDamageType=Class'BWBP_SKC_Pro.DT_MARSGrenadeIceRadius'
	ImpactManager=Class'BWBP_SKC_Pro.IM_CryoGrenade'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	TrailClass=Class'BWBP_SKC_Pro.ChaffTrail'
	TrailOffset=(X=1.6000000,Y=0.0000000,Z=6.4000000)
	ModeIndex=1
	MyRadiusDamageType=Class'BWBP_SKC_Pro.DT_MARSGrenadeIceRadius'
	Speed=3500.0000000
	Damage=50.0000000
	DamageRadius=512.0000000
	MomentumTransfer=0.0000000
	MyDamageType=Class'BWBP_SKC_Pro.DT_MARSGrenadeIceRadius'
	ImpactSound=SoundGroup'BW_Core_WeaponSound.NRP57.NRP57-Concrete'
	StaticMesh=StaticMesh'BWBP_APC_Static.CryoLance.Proj_IceFlak'
	DrawScale=0.2000000
	bUnlit=false
	bIgnoreTerminalVelocity=true
}
