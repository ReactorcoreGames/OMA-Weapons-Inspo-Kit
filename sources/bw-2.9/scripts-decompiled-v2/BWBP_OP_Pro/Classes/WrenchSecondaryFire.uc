class WrenchSecondaryFire extends BallisticFire;

simulated function bool AllowFire()
{
	return ((Weapon.AmmoAmount(ThisModeNum) >= AmmoPerFire) && !BW.bServerReloading) && int(BW.MeleeState) == int(0);
	//return;	
}

simulated event ModeDoFire()
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
	// End:0x122
	if(int(Weapon.Role) == int(ROLE_Authority))
	{
		// End:0xD7
		if((Instigator == none) || Instigator.Controller == none)
		{
			return;
		}
		// End:0x113
		if(AIController(Instigator.Controller) != none)
		{
			AIController(Instigator.Controller).WeaponFireAgain(BotRefireRate, true);
		}
		Instigator.DeactivateSpawnProtection();
	}
	BW.LastFireTime = Level.TimeSeconds;
	// End:0x15A
	if(Instigator.IsLocallyControlled())
	{
		PlayFiring();		
	}
	else
	{
		ServerPlayFiring();
	}
	NextFireTime += FireRate;
	NextFireTime = FMax(NextFireTime, Level.TimeSeconds);
	load = float(AmmoPerFire);
	// End:0x1D9
	if((Instigator.PendingWeapon != Weapon) && Instigator.PendingWeapon != none)
	{
		bIsFiring = false;
		Weapon.PutDown();
	}
	//return;	
}

defaultproperties
{
	bUseWeaponMag=false
	bWaitForRelease=true
	FireAnim="BarrierButton"
	FireAnimRate=2.0000000
	FireRate=1.0000000
	AmmoClass=Class'BWBP_OP_Pro.Ammo_Wrench'
	AmmoPerFire=20
}
