class G51SecondaryFire extends BallisticProjectileFire;

var bool bLoaded;

simulated function bool CheckGrenade()
{
	local int Channel;
	local name seq;
	local float frame, Rate;

	// End:0x79
	if(!G51Carbine(Weapon).bLoaded)
	{
		Weapon.GetAnimParams(Channel, seq, frame, Rate);
		// End:0x5B
		if(seq == G51Carbine(Weapon).GrenadeLoadAnim)
		{
			return false;
		}
		G51Carbine(Weapon).LoadGrenade();
		bIsFiring = false;
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
	// End:0x1A
	if(!CheckGrenade())
	{
		return;
	}
	super(BallisticFire).ModeDoFire();
	G51Carbine(Weapon).bLoaded = false;
	//return;	
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
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	MuzzleFlashClass=Class'BWBP_SKC_Pro.G51AltFlashEmitter'
	BallisticFireSound=(Sound=Sound'BWBP_SKC_Sounds.MJ51.MJ51Carbine-GrenLaunch',Volume=2.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	bSplashDamage=true
	bRecommendSplashDamage=true
	bTossed=true
	FireAnim="FireGrenade"
	FireForce="AssaultRifleAltFire"
	FireRate=0.6000000
	AmmoClass=Class'BWBP_SKC_Pro.Ammo_G51Grenades'
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-8.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	ProjectileClass=Class'BWBP_SKC_Pro.G51Grenade_Chaff'
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
}
