class M925TW_PrimaryFire extends M925PrimaryFire;

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
	// End:0x2AF
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
		// End:0x2AF
		if((Instigator != none) && Class'BallisticProV55.Mut_Ballistic'.static.GetBPRI(Instigator.PlayerReplicationInfo) != none)
		{
			Class'BallisticProV55.Mut_Ballistic'.static.GetBPRI(Instigator.PlayerReplicationInfo).AddFireStat(int(load), int(BW.InventoryGroup));
		}
	}
	BW.LastFireTime = Level.TimeSeconds;
	// End:0x2F9
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
	// End:0x345
	if(bFireOnRelease)
	{
		// End:0x327
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
		// End:0x3F6
		if(bBurstMode)
		{
			BurstCount++;
			// End:0x3C5
			if(BurstCount >= MaxBurst)
			{
				NextFireTime += (FireRate * (float(1) + (float(MaxBurst) * (1.0000000 - BurstFireRateFactor))));
				NextFireTime = FMax(NextFireTime, Level.TimeSeconds);
				Weapon.StopFire(ThisModeNum);
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
	// End:0x47A
	if((Instigator.PendingWeapon != Weapon) && Instigator.PendingWeapon != none)
	{
		bIsFiring = false;
		Weapon.PutDown();
	}
	// End:0x4F4
	if(BW != none)
	{
		BW.bNeedReload = BW.MayNeedReload(byte(ThisModeNum), float(ConsumedLoad));
		// End:0x4F4
		if(bCockAfterFire || bCockAfterEmpty && (BW.MagAmmo - ConsumedLoad) < 1)
		{
			BW.bNeedCock = true;
		}
	}
	//return;	
}

defaultproperties
{
	DamageType=Class'BallisticProV55.DTM925MGDeploy'
	DamageTypeHead=Class'BallisticProV55.DTM925MGDeployHead'
	DamageTypeArm=Class'BallisticProV55.DTM925MGDeploy'
	FireRecoil=250.0000000
	FirePushbackForce=0.0000000
	FireRate=0.1450000
	aimerror=0.0000000
}
