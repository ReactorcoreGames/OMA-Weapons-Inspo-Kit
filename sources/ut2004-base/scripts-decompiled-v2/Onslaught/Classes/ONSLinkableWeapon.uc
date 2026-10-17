class ONSLinkableWeapon extends ONSWeapon
	abstract
	native
	notplaceable;

var ONSWeapon ChildWeapon;

replication
{
	// Pos:0x000
	reliable if((bNetDirty && bNetOwner) && int(Role) == int(ROLE_Authority))
		ChildWeapon;
}

event bool AttemptFire(Controller C, bool bAltFire)
{
	// End:0x1D
	if((int(Role) != int(ROLE_Authority)) || bForceCenterAim)
	{
		return false;
	}
	// End:0x116
	if(FireCountdown <= float(0))
	{
		CalcWeaponFire();
		// End:0x4B
		if(bCorrectAim)
		{
			WeaponFireRotation = AdjustAim(bAltFire);
		}
		// End:0x76
		if(Spread > float(0))
		{
			WeaponFireRotation = Rotator(Vector(WeaponFireRotation) + ((VRand() * FRand()) * Spread));
		}
		DualFireOffset *= float(-1);
		Instigator.MakeNoise(1.0000000);
		// End:0xB7
		if(bAltFire)
		{
			FireCountdown = AltFireInterval;
			AltFire(C);			
		}
		else
		{
			FireCountdown = FireInterval;
			Fire(C);
		}
		AimLockReleaseTime = Level.TimeSeconds + (FireCountdown * FireIntervalAimLock);
		// End:0x114
		if(ChildWeapon != none)
		{
			ChildWeapon.AttemptFire(C, bAltFire);
		}
		return true;
	}
	return false;
	//return;	
}

simulated function Destroyed()
{
	// End:0x17
	if(ChildWeapon != none)
	{
		ChildWeapon.Destroy();
	}
	super.Destroyed();
	//return;	
}

