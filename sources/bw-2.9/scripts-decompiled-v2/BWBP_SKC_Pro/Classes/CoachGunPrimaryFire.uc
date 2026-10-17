class CoachGunPrimaryFire extends BallisticProShotgunFire;

const SHOT_AMMO = 0;
const SLUG_AMMO = 1;
const ZAP_AMMO = 2;
const FLAME_AMMO = 3;
const HE_AMMO = 4;
const FRAG_AMMO = 5;

var() Actor MuzzleFlash2;
var name AimedFireEmptyAnim;
var name FireEmptyAnim;
var name AimedFireSingleAnim;
var name FireSingleAnim;
var name FireLoadingAnim;
var name AimedFireLoadingAnim;
var() float ChargeTime;
var() float DecayCharge;
var bool FlashSide;
var() Vector SpawnOffset;
var Projectile proj;

function AnimateFiring()
{
	// End:0x10F
	if(BW.HasNonMagAmmo(0) && CoachGun(BW).bQuickLoad)
	{
		// End:0xAB
		if(load >= float(BW.MagAmmo))
		{
			BW.SafePlayAnim(FireLoadingAnim, FireAnimRate, TweenTime,, "FIRE");
			// End:0xA8
			if(BW.BlendFire())
			{
				BW.SafePlayAnim(AimedFireLoadingAnim, FireAnimRate, TweenTime, 1, "AIMEDFIRE");
			}			
		}
		else
		{
			BW.SafePlayAnim(FireSingleAnim, FireAnimRate, TweenTime,, "FIRE");
			// End:0x10C
			if(BW.BlendFire())
			{
				BW.SafePlayAnim(AimedFireSingleAnim, FireAnimRate, TweenTime, 1, "AIMEDFIRE");
			}
		}		
	}
	else
	{
		// End:0x181
		if(load >= float(2))
		{
			BW.SafePlayAnim(FireAnim, FireAnimRate, TweenTime,, "FIRE");
			// End:0x17E
			if(BW.BlendFire())
			{
				BW.SafePlayAnim(AimedFireAnim, FireAnimRate, TweenTime, 1, "AIMEDFIRE");
			}			
		}
		else
		{
			BW.SafePlayAnim(FireSingleAnim, FireAnimRate, TweenTime,, "FIRE");
			// End:0x1E2
			if(BW.BlendFire())
			{
				BW.SafePlayAnim(AimedFireSingleAnim, FireAnimRate, TweenTime, 1, "AIMEDFIRE");
			}
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
	AnimateFiring();
	//return;	
}

function PlayFiring()
{
	// End:0x29
	if(int(ScopeDownOn) == int(1))
	{
		BW.TemporaryScopeDown(0.5000000, 0.9000000);
	}
	AnimateFiring();
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

simulated function SendFireEffect(Actor Other, Vector HitLocation, Vector HitNormal, int Surf, optional Vector WaterHitLoc)
{
	BallisticAttachment(Weapon.ThirdPersonActor).BallisticUpdateHit(Other, HitLocation, HitNormal, Surf, ConsumedLoad == 2, WaterHitLoc);
	//return;	
}

simulated function bool ImpactEffect(Vector HitLocation, Vector HitNormal, Material HitMat, Actor Other, optional Vector WaterHitLoc)
{
	local int Surf;

	// End:0x8C
	if((((ImpactManager != none) && WaterHitLoc != vect(0.0000000, 0.0000000, 0.0000000)) && Weapon.EffectIsRelevant(WaterHitLoc, false)) && bDoWaterSplash)
	{
		ImpactManager.static.StartSpawn(WaterHitLoc, Normal((Instigator.Location + Instigator.EyePosition()) - WaterHitLoc), 9, Instigator);
	}
	// End:0xE1
	if(((!Other.bWorldGeometry && Mover(Other) == none) && Pawn(Other) == none) || int(Level.NetMode) == int(NM_Client))
	{
		return false;
	}
	// End:0x142
	if(((!Other.bWorldGeometry && Mover(Other) == none) && BallisticShield(Other) == none) && Other.bProjTarget)
	{
		Spawn(Class'BallisticProV55.IE_IncMinigunBulletConcrete',,, HitLocation);		
	}
	else
	{
		// End:0x15D
		if(Vehicle(Other) != none)
		{
			Surf = 3;			
		}
		else
		{
			// End:0x181
			if(HitMat == none)
			{
				Surf = int(Other.SurfaceType);				
			}
			else
			{
				Surf = int(HitMat.SurfaceType);
			}
		}
		ImpactManager.static.StartSpawn(HitLocation, HitNormal, Surf, Instigator);
	}
	// End:0x28B
	if(((((TracerClass != none) && int(Level.DetailMode) > int(0)) && int(Class'BCoreProV55.BallisticMod'.default.EffectsDetailMode) > 0) && VSize(HitLocation - BallisticAttachment(Weapon.ThirdPersonActor).GetTipLocation()) > float(200)) && FRand() < TracerChance)
	{
		Spawn(TracerClass, Instigator,, BallisticAttachment(Weapon.ThirdPersonActor).GetTipLocation(), Rotator(HitLocation - BallisticAttachment(Weapon.ThirdPersonActor).GetTipLocation()));
	}
	return true;
	//return;	
}

simulated function SwitchWeaponMode(byte newmode)
{
	CoachGunAttachment(Weapon.ThirdPersonActor).SwitchWeaponMode(newmode);
	SwitchShotParams();
	//return;	
}

simulated event Timer()
{
	// End:0xB1
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
		// End:0xB1
		if(((BW.MagAmmo == 0) && BW.HasNonMagAmmo(0)) && CoachGun(BW).bQuickLoad)
		{
			BW.bServerReloading = true;
		}
	}
	ConsumedLoad = 0;
	//return;	
}

simulated function ModeTick(float DeltaTime)
{
	super(BallisticFire).ModeTick(DeltaTime);
	// End:0x50
	if(!bIsFiring && DecayCharge > float(0))
	{
		DecayCharge -= (DeltaTime * 2.5000000);
		// End:0x50
		if(DecayCharge < float(0))
		{
			DecayCharge = 0.0000000;
		}
	}
	//return;	
}

simulated event ModeDoFire()
{
	// End:0x3B
	if(BW.MagAmmo == 1)
	{
		load = 1.0000000;
		BW.bFireMode[1].ModeDoFire();
		return;
	}
	// End:0x53
	if(!AllowFire())
	{
		HoldTime = 0.0000000;
		return;
	}
	// End:0xD3
	if(BW != none)
	{
		BW.bPreventReload = true;
		BW.FireCount++;
		// End:0xD3
		if(int(BW.ReloadState) != int(0))
		{
			// End:0xC2
			if(int(Weapon.Role) == int(ROLE_Authority))
			{
				BW.bServerReloading = false;
			}
			BW.ReloadState = 0;
		}
	}
	// End:0xF9
	if(BW.MagAmmo >= 2)
	{
		load = 2.0000000;
		SwitchShotParams();
	}
	ConsumedLoad += int(load);
	SetTimer(FMin(0.1000000, FireRate / float(2)), false);
	// End:0x1AD
	if(int(Weapon.Role) == int(ROLE_Authority))
	{
		DoFireEffect();
		// End:0x162
		if((Instigator == none) || Instigator.Controller == none)
		{
			return;
		}
		// End:0x19E
		if(AIController(Instigator.Controller) != none)
		{
			AIController(Instigator.Controller).WeaponFireAgain(BotRefireRate, true);
		}
		Instigator.DeactivateSpawnProtection();
	}
	// End:0x1D5
	if(!BW.bScopeView)
	{
		BW.AddFireChaos(FireChaos);
	}
	// End:0x202
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
	// End:0x24E
	if(bFireOnRelease)
	{
		// End:0x230
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
	// End:0x296
	if(load == float(2))
	{
		load = float(AmmoPerFire);
		SwitchShotParams();
	}
	HoldTime = 0.0000000;
	// End:0x2E6
	if((Instigator.PendingWeapon != Weapon) && Instigator.PendingWeapon != none)
	{
		bIsFiring = false;
		Weapon.PutDown();
	}
	// End:0x3B8
	if(BW != none)
	{
		BW.bNeedReload = BW.MayNeedReload(byte(ThisModeNum), float(ConsumedLoad));
		// End:0x360
		if(bCockAfterFire || bCockAfterEmpty && (BW.MagAmmo - ConsumedLoad) < 1)
		{
			BW.bNeedCock = true;
		}
		// End:0x3B8
		if((CoachGun(BW).bQuickLoad && BW.HasNonMagAmmo(0)) && BW.MagAmmo <= ConsumedLoad)
		{
			BW.ReloadState = 1;
		}
	}
	//return;	
}

function int GetTraceCount(int load)
{
	switch(load)
	{
		// End:0x16
		case 2:
			return TraceCount * 2;
		// End:0x20
		case 1:
			return TraceCount;
		// End:0xFFFF
		default:
			return TraceCount;
			break;
	}
	//return;	
}

function DoFireEffect()
{
	local Vector StartTrace;
	local Rotator R, Aim;
	local int i;

	Aim = GetFireAim(StartTrace);
	// End:0x39
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		BW.RewindCollisions();
	}
	i = 0;
	J0x40:

	// End:0x87 [Loop If]
	if(i < (GetTraceCount(int(load))))
	{
		R = Rotator((GetFireSpread()) >> Aim);
		DoTrace(StartTrace, R);
		i++;
		// [Loop Continue]
		goto J0x40;
	}
	// End:0xAF
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		BW.RestoreCollisions();
	}
	ApplyHits();
	// End:0x114
	if(BallisticShotgunAttachment(Weapon.ThirdPersonActor) != none)
	{
		BallisticShotgunAttachment(Weapon.ThirdPersonActor).XInaccuracy = GetXInaccuracy();
		BallisticShotgunAttachment(Weapon.ThirdPersonActor).YInaccuracy = GetYInaccuracy();
	}
	SendFireEffect(none, Vector(Aim) * TraceRange.Max, StartTrace, 0);
	super(BallisticFire).DoFireEffect();
	//return;	
}

function InitEffects()
{
	super(BallisticFire).InitEffects();
	// End:0x6A
	if((MuzzleFlashClass != none) && (MuzzleFlash2 == none) || MuzzleFlash2.bDeleteMe)
	{
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(MuzzleFlash2, MuzzleFlashClass, Weapon.DrawScale * FlashScaleFactor, Weapon, 'tip2');
	}
	//return;	
}

function FlashMuzzleFlash()
{
	local Coords C;
	local Actor MuzzleSmoke;
	local Vector Start, X, Y, Z;
	local int i;

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
	i = 0;
	J0x7B:

	// End:0x197 [Loop If]
	if(float(i) < load)
	{
		// End:0xCB
		if(FlashSide)
		{
			C = Weapon.GetBoneCoords('tip2');
			MuzzleFlash2.Trigger(Weapon, Instigator);			
		}
		else
		{
			C = Weapon.GetBoneCoords('tip');
			MuzzleFlash.Trigger(Weapon, Instigator);
		}
		FlashSide = !FlashSide;
		// End:0x18D
		if(Class'BCoreProV55.BallisticMod'.default.bMuzzleSmoke)
		{
			Weapon.GetViewAxes(X, Y, Z);
			Start = (C.Origin + (X * float(-180))) + (Y * float(3));
			MuzzleSmoke = Spawn(Class'BallisticProV55.MRT6Smoke', Weapon,, Start, Rotator(X));
		}
		++i;
		// [Loop Continue]
		goto J0x7B;
	}
	// End:0x1A8
	if(!bBrassOnCock)
	{
		EjectBrass();
	}
	//return;	
}

function SwitchShotParams()
{
	// End:0x50
	if(load == float(2))
	{
		BallisticFireSound.Volume = default.BallisticFireSound.Volume * float(2);
		XInaccuracy = default.XInaccuracy * 2.5000000;
		YInaccuracy = default.YInaccuracy * 1.5000000;		
	}
	else
	{
		BallisticFireSound.Volume = default.BallisticFireSound.Volume;
		XInaccuracy = default.XInaccuracy;
		YInaccuracy = default.YInaccuracy;
	}
	//return;	
}

simulated state Projectile
{
	simulated function ApplyFireEffectParams(FireEffectParams Params)
	{
		local GrenadeEffectParams effect_params;

		super(BallisticFire).ApplyFireEffectParams(Params);
		effect_params = GrenadeEffectParams(Params);
		ProjectileClass = effect_params.ProjectileClass;
		SpawnOffset = effect_params.SpawnOffset;
		default.ProjectileClass = effect_params.ProjectileClass;
		default.SpawnOffset = effect_params.SpawnOffset;
		// End:0xA3
		if(CoachGunAttachment(Weapon.ThirdPersonActor) != none)
		{
			CoachGunAttachment(Weapon.ThirdPersonActor).SwitchWeaponMode(5);
		}
		//return;		
	}

	function float MaxRange()
	{
		// End:0x155
		if(ProjectileClass.default.MaxSpeed > ProjectileClass.default.Speed)
		{
			// End:0xFE
			if((Class<BallisticProjectile>(ProjectileClass) != none) && Class<BallisticProjectile>(ProjectileClass).default.AccelSpeed > float(0))
			{
				// End:0xA7
				if(ProjectileClass.default.LifeSpan <= float(0))
				{
					return FMin(ProjectileClass.default.MaxSpeed, (ProjectileClass.default.Speed + (Class<BallisticProjectile>(ProjectileClass).default.AccelSpeed * float(2))) * float(2));					
				}
				else
				{
					return FMin(ProjectileClass.default.MaxSpeed, (ProjectileClass.default.Speed + (Class<BallisticProjectile>(ProjectileClass).default.AccelSpeed * ProjectileClass.default.LifeSpan)) * ProjectileClass.default.LifeSpan);
				}				
			}
			else
			{
				// End:0x12C
				if(ProjectileClass.default.LifeSpan <= float(0))
				{
					return ProjectileClass.default.MaxSpeed * float(2);					
				}
				else
				{
					return (ProjectileClass.default.MaxSpeed * ProjectileClass.default.LifeSpan) * 0.7500000;
				}
			}			
		}
		else
		{
			// End:0x183
			if(ProjectileClass.default.LifeSpan <= float(0))
			{
				return ProjectileClass.default.Speed * float(2);				
			}
			else
			{
				return ProjectileClass.default.Speed * ProjectileClass.default.LifeSpan;
			}
		}
		//return;		
	}

	function DoFireEffect()
	{
		local Vector Start, X, Y, Z, End, HitLocation,
			HitNormal, StartTrace;

		local Rotator Aim;
		local Actor Other;

		Weapon.GetViewAxes(X, Y, Z);
		Start = Instigator.Location + Instigator.EyePosition();
		StartTrace = (Start + (X * SpawnOffset.X)) + (Z * SpawnOffset.Z);
		// End:0xB6
		if(!Weapon.WeaponCentered())
		{
			StartTrace = StartTrace + ((Weapon.hand * Y) * SpawnOffset.Y);
		}
		Aim = GetFireAim(StartTrace);
		Aim = Rotator((GetFireSpread()) >> Aim);
		End = Start + (Vector(Aim) * SpawnOffset.X);
		Other = Weapon.Trace(HitLocation, HitNormal, End, Start, false);
		// End:0x13A
		if(Other != none)
		{
			StartTrace = HitLocation;
		}
		End = Start + (Vector(Aim) * (MaxRange()));
		Other = Trace(HitLocation, HitNormal, End, Start, true);
		// End:0x196
		if(Other != none)
		{
			Aim = Rotator(HitLocation - StartTrace);
		}
		// End:0x1DF
		if(load == float(2))
		{
			SpawnProjectile((Start + (X * (SpawnOffset.X + float(1)))) + (Z * SpawnOffset.Z), Aim);
		}
		SpawnProjectile(StartTrace, Aim);
		SendFireEffect(none, vect(0.0000000, 0.0000000, 0.0000000), StartTrace, 0);
		super(BallisticFire).DoFireEffect();
		//return;		
	}

	function SpawnProjectile(Vector Start, Rotator Dir)
	{
		proj = Spawn(ProjectileClass,,, Start, Dir);
		// End:0x3C
		if(proj != none)
		{
			proj.Instigator = Instigator;
		}
		//return;		
	}
	stop;	
}

simulated state ShotgunZap
{
	simulated function ApplyFireEffectParams(FireEffectParams Params)
	{
		local ShotgunEffectParams effect_params;

		super(BallisticProShotgunFire).ApplyFireEffectParams(Params);
		effect_params = ShotgunEffectParams(Params);
		HipSpreadFactor = effect_params.HipSpreadFactor;
		KickForce = 4500;
		MaxWaterTraceRange = 9000.0000000;
		// End:0x7D
		if(CoachGunAttachment(Weapon.ThirdPersonActor) != none)
		{
			CoachGunAttachment(Weapon.ThirdPersonActor).SwitchWeaponMode(2);
		}
		//return;		
	}

	function DoFireEffect()
	{
		local Vector StartTrace;
		local Rotator R, Aim;
		local int i;

		Aim = GetFireAim(StartTrace);
		// End:0x39
		if(int(Level.NetMode) == int(NM_DedicatedServer))
		{
			BW.RewindCollisions();
		}
		i = 0;
		J0x40:

		// End:0x87 [Loop If]
		if(i < (GetTraceCount(int(load))))
		{
			R = Rotator((GetFireSpread()) >> Aim);
			DoTrace(StartTrace, R);
			i++;
			// [Loop Continue]
			goto J0x40;
		}
		// End:0xAF
		if(int(Level.NetMode) == int(NM_DedicatedServer))
		{
			BW.RestoreCollisions();
		}
		ApplyHits();
		// End:0x114
		if(BallisticShotgunAttachment(Weapon.ThirdPersonActor) != none)
		{
			BallisticShotgunAttachment(Weapon.ThirdPersonActor).XInaccuracy = GetXInaccuracy();
			BallisticShotgunAttachment(Weapon.ThirdPersonActor).YInaccuracy = GetYInaccuracy();
		}
		SendFireEffect(none, Vector(Aim) * TraceRange.Max, StartTrace, 0);
		super(BallisticFire).DoFireEffect();
		//return;		
	}
	stop;	
}

simulated state ShotgunHE
{
	simulated function ApplyFireEffectParams(FireEffectParams Params)
	{
		local ShotgunEffectParams effect_params;

		super(BallisticProShotgunFire).ApplyFireEffectParams(Params);
		effect_params = ShotgunEffectParams(Params);
		HipSpreadFactor = effect_params.HipSpreadFactor;
		// End:0x67
		if(CoachGunAttachment(Weapon.ThirdPersonActor) != none)
		{
			CoachGunAttachment(Weapon.ThirdPersonActor).SwitchWeaponMode(4);
		}
		//return;		
	}

	function DoFireEffect()
	{
		local Vector StartTrace;
		local Rotator R, Aim;
		local int i;

		Aim = GetFireAim(StartTrace);
		// End:0x39
		if(int(Level.NetMode) == int(NM_DedicatedServer))
		{
			BW.RewindCollisions();
		}
		i = 0;
		J0x40:

		// End:0x87 [Loop If]
		if(i < (GetTraceCount(int(load))))
		{
			R = Rotator((GetFireSpread()) >> Aim);
			DoTrace(StartTrace, R);
			i++;
			// [Loop Continue]
			goto J0x40;
		}
		// End:0xAF
		if(int(Level.NetMode) == int(NM_DedicatedServer))
		{
			BW.RestoreCollisions();
		}
		// End:0x10E
		if(BallisticShotgunAttachment(Weapon.ThirdPersonActor) != none)
		{
			BallisticShotgunAttachment(Weapon.ThirdPersonActor).XInaccuracy = GetXInaccuracy();
			BallisticShotgunAttachment(Weapon.ThirdPersonActor).YInaccuracy = GetYInaccuracy();
		}
		SendFireEffect(none, Vector(Aim) * TraceRange.Max, StartTrace, 0);
		super(BallisticFire).DoFireEffect();
		ApplyHits();
		//return;		
	}

	function ApplyDamage(Actor Target, int Damage, Pawn Instigator, Vector HitLocation, Vector MomentumDir, Class<DamageType> DamageType)
	{
		super(BallisticInstantFire).ApplyDamage(Target, Damage, Instigator, HitLocation, MomentumDir, DamageType);
		// End:0x6A
		if(Target.bProjTarget)
		{
			BW.TargetedHurtRadius(float(Damage), 512.0000000, Class'BWBP_SKC_Pro.DT_CoachGunExplosive', 200.0000000, HitLocation, Pawn(Target));
		}
		//return;		
	}
	stop;	
}

simulated state ShotgunIncendiary
{
	simulated function ApplyFireEffectParams(FireEffectParams Params)
	{
		local ShotgunEffectParams effect_params;

		super(BallisticProShotgunFire).ApplyFireEffectParams(Params);
		effect_params = ShotgunEffectParams(Params);
		HipSpreadFactor = effect_params.HipSpreadFactor;
		// End:0x67
		if(CoachGunAttachment(Weapon.ThirdPersonActor) != none)
		{
			CoachGunAttachment(Weapon.ThirdPersonActor).SwitchWeaponMode(3);
		}
		//return;		
	}

	function CoachGunFireControl GetFireControl()
	{
		return CoachGun(Weapon).GetFireControl();
		//return;		
	}

	function DoFireEffect()
	{
		local Vector Start, Dir, End, HitLocation, HitNormal;

		local Rotator R, Aim;
		local Actor Other;
		local float dist, NodeDist, DR;
		local int i;

		Aim = GetFireAim(Start);
		// End:0x39
		if(int(Level.NetMode) == int(NM_DedicatedServer))
		{
			BW.RewindCollisions();
		}
		i = 0;
		J0x40:

		// End:0x87 [Loop If]
		if(i < (GetTraceCount(int(load))))
		{
			R = Rotator((GetFireSpread()) >> Aim);
			DoTrace(Start, R);
			i++;
			// [Loop Continue]
			goto J0x40;
		}
		// End:0xAF
		if(int(Level.NetMode) == int(NM_DedicatedServer))
		{
			BW.RestoreCollisions();
		}
		ApplyHits();
		// End:0x114
		if(BallisticShotgunAttachment(Weapon.ThirdPersonActor) != none)
		{
			BallisticShotgunAttachment(Weapon.ThirdPersonActor).XInaccuracy = GetXInaccuracy();
			BallisticShotgunAttachment(Weapon.ThirdPersonActor).YInaccuracy = GetYInaccuracy();
		}
		Start = Instigator.Location + Instigator.EyePosition();
		Aim = GetFireAim(Start);
		Aim = Rotator((GetFireSpread()) >> Aim);
		Dir = Vector(Aim);
		End = Start + (Dir * (MaxRange()));
		Weapon.bTraceWater = true;
		i = 0;
		J0x19F:

		// End:0x28E [Loop If]
		if(i < 20)
		{
			Other = Trace(HitLocation, HitNormal, End, Start, true);
			// End:0x24F
			if((((((Other == none) || Other.bWorldGeometry) || Mover(Other) != none) || Vehicle(Other) != none) || FluidSurfaceInfo(Other) != none) || (PhysicsVolume(Other) != none) && PhysicsVolume(Other).bWaterVolume)
			{
				// [Explicit Break]
				goto J0x28E;
			}
			Start = HitLocation + (Dir * FMax(32.0000000, (Other.CollisionRadius * float(2)) + float(4)));
			i++;
			// [Loop Continue]
			goto J0x19F;
		}
		J0x28E:

		Weapon.bTraceWater = false;
		// End:0x2B5
		if(Other == none)
		{
			HitLocation = End;
		}
		// End:0x2F7
		if((FluidSurfaceInfo(Other) != none) || (PhysicsVolume(Other) != none) && PhysicsVolume(Other).bWaterVolume)
		{
			Other = none;
		}
		i = 0;
		J0x2FE:

		// End:0x3DB [Loop If]
		if(i < (GetTraceCount(int(load))))
		{
			R = Rotator((GetFireSpread()) >> Aim);
			// End:0x39A
			if((Other != none) && Other.bWorldGeometry || Mover(Other) != none)
			{
				GetFireControl().FireShotRotated(Start, HitLocation, dist, Other != none, HitNormal, Instigator, Other, R);
				// [Explicit Continue]
				goto J0x3D1;
			}
			GetFireControl().FireShotRotated(Start, HitLocation, dist, Other != none, HitNormal, Instigator, none, R);
			J0x3D1:

			i++;
			// [Loop Continue]
			goto J0x2FE;
		}
		dist = VSize(HitLocation - Start);
		i = 0;
		J0x3F6:

		// End:0x5C9 [Loop If]
		if(i < GetFireControl().GasNodes.Length)
		{
			// End:0x494
			if((GetFireControl().GasNodes[i] == none) || ((RX22AGasCloud(GetFireControl().GasNodes[i]) == none) && RX22AGasPatch(GetFireControl().GasNodes[i]) == none) && RX22AGasSoak(GetFireControl().GasNodes[i]) == none)
			{
				// [Explicit Continue]
				goto J0x5BF;
			}
			NodeDist = VSize(GetFireControl().GasNodes[i].Location - Start);
			// End:0x4D3
			if(NodeDist > dist)
			{
				// [Explicit Continue]
				goto J0x5BF;
			}
			DR = Dir Dot Normal(GetFireControl().GasNodes[i].Location - Start);
			// End:0x519
			if(DR < 0.7500000)
			{
				// [Explicit Continue]
				goto J0x5BF;
			}
			NodeDist = VSize(GetFireControl().GasNodes[i].Location - (Start + (Dir * (DR * NodeDist))));
			// End:0x5BF
			if(NodeDist < float(128))
			{
				GetFireControl().GasNodes[i].TakeDamage(5, Instigator, GetFireControl().GasNodes[i].Location, vect(0.0000000, 0.0000000, 0.0000000), Class'BallisticProV55.DTRX22ABurned');
			}
			J0x5BF:

			i++;
			// [Loop Continue]
			goto J0x3F6;
		}
		SendFireEffect(none, Vector(Aim) * TraceRange.Max, Start, 0);
		super(BallisticFire).DoFireEffect();
		//return;		
	}
	stop;	
}

defaultproperties
{
	AimedFireEmptyAnim="Fire"
	FireEmptyAnim="Fire"
	AimedFireSingleAnim="SightFire"
	FireSingleAnim="SightFire"
	FireLoadingAnim="FireCombined"
	AimedFireLoadingAnim="SightFireCombined"
	ChargeTime=0.3500000
	HipSpreadFactor=2.5000000
	TraceCount=10
	TracerClass=Class'BallisticProV55.TraceEmitter_MRTsix'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	MaxHits=14
	TraceRange=(Min=2560.0000000,Max=3072.0000000)
	RangeAtten=0.2500000
	DamageType=Class'BWBP_SKC_Pro.DT_CoachShot'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_CoachShot'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_CoachShot'
	KickForce=500
	BrassBone="EjectorR"
	BrassOffset=(X=-30.0000000,Y=-5.0000000,Z=5.0000000)
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	FlashScaleFactor=1.5000000
	AimedFireAnim="Fire"
	FireRecoil=768.0000000
	FirePushbackForce=250.0000000
	FireChaos=1.0000000
	XInaccuracy=220.0000000
	YInaccuracy=220.0000000
	BallisticFireSound=(Sound=Sound'BWBP_SKC_Sounds.Redwood.Redwood-Fire',Volume=1.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	FireAnimRate=1.3500000
	FireRate=0.3000000
	AmmoClass=Class'BallisticProV55.Ammo_MRS138Shells'
	ShakeRotMag=(X=128.0000000,Y=64.0000000,Z=0.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-12.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	BotRefireRate=0.6000000
	WarnTargetPct=0.5000000
}
