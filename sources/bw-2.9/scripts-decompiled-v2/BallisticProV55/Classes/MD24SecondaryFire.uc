class MD24SecondaryFire extends BallisticMeleeFire;

simulated function bool HasAmmo()
{
	return true;
	//return;	
}

function PlayPreFire()
{
	super(BallisticFire).PlayPreFire();
	MD24Pistol(Weapon).bStriking = true;
	//return;	
}

function PlayFiring()
{
	// End:0x22
	if(BW.MagAmmo == 0)
	{
		FireAnim = 'StabOpen';		
	}
	else
	{
		FireAnim = 'Stab';
	}
	super.PlayFiring();
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
		// End:0x4A
		if(int(BW.MeleeState) > int(1))
		{
			return false;
		}
		// End:0x72
		if((int(BW.ReloadState) == int(8)) && !bIgnoreCocking)
		{
			return false;
		}
		// End:0xA1
		if((int(BW.ReloadState) != int(0)) || BW.bServerReloading)
		{
			return false;
		}
		return true;
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
	SwipePoints[0]=(Weight=3,offset=(Pitch=2048,Yaw=2048,Roll=0))
	SwipePoints[1]=(Weight=1,offset=(Pitch=1000,Yaw=1000,Roll=0))
	SwipePoints[2]=(Weight=2,offset=(Pitch=0,Yaw=0,Roll=0))
	SwipePoints[3]=(Weight=1,offset=(Pitch=-1000,Yaw=-1000,Roll=0))
	SwipePoints[4]=(Weight=3,offset=(Pitch=-2048,Yaw=-2048,Roll=0))
	TraceRange=(Min=140.0000000,Max=140.0000000)
	Damage=70.0000000
	DamageType=Class'BallisticProV55.DTMD24Melee'
	DamageTypeHead=Class'BallisticProV55.DTMD24Melee'
	DamageTypeArm=Class'BallisticProV55.DTMD24Melee'
	KickForce=100
	HookStopFactor=1.7000000
	HookPullForce=100.0000000
	bIgnoreReload=true
	bUseWeaponMag=false
	ScopeDownOn=2
	bReleaseFireOnDie=false
	BallisticFireSound=(Sound=Sound'BW_Core_WeaponSound.MD24.MD24_Melee',Volume=0.5000000,Radius=12.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	bAISilent=true
	PreFireAnim="None"
	FireAnim="Stab"
	FireRate=0.2500000
	AmmoClass=Class'BallisticProV55.Ammo_MD24Clip'
	AmmoPerFire=0
	ShakeRotMag=(X=64.0000000,Y=128.0000000,Z=0.0000000)
	ShakeRotRate=(X=2500.0000000,Y=2500.0000000,Z=2500.0000000)
	ShakeRotTime=2.5000000
	BotRefireRate=0.8000000
	WarnTargetPct=0.0500000
}
