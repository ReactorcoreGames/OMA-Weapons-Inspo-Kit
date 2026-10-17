class G5SecondaryFire extends BallisticFire;

event ModeDoFire()
{
	// End:0x43
	if(int(Weapon.Role) == int(ROLE_Authority))
	{
		G5Bazooka(Weapon).ServerSwitchLaser(!G5Bazooka(Weapon).bLaserOn);
	}
	//return;	
}

defaultproperties
{
	bUseWeaponMag=false
	bWaitForRelease=true
	bModeExclusive=false
	FireRate=0.2000000
	AmmoClass=Class'BallisticProV55.Ammo_RPG'
	AmmoPerFire=0
	BotRefireRate=0.3000000
}
