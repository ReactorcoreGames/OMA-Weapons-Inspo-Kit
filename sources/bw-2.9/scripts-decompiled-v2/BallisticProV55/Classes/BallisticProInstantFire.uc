class BallisticProInstantFire extends BallisticInstantFire;

var bool bNoRandomFire;

simulated function Vector GetFireSpread()
{
	local float fX;
	local Rotator R;

	// End:0x38
	if((BW.bScopeView || bNoRandomFire) || Class'BCoreProV55.BallisticReplicationInfo'.static.IsClassicOrRealism())
	{
		return super(BallisticFire).GetFireSpread();
	}
	fX = FRand();
	R.Yaw = int((BallisticWeapon(Weapon).GetConeInaccuracy() * Sin(FMin(Sqrt(FRand()), 1.0000000) * 1.5707960)) * Sin(fX * 1.5707960));
	// End:0xAA
	if(FRand() > 0.5000000)
	{
		R.Yaw = -R.Yaw;
	}
	R.Pitch = int((BallisticWeapon(Weapon).GetConeInaccuracy() * Sin(FMin(Sqrt(FRand()), 1.0000000) * 1.5707960)) * Cos(fX * 1.5707960));
	// End:0x114
	if(FRand() > 0.5000000)
	{
		R.Pitch = -R.Pitch;
	}
	return Vector(R);
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
	// End:0x2D9
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
		// End:0x2D9
		if((BallisticTurret(Weapon.Owner) == none) && Class'BallisticProV55.Mut_Ballistic'.static.GetBPRI(xPawn(Weapon.Owner).PlayerReplicationInfo) != none)
		{
			Class'BallisticProV55.Mut_Ballistic'.static.GetBPRI(xPawn(Weapon.Owner).PlayerReplicationInfo).AddFireStat(int(load), int(BW.InventoryGroup));
		}
	}
	// End:0x31D
	if(!BW.bScopeView)
	{
		BW.AddFireChaos(FireChaos * InterpCurveEval(FireChaosCurve, BW.GetFireChaos()));
	}
	BW.LastFireTime = Level.TimeSeconds;
	// End:0x367
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
	// End:0x3B3
	if(bFireOnRelease)
	{
		// End:0x395
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
		// End:0x450
		if(bBurstMode)
		{
			BurstCount++;
			// End:0x41F
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
	// End:0x4FC
	if(((BallisticHandgun(Weapon) != none) && BallisticHandgun(Weapon).OtherGun != none) && BallisticHandgun(Weapon).CanSynch(byte(ThisModeNum)))
	{
		BallisticHandgun(BW).OtherGun.ForceFire(ThisModeNum);
	}
	// End:0x541
	if((Instigator.PendingWeapon != Weapon) && Instigator.PendingWeapon != none)
	{
		bIsFiring = false;
		Weapon.PutDown();
	}
	// End:0x5BB
	if(BW != none)
	{
		BW.bNeedReload = BW.MayNeedReload(byte(ThisModeNum), float(ConsumedLoad));
		// End:0x5BB
		if(bCockAfterFire || bCockAfterEmpty && (BW.MagAmmo - ConsumedLoad) < 1)
		{
			BW.bNeedCock = true;
		}
	}
	//return;	
}

defaultproperties
{
	FireChaos=0.1000000
}
