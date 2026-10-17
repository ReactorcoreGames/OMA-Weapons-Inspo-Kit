class LK05SecondaryFire extends BallisticFire;

simulated event ModeDoFire()
{
	// End:0x16
	if(!Instigator.IsLocallyControlled())
	{
		return;
	}
	LK05Carbine(Weapon).SwitchSilencer();
	//return;	
}

defaultproperties
{
	bUseWeaponMag=false
	bAISilent=true
	bWaitForRelease=true
	bModeExclusive=false
	FireRate=1.3000000
	AmmoClass=Class'BWBP_SKC_Pro.Ammo_68mm'
	AmmoPerFire=0
	BotRefireRate=0.3000000
}
