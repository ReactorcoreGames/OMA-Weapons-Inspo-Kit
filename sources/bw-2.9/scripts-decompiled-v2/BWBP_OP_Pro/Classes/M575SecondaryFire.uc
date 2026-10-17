class M575SecondaryFire extends BallisticFire;

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
		M575Machinegun(Weapon).ToggleAmplifier();
	}
	//return;	
}

defaultproperties
{
	bUseWeaponMag=false
	bWaitForRelease=true
	bModeExclusive=false
	FireRate=0.7000000
	AmmoClass=Class'BWBP_OP_Pro.Ammo_762mmBelt'
	AmmoPerFire=0
	BotRefireRate=0.3000000
}
