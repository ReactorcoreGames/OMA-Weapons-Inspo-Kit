class XMV850MinigunSecondaryFire extends BallisticFire;

function PlayFiring()
{
	// End:0x16
	if(BallisticTurret(Instigator) != none)
	{
		super.PlayFiring();
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
		XMV850Minigun(Weapon).Notify_Deploy();
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
	return super.AllowFire();
	//return;	
}

defaultproperties
{
	bUseWeaponMag=false
	bModeExclusive=false
	FireAnim="Undeploy"
	FireRate=0.7000000
	AmmoClass=Class'BallisticProV55.Ammo_MinigunRounds'
	AmmoPerFire=0
	BotRefireRate=0.3000000
}
