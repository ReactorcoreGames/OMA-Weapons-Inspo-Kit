class GRSXXSecondaryAmpFire extends BallisticFire;

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
		GRSXXPistol(Weapon).ToggleAmplifier();
	}
	//return;	
}

defaultproperties
{
	bUseWeaponMag=false
	bWaitForRelease=true
	bModeExclusive=false
	FireRate=0.7000000
	AmmoClass=Class'BallisticProV55.Ammo_GRSNine'
	AmmoPerFire=0
	BotRefireRate=0.3000000
}
