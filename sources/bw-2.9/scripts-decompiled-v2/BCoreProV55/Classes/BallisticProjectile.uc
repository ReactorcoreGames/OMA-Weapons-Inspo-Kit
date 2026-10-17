class BallisticProjectile extends Projectile
	abstract;

const HEAD_RADIUS = 7;
const MAX_MOMENTUM_Z = 10000.0f;

struct NetInitialRot
{
	var int Pitch;
	var int Yaw;
	var int Roll;
};

var Actor Trail;
var Actor HitActor;
var bool bCanHitOwner;
var bool bExploded;
var Vector TearOffHitNormal;
var bool bApplyParams;
var() Class<BallisticWeapon> WeaponClass;
var() Class<BCImpactManager> ImpactManager;
var() Class<BCImpactManager> PenetrateManager;
var() Class<BCImpactManager> SplashManager;
var() Class<Actor> TrailClass;
var() Vector TrailOffset;
var() bool bRandomStartRotation;
var() int ModeIndex;
var() byte LayoutIndex;
var() byte CurrentWeaponMode;
var() bool bOverrideMode;
var() bool bCheckHitSurface;
var() bool bPenetrate;
var() float StartDelay;
var() bool bTearOnExplode;
var() float NetTrappedDelay;
var() float DamageSpecial;
var() Class<DamageType> DamageTypeHead;
var() Class<DamageType> DamageTypeLimb;
var() Class<DamageType> MyRadiusDamageType;
var() bool bLimitMomentumZ;
var() bool bUsePositionalDamage;
var() float WallPenetrationForce;
var() bool bWarnEnemy;
var() float ShakeRadius;
var() Vector ShakeRotMag;
var() Vector ShakeRotRate;
var() float ShakeRotTime;
var() Vector ShakeOffsetMag;
var() Vector ShakeOffsetRate;
var() float ShakeOffsetTime;
var() float MotionBlurRadius;
var() float MotionBlurFactor;
var() float MotionBlurTime;
var() float AccelSpeed;
var() Rotator StartRotation;
var() float HeadMult;
var() float LimbMult;
var() float MaxDamageGainFactor;
var() float DamageGainStartTime;
var() float DamageGainEndTime;
var() ProjectileEffectParams.ERadiusFallOffType RadiusFallOffType;
var NetInitialRot NetInitialRotation;

replication
{
	// Pos:0x000
	reliable if(bNetInitial && int(Role) == int(ROLE_Authority))
		CurrentWeaponMode, LayoutIndex;

	// Pos:0x018
	reliable if((bNetInitial && int(Role) == int(ROLE_Authority)) && bNetInitialRotation)
		NetInitialRotation;

	// Pos:0x03B
	reliable if(bTearOff && int(Role) == int(ROLE_Authority))
		TearOffHitNormal;
}

final function UpdateNetRotation()
{
	NetInitialRotation.Pitch = Rotation.Pitch;
	NetInitialRotation.Yaw = Rotation.Yaw;
	NetInitialRotation.Roll = Rotation.Roll;
	//return;	
}

simulated function PostBeginPlay()
{
	super.PostBeginPlay();
	// End:0x21
	if(int(Level.NetMode) == int(NM_Client))
	{
		return;
	}
	// End:0x96
	if((Instigator != none) && BallisticWeapon(Instigator.Weapon) != none)
	{
		// End:0x74
		if(!bOverrideMode)
		{
			CurrentWeaponMode = BallisticWeapon(Instigator.Weapon).CurrentWeaponMode;
		}
		LayoutIndex = BallisticWeapon(Instigator.Weapon).LayoutIndex;
	}
	UpdateNetRotation();
	InitParams();
	// End:0xB6
	if(StartDelay == float(0))
	{
		SetInitialSpeed(true);
	}
	//return;	
}

simulated function PostNetBeginPlay()
{
	local PlayerController PC;
	local Rotator R;

	// End:0x6C
	if(int(Level.NetMode) == int(NM_Client))
	{
		R.Pitch = NetInitialRotation.Pitch;
		R.Yaw = NetInitialRotation.Yaw;
		R.Roll = NetInitialRotation.Roll;
		SetRotation(R);
		InitParams();
		SetInitialSpeed();
	}
	// End:0xE7
	if(StartDelay > float(0))
	{
		// End:0xC3
		if(((int(Role) == int(ROLE_Authority)) || bNetOwner) || bAlwaysRelevant)
		{
			// End:0xB8
			if(int(Level.NetMode) == int(NM_Client))
			{
			}
			HideForStartDelay();
			return;			
		}
		else
		{
			// End:0xDC
			if(int(Level.NetMode) == int(NM_Client))
			{
			}
			StartDelay = 0.0000000;
		}
	}
	InitProjectile();
	// End:0x108
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		return;
	}
	// End:0x148
	if(Level.bDropDetail || int(Level.DetailMode) == int(0))
	{
		bDynamicLight = false;
		LightType = 0;		
	}
	else
	{
		PC = Level.GetLocalPlayerController();
		// End:0x19F
		if(((PC == none) || Instigator == none) || PC != Instigator.Controller)
		{
			bDynamicLight = false;
			LightType = 0;
		}
	}
	//return;	
}

simulated function InitParams()
{
	WeaponClass.default.ParamsClasses[int(Class'BCoreProV55.BallisticReplicationInfo'.default.GameStyle)].SetProjectileParams(self);
	//return;	
}

simulated function ApplyParams(ProjectileEffectParams Params)
{
	// End:0x0D
	if(!bApplyParams)
	{
		return;
	}
	Speed = Params.Speed;
	default.Speed = Params.Speed;
	AccelSpeed = Params.AccelSpeed;
	default.AccelSpeed = Params.AccelSpeed;
	MaxSpeed = Params.MaxSpeed;
	default.MaxSpeed = Params.MaxSpeed;
	// End:0xA0
	if(int(Level.NetMode) == int(NM_Client))
	{
		return;
	}
	Damage = Params.Damage;
	default.Damage = Params.Damage;
	DamageSpecial = Params.DamageSpecial;
	default.DamageSpecial = Params.DamageSpecial;
	DamageRadius = Params.DamageRadius;
	default.DamageRadius = Params.DamageRadius;
	MomentumTransfer = Params.MomentumTransfer;
	default.MomentumTransfer = Params.MomentumTransfer;
	bLimitMomentumZ = Params.bLimitMomentumZ;
	default.bLimitMomentumZ = Params.bLimitMomentumZ;
	HeadMult = Params.HeadMult;
	LimbMult = Params.LimbMult;
	MaxDamageGainFactor = Params.MaxDamageGainFactor;
	DamageGainStartTime = Params.DamageGainStartTime;
	DamageGainEndTime = Params.DamageGainEndTime;
	RadiusFallOffType = Params.RadiusFallOffType;
	default.MaxDamageGainFactor = Params.MaxDamageGainFactor;
	default.DamageGainStartTime = Params.DamageGainStartTime;
	default.DamageGainEndTime = Params.DamageGainEndTime;
	default.RadiusFallOffType = Params.RadiusFallOffType;
	//return;	
}

simulated function override(byte NewWeaponMode)
{
	bOverrideMode = true;
	CurrentWeaponMode = NewWeaponMode;
	InitParams();
	//return;	
}

simulated function SetInitialSpeed(optional bool force_speed)
{
	local Rotator R;

	// End:0x38
	if((int(Level.NetMode) != int(NM_Client)) || force_speed)
	{
		Velocity = Vector(Rotation) * Speed;
	}
	// End:0x6A
	if((AccelSpeed > float(0)) && MaxSpeed > Speed)
	{
		Acceleration = Normal(Velocity) * AccelSpeed;
	}
	// End:0x98
	if(bRandomStartRotation)
	{
		R = Rotation;
		R.Roll = Rand(65536);
		SetRotation(R);
	}
	StartRotation = Rotation;
	//return;	
}

simulated function InitProjectile()
{
	InitEffects();
	//return;	
}

simulated function InitEffects()
{
	local Vector X, Y, Z;

	// End:0x1B
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		return;
	}
	// End:0xE2
	if((TrailClass != none) && Trail == none)
	{
		GetAxes(Rotation, X, Y, Z);
		Trail = Spawn(TrailClass, self,, ((Location + (X * TrailOffset.X)) + (Y * TrailOffset.Y)) + (Z * TrailOffset.Z), Rotation);
		// End:0xCA
		if(Emitter(Trail) != none)
		{
			Class'BCoreProV55.BallisticEmitter'.static.ScaleEmitter(Emitter(Trail), DrawScale);
		}
		// End:0xE2
		if(Trail != none)
		{
			Trail.SetBase(self);
		}
	}
	//return;	
}

simulated event TornOff()
{
	Explode(Location, TearOffHitNormal);
	//return;	
}

simulated function HideForStartDelay()
{
	SetPhysics(0);
	SetCollision(false, false, false);
	SetTimer(StartDelay, false);
	bDynamicLight = false;
	// End:0x3D
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		bHidden = true;
	}
	//return;	
}

simulated function ShowAfterStartDelay()
{
	// End:0x21
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		bHidden = false;
	}
	StartDelay = 0.0000000;
	SetPhysics(default.Physics);
	SetCollision(default.bCollideActors, default.bBlockActors, default.bBlockPlayers);
	bDynamicLight = default.bDynamicLight;
	SetInitialSpeed(true);
	InitProjectile();
	//return;	
}

simulated function Timer()
{
	// End:0x15
	if(StartDelay > float(0))
	{
		ShowAfterStartDelay();
		return;
	}
	//return;	
}

simulated function bool CanSplash()
{
	return false;
	//return;	
}

simulated function PhysicsVolumeChange(PhysicsVolume NewVolume)
{
	local Actor A;
	local Vector HitLoc, HitNorm, Start, End;

	// End:0xCA
	if(((SplashManager != none) && bReadyToSplash) && NewVolume.bWaterVolume)
	{
		Start = Location - (Velocity * (Level.TimeSeconds - LastRenderTime));
		End = Location;
		bTraceWater = true;
		A = Trace(HitLoc, HitNorm, End, Start, true);
		bTraceWater = false;
		// End:0xA6
		if(A != NewVolume)
		{
			HitLoc = Start;
		}
		SplashManager.static.StartSpawn(HitLoc, Normal(-Velocity), 9, Instigator);
	}
	//return;	
}

simulated function CheckSurface(Vector StartLocation, Vector StartNormal, out int Surf, optional out Actor Wall)
{
	local Vector HitLoc, HitNorm;
	local Material HitMaterial;

	Wall = Trace(HitLoc, HitNorm, StartLocation - (StartNormal * float(4)), StartLocation + (StartNormal * float(4)), false,, HitMaterial);
	// End:0x4B
	if(Wall == none)
	{
		return;
	}
	// End:0x66
	if(Vehicle(Wall) != none)
	{
		Surf = 3;		
	}
	else
	{
		// End:0x8A
		if(HitMaterial == none)
		{
			Surf = int(Wall.SurfaceType);			
		}
		else
		{
			Surf = int(HitMaterial.SurfaceType);
		}
	}
	//return;	
}

simulated function Destroyed()
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
	super(Actor).Destroyed();
	//return;	
}

simulated function ShakeView(Vector HitLocation)
{
	local PlayerController PC;
	local float dist, ScaleFactor;

	PC = Level.GetLocalPlayerController();
	// End:0x136
	if((PC != none) && PC.ViewTarget != none)
	{
		dist = VSize(HitLocation - PC.ViewTarget.Location);
		// End:0xB0
		if(dist < MotionBlurRadius)
		{
			ScaleFactor = (MotionBlurRadius - dist) / MotionBlurRadius;
			Class'BCoreProV55.BC_MotionBlurActor'.static.DoMotionBlur(PC, MotionBlurFactor * ScaleFactor, MotionBlurTime * ScaleFactor);
		}
		// End:0x136
		if(dist < ShakeRadius)
		{
			// End:0xE2
			if(dist < (ShakeRadius / float(3)))
			{
				ScaleFactor = 1.0000000;				
			}
			else
			{
				ScaleFactor = (ShakeRadius - dist) / ShakeRadius;
			}
			PC.ShakeView(ShakeRotMag * ScaleFactor, ShakeRotRate, ShakeRotTime, ShakeOffsetMag * ScaleFactor, ShakeOffsetRate, ShakeOffsetTime);
		}
	}
	//return;	
}

simulated function Vector GetMomentumVector(Vector Input)
{
	Input *= MomentumTransfer;
	// End:0x43
	if(bLimitMomentumZ && Input.Z > 10000.0000000)
	{
		Input *= (10000.0000000 / Input.Z);
	}
	return Input;
	//return;	
}

function float SurfaceScale(int Surf)
{
	switch(Surf)
	{
		// End:0x11
		case 0:
			return 0.5000000;
		// End:0x1B
		case 1:
			return 0.5000000;
		// End:0x26
		case 2:
			return 0.3500000;
		// End:0x31
		case 3:
			return 0.2500000;
		// End:0x3C
		case 4:
			return 0.5500000;
		// End:0x47
		case 5:
			return 0.5000000;
		// End:0x52
		case 6:
			return 1.0000000;
		// End:0x5D
		case 7:
			return 0.7500000;
		// End:0x68
		case 8:
			return 1.0000000;
		// End:0x73
		case 9:
			return 1.0000000;
		// End:0x7E
		case 10:
			return 1.0000000;
		// End:0xFFFF
		default:
			return 0.5000000;
			break;
	}
	//return;	
}

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
	local int Surf;

	// End:0x1F
	if(!bNetTemporary && int(Role) != int(ROLE_Authority))
	{
		return;
	}
	// End:0x2A
	if(bExploded)
	{
		return;
	}
	// End:0x51
	if((ShakeRadius > float(0)) || MotionBlurRadius > float(0))
	{
		ShakeView(HitLocation);
	}
	// End:0xF3
	if((ImpactManager != none) && int(Level.NetMode) != int(NM_DedicatedServer))
	{
		// End:0x95
		if(bCheckHitSurface)
		{
			CheckSurface(HitLocation, HitNormal, Surf);
		}
		// End:0xD0
		if(Instigator == none)
		{
			ImpactManager.static.StartSpawn(HitLocation, HitNormal, Surf, Level.GetLocalPlayerController());			
		}
		else
		{
			ImpactManager.static.StartSpawn(HitLocation, HitNormal, Surf, Instigator);
		}
	}
	BlowUp(HitLocation);
	bExploded = true;
	// End:0x188
	if((!bNetTemporary && bTearOnExplode) && (int(Level.NetMode) == int(NM_DedicatedServer)) || int(Level.NetMode) == int(NM_ListenServer))
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

function HideProjectile()
{
	SetPhysics(0);
	bAlwaysRelevant = true;
	bHidden = true;
	SetTimer(StartDelay, false);
	bDynamicLight = false;
	AmbientSound = none;
	//return;	
}

function BlowUp(Vector HitLocation)
{
	// End:0x12
	if(int(Role) < int(ROLE_Authority))
	{
		return;
	}
	// End:0x43
	if(DamageRadius > float(0))
	{
		TargetedHurtRadius(Damage, DamageRadius, MyRadiusDamageType, MomentumTransfer, HitLocation, HitActor);
	}
	MakeNoise(1.0000000);
	//return;	
}

simulated function ProcessTouch(Actor Other, Vector HitLocation)
{
	local bool bContinueAfterImpact;

	// End:0x29
	if(UnlaggedPawnCollision(Other) != none)
	{
		Other = UnlaggedPawnCollision(Other).UnlaggedPawn;
	}
	// End:0x3B
	if(!CanTouch(Other))
	{
		return;
	}
	// End:0xCA
	if(Other != HitActor)
	{
		// End:0x73
		if(int(Other.Role) == int(ROLE_Authority))
		{
			ApplyImpactEffect(Other, HitLocation);
		}
		HitActor = Other;
		bContinueAfterImpact = Impact(Other, HitLocation);
		// End:0xCA
		if(!bContinueAfterImpact && int(Role) == int(ROLE_Authority))
		{
			Explode(HitLocation, vect(0.0000000, 0.0000000, 1.0000000));
		}
	}
	//return;	
}

simulated function bool CanTouch(Actor Other)
{
	return (Other != none) && bCanHitOwner || (Other != Instigator) && Other != Owner;
	//return;	
}

simulated function Penetrate(Actor Other, Vector HitLocation)
{
	local Vector X;

	X = Normal(Velocity);
	SetLocation(HitLocation + ((X * (((Other.CollisionHeight * float(2)) * X.Z) + ((Other.CollisionRadius * float(2)) * (float(1) - X.Z)))) * 1.2000000));
	// End:0xC8
	if((EffectIsRelevant(Location, false)) && PenetrateManager != none)
	{
		PenetrateManager.static.StartSpawn(HitLocation, Other.Location - HitLocation, int(Other.SurfaceType), Owner, 4);
	}
	//return;	
}

simulated function bool Impact(Actor Other, Vector HitLocation)
{
	// End:0x12
	if(!CanPenetrate(Other))
	{
		return false;
	}
	Penetrate(Other, HitLocation);
	return true;
	//return;	
}

singular simulated function HitWall(Vector HitNormal, Actor Wall)
{
	local PlayerController PC;

	// End:0x134
	if(int(Role) == int(ROLE_Authority))
	{
		// End:0x12C
		if(!Wall.bStatic && !Wall.bWorldGeometry || Wall.bCanBeDamaged)
		{
			// End:0x83
			if((Instigator == none) || Instigator.Controller == none)
			{
				Wall.SetDelayedDamageInstigatorController(InstigatorController);
			}
			Wall.TakeDamage(int(Damage), Instigator, Location, GetMomentumVector(Normal(Velocity)), MyDamageType);
			// End:0x121
			if(((DamageRadius > float(0)) && Vehicle(Wall) != none) && Vehicle(Wall).Health > 0)
			{
				Vehicle(Wall).DriverRadiusDamage(Damage, DamageRadius, InstigatorController, MyDamageType, MomentumTransfer, Location);
			}
			HurtWall = Wall;
		}
		MakeNoise(1.0000000);
	}
	Explode(Location + (ExploWallOut * HitNormal), HitNormal);
	// End:0x26D
	if((ExplosionDecal != none) && int(Level.NetMode) != int(NM_DedicatedServer))
	{
		// End:0x255
		if(ExplosionDecal.default.CullDistance != float(0))
		{
			PC = Level.GetLocalPlayerController();
			// End:0x1E5
			if(!PC.BeyondViewDistance(Location, ExplosionDecal.default.CullDistance))
			{
				Spawn(ExplosionDecal, self,, Location, Rotator(-HitNormal));				
			}
			else
			{
				// End:0x252
				if(((Instigator != none) && PC == Instigator.Controller) && !PC.BeyondViewDistance(Location, 2.0000000 * ExplosionDecal.default.CullDistance))
				{
					Spawn(ExplosionDecal, self,, Location, Rotator(-HitNormal));
				}
			}			
		}
		else
		{
			Spawn(ExplosionDecal, self,, Location, Rotator(-HitNormal));
		}
	}
	HurtWall = none;
	//return;	
}

simulated function ApplyImpactEffect(Actor Other, Vector HitLocation)
{
	DoDamage(Other, HitLocation);
	//return;	
}

simulated function DoDamage(Actor Other, Vector HitLocation)
{
	local Class<DamageType> dt;
	local float Dmg;
	local Vector BoneTestLocation;

	// End:0x35
	if((Instigator == none) || Instigator.Controller == none)
	{
		Other.SetDelayedDamageInstigatorController(InstigatorController);
	}
	// End:0xAA
	if(xPawn(Other) != none)
	{
		BoneTestLocation = GetDamageHitLocation(Other);
		Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(GetDamageVictim(Other, BoneTestLocation, Normal(Velocity), Dmg, dt), Dmg, Instigator, HitLocation, GetMomentumVector(Normal(Velocity)), dt);		
	}
	else
	{
		Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(GetDamageVictim(Other, HitLocation, Normal(Velocity), Dmg, dt), Dmg, Instigator, HitLocation, GetMomentumVector(Normal(Velocity)), dt);
	}
	//return;	
}

simulated function bool CanPenetrate(Actor Other)
{
	// End:0x64
	if(((((!bPenetrate || Other == none) || Other.bWorldGeometry) || Mover(Other) != none) || Vehicle(Other) != none) || DestroyableObjective(Other) != none)
	{
		return false;
	}
	return true;
	//return;	
}

final function float GetDamageOverRangeFactor()
{
	// End:0x46
	if((default.LifeSpan - LifeSpan) > DamageGainStartTime)
	{
		return 1.0000000 + ((MaxDamageGainFactor * FMin((default.LifeSpan - LifeSpan) - DamageGainStartTime, DamageGainEndTime)) / DamageGainEndTime);
	}
	return 1.0000000;
	//return;	
}

function Vector GetDamageHitLocation(Actor Other)
{
	local Vector ClosestLocation;

	ClosestLocation = Other.Location;
	ClosestLocation.Z += Location - Other.Location.Z;
	return Class'BCoreProV55.BUtil'.static.GetClosestPointTo(ClosestLocation, Location, Normal(Velocity));
	//return;	
}

function Actor GetDamageVictim(Actor Other, Vector HitLocation, Vector Dir, out float Dmg, optional out Class<DamageType> dt)
{
	local string Bone;
	local float boneDist;
	local Vector HitLocationMatchZ;
	local Pawn DriverPawn;

	Dmg = Damage;
	dt = MyDamageType;
	// End:0x4B
	if(UnlaggedPawnCollision(Other) != none)
	{
		return GetDamageForCollision(UnlaggedPawnCollision(Other), HitLocation, Dir, Dmg, dt);
	}
	// End:0x65
	if(DamageGainEndTime > float(0))
	{
		Dmg *= GetDamageOverRangeFactor();
	}
	// End:0x88
	if(!bUsePositionalDamage || Monster(Other) != none)
	{
		return Other;
	}
	// End:0x1EB
	if(Pawn(Other) != none)
	{
		// End:0x10C
		if(Vehicle(Other) != none)
		{
			DriverPawn = Vehicle(Other).CheckForHeadShot(HitLocation, Dir, 1.0000000);
			// End:0x109
			if(DriverPawn != none)
			{
				Other = DriverPawn;
				Dmg *= HeadMult;
				// End:0x109
				if(DamageTypeHead != none)
				{
					dt = DamageTypeHead;
				}
			}			
		}
		else
		{
			HitLocationMatchZ = HitLocation;
			HitLocationMatchZ.Z = Other.Location.Z;
			Bone = string(Other.GetClosestBone(HitLocation, Dir, boneDist, 'head', 7.0000000));
			// End:0x1A1
			if(InStr(Bone, "head") > -1)
			{
				Dmg *= HeadMult;
				// End:0x19E
				if(DamageTypeHead != none)
				{
					dt = DamageTypeHead;
				}				
			}
			else
			{
				// End:0x1EB
				if(HitLocation.Z <= (Other.Location.Z - float(5)))
				{
					Dmg *= LimbMult;
					// End:0x1EB
					if(DamageTypeLimb != none)
					{
						dt = DamageTypeLimb;
					}
				}
			}
		}
	}
	return Other;
	//return;	
}

final function Actor GetDamageForCollision(UnlaggedPawnCollision Other, Vector HitLocation, Vector Dir, out float Dmg, optional out Class<DamageType> dt)
{
	local Vector HeadPositionApprox;

	HeadPositionApprox = Other.Location;
	HeadPositionApprox.Z += Other.CollisionHeight;
	HeadPositionApprox.Z -= float(7 + 2);
	// End:0x83
	if(Class'BCoreProV55.BUtil'.static.GetClosestDistanceTo(HeadPositionApprox, Location, Dir) <= float(7))
	{
		Dmg *= HeadMult;
		dt = DamageTypeHead;		
	}
	else
	{
		// End:0xC2
		if(HitLocation.Z <= (Other.Location.Z - float(5)))
		{
			Dmg *= LimbMult;
			dt = DamageTypeLimb;
		}
	}
	return Other;
	//return;	
}

function TargetedHurtRadius(float DamageAmount, float DamageRadius, Class<DamageType> DamageType, float Momentum, Vector HitLocation, optional Actor Victim)
{
	local Actor Victims;
	local float damageScale, dist;
	local Vector Dir;
	local bool can_see;

	// End:0x0B
	if(bHurtEntry)
	{
		return;
	}
	bHurtEntry = true;
	// End:0x343
	foreach CollidingActors(Class'Engine.Actor', Victims, DamageRadius, HitLocation)
	{
		// End:0x342
		if(((((Victims.bCanBeDamaged && Victims != self) && int(Victims.Role) == int(ROLE_Authority)) && !Victims.IsA('FluidSurfaceInfo')) && Victims != Victim) && Victims != HurtWall)
		{
			can_see = FastTrace(Victims.Location, Location);
			// End:0xDD
			if(!can_see)
			{
				// End:0xDA
				if(WallPenetrationForce == float(0))
				{
					continue;					
				}				
			}
			else
			{
				// End:0x114
				if(PhysicsVolume.bWaterVolume && Victims.PhysicsVolume == PhysicsVolume)
				{
					DamageRadius *= float(3);
				}
			}
			damageScale = 1.0000000;
			Dir = Victims.Location;
			// End:0x189
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
			Dir /= dist;
			// End:0x24F
			if(can_see)
			{
				// End:0x22F
				if(int(RadiusFallOffType) != int(2))
				{
					damageScale = 1.0000000 - FMax(0.0000000, (dist - Victims.CollisionRadius) / DamageRadius);
				}
				// End:0x24C
				if(int(RadiusFallOffType) == int(1))
				{
					damageScale = Square(damageScale);
				}				
			}
			else
			{
				damageScale = GetPenetrationDamageScale(Dir, dist);
				// End:0x278
				if(damageScale < 0.0100000)
				{
					continue;					
				}
				// End:0x295
				if(int(RadiusFallOffType) == int(1))
				{
					damageScale = Square(damageScale);
				}
			}
			// End:0x2CA
			if((Instigator == none) || Instigator.Controller == none)
			{
				Victims.SetDelayedDamageInstigatorController(InstigatorController);
			}
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Victims, damageScale * DamageAmount, Instigator, Victims.Location - ((0.5000000 * (Victims.CollisionHeight + Victims.CollisionRadius)) * Dir), GetMomentumVector(damageScale * Dir), DamageType);
		}		
	}	
	bHurtEntry = false;
	//return;	
}

function float GetPenetrationDamageScale(Vector Dir, float dist)
{
	local int WallCount, WallPenForce, WallPenDelta;
	local Vector End, X, HitLocation, HitNormal, Start, LastHitLoc,
		ExitNormal;

	local Material HitMaterial, ExitMaterial;
	local float pwr;
	local Actor Other, LastOther;

	WallPenForce = int(WallPenetrationForce);
	pwr = DamageRadius;
	Start = Location;
	X = Normal(Dir);
	End = Start + (X * dist);
	LastHitLoc = End;
	bTraceWater = true;
	J0x5C:

	// End:0x309 [Loop If]
	if((dist > float(0)) && pwr > float(0))
	{
		Other = Trace(HitLocation, HitNormal, End, Start, true,, HitMaterial);
		bTraceWater = false;
		dist -= VSize(HitLocation - Start);
		pwr -= VSize(HitLocation - Start);
		// End:0xE7
		if(Other == none)
		{
			LastHitLoc = End;
			// [Explicit Break]
			goto J0x309;
		}
		// End:0x151
		if((FluidSurfaceInfo(Other) != none) || (PhysicsVolume(Other) != none) && PhysicsVolume(Other).bWaterVolume)
		{
			Start = HitLocation;
			End = Start + (X * dist);
			bTraceWater = false;			
		}
		else
		{
			LastHitLoc = HitLocation;
			// End:0x290
			if(Other.bWorldGeometry || Mover(Other) != none)
			{
				WallCount++;
				// End:0x282
				if(((WallPenForce > 0) && WallCount < 5) && Class'BCoreProV55.WallPenetrationUtil'.static.GoThroughWall(self, Instigator, HitLocation, HitNormal, float(WallPenForce) * (SurfaceScale(Class'BCoreProV55.WallPenetrationUtil'.static.GetSurfaceType(Other, HitMaterial))), X, Start, ExitNormal, ExitMaterial))
				{
					WallPenDelta = int(VSize(Start - HitLocation) / (SurfaceScale(Class'BCoreProV55.WallPenetrationUtil'.static.GetSurfaceType(Other, HitMaterial))));
					WallPenForce -= WallPenDelta;
					dist -= VSize(Start - HitLocation);
					pwr -= (DamageRadius * (float(WallPenDelta) / WallPenetrationForce));
					bTraceWater = true;
					goto J0x306;					
				}
				else
				{
					pwr = 0.0000000;
				}
				// [Explicit Break]
				goto J0x309;
			}
			// End:0x303
			if((Other == Instigator) || Other == LastOther)
			{
				Start = HitLocation + (X * FMax(32.0000000, Other.CollisionRadius * float(2)));
				End = Start + (X * dist);
				bTraceWater = true;				
			}
			else
			{
				// [Explicit Break]
				goto J0x309;
			}
		}
		J0x306:

		// [Loop Continue]
		goto J0x5C;
	}
	J0x309:

	return FMax(0.0000000, pwr / DamageRadius);
	//return;	
}

state NetTrapped
{
	function BeginState()
	{
		HideProjectile();
		SetTimer(NetTrappedDelay, false);
		//return;		
	}

	event Timer()
	{
		Destroy();
		//return;		
	}

	simulated function Explode(Vector HitLocation, Vector HitNormal)
	{
		//return;		
	}
	stop;	
}

defaultproperties
{
	bApplyParams=true
	bRandomStartRotation=true
	bTearOnExplode=true
	NetTrappedDelay=0.1500000
	bLimitMomentumZ=true
	bWarnEnemy=true
	ShakeRadius=-1.0000000
	ShakeRotMag=(X=256.0000000,Y=256.0000000,Z=256.0000000)
	ShakeRotRate=(X=2500.0000000,Y=2500.0000000,Z=2500.0000000)
	ShakeRotTime=6.0000000
	ShakeOffsetMag=(X=10.0000000,Y=10.0000000,Z=20.0000000)
	ShakeOffsetRate=(X=200.0000000,Y=200.0000000,Z=200.0000000)
	ShakeOffsetTime=6.0000000
	MotionBlurRadius=-1.0000000
	MotionBlurFactor=4.0000000
	MotionBlurTime=5.0000000
	HeadMult=2.0000000
	LimbMult=0.7500000
	RadiusFallOffType=1
	MaxSpeed=0.0000000
	DamageRadius=0.0000000
	DrawType=8
}
