class TAC30SecondaryFire extends BallisticFire;

event ModeDoFire()
{
	// End:0x43
	if(int(Weapon.Role) == int(ROLE_Authority))
	{
		TAC30Cannon(Weapon).ServerSwitchLaser(!TAC30Cannon(Weapon).bLaserOn);
	}
	//return;	
}

defaultproperties
{
	bUseWeaponMag=false
	bWaitForRelease=true
	bModeExclusive=false
	FireRate=0.2000000
	AmmoClass=Class'BWBP_SKC_Pro.Ammo_20mmGrenade'
	AmmoPerFire=0
	BotRefireRate=0.3000000
}
