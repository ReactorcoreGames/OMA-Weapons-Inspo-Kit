class XMV500SecondaryFire extends BallisticFire;

event ModeDoFire()
{
	// End:0x43
	if(int(Weapon.Role) == int(ROLE_Authority))
	{
		XMV500Minigun(Weapon).ServerSwitchLaser(!XMV500Minigun(Weapon).bLaserOn);
	}
	//return;	
}

defaultproperties
{
	bUseWeaponMag=false
	bWaitForRelease=true
	bModeExclusive=false
	FireEndAnim="None"
	FireRate=0.2000000
	AmmoClass=Class'BWBP_APC_Pro.Ammo_MinigunInc'
	AmmoPerFire=0
	BotRefireRate=0.3000000
}
