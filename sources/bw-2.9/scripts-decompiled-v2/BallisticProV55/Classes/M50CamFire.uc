class M50CamFire extends BallisticFire;

event ModeDoFire()
{
	// End:0x26
	if(Instigator.IsLocallyControlled())
	{
		M50AssaultRifle(Weapon).WeaponSpecial();
	}
	//return;	
}

defaultproperties
{
	bUseWeaponMag=false
	bWaitForRelease=true
	bModeExclusive=false
	FireRate=0.7000000
	AmmoClass=Class'BallisticProV55.Ammo_556mm'
	AmmoPerFire=0
	BotRefireRate=0.3000000
}
