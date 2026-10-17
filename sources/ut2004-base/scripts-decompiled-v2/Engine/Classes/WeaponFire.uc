class WeaponFire extends Object
	native;

enum ESpreadStyle
{
	SS_None,                        // 0
	SS_Random,                      // 1
	SS_Line,                        // 2
	SS_Ring                         // 3
};

var() bool bSplashDamage;
var() bool bSplashJump;
var() bool bRecommendSplashDamage;
var() bool bTossed;
var() bool bLeadTarget;
var() bool bInstantHit;
var() bool bPawnRapidFireAnim;
var() bool bReflective;
var bool bTimerLoop;
var() bool bFireOnRelease;
var() bool bWaitForRelease;
var() bool bModeExclusive;
var bool bIsFiring;
var bool bNowWaiting;
var bool bServerDelayStopFire;
var bool bServerDelayStartFire;
var bool bInstantStop;
var() bool bAttachSmokeEmitter;
var() bool bAttachFlashEmitter;
var float TimerInterval;
var float NextTimerPop;
var() Weapon Weapon;
var Pawn Instigator;
var LevelInfo Level;
var Actor Owner;
var float NextFireTime;
var() float PreFireTime;
var() float MaxHoldTime;
var() float HoldTime;
var() int ThisModeNum;
var float TransientSoundVolume;
var float TransientSoundRadius;
var() name PreFireAnim;
var() name FireAnim;
var() name FireLoopAnim;
var() name FireEndAnim;
var() name ReloadAnim;
var() float PreFireAnimRate;
var() float FireAnimRate;
var() float FireLoopAnimRate;
var() float FireEndAnimRate;
var() float ReloadAnimRate;
var() float TweenTime;
var() Sound FireSound;
var() Sound ReloadSound;
var() Sound NoAmmoSound;
var() string FireForce;
var() string ReloadForce;
var() string NoAmmoForce;
var() float FireRate;
var float ServerStartFireTime;
var() Class<Ammunition> AmmoClass;
var() int AmmoPerFire;
var() int AmmoClipSize;
var() float load;
var() Vector ShakeRotMag;
var() Vector ShakeRotRate;
var() float ShakeRotTime;
var() Vector ShakeOffsetMag;
var() Vector ShakeOffsetRate;
var() float ShakeOffsetTime;
var() Class<Projectile> ProjectileClass;
var() float BotRefireRate;
var() float WarnTargetPct;
var() Class<xEmitter> FlashEmitterClass;
var() xEmitter FlashEmitter;
var() Class<xEmitter> SmokeEmitterClass;
var() xEmitter SmokeEmitter;
var() float aimerror;
var() float Spread;
var() WeaponFire.ESpreadStyle SpreadStyle;
var int FireCount;
var() float DamageAtten;
var FireProperties SavedFireProperties;

simulated function SetTimer(float NewTimerRate, bool bLoop)
{
	bTimerLoop = bLoop;
	TimerInterval = NewTimerRate;
	NextTimerPop = Level.TimeSeconds + TimerInterval;
	//return;	
}

event Timer()
{
	//return;	
}

simulated function PreBeginPlay()
{
	//return;	
}

simulated function BeginPlay()
{
	//return;	
}

simulated function PostNetBeginPlay()
{
	//return;	
}

simulated event SetInitialState()
{
	GotoState('Auto');
	//return;	
}

simulated function PostBeginPlay()
{
	load = float(AmmoPerFire);
	// End:0x1E
	if(bFireOnRelease)
	{
		bWaitForRelease = true;
	}
	// End:0x2F
	if(bWaitForRelease)
	{
		bNowWaiting = true;
	}
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
	if(SmokeEmitter != none)
	{
		SmokeEmitter.Destroy();
	}
	//return;	
}

simulated function InitEffects()
{
	// End:0x36
	if((int(Level.NetMode) == int(NM_DedicatedServer)) || AIController(Instigator.Controller) != none)
	{
		return;
	}
	// End:0x79
	if((FlashEmitterClass != none) && (FlashEmitter == none) || FlashEmitter.bDeleteMe)
	{
		FlashEmitter = Weapon.Spawn(FlashEmitterClass);
	}
	// End:0xBC
	if((SmokeEmitterClass != none) && (SmokeEmitter == none) || SmokeEmitter.bDeleteMe)
	{
		SmokeEmitter = Weapon.Spawn(SmokeEmitterClass);
	}
	//return;	
}

function DoFireEffect()
{
	//return;	
}

function DrawMuzzleFlash(Canvas Canvas)
{
	// End:0x61
	if((SmokeEmitter != none) && SmokeEmitter.Base != Weapon)
	{
		SmokeEmitter.SetLocation(Weapon.GetEffectStart());
		Canvas.DrawActor(SmokeEmitter, false, false, Weapon.DisplayFOV);
	}
	// End:0xC2
	if((FlashEmitter != none) && FlashEmitter.Base != Weapon)
	{
		FlashEmitter.SetLocation(Weapon.GetEffectStart());
		Canvas.DrawActor(FlashEmitter, false, false, Weapon.DisplayFOV);
	}
	//return;	
}

function FlashMuzzleFlash()
{
	// End:0x24
	if(FlashEmitter != none)
	{
		FlashEmitter.Trigger(Weapon, Instigator);
	}
	//return;	
}

function StartMuzzleSmoke()
{
	// End:0x3A
	if(!Level.bDropDetail && SmokeEmitter != none)
	{
		SmokeEmitter.Trigger(Weapon, Instigator);
	}
	//return;	
}

function ShakeView()
{
	local PlayerController P;

	P = PlayerController(Instigator.Controller);
	// End:0x51
	if(P != none)
	{
		P.WeaponShakeView(ShakeRotMag, ShakeRotRate, ShakeRotTime, ShakeOffsetMag, ShakeOffsetRate, ShakeOffsetTime);
	}
	//return;	
}

function ClientPlayForceFeedback(string EffectName)
{
	local PlayerController PC;

	PC = PlayerController(Instigator.Controller);
	// End:0x4C
	if((PC != none) && PC.bEnableWeaponForceFeedback)
	{
		PC.ClientPlayForceFeedback(EffectName);
	}
	//return;	
}

function StopForceFeedback(string EffectName)
{
	local PlayerController PC;

	PC = PlayerController(Instigator.Controller);
	// End:0x4C
	if((PC != none) && PC.bEnableWeaponForceFeedback)
	{
		PC.StopForceFeedback(EffectName);
	}
	//return;	
}

function Update(float dt)
{
	//return;	
}

function StartFiring()
{
	//return;	
}

function StopFiring()
{
	//return;	
}

function StartBerserk()
{
	FireRate = default.FireRate * 0.7500000;
	FireAnimRate = default.FireAnimRate / 0.7500000;
	ReloadAnimRate = default.ReloadAnimRate / 0.7500000;
	//return;	
}

function StopBerserk()
{
	FireRate = default.FireRate;
	FireAnimRate = default.FireAnimRate;
	ReloadAnimRate = default.ReloadAnimRate;
	//return;	
}

function StartSuperBerserk()
{
	FireRate = default.FireRate / Level.GRI.WeaponBerserk;
	FireAnimRate = default.FireAnimRate * Level.GRI.WeaponBerserk;
	ReloadAnimRate = default.ReloadAnimRate * Level.GRI.WeaponBerserk;
	//return;	
}

function bool IsFiring()
{
	return bIsFiring;
	//return;	
}

event ModeTick(float dt)
{
	//return;	
}

event ModeDoFire()
{
	// End:0x0D
	if(!AllowFire())
	{
		return;
	}
	// End:0x2E
	if(MaxHoldTime > 0.0000000)
	{
		HoldTime = FMin(HoldTime, MaxHoldTime);
	}
	// End:0xEC
	if(int(Weapon.Role) == int(ROLE_Authority))
	{
		Weapon.ConsumeAmmo(ThisModeNum, load);
		DoFireEffect();
		HoldTime = 0.0000000;
		// End:0xA1
		if(((Weapon == none) || Instigator == none) || Instigator.Controller == none)
		{
			return;
		}
		// End:0xDD
		if(AIController(Instigator.Controller) != none)
		{
			AIController(Instigator.Controller).WeaponFireAgain(BotRefireRate, true);
		}
		Instigator.DeactivateSpawnProtection();
	}
	// End:0x119
	if(Instigator.IsLocallyControlled())
	{
		ShakeView();
		PlayFiring();
		FlashMuzzleFlash();
		StartMuzzleSmoke();		
	}
	else
	{
		ServerPlayFiring();
	}
	Weapon.IncrementFlashCount(ThisModeNum);
	// End:0x179
	if(bFireOnRelease)
	{
		// End:0x15B
		if(bIsFiring)
		{
			NextFireTime += (MaxHoldTime + FireRate);			
		}
		else
		{
			NextFireTime = Level.TimeSeconds + FireRate;
		}		
	}
	else
	{
		NextFireTime += FireRate;
		NextFireTime = FMax(NextFireTime, Level.TimeSeconds);
	}
	load = float(AmmoPerFire);
	HoldTime = 0.0000000;
	// End:0x1FD
	if((Instigator.PendingWeapon != Weapon) && Instigator.PendingWeapon != none)
	{
		bIsFiring = false;
		Weapon.PutDown();
	}
	//return;	
}

event ModeHoldFire()
{
	// End:0x18
	if(Instigator.IsLocallyControlled())
	{
		PlayStartHold();
	}
	//return;	
}

simulated function bool AllowFire()
{
	return Weapon.AmmoAmount(ThisModeNum) >= AmmoPerFire;
	//return;	
}

function ServerPlayFiring()
{
	Weapon.PlayOwnedSound(FireSound, 3, TransientSoundVolume,, TransientSoundRadius,, false);
	//return;	
}

function PlayPreFire()
{
	// End:0x45
	if((Weapon.Mesh != none) && Weapon.HasAnim(PreFireAnim))
	{
		Weapon.PlayAnim(PreFireAnim, PreFireAnimRate, TweenTime);
	}
	//return;	
}

function PlayStartHold()
{
	//return;	
}

function PlayFiring()
{
	// End:0x8A
	if(Weapon.Mesh != none)
	{
		// End:0x6F
		if(FireCount > 0)
		{
			// End:0x51
			if(Weapon.HasAnim(FireLoopAnim))
			{
				Weapon.PlayAnim(FireLoopAnim, FireLoopAnimRate, 0.0000000);				
			}
			else
			{
				Weapon.PlayAnim(FireAnim, FireAnimRate, TweenTime);
			}			
		}
		else
		{
			Weapon.PlayAnim(FireAnim, FireAnimRate, TweenTime);
		}
	}
	Weapon.PlayOwnedSound(FireSound, 3, TransientSoundVolume,, TransientSoundRadius, default.FireAnimRate / FireAnimRate, false);
	ClientPlayForceFeedback(FireForce);
	FireCount++;
	//return;	
}

function PlayFireEnd()
{
	// End:0x45
	if((Weapon.Mesh != none) && Weapon.HasAnim(FireEndAnim))
	{
		Weapon.PlayAnim(FireEndAnim, FireEndAnimRate, TweenTime);
	}
	//return;	
}

function Rotator AdjustAim(Vector Start, float InAimError)
{
	// End:0xA6
	if(!SavedFireProperties.bInitialized)
	{
		SavedFireProperties.AmmoClass = AmmoClass;
		SavedFireProperties.ProjectileClass = ProjectileClass;
		SavedFireProperties.WarnTargetPct = WarnTargetPct;
		SavedFireProperties.MaxRange = MaxRange();
		SavedFireProperties.bTossed = bTossed;
		SavedFireProperties.bTrySplash = bRecommendSplashDamage;
		SavedFireProperties.bLeadTarget = bLeadTarget;
		SavedFireProperties.bInstantHit = bInstantHit;
		SavedFireProperties.bInitialized = true;
	}
	return Instigator.super(WeaponFire).AdjustAim(SavedFireProperties, Start, int(InAimError));
	//return;	
}

simulated function Vector GetFireStart(Vector X, Vector Y, Vector Z)
{
	return Instigator.Location + Instigator.EyePosition();
	//return;	
}

simulated function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
{
	Canvas.SetDrawColor(0, byte(255), 0);
	Canvas.DrawText((("  FIREMODE " $ string(self)) $ " IsFiring ") $ string(bIsFiring));
	YPos += YL;
	Canvas.SetPos(4.0000000, YPos);
	//return;	
}

function float MaxRange()
{
	return 5000.0000000;
	//return;	
}

function Actor Spawn(Class<Actor> SpawnClass, optional Actor SpawnOwner, optional name SpawnTag, optional Vector SpawnLocation, optional Rotator SpawnRotation)
{
	return Weapon.Spawn(SpawnClass, SpawnOwner, SpawnTag, SpawnLocation, SpawnRotation);
	//return;	
}

function Actor Trace(out Vector HitLocation, out Vector HitNormal, Vector TraceEnd, optional Vector TraceStart, optional bool bTraceActors, optional Vector Extent, optional out Material Material)
{
	return Weapon.Trace(HitLocation, HitNormal, TraceEnd, TraceStart, bTraceActors, Extent, Material);
	//return;	
}

defaultproperties
{
	bInstantHit=true
	bModeExclusive=true
	TransientSoundVolume=0.5000000
	TransientSoundRadius=400.0000000
	PreFireAnim="PreFire"
	FireAnim="Fire"
	FireLoopAnim="FireLoop"
	FireEndAnim="FireEnd"
	ReloadAnim="Reload"
	PreFireAnimRate=1.0000000
	FireAnimRate=1.0000000
	FireLoopAnimRate=1.0000000
	FireEndAnimRate=1.0000000
	ReloadAnimRate=1.0000000
	TweenTime=0.1000000
	FireRate=0.5000000
	BotRefireRate=0.9500000
	aimerror=600.0000000
	DamageAtten=1.0000000
}
