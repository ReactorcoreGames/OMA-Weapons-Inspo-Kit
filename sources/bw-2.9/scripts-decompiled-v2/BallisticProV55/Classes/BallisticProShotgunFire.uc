class BallisticProShotgunFire extends BallisticShotgunFire;

var float HipSpreadFactor;
var int MaxSpreadFactor;

simulated function ApplyFireEffectParams(FireEffectParams Params)
{
	local ShotgunEffectParams effect_params;

	super.ApplyFireEffectParams(Params);
	effect_params = ShotgunEffectParams(Params);
	HipSpreadFactor = effect_params.HipSpreadFactor;
	//return;	
}

simulated function float GetCrosshairInaccAngle()
{
	return YInaccuracy * HipSpreadFactor;
	//return;	
}

simulated function Vector GetFireSpread()
{
	local float fX;
	local Rotator R;

	// End:0x30
	if(BW.bScopeView || BW.bAimDisabled)
	{
		return super(BallisticFire).GetFireSpread();		
	}
	else
	{
		fX = FRand();
		R.Yaw = int((float(GetXInaccuracy()) * Sin(((FRand() * float(2)) - float(1)) * 1.5707960)) * Sin(fX * 1.5707960));
		R.Pitch = int((float(GetYInaccuracy()) * Sin(((FRand() * float(2)) - float(1)) * 1.5707960)) * Cos(fX * 1.5707960));
		return Vector(R);
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
	// End:0x2D7
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
		// End:0x2D7
		if((BallisticTurret(Weapon.Owner) == none) && Class'BallisticProV55.Mut_Ballistic'.static.GetBPRI(xPawn(Weapon.Owner).PlayerReplicationInfo) != none)
		{
			Class'BallisticProV55.Mut_Ballistic'.static.GetBPRI(xPawn(Weapon.Owner).PlayerReplicationInfo).AddFireStat(TraceCount, int(BW.InventoryGroup));
		}
	}
	// End:0x2FF
	if(!BW.bScopeView)
	{
		BW.AddFireChaos(FireChaos);
	}
	BW.LastFireTime = Level.TimeSeconds;
	// End:0x349
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
	// End:0x395
	if(bFireOnRelease)
	{
		// End:0x377
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
	// End:0x419
	if((Instigator.PendingWeapon != Weapon) && Instigator.PendingWeapon != none)
	{
		bIsFiring = false;
		Weapon.PutDown();
	}
	// End:0x493
	if(BW != none)
	{
		BW.bNeedReload = BW.MayNeedReload(byte(ThisModeNum), float(ConsumedLoad));
		// End:0x493
		if(bCockAfterFire || bCockAfterEmpty && (BW.MagAmmo - ConsumedLoad) < 1)
		{
			BW.bNeedCock = true;
		}
	}
	//return;	
}

function int GetXInaccuracy()
{
	// End:0x19
	if(BW.bScopeView)
	{
		return super.GetXInaccuracy();
	}
	return int((XInaccuracy * HipSpreadFactor) * Lerp(BW.GetFireChaos(), 1.0000000, float(MaxSpreadFactor)));
	//return;	
}

function int GetYInaccuracy()
{
	// End:0x19
	if(BW.bScopeView)
	{
		return super.GetYInaccuracy();
	}
	return int((YInaccuracy * HipSpreadFactor) * Lerp(BW.GetFireChaos(), 1.0000000, float(MaxSpreadFactor)));
	//return;	
}

defaultproperties
{
	HipSpreadFactor=2.0000000
	MaxSpreadFactor=1
	FireSpreadMode=2
}
