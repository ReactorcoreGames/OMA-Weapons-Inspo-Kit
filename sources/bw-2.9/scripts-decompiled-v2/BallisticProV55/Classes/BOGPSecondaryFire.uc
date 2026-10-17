class BOGPSecondaryFire extends BallisticFire;

simulated function bool AllowFire()
{
	// End:0x19
	if(BOGPPistol(BW).IsSlave())
	{
		return false;
	}
	return super.AllowFire();
	//return;	
}

event ModeDoFire()
{
	// End:0x31
	if(int(Weapon.Role) == int(ROLE_Authority))
	{
		BOGPPistol(Weapon).ServerSwitchWeaponMode(byte(255));
	}
	//return;	
}

defaultproperties
{
	bUseWeaponMag=false
	bWaitForRelease=true
	AmmoClass=Class'BallisticProV55.Ammo_BOGPGrenades'
	BotRefireRate=0.3000000
}
