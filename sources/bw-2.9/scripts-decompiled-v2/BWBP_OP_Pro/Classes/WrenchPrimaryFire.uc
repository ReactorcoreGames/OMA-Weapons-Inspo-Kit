class WrenchPrimaryFire extends BallisticFire;

simulated function bool AllowFire()
{
	return ((Weapon.AmmoAmount(ThisModeNum) >= AmmoPerFire) && !BW.bServerReloading) && int(BW.MeleeState) == int(0);
	//return;	
}

simulated function SwitchWeaponMode(byte newmode)
{
	AmmoPerFire = WrenchWarpDevice(Weapon).Deployables[int(newmode)].AmmoReq;
	//return;	
}

simulated function PostBeginPlay()
{
	super(WeaponFire).PostBeginPlay();
	SetTimer(0.4000000, true);
	//return;	
}

function Timer()
{
	// End:0x1B
	if(int(Weapon.Role) < int(ROLE_Authority))
	{
		return;
	}
	// End:0x41
	if(!Weapon.AmmoMaxed(0))
	{
		Weapon.AddAmmo(1, 0);
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
	// End:0x39
	if(BW != none)
	{
		BW.bPreventReload = true;
		BW.FireCount++;
	}
	ConsumedLoad += int(load);
	// End:0xCE
	if(int(Weapon.Role) == int(ROLE_Authority))
	{
		// End:0x83
		if((Instigator == none) || Instigator.Controller == none)
		{
			return;
		}
		// End:0xBF
		if(AIController(Instigator.Controller) != none)
		{
			AIController(Instigator.Controller).WeaponFireAgain(BotRefireRate, true);
		}
		Instigator.DeactivateSpawnProtection();
	}
	BW.LastFireTime = Level.TimeSeconds;
	// End:0x106
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
	// End:0x185
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
	FireAnim="Button"
	FireAnimRate=2.0000000
	FireRate=1.0000000
	AmmoClass=Class'BWBP_OP_Pro.Ammo_Wrench'
	AmmoPerFire=10
}
