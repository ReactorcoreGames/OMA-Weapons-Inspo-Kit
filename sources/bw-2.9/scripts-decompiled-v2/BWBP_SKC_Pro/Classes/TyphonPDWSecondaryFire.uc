class TyphonPDWSecondaryFire extends BallisticFire;

simulated event ModeDoFire()
{
	// End:0x21
	if(MaxHoldTime > 0.0000000)
	{
		HoldTime = FMin(HoldTime, MaxHoldTime);
	}
	// End:0x37
	if(!Instigator.IsLocallyControlled())
	{
		return;
	}
	TyphonPDW(Weapon).ShieldDeploy();
	// End:0x91
	if(bFireOnRelease)
	{
		// End:0x73
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
	// End:0x108
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
	bAISilent=true
	bWaitForRelease=true
	FireRate=0.6000000
	AmmoClass=Class'BWBP_SKC_Pro.Ammo_Laser'
	AmmoPerFire=0
	BotRefireRate=0.3000000
}
