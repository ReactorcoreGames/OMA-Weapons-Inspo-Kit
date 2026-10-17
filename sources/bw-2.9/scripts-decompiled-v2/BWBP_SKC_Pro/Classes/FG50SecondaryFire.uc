class FG50SecondaryFire extends BallisticProInstantFire;

var() Sound SpecialFireSound;
var Actor Heater;

simulated state RapidFire
{
	simulated function bool AllowFire()
	{
		// End:0x31
		if((FG50MachineGun(Weapon).HeatLevel >= float(10)) || !super(BallisticFire).AllowFire())
		{
			StopFiring();
			return false;
		}
		return true;
		//return;		
	}

	function PlayFiring()
	{
		super(BallisticFire).PlayFiring();
		FG50MachineGun(BW).AddHeat(HeatPerShot);
		//return;		
	}

	function DoFireEffect()
	{
		super(BallisticInstantFire).DoFireEffect();
		// End:0x38
		if(int(Level.NetMode) == int(NM_DedicatedServer))
		{
			FG50MachineGun(BW).AddHeat(HeatPerShot);
		}
		//return;		
	}

	simulated function SwitchCannonMode(byte newmode)
	{
		// End:0x1E
		if(Weapon.bBerserk)
		{
			FireRate *= 0.7500000;
		}
		// End:0x5D
		if(Level.GRI.WeaponBerserk > 1.0000000)
		{
			FireRate /= Level.GRI.WeaponBerserk;
		}
		//return;		
	}

	simulated function DestroyEffects()
	{
		super(BallisticFire).DestroyEffects();
		// End:0x1D
		if(Heater != none)
		{
			Heater.Destroy();
		}
		//return;		
	}

	function DoTrace(Vector InitialStart, Rotator Dir)
	{
		local Vector End, X, HitLocation, HitNormal, Start, WaterHitLoc,
			LastHitLoc;

		local Material HitMaterial;
		local float dist;
		local Actor Other, LastOther;
		local bool bHitWall;

		dist = TraceRange.Min + (FRand() * (TraceRange.Max - TraceRange.Min));
		Start = InitialStart;
		X = Normal(Vector(Dir));
		End = Start + (X * dist);
		LastHitLoc = End;
		Weapon.bTraceWater = true;
		J0x7B:

		// End:0x363 [Loop If]
		if(dist > float(0))
		{
			Other = Trace(HitLocation, HitNormal, End, Start, true,, HitMaterial);
			Weapon.bTraceWater = false;
			dist -= VSize(HitLocation - Start);
			// End:0x120
			if((int(Level.NetMode) == int(NM_Client)) && (int(Other.Role) != int(ROLE_Authority)) || Other.bWorldGeometry)
			{
				// [Explicit Break]
				goto J0x363;
			}
			// End:0x352
			if(Other != none)
			{
				// End:0x1D7
				if((FluidSurfaceInfo(Other) != none) || (PhysicsVolume(Other) != none) && PhysicsVolume(Other).bWaterVolume)
				{
					// End:0x187
					if(VSize(HitLocation - Start) > float(1))
					{
						WaterHitLoc = HitLocation;
					}
					Start = HitLocation;
					dist = float(Min(int(dist), int(MaxWaterTraceRange)));
					End = Start + (X * dist);
					Weapon.bTraceWater = false;
					// [Explicit Continue]
					goto J0x360;
				}
				LastHitLoc = HitLocation;
				// End:0x283
				if(!Other.bWorldGeometry && Other != LastOther)
				{
					OnTraceHit(Other, HitLocation, InitialStart, X, 0, 0, 0, WaterHitLoc);
					LastOther = Other;
					// End:0x270
					if(Pawn(Other) != none)
					{
						bHitWall = ImpactEffect(HitLocation, HitNormal, HitMaterial, Other, WaterHitLoc);
						// [Explicit Break]
						goto J0x363;						
					}
					else
					{
						// End:0x283
						if(Mover(Other) == none)
						{
							// [Explicit Break]
							goto J0x363;
						}
					}
				}
				// End:0x2D0
				if(Other.bWorldGeometry || Mover(Other) != none)
				{
					bHitWall = ImpactEffect(HitLocation, HitNormal, HitMaterial, Other, WaterHitLoc);
					// [Explicit Break]
					goto J0x363;
				}
				// End:0x34C
				if((Other == Instigator) || Other == LastOther)
				{
					Start = HitLocation + (X * FMax(32.0000000, Other.CollisionRadius * float(2)));
					End = Start + (X * dist);
					Weapon.bTraceWater = true;
					// [Explicit Continue]
					goto J0x360;
				}
				// [Explicit Break]
				goto J0x363;				
			}
			else
			{
				LastHitLoc = End;
				// [Explicit Break]
				goto J0x363;
			}
			J0x360:

			// [Loop Continue]
			goto J0x7B;
		}
		J0x363:

		// End:0x388
		if(!bHitWall)
		{
			NoHitEffect(X, InitialStart, LastHitLoc, WaterHitLoc);
		}
		//return;		
	}

	simulated function bool ImpactEffect(Vector HitLocation, Vector HitNormal, Material HitMat, Actor Other, optional Vector WaterHitLoc)
	{
		local int Surf;

		// End:0x55
		if(((!Other.bWorldGeometry && Mover(Other) == none) && Pawn(Other) == none) || int(Level.NetMode) == int(NM_Client))
		{
			return false;
		}
		// End:0x70
		if(Vehicle(Other) != none)
		{
			Surf = 3;			
		}
		else
		{
			// End:0x94
			if(HitMat == none)
			{
				Surf = int(Other.SurfaceType);				
			}
			else
			{
				Surf = int(HitMat.SurfaceType);
			}
		}
		SendFireEffect(Other, HitLocation, HitNormal, Surf, WaterHitLoc);
		// End:0xE5
		if(!bAISilent)
		{
			Instigator.MakeNoise(1.0000000);
		}
		return true;
		//return;		
	}

	function ApplyDamage(Actor Victim, int Damage, Pawn Instigator, Vector HitLocation, Vector MomentumDir, Class<DamageType> DamageType)
	{
		super(BallisticInstantFire).ApplyDamage(Victim, Damage, Instigator, HitLocation, MomentumDir, DamageType);
		// End:0xB1
		if(Victim.bProjTarget)
		{
			// End:0x7D
			if(BallisticShield(Victim) != none)
			{
				BW.TargetedHurtRadius(float(Damage), 192.0000000, Class'BWBP_SKC_Pro.DT_FG50Explosion', 500.0000000, HitLocation, Pawn(Victim));				
			}
			else
			{
				BW.TargetedHurtRadius(float(Damage), 512.0000000, Class'BWBP_SKC_Pro.DT_FG50Explosion', 500.0000000, HitLocation, Pawn(Victim));
			}
		}
		//return;		
	}

	simulated function InitEffects()
	{
		// End:0x1B
		if(AIController(Instigator.Controller) != none)
		{
			return;
		}
		// End:0x72
		if((Heater == none) || Heater.bDeleteMe)
		{
			Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(Heater, Class'BWBP_SKC_Pro.FG50Heater', Weapon.DrawScale * FlashScaleFactor, Weapon, 'tip3');
		}
		FG50Heater(Heater).SetHeat(0.0000000);
		FG50MachineGun(Weapon).Heater = FG50Heater(Heater);
		super(BallisticFire).InitEffects();
		//return;		
	}
	stop;	
}

simulated state Scope
{
	simulated function ApplyFireEffectParams(FireEffectParams effect_params)
	{
		super(BallisticFire).ApplyFireEffectParams(effect_params);
		bUseWeaponMag = false;
		bFireOnRelease = true;
		bModeExclusive = false;
		// End:0x34
		if(bFireOnRelease)
		{
			bWaitForRelease = true;
		}
		// End:0x45
		if(bWaitForRelease)
		{
			bNowWaiting = true;
		}
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
			if(!super(WeaponFire).AllowFire())
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

	simulated function PostBeginPlay()
	{
		// End:0x3C
		if((ThisModeNum == 0) && Weapon.AmmoClass[1] != none)
		{
			AmmoClass = Weapon.AmmoClass[1];			
		}
		else
		{
			// End:0x68
			if(Weapon.AmmoClass[0] != none)
			{
				AmmoClass = Weapon.AmmoClass[0];
			}
		}
		super(WeaponFire).PostBeginPlay();
		//return;		
	}

	simulated function bool CheckReloading()
	{
		// End:0x2F
		if(BW.bScopeView && int(BW.ReloadState) == int(8))
		{
			return true;
		}
		return super(BallisticFire).CheckReloading();
		//return;		
	}

	simulated event ModeDoFire()
	{
		// End:0x2E
		if(Instigator.IsLocallyControlled() && BW != none)
		{
			BW.ScopeViewRelease();
		}
		//return;		
	}

	simulated function PlayPreFire()
	{
		// End:0x6A
		if(Instigator.IsLocallyControlled() && BW != none)
		{
			BW.ScopeView();
			// End:0x6A
			if(!BW.bNoTweenToScope)
			{
				BW.TweenAnim(BW.IdleAnim, BW.SightingTime);
			}
		}
		//return;		
	}
	stop;	
}

simulated state Mount
{
	simulated function ApplyFireEffectParams(FireEffectParams effect_params)
	{
		super(BallisticFire).ApplyFireEffectParams(effect_params);
		bUseWeaponMag = false;
		BrassClass = none;
		//return;		
	}

	function PlayFiring()
	{
		// End:0x16
		if(BallisticTurret(Instigator) != none)
		{
			super(BallisticFire).PlayFiring();
		}
		//return;		
	}

	function ServerPlayFiring()
	{
		// End:0x35
		if(BallisticTurret(Instigator) != none)
		{
			BW.SafePlayAnim(FireAnim, FireAnimRate, TweenTime,, "FIRE");
		}
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
		// End:0x246
		if(int(Weapon.Role) == int(ROLE_Authority))
		{
			DoFireEffect();
			// End:0x1FB
			if((BallisticTurret(Instigator) == none) || Instigator.Controller == none)
			{
				return;
			}
			// End:0x237
			if(AIController(Instigator.Controller) != none)
			{
				AIController(Instigator.Controller).WeaponFireAgain(BotRefireRate, true);
			}
			Instigator.DeactivateSpawnProtection();
		}
		BW.LastFireTime = Level.TimeSeconds;
		// End:0x290
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
		// End:0x2DC
		if(bFireOnRelease)
		{
			// End:0x2BE
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
		// End:0x360
		if((Instigator.PendingWeapon != Weapon) && Instigator.PendingWeapon != none)
		{
			bIsFiring = false;
			Weapon.PutDown();
		}
		// End:0x3DA
		if(BW != none)
		{
			BW.bNeedReload = BW.MayNeedReload(byte(ThisModeNum), float(ConsumedLoad));
			// End:0x3DA
			if(bCockAfterFire || bCockAfterEmpty && (BW.MagAmmo - ConsumedLoad) < 1)
			{
				BW.bNeedCock = true;
			}
		}
		//return;		
	}

	function DoFireEffect()
	{
		// End:0x24
		if(BallisticTurret(Instigator) == none)
		{
			FG50MachineGun(Weapon).Notify_Deploy();
		}
		//return;		
	}

	simulated function bool AllowFire()
	{
		// End:0x2F
		if((BallisticTurret(Instigator) == none) && Instigator.HeadVolume.bWaterVolume)
		{
			return false;
		}
		return super(BallisticFire).AllowFire();
		//return;		
	}
	stop;	
}

defaultproperties
{
	SpecialFireSound=Sound'BWBP_SKC_Sounds.X82.X82-Fire2'
	TraceRange=(Min=15000.0000000,Max=15000.0000000)
	WallPenetrationForce=72.0000000
	Damage=65.0000000
	WaterRangeAtten=0.8000000
	DamageType=Class'BWBP_SKC_Pro.DT_FG50Torso'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_FG50Head'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_FG50Limb'
	KickForce=1000
	PenetrateForce=150
	PDamageFactor=0.8000000
	WallPDamageFactor=0.8000000
	BrassClass=Class'BWBP_SKC_Pro.Brass_BMGInc'
	BrassBone="tip"
	BrassOffset=(X=-80.0000000,Y=1.0000000,Z=0.0000000)
	bCockAfterEmpty=true
	DryFireSound=(Sound=Sound'BW_Core_WeaponSound.D49.D49-DryFire',Volume=0.7000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	MuzzleFlashClass=Class'BWBP_SKC_Pro.FG50FlashEmitter'
	FlashScaleFactor=1.5000000
	AimedFireAnim="SGCFireAimed"
	FireRecoil=512.0000000
	FirePushbackForce=125.0000000
	BallisticFireSound=(Sound=Sound'BWBP_SKC_Sounds.AS50.FG50-Fire',Volume=7.1000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	HeatPerShot=1.5000000
	bPawnRapidFireAnim=true
	FireAnim="CFire"
	FireEndAnim="None"
	FireAnimRate=2.4000000
	FireRate=0.1750000
	AmmoClass=Class'BWBP_SKC_Pro.Ammo_50IncDrum'
	ShakeRotMag=(X=512.0000000,Y=512.0000000,Z=0.0000000)
	ShakeRotRate=(X=20000.0000000,Y=20000.0000000,Z=20000.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-20.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-400.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	WarnTargetPct=0.6000000
	aimerror=900.0000000
}
