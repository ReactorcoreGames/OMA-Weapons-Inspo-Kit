class A909SecondaryFire extends BallisticMeleeFire;

event ModeDoFire()
{
	local float F;

	super.ModeDoFire();
	F = FRand();
	// End:0x36
	if(F > 0.6600000)
	{
		PreFireAnim = 'PrepBigHack1';
		FireAnim = 'BigHack1';		
	}
	else
	{
		// End:0x5E
		if(F > 0.3300000)
		{
			PreFireAnim = 'PrepBigHack2';
			FireAnim = 'BigHack2';			
		}
		else
		{
			PreFireAnim = 'PrepBigHack3';
			FireAnim = 'BigHack3';
		}
	}
	//return;	
}

simulated function bool HasAmmo()
{
	return true;
	//return;	
}

defaultproperties
{
	bReleaseFireOnDie=false
	bAISilent=true
	bFireOnRelease=true
	AmmoClass=Class'BallisticProV55.Ammo_Knife'
	ShakeRotMag=(X=64.0000000,Y=384.0000000,Z=0.0000000)
	ShakeRotRate=(X=3500.0000000,Y=3500.0000000,Z=3500.0000000)
	ShakeRotTime=2.0000000
	BotRefireRate=0.5000000
}
