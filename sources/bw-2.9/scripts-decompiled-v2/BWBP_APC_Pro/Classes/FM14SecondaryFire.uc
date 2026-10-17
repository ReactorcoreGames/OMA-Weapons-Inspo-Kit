class FM14SecondaryFire extends BallisticProjectileFire;

simulated function bool AllowFire()
{
	// End:0x0D
	if(!CheckReloading())
	{
		return false;
	}
	// End:0x1A
	if(!CheckWeaponMode())
	{
		return false;
	}
	// End:0x35
	if(!FM14Shotgun(BW).bAltLoaded)
	{
		return false;
	}
	return true;
	//return;	
}

simulated function ModeDoFire()
{
	super(BallisticFire).ModeDoFire();
	FM14Shotgun(BW).bAltLoaded = false;
	FM14Shotgun(BW).PrepPriFire();
	//return;	
}

defaultproperties
{
	BrassClass=Class'BallisticProV55.Brass_Shotgun'
	BrassOffset=(X=-1.0000000,Y=0.0000000,Z=-1.0000000)
	bUseWeaponMag=false
	FlashScaleFactor=2.0000000
	AimedFireAnim="SightFire"
	FireRecoil=1280.0000000
	FireChaos=0.5000000
	BallisticFireSound=(Sound=SoundGroup'BWBP_OP_Sounds.FM13.FM13-Fire',Volume=1.3000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	bSplashDamage=true
	bLeadTarget=false
	bInstantHit=true
	FireEndAnim="None"
	FireAnimRate=1.1000000
	FireRate=0.7500000
	AmmoClass=Class'BallisticProV55.Ammo_BOGPGrenades'
	ShakeRotMag=(X=128.0000000,Y=64.0000000,Z=0.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-30.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	ProjectileClass=Class'BWBP_APC_Pro.FM14FlakGrenade'
	BotRefireRate=0.3000000
	WarnTargetPct=0.7500000
}
