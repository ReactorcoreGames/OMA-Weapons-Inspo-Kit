class MDKSecondaryFire extends BallisticFire;

simulated event ModeDoFire()
{
	// End:0x16
	if(!Instigator.IsLocallyControlled())
	{
		return;
	}
	// End:0x33
	if(AllowFire())
	{
		MDKSubMachinegun(Weapon).ScopeSpecial();
	}
	//return;	
}

defaultproperties
{
	bUseWeaponMag=false
	bWaitForRelease=true
	bModeExclusive=false
	FireRate=1.2000000
	AmmoClass=Class'BallisticProV55.Ammo_9mm'
	AmmoPerFire=0
	BotRefireRate=0.3000000
}
