class BX5SecondaryFire extends BallisticFire;

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
		BX5Mine(Weapon).SwitchSpringMode();
	}
	NextFireTime += FireRate;
	NextFireTime = FMax(NextFireTime, Level.TimeSeconds);
	//return;	
}

defaultproperties
{
	bUseWeaponMag=false
	bAISilent=true
	bWaitForRelease=true
	bModeExclusive=false
	FireRate=0.7000000
	AmmoClass=Class'BallisticProV55.Ammo_BX5Mines'
	AmmoPerFire=0
	BotRefireRate=0.3000000
}
