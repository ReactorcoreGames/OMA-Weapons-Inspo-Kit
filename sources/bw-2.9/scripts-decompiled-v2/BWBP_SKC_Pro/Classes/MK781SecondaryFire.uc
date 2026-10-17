class MK781SecondaryFire extends BallisticProShotgunFire;

var bool bLoaded;
var() Vector SpawnOffset;
var Projectile proj;

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
	// End:0x12C
	if((MK781Shotgun(BW).Grenades == 0) && !MK781Shotgun(BW).bReady)
	{
		// End:0xCA
		if(!bPlayedDryFire && DryFireSound.Sound != none)
		{
			Weapon.PlayOwnedSound(DryFireSound.Sound, DryFireSound.Slot, DryFireSound.Volume, DryFireSound.bNoOverride, DryFireSound.Radius, DryFireSound.Pitch, DryFireSound.bAtten);
			bPlayedDryFire = true;
		}
		// End:0xE4
		if(bDryUncock)
		{
			BW.bNeedCock = true;
		}
		BW.bNeedReload = BW.MayNeedReload(byte(ThisModeNum), 0.0000000);
		MK781Shotgun(BW).EmptyAltFire(byte(ThisModeNum));
		return false;
	}
	return true;
	//return;	
}

simulated event ModeDoFire()
{
	// End:0x0D
	if(!AllowFire())
	{
		return;
	}
	// End:0x3F
	if(!MK781Shotgun(Weapon).bReady)
	{
		MK781Shotgun(Weapon).PrepAltFire();
		return;		
	}
	else
	{
		super.ModeDoFire();
		MK781Shotgun(Weapon).bReady = false;
		MK781Shotgun(Weapon).PrepPriFire();
	}
	//return;	
}

simulated function SwitchSilencerMode(bool bSilenced)
{
	// End:0x79
	if(bSilenced == true)
	{
		// End:0x44
		if(MK781Attachment(Weapon.ThirdPersonActor) != none)
		{
			MK781Attachment(Weapon.ThirdPersonActor).bSilenced = true;
		}
		bLeadTarget = true;
		bInstantHit = false;
		GotoState('ElektroSlug');
		bSplashDamage = true;
		bRecommendSplashDamage = true;
		WarnTargetPct = 0.1000000;		
	}
	else
	{
		MK781Attachment(Weapon.ThirdPersonActor).bSilenced = false;
		ProjectileClass = none;
		bLeadTarget = false;
		bInstantHit = true;
		GotoState('ElektroShot');
		bSplashDamage = false;
		bRecommendSplashDamage = false;
		WarnTargetPct = 0.0100000;
	}
	//return;	
}

simulated state ElektroSlug
{
	simulated function ApplyFireEffectParams(FireEffectParams Params)
	{
		local ProjectileEffectParams effect_params;

		super(BallisticFire).ApplyFireEffectParams(Params);
		effect_params = ProjectileEffectParams(Params);
		ProjectileClass = effect_params.ProjectileClass;
		SpawnOffset = effect_params.SpawnOffset;
		default.ProjectileClass = effect_params.ProjectileClass;
		default.SpawnOffset = effect_params.SpawnOffset;
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
		local Vector StartTrace, X, Y, Z, Start, End,
			HitLocation, HitNormal;

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
		End = Start + (Vector(Aim) * (MaxRange()));
		Other = Trace(HitLocation, HitNormal, End, Start, true);
		// End:0x139
		if(Other != none)
		{
			Aim = Rotator(HitLocation - StartTrace);
		}
		SpawnProjectile(StartTrace, Aim);
		SendFireEffect(none, vect(0.0000000, 0.0000000, 0.0000000), StartTrace, 0);
		super(BallisticFire).DoFireEffect();
		//return;		
	}

	function SpawnProjectile(Vector Start, Rotator Dir)
	{
		proj = Spawn(ProjectileClass,,, Start, Dir);
		proj.Instigator = Instigator;
		//return;		
	}
	stop;	
}

simulated state ElektroShot
{
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

		// End:0x7F [Loop If]
		if(i < TraceCount)
		{
			R = Rotator((GetFireSpread()) >> Aim);
			DoTrace(StartTrace, R);
			i++;
			// [Loop Continue]
			goto J0x40;
		}
		// End:0xA7
		if(int(Level.NetMode) == int(NM_DedicatedServer))
		{
			BW.RestoreCollisions();
		}
		ApplyHits();
		SendFireEffect(none, Vector(Aim) * TraceRange.Max, StartTrace, 0);
		super(BallisticFire).DoFireEffect();
		//return;		
	}

	function NoHitEffect(Vector Dir, optional Vector Start, optional Vector HitLocation, optional Vector WaterHitLoc)
	{
		local Vector V;

		V = (Instigator.Location + Instigator.EyePosition()) + (Dir * TraceRange.Min);
		// End:0x109
		if(((((TracerClass != none) && int(Level.DetailMode) > int(0)) && int(Class'BCoreProV55.BallisticMod'.default.EffectsDetailMode) > 0) && VSize(V - BallisticAttachment(Weapon.ThirdPersonActor).GetModeTipLocation()) > float(200)) && FRand() < TracerChance)
		{
			Spawn(TracerClass, Instigator,, BallisticAttachment(Weapon.ThirdPersonActor).GetModeTipLocation(), Rotator(V - BallisticAttachment(Weapon.ThirdPersonActor).GetModeTipLocation()));
		}
		// End:0x195
		if((((ImpactManager != none) && WaterHitLoc != vect(0.0000000, 0.0000000, 0.0000000)) && Weapon.EffectIsRelevant(WaterHitLoc, false)) && bDoWaterSplash)
		{
			ImpactManager.static.StartSpawn(WaterHitLoc, Normal((Instigator.Location + Instigator.EyePosition()) - WaterHitLoc), 9, Instigator);
		}
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
		// End:0xB4
		if(!Other.bWorldGeometry && Mover(Other) == none)
		{
			return false;
		}
		// End:0xD0
		if(!bAISilent)
		{
			Instigator.MakeNoise(1.0000000);
		}
		// End:0x23E
		if((ImpactManager != none) && Weapon.EffectIsRelevant(HitLocation, false))
		{
			// End:0x110
			if(Vehicle(Other) != none)
			{
				Surf = 3;				
			}
			else
			{
				// End:0x134
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
			// End:0x23E
			if(((((TracerClass != none) && int(Level.DetailMode) > int(0)) && int(Class'BCoreProV55.BallisticMod'.default.EffectsDetailMode) > 0) && VSize(HitLocation - BallisticAttachment(Weapon.ThirdPersonActor).GetModeTipLocation()) > float(200)) && FRand() < TracerChance)
			{
				Spawn(TracerClass, Instigator,, BallisticAttachment(Weapon.ThirdPersonActor).GetModeTipLocation(), Rotator(HitLocation - BallisticAttachment(Weapon.ThirdPersonActor).GetModeTipLocation()));
			}
		}
		return true;
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

defaultproperties
{
	SpawnOffset=(X=20.0000000,Y=9.0000000,Z=-9.0000000)
	TraceCount=7
	TracerClass=Class'BWBP_SKC_Pro.TraceEmitter_Supercharge'
	ImpactManager=Class'BWBP_SKC_Pro.IM_Supercharge'
	TraceRange=(Min=2000.0000000,Max=4000.0000000)
	DamageType=Class'BWBP_SKC_Pro.DT_Mk781Electro'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_Mk781Electro'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_Mk781Electro'
	KickForce=700
	PenetrateForce=100
	bPenetrate=true
	BrassClass=Class'BWBP_SKC_Pro.Brass_ShotgunZap'
	BrassOffset=(X=-1.0000000,Y=0.0000000,Z=-1.0000000)
	bUseWeaponMag=false
	MuzzleFlashClass=Class'BWBP_SKC_Pro.PlasmaFlashEmitter'
	FlashScaleFactor=2.0000000
	AimedFireAnim="SightFire"
	FireRecoil=768.0000000
	FirePushbackForce=180.0000000
	XInaccuracy=150.0000000
	YInaccuracy=150.0000000
	BallisticFireSound=(Sound=Sound'BWBP_SKC_Sounds.HyperBeamCannon.343Primary-Hit',Volume=1.6000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	FireEndAnim="None"
	FireRate=0.8000000
	AmmoClass=Class'BWBP_SKC_Pro.Ammo_10GaugeZap'
	AmmoPerFire=0
	ShakeRotMag=(X=128.0000000,Y=64.0000000,Z=0.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-12.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	ProjectileClass=Class'BWBP_SKC_Pro.MK781PulseProjectile'
	BotRefireRate=0.4000000
	WarnTargetPct=0.5000000
	aimerror=400.0000000
}
