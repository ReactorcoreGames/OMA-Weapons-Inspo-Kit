class R9A1ScopeFire extends BallisticFire;

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
		if(!super(WeaponFire).AllowFire())
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
		// End:0x1A4
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
			BW.EmptyFire(byte(ThisModeNum));
			return false;			
		}
		else
		{
			// End:0x1BB
			if(BW.bNeedReload)
			{
				return false;				
			}
			else
			{
				// End:0x1CF
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

simulated function bool CheckReloading()
{
	// End:0x2F
	if(BW.bScopeView && int(BW.ReloadState) == int(8))
	{
		return true;
	}
	return super.CheckReloading();
	//return;	
}

simulated event ModeDoFire()
{
	// End:0x3E
	if(((AllowFire()) && Instigator.IsLocallyControlled()) && BW != none)
	{
		R9A1RangerRifle(BW).ScopeViewTwoRelease();
	}
	//return;	
}

simulated function PlayPreFire()
{
	// End:0x33
	if(Instigator.IsLocallyControlled() && BW != none)
	{
		R9A1RangerRifle(BW).ScopeViewTwo();
	}
	//return;	
}

defaultproperties
{
	bUseWeaponMag=false
	bFireOnRelease=true
	bModeExclusive=false
	FireAnim="None"
	FireRate=0.0200000
	AmmoClass=Class'BWBP_OP_Pro.Ammo_R9A1Rifle'
	AmmoPerFire=0
	BotRefireRate=0.3000000
}
