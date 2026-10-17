class FP9SecondaryFire extends BallisticFire;

simulated event ModeDoFire()
{
	// End:0x1D
	if(AllowFire())
	{
		FP9Explosive(Weapon).Detonate();
	}
	NextFireTime += FireRate;
	NextFireTime = FMax(NextFireTime, Level.TimeSeconds);
	//return;	
}

defaultproperties
{
	bUseWeaponMag=false
	bAISilent=true
	FireRate=0.3000000
	AmmoClass=Class'BallisticProV55.Ammo_FP9Ammo'
	AmmoPerFire=0
	BotRefireRate=0.3000000
}
