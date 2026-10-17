class M99SecondaryFire extends BallisticFire;

event ModeDoFire()
{
	// End:0x2D
	if(int(Weapon.Role) == int(ROLE_Authority))
	{
		M99Rifle(Weapon).InitLaser();
	}
	//return;	
}

defaultproperties
{
	bUseWeaponMag=false
	bWaitForRelease=true
	bModeExclusive=false
	FireRate=0.7000000
	AmmoClass=Class'BWBP_JCF_Pro.Ammo_50ECSRifle'
	AmmoPerFire=0
	BotRefireRate=0.3000000
}
