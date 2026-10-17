class AkeronSecondaryFire extends BallisticProProjectileFire;

var FullSound LockOffSound;

simulated function bool AllowFire()
{
	// End:0x1B
	if(AIController(Instigator.Controller) != none)
	{
		return false;
	}
	return super(BallisticFire).AllowFire();
	//return;	
}

function SpawnProjectile(Vector Start, Rotator Dir)
{
	local AkeronWarhead Warhead;
	local PlayerController Possessor;
	local Class<AkeronWarhead> WarheadClass;

	// End:0x25
	if(int(BW.CurrentWeaponMode) == 2)
	{
		WarheadClass = Class'BWBP_OP_Pro.AkeronWarheadHEBurst';		
	}
	else
	{
		// End:0x49
		if(int(BW.CurrentWeaponMode) == 1)
		{
			WarheadClass = Class'BWBP_OP_Pro.AkeronWarheadFast';			
		}
		else
		{
			WarheadClass = Class'BWBP_OP_Pro.AkeronWarhead';
		}
	}
	Warhead = Weapon.Spawn(WarheadClass, Instigator,, Start, Dir);
	// End:0xB6
	if(Warhead == none)
	{
		Warhead = Weapon.Spawn(WarheadClass, Instigator,, Instigator.Location, Dir);
	}
	// End:0x23B
	if(Warhead != none)
	{
		AkeronLauncher(BW).ActiveWarhead = Warhead;
		Warhead.OldPawn = Instigator;
		Warhead.PlaySound(BallisticFireSound.Sound);
		Possessor = PlayerController(Instigator.Controller);
		Possessor.bAltFire = 0;
		// End:0x1B0
		if(Possessor != none)
		{
			// End:0x15F
			if(Instigator.InCurrentCombo())
			{
				Possessor.Adrenaline = 0.0000000;
			}
			Possessor.UnPossess();
			Instigator.SetOwner(Possessor);
			Instigator.PlayerReplicationInfo = Possessor.PlayerReplicationInfo;
			Possessor.Possess(Warhead);
		}
		Warhead.Velocity = Warhead.AirSpeed * Vector(Warhead.Rotation);
		Warhead.Acceleration = Warhead.Velocity;
		Warhead.MyTeam = Possessor.PlayerReplicationInfo.Team;
		Warhead.Master = AkeronLauncher(BW);
	}
	bIsFiring = false;
	StopFiring();
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
	// End:0x15B
	if(BW != none)
	{
		BW.FireCount++;
		// End:0x15B
		if(int(BW.ReloadState) != int(0))
		{
			// End:0x14A
			if(int(Weapon.Role) == int(ROLE_Authority))
			{
				BW.bServerReloading = false;
			}
			BW.ReloadState = 0;
		}
	}
	// End:0x17C
	if(MaxHoldTime > 0.0000000)
	{
		HoldTime = FMin(HoldTime, MaxHoldTime);
	}
	ConsumedLoad += int(load);
	SetTimer(FMin(0.1000000, FireRate / float(2)), false);
	// End:0x2C8
	if(int(Weapon.Role) == int(ROLE_Authority))
	{
		DoFireEffect();
		// End:0x1E5
		if((Instigator == none) || Instigator.Controller == none)
		{
			return;
		}
		// End:0x221
		if(AIController(Instigator.Controller) != none)
		{
			AIController(Instigator.Controller).WeaponFireAgain(BotRefireRate, true);
		}
		Instigator.DeactivateSpawnProtection();
		// End:0x2C8
		if((BallisticTurret(Weapon.Owner) == none) && Class'BallisticProV55.Mut_Ballistic'.static.GetBPRI(xPawn(Weapon.Owner).PlayerReplicationInfo) != none)
		{
			Class'BallisticProV55.Mut_Ballistic'.static.GetBPRI(xPawn(Weapon.Owner).PlayerReplicationInfo).AddFireStat(int(load), int(BW.InventoryGroup));
		}
	}
	// End:0x2F0
	if(!BW.bScopeView)
	{
		BW.AddFireChaos(FireChaos);
	}
	// End:0x31D
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
	// End:0x369
	if(bFireOnRelease)
	{
		// End:0x34B
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
		// End:0x3FF
		if(bBurstMode)
		{
			BurstCount++;
			// End:0x3CE
			if(BurstCount >= MaxBurst)
			{
				NextFireTime += (FireRate * (float(1) + (float(MaxBurst) * 0.2500000)));
				NextFireTime = FMax(NextFireTime, Level.TimeSeconds);
				BurstCount = 0;				
			}
			else
			{
				NextFireTime += (FireRate * 0.7500000);
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
	// End:0x483
	if((Instigator.PendingWeapon != Weapon) && Instigator.PendingWeapon != none)
	{
		bIsFiring = false;
		Weapon.PutDown();
	}
	// End:0x4BB
	if(BW != none)
	{
		BW.bNeedReload = BW.MayNeedReload(byte(ThisModeNum), float(ConsumedLoad));
	}
	//return;	
}

defaultproperties
{
	LockOffSound=(Sound=Sound'BW_Core_WeaponSound.G5.G5-TargetOff',Volume=0.5000000,Radius=128.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	SpawnOffset=(X=50.0000000,Y=10.0000000,Z=-3.0000000)
	MuzzleFlashClass=Class'BallisticProV55.G5FlashEmitter'
	FireRecoil=64.0000000
	FireChaos=0.5000000
	BallisticFireSound=(Sound=Sound'BW_Core_WeaponSound.G5.G5-Fire1',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	bSplashDamage=true
	bRecommendSplashDamage=true
	bWaitForRelease=true
	FireEndAnim="None"
	FireRate=0.8000000
	AmmoClass=Class'BWBP_OP_Pro.Ammo_Akeron'
	ShakeRotMag=(X=128.0000000,Y=64.0000000,Z=16.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=2.5000000
	ShakeOffsetMag=(X=-8.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.5000000
	ProjectileClass=Class'BWBP_OP_Pro.AkeronRocket'
	BotRefireRate=0.5000000
	WarnTargetPct=0.3000000
}
