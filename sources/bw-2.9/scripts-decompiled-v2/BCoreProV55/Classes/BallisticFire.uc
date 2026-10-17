class BallisticFire extends WeaponFire;

enum EScopeDownOn
{
	SDO_Never,                      // 0
	SDO_Fire,                       // 1
	SDO_PreFire                     // 2
};

enum EUnjamMethod
{
	UJM_ReloadAndCock,              // 0
	UJM_Reload,                     // 1
	UJM_Cock,                       // 2
	UJM_FireNextRound,              // 3
	UJM_Fire                        // 4
};

var FireParams Params;
var BallisticWeapon BW;
var int ConsumedLoad;
var() name FlashBone;
var() Class<Actor> BrassClass;
var() name BrassBone;
var() bool bBrassOnCock;
var() Vector BrassOffset;
var bool bPlayedDryFire;
var() bool bCockAfterFire;
var() bool bCockAfterEmpty;
var() bool bDryUncock;
var() bool bIgnoreReload;
var() bool bIgnoreCocking;
var() bool bUseWeaponMag;
var() BallisticFire.EScopeDownOn ScopeDownOn;
var() FullSound ClipFinishSound;
var() FullSound DryFireSound;
var() Class<Actor> MuzzleFlashClass;
var() Actor MuzzleFlash;
var() float FlashScaleFactor;
var name AimedFireAnim;
var name EmptyFireAnim;
var name EmptyAimedFireAnim;
var() bool bReleaseFireOnDie;
var int BurstCount;
var int MaxBurst;
var bool bBurstMode;
var float BurstFireRateFactor;
var() float FireRecoil;
var() float FirePushbackForce;
var() float FireChaos;
var() InterpCurve FireChaosCurve;
var() float XInaccuracy;
var() float YInaccuracy;
var() FireEffectParams.FireSpreadMode FireSpreadMode;
var() FullSound SilencedFireSound;
var() FullSound BallisticFireSound;
var() bool bAISilent;
var() float HeatPerShot;
var(Jamming) BallisticFire.EUnjamMethod UnjamMethod;
var(Jamming) float JamChance;
var(Jamming) float WaterJamChance;
var(Jamming) float JamMoveMultiplier;
var bool bIsJammed;
var(Jamming) FullSound JamSound;
var bool bPendingTryJam;
var(Jamming) bool bJamWastesAmmo;

final simulated function ApplyFireParams()
{
	FireRate = Params.FireInterval;
	default.FireRate = Params.FireInterval;
	AmmoPerFire = Params.AmmoPerFire;
	default.AmmoPerFire = Params.AmmoPerFire;
	load = float(Params.AmmoPerFire);
	PreFireTime = Params.PreFireTime;
	MaxHoldTime = Params.MaxHoldTime;
	default.PreFireTime = Params.PreFireTime;
	default.MaxHoldTime = Params.MaxHoldTime;
	GotoState(Params.TargetState);
	BurstFireRateFactor = Params.BurstFireRateFactor;
	bCockAfterFire = Params.bCockAfterFire;
	default.BurstFireRateFactor = Params.BurstFireRateFactor;
	default.bCockAfterFire = Params.bCockAfterFire;
	PreFireAnim = Params.PreFireAnim;
	FireAnim = Params.FireAnim;
	FireLoopAnim = Params.FireLoopAnim;
	FireEndAnim = Params.FireEndAnim;
	PreFireAnimRate = Params.PreFireAnimRate;
	FireAnimRate = Params.FireAnimRate;
	FireLoopAnimRate = Params.FireLoopAnimRate;
	FireEndAnimRate = Params.FireEndAnimRate;
	default.PreFireAnimRate = Params.PreFireAnimRate;
	default.FireAnimRate = Params.FireAnimRate;
	default.FireLoopAnimRate = Params.FireLoopAnimRate;
	default.FireEndAnimRate = Params.FireEndAnimRate;
	AimedFireAnim = Params.AimedFireAnim;
	// End:0x238
	if(AimedFireAnim == 'None')
	{
		AimedFireAnim = FireAnim;
	}
	//return;	
}

simulated function ApplyFireEffectParams(FireEffectParams effect_params)
{
	MuzzleFlashClass = effect_params.MuzzleFlashClass;
	FlashScaleFactor = effect_params.FlashScaleFactor;
	FlashBone = effect_params.FlashBone;
	BallisticFireSound = effect_params.FireSound;
	FireRecoil = effect_params.Recoil;
	FirePushbackForce = effect_params.PushbackForce;
	FireChaos = effect_params.Chaos;
	XInaccuracy = float(effect_params.Inaccuracy.X);
	YInaccuracy = float(effect_params.Inaccuracy.Y);
	FireSpreadMode = effect_params.SpreadMode;
	HeatPerShot = effect_params.Heat;
	default.MuzzleFlashClass = effect_params.MuzzleFlashClass;
	default.FlashScaleFactor = effect_params.FlashScaleFactor;
	default.BallisticFireSound = effect_params.FireSound;
	default.FireRecoil = effect_params.Recoil;
	default.FirePushbackForce = effect_params.PushbackForce;
	default.FireChaos = effect_params.Chaos;
	default.XInaccuracy = float(effect_params.Inaccuracy.X);
	default.YInaccuracy = float(effect_params.Inaccuracy.Y);
	default.FireSpreadMode = effect_params.SpreadMode;
	default.HeatPerShot = effect_params.Heat;
	bSplashDamage = effect_params.SplashDamage;
	bRecommendSplashDamage = effect_params.RecommendSplashDamage;
	BotRefireRate = effect_params.BotRefireRate;
	WarnTargetPct = effect_params.WarnTargetPct;
	default.bSplashDamage = effect_params.SplashDamage;
	default.bRecommendSplashDamage = effect_params.RecommendSplashDamage;
	default.BotRefireRate = effect_params.BotRefireRate;
	default.WarnTargetPct = effect_params.WarnTargetPct;
	//return;	
}

simulated function PreBeginPlay()
{
	super.PreBeginPlay();
	BW = BallisticWeapon(Weapon);
	//return;	
}

function StartBerserk()
{
	// End:0x6D
	if((Params == none) || Params.FireEffectParams.Length == 0)
	{
		FireRate = default.FireRate * 0.8000000;
		FireAnimRate = default.FireAnimRate * 1.2500000;
		FireRecoil = default.FireRecoil * 0.8000000;
		FireChaos = default.FireChaos * 0.8000000;		
	}
	else
	{
		FireRate = Params.FireInterval * 0.8000000;
		FireAnimRate = Params.FireAnimRate * 1.2500000;
		FireRecoil = Params.FireEffectParams[BW.AmmoIndex].Recoil * 0.8000000;
		FireChaos = Params.FireEffectParams[BW.AmmoIndex].Chaos * 0.8000000;
	}
	//return;	
}

function StopBerserk()
{
	// End:0x51
	if((Params == none) || Params.FireEffectParams.Length == 0)
	{
		FireRate = default.FireRate;
		FireAnimRate = default.FireAnimRate;
		FireRecoil = default.FireRecoil;
		FireChaos = default.FireChaos;		
	}
	else
	{
		FireRate = Params.FireInterval;
		FireAnimRate = Params.FireAnimRate;
		FireRecoil = Params.FireEffectParams[BW.AmmoIndex].Recoil;
		FireChaos = Params.FireEffectParams[BW.AmmoIndex].Chaos;
	}
	//return;	
}

function StartSuperBerserk()
{
	// End:0xB5
	if((Params == none) || Params.FireEffectParams.Length == 0)
	{
		FireRate = default.FireRate / Level.GRI.WeaponBerserk;
		FireAnimRate = default.FireAnimRate * Level.GRI.WeaponBerserk;
		FireRecoil = default.FireRecoil / Level.GRI.WeaponBerserk;
		FireChaos = default.FireChaos / Level.GRI.WeaponBerserk;		
	}
	else
	{
		FireRate = Params.FireInterval / Level.GRI.WeaponBerserk;
		FireAnimRate = Params.FireAnimRate * Level.GRI.WeaponBerserk;
		FireRecoil = Params.FireEffectParams[BW.AmmoIndex].Recoil / Level.GRI.WeaponBerserk;
		FireChaos = Params.FireEffectParams[BW.AmmoIndex].Chaos / Level.GRI.WeaponBerserk;
	}
	//return;	
}

simulated function SwitchWeaponMode(byte newmode)
{
	//return;	
}

simulated function OnFireParamsChanged(int EffectIndex)
{
	ApplyFireParams();
	OnEffectParamsChanged(EffectIndex);
	//return;	
}

simulated function OnEffectParamsChanged(int EffectIndex)
{
	ApplyFireEffectParams(Params.FireEffectParams[EffectIndex]);
	// End:0x32
	if(BW.bBerserk)
	{
		StartBerserk();
	}
	//return;	
}

function InitEffects()
{
	// End:0x1B
	if(AIController(Instigator.Controller) != none)
	{
		return;
	}
	// End:0x7F
	if((MuzzleFlashClass != none) && (MuzzleFlash == none) || MuzzleFlash.bDeleteMe)
	{
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(MuzzleFlash, MuzzleFlashClass, Weapon.DrawScale * FlashScaleFactor, Weapon, FlashBone);
	}
	//return;	
}

function FlashMuzzleFlash()
{
	// End:0x36
	if((int(Level.NetMode) == int(NM_DedicatedServer)) || AIController(Instigator.Controller) != none)
	{
		return;
	}
	// End:0x74
	if(!Instigator.IsFirstPerson() || PlayerController(Instigator.Controller).ViewTarget != Instigator)
	{
		return;
	}
	// End:0x98
	if(MuzzleFlash != none)
	{
		MuzzleFlash.Trigger(Weapon, Instigator);
	}
	// End:0xA9
	if(!bBrassOnCock)
	{
		EjectBrass();
	}
	//return;	
}

function EjectBrass()
{
	local Vector Start, X, Y, Z;
	local Coords C;

	// End:0x1B
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		return;
	}
	// End:0x4C
	if(!Class'BCoreProV55.BallisticMod'.default.bEjectBrass || int(Level.DetailMode) < int(1))
	{
		return;
	}
	// End:0x59
	if(BrassClass == none)
	{
		return;
	}
	// End:0x97
	if(!Instigator.IsFirstPerson() || PlayerController(Instigator.Controller).ViewTarget != Instigator)
	{
		return;
	}
	// End:0xB2
	if(AIController(Instigator.Controller) != none)
	{
		return;
	}
	C = Weapon.GetBoneCoords(BrassBone);
	Weapon.GetViewAxes(X, Y, Z);
	Start = ((C.Origin + (X * BrassOffset.X)) + (Y * BrassOffset.Y)) + (Z * BrassOffset.Z);
	Spawn(BrassClass, Weapon,, Start, Rotator(C.XAxis));
	//return;	
}

simulated function DestroyEffects()
{
	super.DestroyEffects();
	Class'BCoreProV55.BUtil'.static.KillEmitterEffect(MuzzleFlash);
	MuzzleFlash = none;
	//return;	
}

function Rotator AdjustAim(Vector Start, float InAimError)
{
	// End:0x23
	if(BW.bUseSpecialAim)
	{
		return BW.GetPlayerAim(true);
	}
	return super.AdjustAim(Start, InAimError);
	//return;	
}

simulated function Vector GetFireDir(out Vector StartTrace)
{
	// End:0x3C
	if(StartTrace == vect(0.0000000, 0.0000000, 0.0000000))
	{
		StartTrace = Instigator.Location + Instigator.EyePosition();
	}
	return BW.super(BallisticFire).GetFireDir() >> (AdjustAim(StartTrace, aimerror));
	//return;	
}

simulated function Rotator GetFireAim(out Vector StartTrace)
{
	return Rotator(GetFireDir(StartTrace));
	//return;	
}

simulated function Vector GetFireSpread()
{
	local float fX;
	local Rotator R;

	switch(FireSpreadMode)
	{
		// End:0x79
		case 1:
			fX = FRand();
			R.Yaw = int((XInaccuracy * ((FRand() * float(2)) - float(1))) * Sin(fX * 1.5707960));
			R.Pitch = int((YInaccuracy * ((FRand() * float(2)) - float(1))) * Cos(fX * 1.5707960));
			// End:0x145
			break;
		// End:0xFD
		case 2:
			fX = FRand();
			R.Yaw = int((XInaccuracy * Sin(((FRand() * float(2)) - float(1)) * 1.5707960)) * Sin(fX * 1.5707960));
			R.Pitch = int((YInaccuracy * Sin(((FRand() * float(2)) - float(1)) * 1.5707960)) * Cos(fX * 1.5707960));
			// End:0x145
			break;
		// End:0xFFFF
		default:
			R.Yaw = int(XInaccuracy * ((FRand() * float(2)) - float(1)));
			R.Pitch = int(YInaccuracy * ((FRand() * float(2)) - float(1)));
			// End:0x145
			break;
			break;
	}
	return Vector(R);
	//return;	
}

simulated function float GetSpreadRand(float RSpread)
{
	return ((FRand() * RSpread) * float(2)) - RSpread;
	//return;	
}

function DoFireEffect()
{
	// End:0x1C
	if(!bAISilent)
	{
		Instigator.MakeNoise(1.0000000);
	}
	ApplyRecoil();
	bPendingTryJam = true;
	super.DoFireEffect();
	//return;	
}

function TryJam()
{
	bPendingTryJam = false;
	// End:0x6A
	if((Instigator != none) && Instigator.PhysicsVolume.bWaterVolume)
	{
		// End:0x67
		if((WaterJamChance > float(0)) && FRand() <= WaterJamChance)
		{
			DoJam();
			BW.ClientJamMode(byte(ThisModeNum));
		}		
	}
	else
	{
		// End:0xA1
		if((JamChance > float(0)) && FRand() <= JamChance)
		{
			DoJam();
			BW.ClientJamMode(byte(ThisModeNum));
		}
	}
	//return;	
}

simulated function DoJam()
{
	// End:0x0B
	if(bIsJammed)
	{
		return;
	}
	switch(UnjamMethod)
	{
		// End:0x3C
		case 0:
			BW.bNeedReload = true;
			BW.bNeedCock = true;
			// End:0x71
			break;
		// End:0x55
		case 1:
			BW.bNeedReload = true;
			// End:0x71
			break;
		// End:0x6E
		case 2:
			BW.bNeedCock = true;
			// End:0x71
			break;
		// End:0xFFFF
		default:
			break;
	}
	Weapon.PlaySound(JamSound.Sound, JamSound.Slot, JamSound.Volume, JamSound.bNoOverride, JamSound.Radius, JamSound.Pitch, JamSound.bAtten);
	bIsJammed = true;
	//return;	
}

simulated function CockingGun(optional byte Type)
{
	// End:0x5B
	if(bIsJammed && int(UnjamMethod) == int(2))
	{
		bIsJammed = false;
		// End:0x5B
		if(bJamWastesAmmo && int(Weapon.Role) == int(ROLE_Authority))
		{
			ConsumedLoad += int(load);
			Timer();
		}
	}
	//return;	
}

simulated function ReloadingGun(optional byte i)
{
	// End:0x6D
	if(bIsJammed && (int(UnjamMethod) == int(1)) || int(UnjamMethod) == int(0))
	{
		bIsJammed = false;
		// End:0x6D
		if(bJamWastesAmmo && int(Weapon.Role) == int(ROLE_Authority))
		{
			ConsumedLoad += int(load);
			Timer();
		}
	}
	//return;	
}

simulated function ApplyRecoil()
{
	local Vector VelRecoilVect;

	// End:0x2B
	if(BW != none)
	{
		BW.AddRecoil(FireRecoil, FireChaos, byte(ThisModeNum));
	}
	// End:0xA2
	if((FirePushbackForce != float(0)) && Instigator != none)
	{
		VelRecoilVect = Vector(Instigator.GetViewRotation()) * FirePushbackForce;
		VelRecoilVect.Z *= 0.2500000;
		// End:0xA2
		if(int(Instigator.Physics) != int(2))
		{
			Instigator.Velocity -= VelRecoilVect;
		}
	}
	//return;	
}

simulated event ModeTick(float dt)
{
	// End:0x35
	if(Instigator == none)
	{
		Log("BallisticFire: ModeTick: No Instigator");
	}
	//return;	
}

simulated function SendFireEffect(Actor Other, Vector HitLocation, Vector HitNormal, int Surf, optional Vector WaterHitLoc)
{
	// End:0x49
	if(Weapon != none)
	{
		BallisticAttachment(Weapon.ThirdPersonActor).BallisticUpdateHit(Other, HitLocation, HitNormal, Surf, ThisModeNum > 0, WaterHitLoc);
	}
	//return;	
}

function PlayPreFire()
{
	// End:0x29
	if(int(ScopeDownOn) == int(2))
	{
		BW.TemporaryScopeDown(0.5000000, 0.9000000);
	}
	super.PlayPreFire();
	//return;	
}

simulated function PlayFireAnimations()
{
	// End:0x49
	if((FireCount == 0) && Weapon.HasAnim(FireLoopAnim))
	{
		BW.SafeLoopAnim(FireLoopAnim, FireLoopAnimRate, 0.0000000,, "FIRE");		
	}
	else
	{
		BW.SafePlayAnim(FireAnim, FireAnimRate, TweenTime,, "FIRE");
		// End:0xAA
		if(BW.BlendFire())
		{
			BW.SafePlayAnim(AimedFireAnim, FireAnimRate, TweenTime, 1, "AIMEDFIRE");
		}
	}
	//return;	
}

function ServerPlayFiring()
{
	// End:0x67
	if(BallisticFireSound.Sound != none)
	{
		Weapon.PlayOwnedSound(BallisticFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);
	}
	CheckClipFinished();
	PlayFireAnimations();
	//return;	
}

function PlayFiring()
{
	// End:0x29
	if(int(ScopeDownOn) == int(1))
	{
		BW.TemporaryScopeDown(0.5000000, 0.9000000);
	}
	PlayFireAnimations();
	ClientPlayForceFeedback(FireForce);
	FireCount++;
	// End:0xA8
	if(BallisticFireSound.Sound != none)
	{
		Weapon.PlayOwnedSound(BallisticFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);
	}
	CheckClipFinished();
	//return;	
}

simulated function CheckClipFinished()
{
	// End:0xCE
	if((ClipFinishSound.Sound != none) && (bUseWeaponMag && (float(BW.MagAmmo) - load) < float(1)) || BW.bNoMag && (float(BW.AmmoAmount(ThisModeNum)) - load) < float(1))
	{
		Weapon.PlayOwnedSound(ClipFinishSound.Sound, ClipFinishSound.Slot, ClipFinishSound.Volume, ClipFinishSound.bNoOverride, ClipFinishSound.Radius, ClipFinishSound.Pitch, ClipFinishSound.bAtten);
	}
	//return;	
}

simulated event Timer()
{
	// End:0x6C
	if(int(Weapon.Role) == int(ROLE_Authority))
	{
		// End:0x42
		if(BW != none)
		{
			BW.ConsumeMagAmmo(ThisModeNum, float(ConsumedLoad));			
		}
		else
		{
			Weapon.ConsumeAmmo(ThisModeNum, float(ConsumedLoad));
		}
		// End:0x6C
		if(bPendingTryJam)
		{
			TryJam();
		}
	}
	ConsumedLoad = 0;
	//return;	
}

simulated event ModeDoFire()
{
	// End:0x0D
	if(!AllowFire())
	{
		return;
	}
	// End:0xEC
	if(bIsJammed)
	{
		// End:0xC3
		if(BW.FireCount == 0)
		{
			bIsJammed = false;
			// End:0x6A
			if(bJamWastesAmmo && int(Weapon.Role) == int(ROLE_Authority))
			{
				ConsumedLoad += int(load);
				Timer();
			}
			// End:0xB3
			if(int(UnjamMethod) == int(3))
			{
				NextFireTime += FireRate;
				NextFireTime = FMax(NextFireTime, Level.TimeSeconds);
				BW.FireCount++;
				return;
			}
			// End:0xC0
			if(!AllowFire())
			{
				return;
			}			
		}
		else
		{
			NextFireTime += FireRate;
			NextFireTime = FMax(NextFireTime, Level.TimeSeconds);
			return;
		}
	}
	// End:0x16C
	if(BW != none)
	{
		BW.bPreventReload = true;
		BW.FireCount++;
		// End:0x16C
		if(int(BW.ReloadState) != int(0))
		{
			// End:0x15B
			if(int(Weapon.Role) == int(ROLE_Authority))
			{
				BW.bServerReloading = false;
			}
			BW.ReloadState = 0;
		}
	}
	// End:0x18D
	if(MaxHoldTime > 0.0000000)
	{
		HoldTime = FMin(HoldTime, MaxHoldTime);
	}
	ConsumedLoad += int(load);
	SetTimer(FMin(0.1000000, FireRate / float(2)), false);
	// End:0x241
	if(int(Weapon.Role) == int(ROLE_Authority))
	{
		DoFireEffect();
		// End:0x1F6
		if((Instigator == none) || Instigator.Controller == none)
		{
			return;
		}
		// End:0x232
		if(AIController(Instigator.Controller) != none)
		{
			AIController(Instigator.Controller).WeaponFireAgain(BotRefireRate, true);
		}
		Instigator.DeactivateSpawnProtection();
	}
	BW.LastFireTime = Level.TimeSeconds;
	// End:0x28B
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
	// End:0x2D7
	if(bFireOnRelease)
	{
		// End:0x2B9
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
		// End:0x374
		if(bBurstMode)
		{
			BurstCount++;
			// End:0x343
			if(BurstCount >= MaxBurst)
			{
				NextFireTime += (FireRate * (float(1) + (float(MaxBurst) * (1.0000000 - BurstFireRateFactor))));
				NextFireTime = FMax(NextFireTime, Level.TimeSeconds);
				BurstCount = 0;				
			}
			else
			{
				NextFireTime += (FireRate * BurstFireRateFactor);
				NextFireTime = FMax(NextFireTime, Level.TimeSeconds);
			}			
		}
		else
		{
			NextFireTime += FireRate;
			NextFireTime = FMax(NextFireTime, Level.TimeSeconds);
		}
	}
	load = float(AmmoPerFire);
	HoldTime = 0.0000000;
	// End:0x3F8
	if((Instigator.PendingWeapon != Weapon) && Instigator.PendingWeapon != none)
	{
		bIsFiring = false;
		Weapon.PutDown();
	}
	// End:0x472
	if(BW != none)
	{
		BW.bNeedReload = BW.MayNeedReload(byte(ThisModeNum), float(ConsumedLoad));
		// End:0x472
		if(bCockAfterFire || bCockAfterEmpty && (BW.MagAmmo - ConsumedLoad) < 1)
		{
			BW.bNeedCock = true;
		}
	}
	//return;	
}

simulated function StopFiring()
{
	// End:0x54
	if(bBurstMode && BurstCount != 0)
	{
		NextFireTime = Level.TimeSeconds + (FireRate * (float(1) + (float(MaxBurst) * (1.0000000 - BurstFireRateFactor))));
		BurstCount = 0;
	}
	//return;	
}

simulated function WeaponReloaded()
{
	bPlayedDryFire = false;
	//return;	
}

simulated function bool CheckWeaponMode()
{
	// End:0x28
	if((Instigator != none) && AIController(Instigator.Controller) != none)
	{
		return true;
	}
	return BW.CheckWeaponMode(ThisModeNum);
	//return;	
}

simulated function bool CheckReloading()
{
	// End:0x1B
	if(int(BW.MeleeState) > int(1))
	{
		return false;
	}
	// End:0x43
	if((int(BW.ReloadState) == int(8)) && !bIgnoreCocking)
	{
		return false;
	}
	// End:0x7F
	if(((int(BW.ReloadState) != int(0)) || BW.bServerReloading) && !bIgnoreReload)
	{
		return false;
	}
	return true;
	//return;	
}

simulated function bool AllowFire()
{
	// End:0x0D
	if(!CheckReloading())
	{
		return false;
	}
	// End:0x1A
	if(!CheckWeaponMode())
	{
		return false;
	}
	// End:0xB0
	if(!bUseWeaponMag || BW.bNoMag)
	{
		// End:0xAD
		if(!super.AllowFire())
		{
			// End:0xAB
			if(DryFireSound.Sound != none)
			{
				Weapon.PlayOwnedSound(DryFireSound.Sound, DryFireSound.Slot, DryFireSound.Volume, DryFireSound.bNoOverride, DryFireSound.Radius, DryFireSound.Pitch, DryFireSound.bAtten);
			}
			return false;
		}		
	}
	else
	{
		// End:0x1A4
		if(BW.MagAmmo < AmmoPerFire)
		{
			// End:0x144
			if(!bPlayedDryFire && DryFireSound.Sound != none)
			{
				Weapon.PlayOwnedSound(DryFireSound.Sound, DryFireSound.Slot, DryFireSound.Volume, DryFireSound.bNoOverride, DryFireSound.Radius, DryFireSound.Pitch, DryFireSound.bAtten);
				bPlayedDryFire = true;
			}
			// End:0x15E
			if(bDryUncock)
			{
				BW.bNeedCock = true;
			}
			BW.bNeedReload = BW.MayNeedReload(byte(ThisModeNum), 0.0000000);
			BW.EmptyFire(byte(ThisModeNum));
			return false;			
		}
		else
		{
			// End:0x1BB
			if(BW.bNeedReload)
			{
				return false;				
			}
			else
			{
				// End:0x1CF
				if(BW.bNeedCock)
				{
					return false;
				}
			}
		}
	}
	return true;
	//return;	
}

defaultproperties
{
	FlashBone="tip"
	BrassBone="ejector"
	bUseWeaponMag=true
	ClipFinishSound=(Sound=none,Volume=0.5000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	DryFireSound=(Sound=none,Volume=0.5000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	FlashScaleFactor=1.0000000
	bReleaseFireOnDie=true
	BurstFireRateFactor=0.6600000
	FireChaosCurve=(Points=((InVal=0.0000000,OutVal=1.0000000),(InVal=1.0000000,OutVal=1.0000000)))
	FireSpreadMode=2
	SilencedFireSound=(Sound=none,Volume=0.7000000,Radius=48.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	BallisticFireSound=(Sound=none,Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	UnjamMethod=2
	JamSound=(Sound=none,Volume=0.8000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	bJamWastesAmmo=true
	TransientSoundVolume=1.0000000
	TweenTime=0.0000000
	AmmoPerFire=1
}
