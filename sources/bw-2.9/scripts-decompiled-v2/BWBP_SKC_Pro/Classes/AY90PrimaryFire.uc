class AY90PrimaryFire extends BallisticProjectileFire;

var() byte OverrideMode;
var() float ChargeTime;
var() Sound ChargeSound;
var() float AutoFireTime;
var bool b100Charge;
var bool b75Charge;
var bool b50Charge;
var bool b25Charge;
var() Sound ChargeFireSound;
var() Sound MaxChargeFireSound;

simulated function bool AllowFire()
{
	// End:0x2A
	if(super(BallisticFire).AllowFire() && AY90SkrithBoltcaster(BW).MagAmmo >= 10)
	{
		return true;		
	}
	else
	{
		return false;
	}
	//return;	
}

simulated function PlayPreFire()
{
	Weapon.AmbientSound = ChargeSound;
	BW.SafeLoopAnim('PreFire', 0.1500000, TweenTime,, "IDLE");
	//return;	
}

function ModeHoldFire()
{
	// End:0x30
	if(BW.HasMagAmmo(byte(ThisModeNum)))
	{
		super(WeaponFire).ModeHoldFire();
		BW.bPreventReload = true;
	}
	//return;	
}

simulated event ModeDoFire()
{
	// End:0x88
	if((HoldTime >= ChargeTime) && AY90SkrithBoltcaster(BW).MagAmmo >= 40)
	{
		AY90SkrithBoltcaster(BW).ParamsClasses[int(AY90SkrithBoltcaster(BW).GameStyleIndex)].static.OverrideFireParams(AY90SkrithBoltcaster(BW), 2);
		OverrideMode = 2;
		AmmoPerFire = 40;
		load = 40.0000000;		
	}
	else
	{
		// End:0x115
		if((HoldTime >= (ChargeTime / float(2))) && AY90SkrithBoltcaster(BW).MagAmmo >= 20)
		{
			AY90SkrithBoltcaster(BW).ParamsClasses[int(AY90SkrithBoltcaster(BW).GameStyleIndex)].static.OverrideFireParams(AY90SkrithBoltcaster(BW), 1);
			OverrideMode = 1;
			AmmoPerFire = 20;
			load = 20.0000000;			
		}
		else
		{
			AY90SkrithBoltcaster(BW).ParamsClasses[int(AY90SkrithBoltcaster(BW).GameStyleIndex)].static.OverrideFireParams(AY90SkrithBoltcaster(BW), 0);
			OverrideMode = 0;
			AmmoPerFire = 10;
			load = 10.0000000;
		}
	}
	Weapon.AmbientSound = Weapon.default.AmbientSound;
	b100Charge = false;
	b75Charge = false;
	b50Charge = false;
	b25Charge = false;
	// End:0x1B8
	if(!AllowFire())
	{
		return;
	}
	// End:0x297
	if(bIsJammed)
	{
		// End:0x26E
		if(BW.FireCount == 0)
		{
			bIsJammed = false;
			// End:0x215
			if(bJamWastesAmmo && int(Weapon.Role) == int(ROLE_Authority))
			{
				ConsumedLoad += int(load);
				Timer();
			}
			// End:0x25E
			if(int(UnjamMethod) == int(3))
			{
				NextFireTime += FireRate;
				NextFireTime = FMax(NextFireTime, Level.TimeSeconds);
				BW.FireCount++;
				return;
			}
			// End:0x26B
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
	// End:0x317
	if(BW != none)
	{
		BW.bPreventReload = true;
		BW.FireCount++;
		// End:0x317
		if(int(BW.ReloadState) != int(0))
		{
			// End:0x306
			if(int(Weapon.Role) == int(ROLE_Authority))
			{
				BW.bServerReloading = false;
			}
			BW.ReloadState = 0;
		}
	}
	// End:0x338
	if(MaxHoldTime > 0.0000000)
	{
		HoldTime = FMin(HoldTime, MaxHoldTime);
	}
	ConsumedLoad += int(load);
	SetTimer(FMin(0.1000000, FireRate / float(2)), false);
	// End:0x3EC
	if(int(Weapon.Role) == int(ROLE_Authority))
	{
		DoFireEffect();
		// End:0x3A1
		if((Instigator == none) || Instigator.Controller == none)
		{
			return;
		}
		// End:0x3DD
		if(AIController(Instigator.Controller) != none)
		{
			AIController(Instigator.Controller).WeaponFireAgain(BotRefireRate, true);
		}
		Instigator.DeactivateSpawnProtection();
	}
	BW.LastFireTime = Level.TimeSeconds;
	// End:0x44A
	if(Instigator.IsLocallyControlled())
	{
		ShakeView();
		PlayFiring();
		FlashMuzzleFlash();
		StartMuzzleSmoke();
		AY90SkrithBoltcaster(BW).UpdateScreen();		
	}
	else
	{
		ServerPlayFiring();
	}
	// End:0x496
	if(bFireOnRelease)
	{
		// End:0x478
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
		// End:0x533
		if(bBurstMode)
		{
			BurstCount++;
			// End:0x502
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
	// End:0x5B7
	if((Instigator.PendingWeapon != Weapon) && Instigator.PendingWeapon != none)
	{
		bIsFiring = false;
		Weapon.PutDown();
	}
	// End:0x642
	if(BW != none)
	{
		BW.bNeedReload = BW.MayNeedReload(byte(ThisModeNum), float(ConsumedLoad));
		// End:0x631
		if(bCockAfterFire || bCockAfterEmpty && (BW.MagAmmo - ConsumedLoad) < 1)
		{
			BW.bNeedCock = true;
		}
		BW.bPreventReload = false;
	}
	AmmoPerFire = 10;
	load = 10.0000000;
	//return;	
}

function SpawnProjectile(Vector Start, Rotator Dir)
{
	proj = Spawn(ProjectileClass,,, Start, Dir);
	// End:0x55
	if(proj != none)
	{
		BallisticProjectile(proj).override(OverrideMode);
		proj.Instigator = Instigator;
	}
	//return;	
}

simulated function ModeTick(float dt)
{
	super(BallisticFire).ModeTick(dt);
	// End:0x196
	if(bIsFiring && BW.MagAmmo >= 10)
	{
		AY90SkrithBoltcaster(BW).UpdateScreen();
		// End:0x72
		if(HoldTime >= AutoFireTime)
		{
			Weapon.StopFire(ThisModeNum);
			Weapon.AmbientSound = none;
		}
		// End:0xD3
		if(((HoldTime >= ChargeTime) && BW.MagAmmo >= 40) && !b100Charge)
		{
			b100Charge = true;
			AY90SkrithBoltcaster(BW).SetGlowSize(2.0000000, 2.0000000, 2.0000000);			
		}
		else
		{
			// End:0x13A
			if(((HoldTime >= (ChargeTime / float(2))) && BW.MagAmmo >= 20) && !b50Charge)
			{
				b50Charge = true;
				AY90SkrithBoltcaster(BW).SetGlowSize(0.3500000, 0.3500000, 0.3500000);				
			}
			else
			{
				// End:0x196
				if(((HoldTime > float(0)) && BW.MagAmmo >= 10) && !b25Charge)
				{
					b25Charge = true;
					AY90SkrithBoltcaster(BW).SetGlowSize(0.1000000, 0.1000000, 0.1000000);
				}
			}
		}
	}
	// End:0x1D4
	if(bIsFiring && HoldTime >= AutoFireTime)
	{
		Weapon.StopFire(ThisModeNum);
		Weapon.AmbientSound = none;
	}
	//return;	
}

defaultproperties
{
	ChargeTime=4.0000000
	ChargeSound=Sound'BWBP_SKC_Sounds.SkrithBow.SkrithBow-BoltCharge'
	AutoFireTime=5.0000000
	ChargeFireSound=Sound'BWBP_SKC_Sounds.SkrithBow.SkrithBow-BoltBlast'
	MaxChargeFireSound=Sound'BWBP_SKC_Sounds.SkrithBow.SkrithBow-BoltBlastMax'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-9.0000000)
	MuzzleFlashClass=Class'BWBP_SKC_Pro.A73BFlashEmitter'
	BallisticFireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.SkrithBow.SkrithBow-BoltShot',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	bFireOnRelease=true
	FireEndAnim="None"
	FireRate=1.0000000
	AmmoClass=Class'BallisticProV55.Ammo_Cells'
	AmmoPerFire=10
	ShakeRotMag=(X=32.0000000,Y=10.0000000,Z=0.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=1.7500000
	ShakeOffsetMag=(X=-8.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=1.7500000
	ProjectileClass=Class'BWBP_SKC_Pro.AY90BoltProjectile'
	WarnTargetPct=0.2000000
}
