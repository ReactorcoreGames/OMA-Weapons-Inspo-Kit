class M806SecondaryFire extends BallisticProShotgunFire;

simulated function ApplyFireEffectParams(FireEffectParams effect_params)
{
	super(BallisticFire).ApplyFireEffectParams(effect_params);
	//return;	
}

event ModeDoFire()
{
	// End:0x43
	if(int(Weapon.Role) == int(ROLE_Authority))
	{
		M806Pistol(Weapon).ServerSwitchLaser(!M806Pistol(Weapon).bLaserOn);
	}
	//return;	
}

state Shotgun
{
	simulated function ApplyFireEffectParams(FireEffectParams Params)
	{
		local ShotgunEffectParams effect_params;

		super(BallisticProShotgunFire).ApplyFireEffectParams(Params);
		effect_params = ShotgunEffectParams(Params);
		TraceCount = effect_params.TraceCount;
		TracerClass = effect_params.TracerClass;
		ImpactManager = effect_params.ImpactManager;
		MaxHits = effect_params.MaxHits;
		default.TraceCount = effect_params.TraceCount;
		default.TracerClass = effect_params.TracerClass;
		default.ImpactManager = effect_params.ImpactManager;
		default.MaxHits = effect_params.MaxHits;
		//return;		
	}

	event ModeDoFire()
	{
		super(BallisticProShotgunFire).ModeDoFire();
		//return;		
	}

	simulated function bool AllowFire()
	{
		// End:0x0D
		if(!CheckReloading())
		{
			return false;
		}
		// End:0xE5
		if(M806Pistol(BW).AltAmmo < 1)
		{
			// End:0xA2
			if(!bPlayedDryFire && DryFireSound.Sound != none)
			{
				Weapon.PlayOwnedSound(DryFireSound.Sound, DryFireSound.Slot, DryFireSound.Volume, DryFireSound.bNoOverride, DryFireSound.Radius, DryFireSound.Pitch, DryFireSound.bAtten);
				bPlayedDryFire = true;
			}
			BW.bNeedReload = BW.MayNeedReload(byte(ThisModeNum), 0.0000000);
			BW.EmptyFire(byte(ThisModeNum));
			return false;
		}
		return true;
		//return;		
	}

	function PlayFiring()
	{
		// End:0xAA
		if((BW.MagAmmo - ConsumedLoad) < 1)
		{
			BW.IdleAnim = 'OpenIdle';
			BW.ReloadAnim = 'OpenReload';
			AimedFireAnim = 'SightFireAltOpen';
			FireAnim = 'FireAltOpen';
			// End:0x8E
			if(M806Pistol(BW).AltAmmo < 1)
			{
				M806Pistol(BW).ReloadAltAnim = 'ReloadAltOpen';				
			}
			else
			{
				M806Pistol(BW).ReloadAltAnim = 'ReloadAlt2Open';
			}			
		}
		else
		{
			BW.IdleAnim = 'Idle';
			BW.ReloadAnim = 'Reload';
			AimedFireAnim = 'SightFireAlt';
			FireAnim = 'FireAlt';
			// End:0x11D
			if(M806Pistol(BW).AltAmmo < 1)
			{
				M806Pistol(BW).ReloadAltAnim = 'ReloadAlt';				
			}
			else
			{
				M806Pistol(BW).ReloadAltAnim = 'ReloadAlt2';
			}
		}
		// End:0x15F
		if(int(ScopeDownOn) == int(1))
		{
			BW.TemporaryScopeDown(0.5000000, 0.9000000);
		}
		// End:0x1D2
		if(AimedFireAnim != 'None')
		{
			BW.SafePlayAnim(FireAnim, FireAnimRate, TweenTime,, "FIRE");
			// End:0x1CF
			if(BW.BlendFire())
			{
				BW.SafePlayAnim(AimedFireAnim, FireAnimRate, TweenTime, 1, "AIMEDFIRE");
			}			
		}
		else
		{
			// End:0x21B
			if((FireCount > 0) && Weapon.HasAnim(FireLoopAnim))
			{
				BW.SafePlayAnim(FireLoopAnim, FireLoopAnimRate, 0.0000000,, "FIRE");				
			}
			else
			{
				BW.SafePlayAnim(FireAnim, FireAnimRate, TweenTime,, "FIRE");
			}
		}
		ClientPlayForceFeedback(FireForce);
		FireCount++;
		// End:0x29A
		if(BallisticFireSound.Sound != none)
		{
			Weapon.PlayOwnedSound(BallisticFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume,, BallisticFireSound.Radius);
		}
		CheckClipFinished();
		//return;		
	}

	function DoFireEffect()
	{
		super(BallisticShotgunFire).DoFireEffect();
		M806Pistol(BW).AltAmmo--;
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
	TraceCount=9
	TracerClass=Class'BallisticProV55.TraceEmitter_Shotgun'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	TraceRange=(Min=5000.0000000,Max=5000.0000000)
	DecayRange=(Min=1024.0000000,Max=1536.0000000)
	Damage=4.0000000
	RangeAtten=0.7500000
	DamageType=Class'BallisticProV55.DTM806Shotgun'
	DamageTypeHead=Class'BallisticProV55.DTM806ShotgunHead'
	DamageTypeArm=Class'BallisticProV55.DTM806Shotgun'
	KickForce=400
	PenetrateForce=100
	bPenetrate=true
	FlashBone="tip3"
	BrassClass=Class'BallisticProV55.Brass_Shotgun'
	bBrassOnCock=true
	BrassOffset=(X=-30.0000000,Y=-5.0000000,Z=5.0000000)
	bUseWeaponMag=false
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	FireRecoil=512.0000000
	FirePushbackForce=150.0000000
	FireChaos=0.5000000
	XInaccuracy=350.0000000
	YInaccuracy=350.0000000
	BallisticFireSound=(Sound=Sound'BWBP_SKC_Sounds.CYLO.CYLO-FireSG',Volume=1.3000000,Radius=256.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	JamSound=(Sound=Sound'BW_Core_WeaponSound.Misc.ClipEnd-1',Volume=0.9000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	bWaitForRelease=true
	bModeExclusive=false
	FireAnim="FireSG"
	FireEndAnim="None"
	FireRate=0.2000000
	AmmoClass=Class'BallisticProV55.Ammo_45HV'
	AmmoPerFire=0
	ShakeRotMag=(X=128.0000000,Y=64.0000000,Z=0.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-30.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	BotRefireRate=0.7000000
	WarnTargetPct=0.5000000
}
