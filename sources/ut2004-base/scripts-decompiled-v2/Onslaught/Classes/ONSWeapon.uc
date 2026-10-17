class ONSWeapon extends Actor
	abstract
	native
	nativereplication
	notplaceable;

struct native ONSWeaponAIInfo
{
	var bool bTossed;
	var bool bTrySplash;
	var bool bLeadTarget;
	var bool bInstantHit;
	var bool bFireOnRelease;
	var float aimerror;
	var float WarnTargetPct;
	var float RefireRate;
};

var() name YawBone;
var() float YawStartConstraint;
var() float YawEndConstraint;
var float YawConstraintDelta;
var() name PitchBone;
var() int PitchUpLimit;
var() int PitchDownLimit;
var Rotator CurrentAim;
var Vector WeaponFireLocation;
var Rotator WeaponFireRotation;
var() name WeaponFireAttachmentBone;
var() name GunnerAttachmentBone;
var() float WeaponFireOffset;
var() float DualFireOffset;
var Vector WeaponOffset;
var Rotator LastRotation;
var float RotationsPerSecond;
var bool bInstantRotation;
var bool bActive;
var() bool bInstantFire;
var() bool bDualIndependantTargeting;
var bool bShowChargingBar;
var bool bCallInstigatorPostRender;
var bool bForceCenterAim;
var() bool bAimable;
var bool bDoOffsetTrace;
var() bool bAmbientFireSound;
var() bool bAmbientAltFireSound;
var() bool bInheritVelocity;
var bool bIsAltFire;
var bool bIsRepeatingFF;
var() bool bReflective;
var() bool bShowAimCrosshair;
var const bool bCorrectAim;
var() float FireIntervalAimLock;
var float AimLockReleaseTime;
var Vector CurrentHitLocation;
var float Spread;
var float AimTraceRange;
var Vector LastHitLocation;
var byte FlashCount;
var byte OldFlashCount;
var byte HitCount;
var byte OldHitCount;
var byte Team;
var() Material RedSkin;
var() Material BlueSkin;
var() float FireInterval;
var() float AltFireInterval;
var float FireCountdown;
var() Class<Emitter> FlashEmitterClass;
var Emitter FlashEmitter;
var() Class<Emitter> EffectEmitterClass;
var Emitter EffectEmitter;
var() Class<ONSWeaponAmbientEmitter> AmbientEffectEmitterClass;
var ONSWeaponAmbientEmitter AmbientEffectEmitter;
var() Sound FireSoundClass;
var() float FireSoundVolume;
var() float FireSoundRadius;
var() float FireSoundPitch;
var() Sound AltFireSoundClass;
var() float AltFireSoundVolume;
var() float AltFireSoundRadius;
var() Sound RotateSound;
var float RotateSoundThreshold;
var() float AmbientSoundScaling;
var() string FireForce;
var() string AltFireForce;
var Class<DamageType> DamageType;
var int DamageMin;
var int DamageMax;
var float TraceRange;
var float Momentum;
var() Class<Projectile> ProjectileClass;
var() Class<Projectile> AltFireProjectileClass;
var array<Projectile> Projectiles;
var() Vector ShakeRotMag;
var() Vector ShakeRotRate;
var() float ShakeRotTime;
var() Vector ShakeOffsetMag;
var() Vector ShakeOffsetRate;
var() float ShakeOffsetTime;
var ONSWeaponAIInfo AIInfo[2];
var FireProperties SavedFireProperties[2];
var string DebugInfo;

replication
{
	// Pos:0x000
	reliable if((bNetDirty && !bNetOwner) && int(Role) == int(ROLE_Authority))
		CurrentHitLocation, FlashCount;

	// Pos:0x025
	reliable if(bNetDirty && int(Role) == int(ROLE_Authority))
		HitCount, LastHitLocation, 
		Team, bActive, 
		bCallInstigatorPostRender, bForceCenterAim;
}

// Export UONSWeapon::execLimitPitch(FFrame&, void* const)
native function int LimitPitch(int Pitch, Rotator ForwardRotation, optional int WeaponYaw);

simulated function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
{
	Canvas.SetDrawColor(byte(255), byte(255), byte(255));
	Canvas.DrawText((("bActive: " $ string(bActive)) @ "bCorrectAim: ") $ string(bCorrectAim));
	YPos += YL;
	Canvas.SetPos(4.0000000, YPos);
	Canvas.DrawText("DebugInfo: " $ DebugInfo);
	//return;	
}

simulated function PostBeginPlay()
{
	YawConstraintDelta = float(int(YawEndConstraint - YawStartConstraint) & 65535);
	// End:0x46
	if(AltFireInterval ~= 0.0000000)
	{
		AltFireInterval = FireInterval;
		AIInfo[1] = AIInfo[0];
	}
	// End:0x72
	if(bShowChargingBar && Owner != none)
	{
		Vehicle(Owner).bShowChargingBar = true;
	}
	// End:0xC6
	if((Level.GRI != none) && Level.GRI.WeaponBerserk > 1.0000000)
	{
		SetFireRateModifier(Level.GRI.WeaponBerserk);
	}
	//return;	
}

simulated function PostNetBeginPlay()
{
	// End:0x13
	if(bInstantFire)
	{
		GotoState('InstantFireMode');		
	}
	else
	{
		GotoState('ProjectileFireMode');
	}
	InitEffects();
	MaxRange();
	super.PostNetBeginPlay();
	//return;	
}

simulated function InitEffects()
{
	// End:0x1B
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		return;
	}
	// End:0xA7
	if((FlashEmitterClass != none) && FlashEmitter == none)
	{
		FlashEmitter = Spawn(FlashEmitterClass);
		FlashEmitter.SetDrawScale(DrawScale);
		// End:0x74
		if(WeaponFireAttachmentBone == 'None')
		{
			FlashEmitter.SetBase(self);			
		}
		else
		{
			AttachToBone(FlashEmitter, WeaponFireAttachmentBone);
		}
		FlashEmitter.SetRelativeLocation(WeaponFireOffset * vect(1.0000000, 0.0000000, 0.0000000));
	}
	// End:0x12B
	if((AmbientEffectEmitterClass != none) && AmbientEffectEmitter == none)
	{
		AmbientEffectEmitter = Spawn(AmbientEffectEmitterClass, self,, WeaponFireLocation, WeaponFireRotation);
		// End:0xF8
		if(WeaponFireAttachmentBone == 'None')
		{
			AmbientEffectEmitter.SetBase(self);			
		}
		else
		{
			AttachToBone(AmbientEffectEmitter, WeaponFireAttachmentBone);
		}
		AmbientEffectEmitter.SetRelativeLocation(WeaponFireOffset * vect(1.0000000, 0.0000000, 0.0000000));
	}
	//return;	
}

simulated function SetGRI(GameReplicationInfo GRI)
{
	// End:0x2C
	if(GRI.WeaponBerserk > 1.0000000)
	{
		SetFireRateModifier(GRI.WeaponBerserk);
	}
	//return;	
}

simulated function SetFireRateModifier(float Modifier)
{
	// End:0x2F
	if(FireInterval == AltFireInterval)
	{
		FireInterval = default.FireInterval / Modifier;
		AltFireInterval = FireInterval;		
	}
	else
	{
		FireInterval = default.FireInterval / Modifier;
		AltFireInterval = default.AltFireInterval / Modifier;
	}
	//return;	
}

function SpawnHitEffects(Actor HitActor, Vector HitLocation, Vector HitNormal)
{
	//return;	
}

simulated event ClientSpawnHitEffects()
{
	//return;	
}

simulated function ShakeView()
{
	local PlayerController P;

	// End:0x0D
	if(Instigator == none)
	{
		return;
	}
	P = PlayerController(Instigator.Controller);
	// End:0x5E
	if(P != none)
	{
		P.WeaponShakeView(ShakeRotMag, ShakeRotRate, ShakeRotTime, ShakeOffsetMag, ShakeOffsetRate, ShakeOffsetTime);
	}
	//return;	
}

simulated function ClientStartFire(Controller C, bool bAltFire)
{
	bIsAltFire = bAltFire;
	// End:0x4B
	if(FireCountdown <= float(0))
	{
		// End:0x45
		if(bIsRepeatingFF)
		{
			// End:0x3A
			if(bIsAltFire)
			{
				ClientPlayForceFeedback(AltFireForce);				
			}
			else
			{
				ClientPlayForceFeedback(FireForce);
			}
		}
		OwnerEffects();
	}
	//return;	
}

simulated function ClientStopFire(Controller C, bool bWasAltFire)
{
	// End:0x2B
	if(bIsRepeatingFF)
	{
		// End:0x20
		if(bIsAltFire)
		{
			StopForceFeedback(AltFireForce);			
		}
		else
		{
			StopForceFeedback(FireForce);
		}
	}
	// End:0x58
	if((int(Role) < int(ROLE_Authority)) && AmbientEffectEmitter != none)
	{
		AmbientEffectEmitter.SetEmitterStatus(false);
	}
	//return;	
}

simulated function ClientPlayForceFeedback(string EffectName)
{
	local PlayerController PC;

	// End:0x0D
	if(Instigator == none)
	{
		return;
	}
	PC = PlayerController(Instigator.Controller);
	// End:0x59
	if((PC != none) && PC.bEnableGUIForceFeedback)
	{
		PC.ClientPlayForceFeedback(EffectName);
	}
	//return;	
}

simulated function StopForceFeedback(string EffectName)
{
	local PlayerController PC;

	// End:0x0D
	if(Instigator == none)
	{
		return;
	}
	PC = PlayerController(Instigator.Controller);
	// End:0x59
	if((PC != none) && PC.bEnableGUIForceFeedback)
	{
		PC.StopForceFeedback(EffectName);
	}
	//return;	
}

simulated event OwnerEffects()
{
	// End:0x2D
	if(!bIsRepeatingFF)
	{
		// End:0x22
		if(bIsAltFire)
		{
			ClientPlayForceFeedback(AltFireForce);			
		}
		else
		{
			ClientPlayForceFeedback(FireForce);
		}
	}
	ShakeView();
	// End:0xFB
	if(int(Role) < int(ROLE_Authority))
	{
		// End:0x5A
		if(bIsAltFire)
		{
			FireCountdown = AltFireInterval;			
		}
		else
		{
			FireCountdown = FireInterval;
		}
		AimLockReleaseTime = Level.TimeSeconds + (FireCountdown * FireIntervalAimLock);
		FlashMuzzleFlash();
		// End:0xA8
		if(AmbientEffectEmitter != none)
		{
			AmbientEffectEmitter.SetEmitterStatus(true);
		}
		// End:0xFB
		if(!bAmbientFireSound)
		{
			// End:0xDD
			if(bIsAltFire)
			{
				PlaySound(AltFireSoundClass, 0, FireSoundVolume / 255.0000000,, AltFireSoundRadius,, false);				
			}
			else
			{
				PlaySound(FireSoundClass, 0, FireSoundVolume / 255.0000000,, FireSoundRadius,, false);
			}
		}
	}
	//return;	
}

event bool AttemptFire(Controller C, bool bAltFire)
{
	// End:0x1D
	if((int(Role) != int(ROLE_Authority)) || bForceCenterAim)
	{
		return false;
	}
	// End:0xF1
	if(FireCountdown <= float(0))
	{
		CalcWeaponFire();
		// End:0x4B
		if(bCorrectAim)
		{
			WeaponFireRotation = AdjustAim(bAltFire);
		}
		// End:0x76
		if(Spread > float(0))
		{
			WeaponFireRotation = Rotator(Vector(WeaponFireRotation) + ((VRand() * FRand()) * Spread));
		}
		DualFireOffset *= float(-1);
		Instigator.MakeNoise(1.0000000);
		// End:0xB7
		if(bAltFire)
		{
			FireCountdown = AltFireInterval;
			AltFire(C);			
		}
		else
		{
			FireCountdown = FireInterval;
			Fire(C);
		}
		AimLockReleaseTime = Level.TimeSeconds + (FireCountdown * FireIntervalAimLock);
		return true;
	}
	return false;
	//return;	
}

function Rotator AdjustAim(bool bAltFire)
{
	local Rotator AdjustedAim, ControllerAim;
	local int N;

	// End:0x27
	if((Instigator == none) || Instigator.Controller == none)
	{
		return WeaponFireRotation;
	}
	// End:0x37
	if(bAltFire)
	{
		N = 1;
	}
	// End:0x172
	if(!SavedFireProperties[N].bInitialized)
	{
		SavedFireProperties[N].AmmoClass = Class'UT2k4Assault.Ammo_Dummy';
		// End:0x85
		if(bAltFire)
		{
			SavedFireProperties[N].ProjectileClass = AltFireProjectileClass;			
		}
		else
		{
			SavedFireProperties[N].ProjectileClass = ProjectileClass;
		}
		SavedFireProperties[N].WarnTargetPct = AIInfo[N].WarnTargetPct;
		SavedFireProperties[N].MaxRange = MaxRange();
		SavedFireProperties[N].bTossed = AIInfo[N].bTossed;
		SavedFireProperties[N].bTrySplash = AIInfo[N].bTrySplash;
		SavedFireProperties[N].bLeadTarget = AIInfo[N].bLeadTarget;
		SavedFireProperties[N].bInstantHit = AIInfo[N].bInstantHit;
		SavedFireProperties[N].bInitialized = true;
	}
	ControllerAim = Instigator.Controller.Rotation;
	AdjustedAim = Instigator.super(ONSWeapon).AdjustAim(SavedFireProperties[N], WeaponFireLocation, int(AIInfo[N].aimerror));
	// End:0x1F8
	if((AdjustedAim == Instigator.Rotation) || AdjustedAim == ControllerAim)
	{
		return WeaponFireRotation;		
	}
	else
	{
		AdjustedAim.Pitch = Instigator.LimitPitch(AdjustedAim.Pitch);
		return AdjustedAim;
	}
	//return;	
}

function byte BestMode()
{
	return byte(Rand(2));
	//return;	
}

function Fire(Controller C)
{
	Log(string(self) $ ": Fire has been called outside of a state!");
	//return;	
}

function AltFire(Controller C)
{
	Log(string(self) $ ": AltFire has been called outside of a state!");
	//return;	
}

function bool CanAttack(Actor Other)
{
	local float Dist, CheckDist;
	local Vector HitLocation, HitNormal, projStart;
	local Actor HitActor;

	// End:0x23
	if((Instigator == none) || Instigator.Controller == none)
	{
		return false;
	}
	Dist = VSize(Instigator.Location - Other.Location);
	// End:0x5B
	if(Dist > (MaxRange()))
	{
		return false;
	}
	// End:0x7C
	if(!Instigator.Controller.LineOfSightTo(Other))
	{
		return false;
	}
	// End:0xDF
	if(ProjectileClass != none)
	{
		CheckDist = FMax(CheckDist, 0.5000000 * ProjectileClass.default.Speed);
		CheckDist = FMax(CheckDist, 300.0000000);
		CheckDist = FMin(CheckDist, VSize(Other.Location - Location));
	}
	// End:0x142
	if(AltFireProjectileClass != none)
	{
		CheckDist = FMax(CheckDist, 0.5000000 * AltFireProjectileClass.default.Speed);
		CheckDist = FMax(CheckDist, 300.0000000);
		CheckDist = FMin(CheckDist, VSize(Other.Location - Location));
	}
	CalcWeaponFire();
	projStart = WeaponFireLocation;
	// End:0x1A5
	if(bInstantFire)
	{
		HitActor = Trace(HitLocation, HitNormal, Other.Location + (Other.CollisionHeight * vect(0.0000000, 0.0000000, 0.8000000)), projStart, true);		
	}
	else
	{
		HitActor = Trace(HitLocation, HitNormal, projStart + (CheckDist * Normal((Other.Location + (Other.CollisionHeight * vect(0.0000000, 0.0000000, 0.8000000))) - Location)), projStart, true);
	}
	// End:0x27F
	if(((((HitActor == none) || HitActor == Other) || Pawn(HitActor) == none) || Pawn(HitActor).Controller == none) || !Instigator.Controller.SameTeamAs(Pawn(HitActor).Controller))
	{
		return true;
	}
	return false;
	//return;	
}

simulated function float MaxRange()
{
	// End:0x9B
	if(bInstantFire)
	{
		// End:0x82
		if(((Instigator != none) && Instigator.Region.Zone != none) && Instigator.Region.Zone.bDistanceFog)
		{
			TraceRange = FClamp(Instigator.Region.Zone.DistanceFogEnd, 8000.0000000, default.TraceRange);			
		}
		else
		{
			TraceRange = default.TraceRange;
		}
		AimTraceRange = TraceRange;		
	}
	else
	{
		// End:0xBE
		if(ProjectileClass != none)
		{
			AimTraceRange = ProjectileClass.static.GetRange();			
		}
		else
		{
			AimTraceRange = 10000.0000000;
		}
	}
	return AimTraceRange;
	//return;	
}

function Projectile SpawnProjectile(Class<Projectile> ProjClass, bool bAltFire)
{
	local Projectile P;
	local ONSWeaponPawn WeaponPawn;
	local Vector StartLocation, HitLocation, HitNormal, Extent;

	// End:0x19A
	if(bDoOffsetTrace)
	{
		Extent = ProjClass.default.CollisionRadius * vect(1.0000000, 1.0000000, 0.0000000);
		Extent.Z = ProjClass.default.CollisionHeight;
		WeaponPawn = ONSWeaponPawn(Owner);
		// End:0x111
		if((WeaponPawn != none) && WeaponPawn.VehicleBase != none)
		{
			// End:0xE3
			if(!WeaponPawn.VehicleBase.TraceThisActor(HitLocation, HitNormal, WeaponFireLocation, WeaponFireLocation + (Vector(WeaponFireRotation) * (WeaponPawn.VehicleBase.CollisionRadius * 1.5000000)), Extent))
			{
				StartLocation = HitLocation;				
			}
			else
			{
				StartLocation = WeaponFireLocation + (Vector(WeaponFireRotation) * (ProjClass.default.CollisionRadius * 1.1000000));
			}			
		}
		else
		{
			// End:0x16C
			if(!Owner.TraceThisActor(HitLocation, HitNormal, WeaponFireLocation, WeaponFireLocation + (Vector(WeaponFireRotation) * (Owner.CollisionRadius * 1.5000000)), Extent))
			{
				StartLocation = HitLocation;				
			}
			else
			{
				StartLocation = WeaponFireLocation + (Vector(WeaponFireRotation) * (ProjClass.default.CollisionRadius * 1.1000000));
			}
		}		
	}
	else
	{
		StartLocation = WeaponFireLocation;
	}
	P = Spawn(ProjClass, self,, StartLocation, WeaponFireRotation);
	// End:0x272
	if(P != none)
	{
		// End:0x1F0
		if(bInheritVelocity)
		{
			P.Velocity = Instigator.Velocity;
		}
		FlashMuzzleFlash();
		// End:0x23A
		if(bAltFire)
		{
			// End:0x216
			if(bAmbientAltFireSound)
			{
				AmbientSound = AltFireSoundClass;				
			}
			else
			{
				PlayOwnedSound(AltFireSoundClass, 0, FireSoundVolume / 255.0000000,, AltFireSoundRadius,, false);
			}			
		}
		else
		{
			// End:0x251
			if(bAmbientFireSound)
			{
				AmbientSound = FireSoundClass;				
			}
			else
			{
				PlayOwnedSound(FireSoundClass, 0, FireSoundVolume / 255.0000000,, FireSoundRadius,, false);
			}
		}
	}
	return P;
	//return;	
}

function CeaseFire(Controller C)
{
	FlashCount = 0;
	HitCount = 0;
	// End:0x2B
	if(AmbientEffectEmitter != none)
	{
		AmbientEffectEmitter.SetEmitterStatus(false);
	}
	// End:0x46
	if(bAmbientFireSound || bAmbientAltFireSound)
	{
		AmbientSound = none;
	}
	//return;	
}

function WeaponCeaseFire(Controller C, bool bWasAltFire)
{
	//return;	
}

simulated event FlashMuzzleFlash()
{
	// End:0x33
	if(int(Role) == int(ROLE_Authority))
	{
		FlashCount++;
		NetUpdateTime = Level.TimeSeconds - float(1);		
	}
	else
	{
		CalcWeaponFire();
	}
	// End:0x59
	if(FlashEmitter != none)
	{
		FlashEmitter.Trigger(self, Instigator);
	}
	// End:0x8F
	if((EffectEmitterClass != none) && EffectIsRelevant(Location, false))
	{
		EffectEmitter = Spawn(EffectEmitterClass, self,, WeaponFireLocation, WeaponFireRotation);
	}
	//return;	
}

simulated function Destroyed()
{
	DestroyEffects();
	super.Destroyed();
	//return;	
}

simulated function DestroyEffects()
{
	// End:0x17
	if(FlashEmitter != none)
	{
		FlashEmitter.Destroy();
	}
	// End:0x2E
	if(EffectEmitter != none)
	{
		EffectEmitter.Destroy();
	}
	// End:0x45
	if(AmbientEffectEmitter != none)
	{
		AmbientEffectEmitter.Destroy();
	}
	//return;	
}

simulated function SetTeam(byte t)
{
	Team = t;
	// End:0x40
	if((int(t) == 0) && RedSkin != none)
	{
		Skins[0] = RedSkin;
		RepSkin = RedSkin;		
	}
	else
	{
		// End:0x72
		if((int(t) == 1) && BlueSkin != none)
		{
			Skins[0] = BlueSkin;
			RepSkin = BlueSkin;
		}
	}
	//return;	
}

simulated function SimulateTraceFire(out Vector Start, out Rotator Dir, out Vector HitLocation, out Vector HitNormal)
{
	local Vector X, End;
	local Actor Other;
	local ONSWeaponPawn WeaponPawn;
	local Vehicle VehicleInstigator;

	// End:0xF5
	if(bDoOffsetTrace)
	{
		WeaponPawn = ONSWeaponPawn(Owner);
		// End:0xA2
		if((WeaponPawn != none) && WeaponPawn.VehicleBase != none)
		{
			// End:0x9F
			if(!WeaponPawn.VehicleBase.TraceThisActor(HitLocation, HitNormal, Start, Start + (Vector(Dir) * (WeaponPawn.VehicleBase.CollisionRadius * 1.5000000))))
			{
				Start = HitLocation;
			}			
		}
		else
		{
			// End:0xF5
			if(!Owner.TraceThisActor(HitLocation, HitNormal, Start, Start + (Vector(Dir) * (Owner.CollisionRadius * 1.5000000))))
			{
				Start = HitLocation;
			}
		}
	}
	X = Vector(Dir);
	End = Start + (TraceRange * X);
	VehicleInstigator = Vehicle(Instigator);
	// End:0x1A1
	if((VehicleInstigator != none) && VehicleInstigator.Driver != none)
	{
		VehicleInstigator.Driver.bBlockZeroExtentTraces = false;
		Other = Trace(HitLocation, HitNormal, End, Start, true);
		VehicleInstigator.Driver.bBlockZeroExtentTraces = true;		
	}
	else
	{
		Other = Trace(HitLocation, HitNormal, End, Start, true);
	}
	// End:0x240
	if((Other != none) && Other != Instigator)
	{
		// End:0x232
		if(!Other.bWorldGeometry)
		{
			// End:0x21C
			if((Vehicle(Other) != none) || Pawn(Other) == none)
			{
				LastHitLocation = HitLocation;
			}
			HitNormal = vect(0.0000000, 0.0000000, 0.0000000);			
		}
		else
		{
			LastHitLocation = HitLocation;
		}		
	}
	else
	{
		HitLocation = End;
		HitNormal = vect(0.0000000, 0.0000000, 0.0000000);
	}
	//return;	
}

function TraceFire(Vector Start, Rotator Dir)
{
	local Vector X, End, HitLocation, HitNormal, RefNormal;

	local Actor Other;
	local ONSWeaponPawn WeaponPawn;
	local Vehicle VehicleInstigator;
	local int Damage;
	local bool bDoReflect;
	local int ReflectNum;

	MaxRange();
	// End:0xFB
	if(bDoOffsetTrace)
	{
		WeaponPawn = ONSWeaponPawn(Owner);
		// End:0xA8
		if((WeaponPawn != none) && WeaponPawn.VehicleBase != none)
		{
			// End:0xA5
			if(!WeaponPawn.VehicleBase.TraceThisActor(HitLocation, HitNormal, Start, Start + (Vector(Dir) * (WeaponPawn.VehicleBase.CollisionRadius * 1.5000000))))
			{
				Start = HitLocation;
			}			
		}
		else
		{
			// End:0xFB
			if(!Owner.TraceThisActor(HitLocation, HitNormal, Start, Start + (Vector(Dir) * (Owner.CollisionRadius * 1.5000000))))
			{
				Start = HitLocation;
			}
		}
	}
	ReflectNum = 0;
	J0x102:

	// End:0x3EE [Loop If]
	if(true)
	{
		bDoReflect = false;
		X = Vector(Dir);
		End = Start + (TraceRange * X);
		VehicleInstigator = Vehicle(Instigator);
		// End:0x1C7
		if(((ReflectNum == 0) && VehicleInstigator != none) && VehicleInstigator.Driver != none)
		{
			VehicleInstigator.Driver.bBlockZeroExtentTraces = false;
			Other = Trace(HitLocation, HitNormal, End, Start, true);
			VehicleInstigator.Driver.bBlockZeroExtentTraces = true;			
		}
		else
		{
			Other = Trace(HitLocation, HitNormal, End, Start, true);
		}
		// End:0x365
		if((Other != none) && (Other != Instigator) || ReflectNum > 0)
		{
			// End:0x27E
			if((bReflective && Other.IsA('xPawn')) && xPawn(Other).CheckReflect(HitLocation, RefNormal, int(float(DamageMin) * 0.2500000)))
			{
				bDoReflect = true;
				HitNormal = vect(0.0000000, 0.0000000, 0.0000000);				
			}
			else
			{
				// End:0x33B
				if(!Other.bWorldGeometry)
				{
					Damage = DamageMin + Rand(DamageMax - DamageMin);
					// End:0x2F6
					if((Vehicle(Other) != none) || Pawn(Other) == none)
					{
						HitCount++;
						LastHitLocation = HitLocation;
						SpawnHitEffects(Other, HitLocation, HitNormal);
					}
					Other.TakeDamage(Damage, Instigator, HitLocation, Momentum * X, DamageType);
					HitNormal = vect(0.0000000, 0.0000000, 0.0000000);					
				}
				else
				{
					HitCount++;
					LastHitLocation = HitLocation;
					SpawnHitEffects(Other, HitLocation, HitNormal);
				}
			}			
		}
		else
		{
			HitLocation = End;
			HitNormal = vect(0.0000000, 0.0000000, 0.0000000);
			HitCount++;
			LastHitLocation = HitLocation;
		}
		SpawnBeamEffect(Start, Dir, HitLocation, HitNormal, ReflectNum);
		// End:0x3E8
		if(bDoReflect && ++ReflectNum < 4)
		{
			Start = HitLocation;
			Dir = Rotator(RefNormal);			
		}
		else
		{
			// [Explicit Break]
			goto J0x3EE;
		}
		// [Loop Continue]
		goto J0x102;
	}
	J0x3EE:

	NetUpdateTime = Level.TimeSeconds - float(1);
	//return;	
}

function SpawnBeamEffect(Vector Start, Rotator Dir, Vector HitLocation, Vector HitNormal, int ReflectNum)
{
	//return;	
}

simulated function CalcWeaponFire()
{
	local Coords WeaponBoneCoords;
	local Vector CurrentFireOffset;

	WeaponBoneCoords = GetBoneCoords(WeaponFireAttachmentBone);
	CurrentFireOffset = (WeaponFireOffset * vect(1.0000000, 0.0000000, 0.0000000)) + (DualFireOffset * vect(0.0000000, 1.0000000, 0.0000000));
	WeaponFireRotation = Rotator(Vector(CurrentAim) >> Rotation);
	WeaponFireLocation = WeaponBoneCoords.Origin + (CurrentFireOffset >> WeaponFireRotation);
	// End:0x94
	if(bDualIndependantTargeting)
	{
		WeaponFireRotation = Rotator(CurrentHitLocation - WeaponFireLocation);
	}
	//return;	
}

function DoCombo()
{
	//return;	
}

simulated function float ChargeBar()
{
	//return;	
}

static function StaticPrecache(LevelInfo L)
{
	//return;	
}

state InstantFireMode
{
	function Fire(Controller C)
	{
		FlashMuzzleFlash();
		// End:0x21
		if(AmbientEffectEmitter != none)
		{
			AmbientEffectEmitter.SetEmitterStatus(true);
		}
		// End:0x38
		if(bAmbientFireSound)
		{
			AmbientSound = FireSoundClass;			
		}
		else
		{
			PlayOwnedSound(FireSoundClass, 0, FireSoundVolume / 255.0000000,, FireSoundRadius, FireSoundPitch, false);
		}
		TraceFire(WeaponFireLocation, WeaponFireRotation);
		//return;		
	}

	function AltFire(Controller C)
	{
		//return;		
	}

	simulated event ClientSpawnHitEffects()
	{
		local Vector HitLocation, HitNormal, offset;
		local Actor HitActor;

		// End:0x1B
		if(int(Level.NetMode) == int(NM_Standalone))
		{
			return;
		}
		offset = float(20) * Normal(WeaponFireLocation - LastHitLocation);
		HitActor = Trace(HitLocation, HitNormal, LastHitLocation - offset, LastHitLocation + offset, false);
		SpawnHitEffects(HitActor, LastHitLocation, HitNormal);
		//return;		
	}

	simulated function SpawnHitEffects(Actor HitActor, Vector HitLocation, Vector HitNormal)
	{
		local PlayerController PC;

		PC = Level.GetLocalPlayerController();
		// End:0x1DB
		if((PC != none) && ((Instigator != none) && Instigator.Controller == PC) || VSize(PC.ViewTarget.Location - HitLocation) < float(5000))
		{
			Spawn(Class'XWeapons.HitEffect'.static.GetHitEffect(HitActor, HitLocation, HitNormal),,, HitLocation, Rotator(HitNormal));
			// End:0x1DB
			if(!Level.bDropDetail && int(Level.DetailMode) != int(0))
			{
				// End:0x140
				if(Base != none)
				{
					Base.bTraceWater = true;
					HitActor = Base.Trace(HitLocation, HitNormal, HitLocation, Location + (float(200) * Normal(HitLocation - Location)), true);
					Base.bTraceWater = false;					
				}
				else
				{
					bTraceWater = true;
					HitActor = Trace(HitLocation, HitNormal, HitLocation, Location + (float(200) * Normal(HitLocation - Location)), true);
					bTraceWater = false;
				}
				// End:0x1DB
				if((FluidSurfaceInfo(HitActor) != none) || (PhysicsVolume(HitActor) != none) && PhysicsVolume(HitActor).bWaterVolume)
				{
					Spawn(Class'XGame.BulletSplash',,, HitLocation, rot(16384, 0, 0));
				}
			}
		}
		//return;		
	}
	stop;	
}

state ProjectileFireMode
{
	function Fire(Controller C)
	{
		SpawnProjectile(ProjectileClass, false);
		//return;		
	}

	function AltFire(Controller C)
	{
		// End:0x19
		if(AltFireProjectileClass == none)
		{
			Fire(C);			
		}
		else
		{
			SpawnProjectile(AltFireProjectileClass, true);
		}
		//return;		
	}
	stop;	
}

defaultproperties
{
	YawEndConstraint=65535.0000000
	PitchUpLimit=5000
	PitchDownLimit=60000
	RotationsPerSecond=0.7500000
	bAimable=true
	bShowAimCrosshair=true
	bCorrectAim=true
	FireInterval=0.5000000
	FireSoundVolume=160.0000000
	FireSoundRadius=300.0000000
	FireSoundPitch=1.0000000
	AltFireSoundVolume=160.0000000
	AltFireSoundRadius=300.0000000
	RotateSoundThreshold=50.0000000
	AmbientSoundScaling=1.0000000
	DamageType=Class'XWeapons.DamTypeMinigunBullet'
	DamageMin=6
	DamageMax=6
	TraceRange=10000.0000000
	Momentum=1.0000000
	AIInfo[0]=(bTossed=false,bTrySplash=false,bLeadTarget=false,bInstantHit=false,bFireOnRelease=false,aimerror=600.0000000,WarnTargetPct=0.0000000,RefireRate=0.9000000)
	AIInfo[1]=(bTossed=false,bTrySplash=false,bLeadTarget=false,bInstantHit=false,bFireOnRelease=false,aimerror=600.0000000,WarnTargetPct=0.0000000,RefireRate=0.9000000)
	DrawType=2
	bIgnoreEncroachers=true
	bReplicateInstigator=true
	RemoteRole=2
	NetUpdateFrequency=5.0000000
	SoundVolume=255
	SoundRadius=100.0000000
	bBlockZeroExtentTraces=false
	bBlockNonZeroExtentTraces=false
	bNoRepMesh=true
}
