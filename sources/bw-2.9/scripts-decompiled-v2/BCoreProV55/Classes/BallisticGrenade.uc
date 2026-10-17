class BallisticGrenade extends BallisticProjectile
	abstract;

var() GrenadeEffectParams.EDetonateType UnarmedDetonateOn;
var() GrenadeEffectParams.EDetonateType ArmedDetonateOn;
var GrenadeEffectParams.EDetonateType DetonateOn;
var() GrenadeEffectParams.EPlayerImpactType UnarmedPlayerImpactType;
var() GrenadeEffectParams.EPlayerImpactType ArmedPlayerImpactType;
var GrenadeEffectParams.EPlayerImpactType PlayerImpactType;
var() Class<BCImpactManager> ReflectImpactManager;
var() float DampenFactor;
var() float DampenFactorParallel;
var() float PawnDampAdjust;
var() float RandomSpin;
var() bool bNoInitialSpin;
var() bool bAlignToVelocity;
var bool bHasImpacted;
var() bool bCombinedSplashImpact;
var() float ArmingDelay;
var() bool bArmed;
var() float DetonateDelay;
var() int flakcount;
var() Class<Projectile> FlakClass;
var() bool TrailWhenStill;
var() int ImpactDamage;
var() Class<DamageType> ImpactDamageType;
var() float MinStickVelocity;
var() float StillSpeed;

simulated event PostBeginPlay()
{
	super.PostBeginPlay();
	// End:0x2B
	if((RandomSpin != float(0)) && !bNoInitialSpin)
	{
		RandSpin(RandomSpin);
	}
	//return;	
}

simulated function ApplyParams(ProjectileEffectParams Params)
{
	local GrenadeEffectParams gren_params;

	super.ApplyParams(Params);
	gren_params = GrenadeEffectParams(Params);
	// End:0x11C
	if(gren_params != none)
	{
		ImpactDamage = int(gren_params.ImpactDamage);
		default.ImpactDamage = int(gren_params.ImpactDamage);
		bCombinedSplashImpact = gren_params.bCombinedSplashImpact;
		default.bCombinedSplashImpact = gren_params.bCombinedSplashImpact;
		// End:0x11C
		if(gren_params.bOverrideArming)
		{
			ArmingDelay = gren_params.ArmingDelay;
			UnarmedDetonateOn = gren_params.UnarmedDetonateOn;
			ArmedDetonateOn = gren_params.ArmedDetonateOn;
			UnarmedPlayerImpactType = gren_params.UnarmedPlayerImpactType;
			ArmedPlayerImpactType = gren_params.ArmedPlayerImpactType;
			DetonateDelay = gren_params.DetonateDelay;
			default.DetonateDelay = gren_params.DetonateDelay;
		}
	}
	// End:0x14B
	if(ArmingDelay > float(0))
	{
		DetonateOn = UnarmedDetonateOn;
		PlayerImpactType = UnarmedPlayerImpactType;
		SetTimer(ArmingDelay, false);		
	}
	else
	{
		ARM();
		// End:0x16A
		if(int(DetonateOn) == int(0))
		{
			SetTimer(DetonateDelay, false);
		}
	}
	//return;	
}

simulated function ARM()
{
	// End:0x26
	if((int(UnarmedDetonateOn) == int(4)) && bHasImpacted)
	{
		DestroyEffects();
		Destroy();
		return;
	}
	bArmed = true;
	DetonateOn = ArmedDetonateOn;
	PlayerImpactType = ArmedPlayerImpactType;
	//return;	
}

simulated event Timer()
{
	// End:0x13
	if(!bArmed)
	{
		ARM();
		return;
	}
	Explode(Location, vect(0.0000000, 0.0000000, 1.0000000));
	//return;	
}

simulated function DestroyEffects()
{
	// End:0x3E
	if(Trail != none)
	{
		// End:0x32
		if(Emitter(Trail) != none)
		{
			Emitter(Trail).Kill();			
		}
		else
		{
			Trail.Destroy();
		}
	}
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

simulated event Landed(Vector HitNormal)
{
	HitWall(HitNormal, none);
	//return;	
}

simulated event UsedBy(Pawn User)
{
	// End:0x35
	if(User == Base)
	{
		bCanHitOwner = false;
		SetBase(none);
		SetPhysics(2);
		Velocity = -Vector(Rotation) * float(200);
	}
	//return;	
}

singular function BaseChange()
{
	// End:0x10
	if(Base == none)
	{
		SetPhysics(2);
	}
	//return;	
}

simulated function bool CanTouch(Actor Other)
{
	// End:0x0D
	if(Base != none)
	{
		return false;
	}
	return super.CanTouch(Other);
	//return;	
}

simulated function ApplyImpactEffect(Actor Other, Vector HitLocation)
{
	// End:0x35
	if((Instigator == none) || Instigator.Controller == none)
	{
		Other.SetDelayedDamageInstigatorController(InstigatorController);
	}
	// End:0xD9
	if((int(PlayerImpactType) == int(1)) || int(DetonateOn) == int(1))
	{
		// End:0xA1
		if(bCombinedSplashImpact)
		{
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Other, Damage + float(ImpactDamage), Instigator, HitLocation, GetMomentumVector(Normal(Velocity)), ImpactDamageType);			
		}
		else
		{
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Other, Damage, Instigator, HitLocation, GetMomentumVector(Normal(Velocity)), ImpactDamageType);
		}		
	}
	else
	{
		Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Other, float(ImpactDamage), Instigator, HitLocation, GetMomentumVector(Normal(Velocity)), ImpactDamageType);
	}
	//return;	
}

simulated function bool Impact(Actor Other, Vector HitLocation)
{
	local float boneDist;

	// End:0x0D
	if(Other == none)
	{
		return false;
	}
	// End:0x54
	if((int(PlayerImpactType) == int(1)) || int(DetonateOn) == int(1))
	{
		Explode(HitLocation, Normal(HitLocation - Other.Location));		
	}
	else
	{
		// End:0xAE
		if((int(PlayerImpactType) == int(0)) || (int(PlayerImpactType) == int(2)) && VSize(Velocity) < MinStickVelocity)
		{
			HitWall(Normal(HitLocation - Other.Location), Other);			
		}
		else
		{
			// End:0x171
			if((int(PlayerImpactType) == int(2)) && Base == none)
			{
				SetPhysics(0);
				// End:0xF1
				if(int(DetonateOn) == int(2))
				{
					bArmed = true;
					SetTimer(DetonateDelay, false);
				}
				// End:0x14C
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
	return true;
	//return;	
}

simulated function HitWall(Vector HitNormal, Actor Wall)
{
	local Vector VNorm;

	// End:0x22
	if(int(DetonateOn) == int(1))
	{
		Explode(Location, HitNormal);
		return;
	}
	// End:0x50
	if((int(DetonateOn) == int(2)) && !bHasImpacted)
	{
		bArmed = true;
		SetTimer(DetonateDelay, false);
	}
	// End:0x78
	if(Pawn(Wall) != none)
	{
		DampenFactor *= PawnDampAdjust;
		DampenFactorParallel *= PawnDampAdjust;
	}
	bCanHitOwner = true;
	bHasImpacted = true;
	VNorm = (Velocity Dot HitNormal) * HitNormal;
	Velocity = (-VNorm * DampenFactor) + ((Velocity - VNorm) * DampenFactorParallel);
	// End:0xE2
	if(RandomSpin != float(0))
	{
		RandSpin(100000.0000000);
	}
	Speed = VSize(Velocity);
	// End:0x14D
	if(Speed < StillSpeed)
	{
		bBounce = false;
		SetPhysics(0);
		// End:0x12C
		if(int(DetonateOn) == int(3))
		{
			bArmed = true;
			SetTimer(DetonateDelay, false);
		}
		// End:0x14A
		if((Trail != none) && !TrailWhenStill)
		{
			DestroyEffects();
		}		
	}
	else
	{
		// End:0x248
		if(((((Pawn(Wall) == none) && int(Level.NetMode) != int(NM_DedicatedServer)) && Speed > float(100)) && !Level.bDropDetail) && EffectIsRelevant(Location, false))
		{
			// End:0x1C9
			if(ImpactSound != none)
			{
				PlaySound(ImpactSound, 1, 1.5000000);
			}
			// End:0x248
			if(ReflectImpactManager != none)
			{
				// End:0x21A
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

simulated function BlowUp(Vector HitLocation)
{
	local Vector Start;
	local Rotator Dir;
	local int i;

	Start = Location;
	// End:0x9F
	if((flakcount > 0) && FlakClass != none)
	{
		i = 0;
		J0x2A:

		// End:0x9F [Loop If]
		if(i < flakcount)
		{
			Dir.Yaw += int((FRand() * float(40000)) - float(20000));
			Dir.Pitch += int((FRand() * float(40000)) - float(20000));
			Spawn(FlakClass,, 'None', Start, Dir);
			i++;
			// [Loop Continue]
			goto J0x2A;
		}
	}
	TargetedHurtRadius(Damage, DamageRadius, MyRadiusDamageType, MomentumTransfer, HitLocation, HitActor);
	// End:0xDB
	if(int(Role) == int(ROLE_Authority))
	{
		MakeNoise(1.0000000);
	}
	//return;	
}

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
	local Actor A;
	local Vector HitLoc, HitNorm, End;

	// End:0x18
	if(ShakeRadius > float(0))
	{
		ShakeView(HitLocation);
	}
	BlowUp(HitLocation);
	End.Z = -DamageRadius;
	A = Trace(HitLoc, HitNorm, End,, false);
	// End:0xB0
	if(ImpactManager != none)
	{
		// End:0x91
		if(Instigator == none)
		{
			ImpactManager.static.StartSpawn(HitLocation, HitNormal, 0, Level.GetLocalPlayerController());			
		}
		else
		{
			ImpactManager.static.StartSpawn(HitLocation, HitNormal, 0, Instigator);
		}
	}
	// End:0x132
	if(((bTearOnExplode && !bNetTemporary) && int(Level.NetMode) == int(NM_DedicatedServer)) || int(Level.NetMode) == int(NM_ListenServer))
	{
		Velocity = vect(0.0000000, 0.0000000, 0.0000000);
		SetCollision(false, false, false);
		TearOffHitNormal = HitNormal;
		bTearOff = true;
		GotoState('NetTrapped');		
	}
	else
	{
		Destroy();
	}
	//return;	
}

defaultproperties
{
	DampenFactor=0.0500000
	DampenFactorParallel=0.3500000
	PawnDampAdjust=0.2500000
	RandomSpin=32768.0000000
	DetonateDelay=3.0000000
	FlakClass=Class'XWeapons.FlakChunk'
	TrailWhenStill=true
	MinStickVelocity=200.0000000
	StillSpeed=10.0000000
	Speed=1000.0000000
	Damage=70.0000000
	DamageRadius=240.0000000
	MomentumTransfer=75000.0000000
	Physics=2
	DrawScale=8.0000000
	bHardAttach=true
	bBounce=true
	bFixedRotationDir=true
	RotationRate=(Pitch=0,Yaw=0,Roll=10000)
}
