class M7A3SecondaryFire extends BallisticProjectileFire;

var M7A3TazerProj ActiveProj;

function SpawnProjectile(Vector Start, Rotator Dir)
{
	proj = Spawn(ProjectileClass,,, Start, Dir);
	// End:0x73
	if(proj != none)
	{
		proj.Instigator = Instigator;
		M7A3TazerProj(proj).Master = M7A3Attachment(BW.ThirdPersonActor);
		ActiveProj = M7A3TazerProj(proj);
	}
	//return;	
}

simulated event ModeHoldFire()
{
	// End:0x0D
	if(!AllowFire())
	{
		return;
	}
	// End:0x8D
	if(BW != none)
	{
		BW.bPreventReload = true;
		BW.FireCount++;
		// End:0x8D
		if(int(BW.ReloadState) != int(0))
		{
			// End:0x7C
			if(int(Weapon.Role) == int(ROLE_Authority))
			{
				BW.bServerReloading = false;
			}
			BW.ReloadState = 0;
		}
	}
	ConsumedLoad += int(load);
	SetTimer(FMin(0.1000000, FireRate / float(2)), false);
	// End:0x141
	if(int(Weapon.Role) == int(ROLE_Authority))
	{
		DoFireEffect();
		// End:0xF6
		if((Instigator == none) || Instigator.Controller == none)
		{
			return;
		}
		// End:0x132
		if(AIController(Instigator.Controller) != none)
		{
			AIController(Instigator.Controller).WeaponFireAgain(BotRefireRate, true);
		}
		Instigator.DeactivateSpawnProtection();
	}
	BW.LastFireTime = Level.TimeSeconds;
	// End:0x18B
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
	load = float(AmmoPerFire);
	// End:0x1E3
	if((Instigator.PendingWeapon != Weapon) && Instigator.PendingWeapon != none)
	{
		bIsFiring = false;
		Weapon.PutDown();
	}
	// End:0x21B
	if(BW != none)
	{
		BW.bNeedReload = BW.MayNeedReload(byte(ThisModeNum), float(ConsumedLoad));
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
	// End:0x76
	if(int(BW.Role) == int(ROLE_Authority))
	{
		// End:0x40
		if(ActiveProj != none)
		{
			ActiveProj.Destroy();			
		}
		else
		{
			// End:0x76
			if(M7A3Attachment(BW.ThirdPersonActor) != none)
			{
				M7A3Attachment(BW.ThirdPersonActor).TazeEnd();
			}
		}
	}
	// End:0xBC
	if(bFireOnRelease)
	{
		// End:0x9E
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
	HoldTime = 0.0000000;
	//return;	
}

defaultproperties
{
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	FlashBone="tip2"
	bUseWeaponMag=false
	BallisticFireSound=(Sound=Sound'BW_Core_WeaponSound.Tazer.BloodhoundTazerFire',Volume=2.2500000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	bFireOnRelease=true
	PreFireAnim="None"
	FireAnim="DartFireSingle"
	FireForce="AssaultRifleAltFire"
	FireRate=0.9000000
	AmmoClass=Class'BallisticProV55.Ammo_RS762mm'
	AmmoPerFire=0
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-20.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	ProjectileClass=Class'BWBP_JCF_Pro.M7A3TazerProj'
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
}
