class R9SecondaryFire extends R9PrimaryFire;

var float BurstInterval;

simulated function ApplyRecoil()
{
	local Vector VelRecoilVect;

	// End:0x60
	if(BW != none)
	{
		// End:0x40
		if(BurstCount > 0)
		{
			BW.AddRecoil(FireRecoil * 1.5000000, FireChaos, byte(ThisModeNum));			
		}
		else
		{
			BW.AddRecoil(FireRecoil, FireChaos, byte(ThisModeNum));
		}
	}
	// End:0xF6
	if((FirePushbackForce != float(0)) && Instigator != none)
	{
		VelRecoilVect = Vector(Instigator.GetViewRotation()) * FirePushbackForce;
		VelRecoilVect.Z *= 0.2500000;
		// End:0xE1
		if(int(Instigator.Physics) == int(2))
		{
			Instigator.Velocity -= (VelRecoilVect * 0.5000000);			
		}
		else
		{
			Instigator.Velocity -= VelRecoilVect;
		}
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
	// End:0x241
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
	}
	BW.LastFireTime = Level.TimeSeconds;
	// End:0x28B
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
	BurstCount++;
	// End:0x2D8
	if(BurstCount >= MaxBurst)
	{
		NextFireTime += FireRate;
		NextFireTime = FMax(NextFireTime, Level.TimeSeconds);
		BurstCount = 0;		
	}
	else
	{
		NextFireTime += BurstInterval;
		NextFireTime = FMax(NextFireTime, Level.TimeSeconds);
	}
	load = float(AmmoPerFire);
	HoldTime = 0.0000000;
	// End:0x35C
	if((Instigator.PendingWeapon != Weapon) && Instigator.PendingWeapon != none)
	{
		bIsFiring = false;
		Weapon.PutDown();
	}
	// End:0x3D6
	if(BW != none)
	{
		BW.bNeedReload = BW.MayNeedReload(byte(ThisModeNum), float(ConsumedLoad));
		// End:0x3D6
		if(bCockAfterFire || bCockAfterEmpty && (BW.MagAmmo - ConsumedLoad) < 1)
		{
			BW.bNeedCock = true;
		}
	}
	//return;	
}

function StopFiring()
{
	BurstCount = 0;
	NextFireTime = Level.TimeSeconds + FireRate;
	//return;	
}

defaultproperties
{
	BurstInterval=0.1250000
	MaxBurst=2
	FireRecoil=512.0000000
	FireRate=0.9000000
}
