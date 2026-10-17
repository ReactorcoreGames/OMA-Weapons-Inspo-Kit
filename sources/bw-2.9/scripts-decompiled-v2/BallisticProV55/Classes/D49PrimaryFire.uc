class D49PrimaryFire extends BallisticProInstantFire;

var bool bSecondary;

simulated function FlashMuzzleFlash()
{
	// End:0x2C
	if(bSecondary)
	{
		D49SecondaryFire(Weapon.GetFireMode(1)).FlashSingleMuzzleFlash();		
	}
	else
	{
		super(BallisticFire).FlashMuzzleFlash();
	}
	//return;	
}

simulated function PlayFiring()
{
	super(BallisticFire).PlayFiring();
	//return;	
}

simulated event ModeDoFire()
{
	// End:0x0D
	if(!AllowFire())
	{
		return;
	}
	switch(D49Revolver(Weapon).GetBarrelMode())
	{
		// End:0x7E
		case 0:
			D49Revolver(Weapon).RevolverFired(0);
			BW.FireCount++;
			NextFireTime += (FireRate * 0.5000000);
			NextFireTime = FMax(NextFireTime, Level.TimeSeconds);
			return;
		// End:0x86
		case 1:
			// End:0x9C
			break;
		// End:0x96
		case 2:
			bSecondary = true;
			// End:0x9C
			break;
		// End:0xFFFF
		default:
			// End:0x9C
			break;
			break;
	}
	super.ModeDoFire();
	// End:0xC4
	if(bSecondary)
	{
		D49Revolver(Weapon).RevolverFired(2);		
	}
	else
	{
		D49Revolver(Weapon).RevolverFired(1);
	}
	bSecondary = false;
	//return;	
}

defaultproperties
{
	FlashBone="tip2"
	AmmoClass=Class'BallisticProV55.Ammo_44Magnum'
	ShakeRotMag=(X=48.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotRate=(X=640.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-8.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-160.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	BotRefireRate=0.7000000
}
