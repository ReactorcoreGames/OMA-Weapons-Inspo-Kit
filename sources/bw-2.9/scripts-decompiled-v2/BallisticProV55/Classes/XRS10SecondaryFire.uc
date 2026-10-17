class XRS10SecondaryFire extends BallisticFire;

event ModeDoFire()
{
	// End:0x43
	if(int(Weapon.Role) == int(ROLE_Authority))
	{
		XRS10SubMachinegun(Weapon).ServerSwitchLaser(!XRS10SubMachinegun(Weapon).bLaserOn);
	}
	//return;	
}

defaultproperties
{
	bUseWeaponMag=false
	bWaitForRelease=true
	bModeExclusive=false
	AmmoClass=Class'BallisticProV55.Ammo_XRS10Bullets'
	BotRefireRate=0.3000000
}
