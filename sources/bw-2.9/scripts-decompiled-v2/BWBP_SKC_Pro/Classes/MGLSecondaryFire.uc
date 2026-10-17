class MGLSecondaryFire extends BallisticProProjectileFire;

var MGLGrenadeRemote LastGrenade;
var float DetonationInterval;

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
		if(!super(BallisticFire).AllowFire())
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
		// End:0x1C0
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
			// End:0x1A5
			if(MGLauncher(BW).bRemoteGrenadeOut)
			{
				return true;				
			}
			else
			{
				BW.EmptyFire(byte(ThisModeNum));
			}
			return false;			
		}
		else
		{
			// End:0x1D7
			if(BW.bNeedReload)
			{
				return false;				
			}
			else
			{
				// End:0x1EB
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

simulated event ModeDoFire()
{
	// End:0xED
	if(MGLauncher(BW).bRemoteGrenadeOut)
	{
		// End:0x80
		if(int(Weapon.Role) == int(ROLE_Authority))
		{
			// End:0x4A
			if(LastGrenade != none)
			{
				LastGrenade.RemoteDetonate();
			}
			// End:0x80
			if((LastGrenade == none) || LastGrenade.IsInState('NetTrapped'))
			{
				MGLauncher(BW).UpdateGrenadeStatus(false);
			}
		}
		BW.LastFireTime = Level.TimeSeconds;
		NextFireTime += FMax(0.1000000, FireRate - (Level.TimeSeconds - BW.LastFireTime));
		NextFireTime = FMax(NextFireTime, Level.TimeSeconds);
		return;
	}
	// End:0xFA
	if(!AllowFire())
	{
		return;
	}
	// End:0x1DC
	if(bIsJammed)
	{
		// End:0x1B0
		if(BW.FireCount == 0)
		{
			bIsJammed = false;
			// End:0x157
			if(bJamWastesAmmo && int(Weapon.Role) == int(ROLE_Authority))
			{
				ConsumedLoad += int(load);
				Timer();
			}
			// End:0x1A0
			if(int(UnjamMethod) == int(3))
			{
				NextFireTime += FireRate;
				NextFireTime = FMax(NextFireTime, Level.TimeSeconds);
				BW.FireCount++;
				return;
			}
			// End:0x1AD
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
	else
	{
		// End:0x25C
		if(BW != none)
		{
			BW.bPreventReload = true;
			BW.FireCount++;
			// End:0x25C
			if(int(BW.ReloadState) != int(0))
			{
				// End:0x24B
				if(int(Weapon.Role) == int(ROLE_Authority))
				{
					BW.bServerReloading = false;
				}
				BW.ReloadState = 0;
			}
		}
		// End:0x27D
		if(MaxHoldTime > 0.0000000)
		{
			HoldTime = FMin(HoldTime, MaxHoldTime);
		}
		ConsumedLoad += int(load);
		SetTimer(FMin(0.1000000, FireRate / float(2)), false);
		// End:0x331
		if(int(Weapon.Role) == int(ROLE_Authority))
		{
			DoFireEffect();
			// End:0x2E6
			if((Instigator == none) || Instigator.Controller == none)
			{
				return;
			}
			// End:0x322
			if(AIController(Instigator.Controller) != none)
			{
				AIController(Instigator.Controller).WeaponFireAgain(BotRefireRate, true);
			}
			Instigator.DeactivateSpawnProtection();
		}
		BW.LastFireTime = Level.TimeSeconds;
		// End:0x37B
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
		// End:0x3C7
		if(bFireOnRelease)
		{
			// End:0x3A9
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
			NextFireTime += DetonationInterval;
			NextFireTime = FMax(NextFireTime, Level.TimeSeconds);
		}
		load = float(AmmoPerFire);
		HoldTime = 0.0000000;
		// End:0x44B
		if((Instigator.PendingWeapon != Weapon) && Instigator.PendingWeapon != none)
		{
			bIsFiring = false;
			Weapon.PutDown();
		}
		// End:0x4C5
		if(BW != none)
		{
			BW.bNeedReload = BW.MayNeedReload(byte(ThisModeNum), float(ConsumedLoad));
			// End:0x4C5
			if(bCockAfterFire || bCockAfterEmpty && (BW.MagAmmo - ConsumedLoad) < 1)
			{
				BW.bNeedCock = true;
			}
		}
	}
	//return;	
}

function SpawnProjectile(Vector Start, Rotator Dir)
{
	proj = Spawn(ProjectileClass,,, Start, Dir);
	proj.Instigator = Instigator;
	LastGrenade = MGLGrenadeRemote(proj);
	MGLauncher(BW).UpdateGrenadeStatus(true);
	//return;	
}

defaultproperties
{
	DetonationInterval=0.1000000
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	MuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
	AimedFireAnim="SightFire"
	FireRecoil=768.0000000
	FireChaos=0.6500000
	BallisticFireSound=(Sound=Sound'BWBP_SKC_Sounds.MGL.MGL-Fire',Volume=9.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	bSplashDamage=true
	bRecommendSplashDamage=true
	bTossed=true
	bWaitForRelease=true
	FireForce="AssaultRifleAltFire"
	AmmoClass=Class'BWBP_SKC_Pro.Ammo_MGL'
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-8.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	ProjectileClass=Class'BWBP_SKC_Pro.MGLGrenadeRemote'
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
}
