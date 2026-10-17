class ClassicRocketLauncher extends RocketLauncher
	config(User)
	hidedropdown
	cacheexempt;

simulated event ClientStartFire(int Mode)
{
	// End:0x15
	if(Mode == 0)
	{
		SetTightSpread(false);		
	}
	else
	{
		// End:0x6F
		if(FireMode[0].bIsFiring || FireMode[0].NextFireTime > Level.TimeSeconds)
		{
			// End:0x6D
			if(FireMode[0].load > float(0))
			{
				SetTightSpread(true);
			}
			return;
		}
	}
	super(Weapon).ClientStartFire(Mode);
	//return;	
}

defaultproperties
{
	FireModeClass[0]=Class'UTClassic.ClassicRocketMultifire'
	FireModeClass[1]=Class'UTClassic.ClassicGrenadeFire'
	SelectAnimRate=0.7500000
	BringUpTime=0.6000000
	MinReloadPct=1.0000000
	PickupClass=Class'UTClassic.ClassicRocketLauncherPickup'
}
