class D49SecondaryFire extends BallisticProInstantFire;

simulated function PlayFiring()
{
	super(BallisticFire).PlayFiring();
	//return;	
}

simulated function FlashSingleMuzzleFlash()
{
	FlashMuzzleFlash();
	//return;	
}

simulated function FlashMuzzleFlash()
{
	super(BallisticFire).FlashMuzzleFlash();
	Weapon.GetFireMode(0).FlashMuzzleFlash();
	//return;	
}

simulated function bool AllowFire()
{
	// End:0x0D
	if(!CheckWeaponMode())
	{
		return false;
	}
	// End:0x1A
	if(!CheckReloading())
	{
		return false;
	}
	// End:0x63
	if(BW.MagAmmo < 1)
	{
		BW.bNeedReload = BW.MayNeedReload(byte(ThisModeNum), 0.0000000);
		bIsFiring = false;
		return false;
	}
	return true;
	//return;	
}

simulated event ModeDoFire()
{
	// End:0x0D
	if(!AllowFire())
	{
		return;
	}
	switch(D49Revolver(Weapon).GetBarrelMode())
	{
		// End:0x7E
		case 0:
			D49Revolver(Weapon).RevolverFired(0);
			BW.FireCount++;
			NextFireTime += (FireRate * 0.5000000);
			NextFireTime = FMax(NextFireTime, Level.TimeSeconds);
			return;
		// End:0xA0
		case 1:
			Weapon.GetFireMode(0).ModeDoFire();
			return;
		// End:0xC2
		case 2:
			Weapon.GetFireMode(0).ModeDoFire();
			return;
		// End:0xFFFF
		default:
			// End:0xC8
			break;
			break;
	}
	D49Revolver(Weapon).RevolverFired(3);
	super.ModeDoFire();
	//return;	
}

defaultproperties
{
	AmmoClass=Class'BallisticProV55.Ammo_44Magnum'
	ShakeRotMag=(X=64.0000000,Y=32.0000000,Z=0.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-12.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-240.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	BotRefireRate=0.7000000
}
