class LS14SecondaryFire extends BallisticProProjectileFire;

var() int ProjPerFire;
var bool bLoaded;

simulated function bool AllowFire()
{
	// End:0x26
	if(LS14Carbine(Weapon).bOverloaded || !super(BallisticFire).AllowFire())
	{
		return false;
	}
	// End:0xFE
	if(LS14Carbine(Weapon).Rockets < 1)
	{
		// End:0xBB
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

simulated event ModeDoFire()
{
	// End:0x0D
	if(!AllowFire())
	{
		return;
	}
	super.ModeDoFire();
	LS14Carbine(Weapon).Rockets--;
	LS14Carbine(Weapon).UpdateGLIndicator();
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
	bLoaded=true
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	FlashBone="tip3"
	bUseWeaponMag=false
	MuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
	FlashScaleFactor=2.6000000
	FireRecoil=256.0000000
	BallisticFireSound=(Sound=Sound'BWBP_SKC_Sounds.LS14.Rocket-Launch',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	bSplashDamage=true
	bRecommendSplashDamage=true
	bTossed=true
	PreFireAnim="GrenadePrepFire"
	FireAnim="RLFire"
	FireForce="AssaultRifleAltFire"
	FireRate=0.6000000
	AmmoClass=Class'BWBP_SKC_Pro.Ammo_LS14Rocket'
	AmmoPerFire=0
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-8.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	ProjectileClass=Class'BWBP_SKC_Pro.LS14Rocket'
	BotRefireRate=0.6000000
	WarnTargetPct=0.3000000
	SpreadStyle=1
}
