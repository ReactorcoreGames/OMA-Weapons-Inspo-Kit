class RCS715SecondaryFire extends BallisticProProjectileFire;

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
	// End:0x12C
	if((RCS715Shotgun(BW).Grenades == 0) && !RCS715Shotgun(BW).bReady)
	{
		// End:0xCA
		if(!bPlayedDryFire && DryFireSound.Sound != none)
		{
			Weapon.PlayOwnedSound(DryFireSound.Sound, DryFireSound.Slot, DryFireSound.Volume, DryFireSound.bNoOverride, DryFireSound.Radius, DryFireSound.Pitch, DryFireSound.bAtten);
			bPlayedDryFire = true;
		}
		// End:0xE4
		if(bDryUncock)
		{
			BW.bNeedCock = true;
		}
		BW.bNeedReload = BW.MayNeedReload(byte(ThisModeNum), 0.0000000);
		RCS715Shotgun(BW).EmptyAltFire(byte(ThisModeNum));
		return false;
	}
	return true;
	//return;	
}

simulated event ModeDoFire()
{
	// End:0x0D
	if(!AllowFire())
	{
		return;
	}
	// End:0x3F
	if(!RCS715Shotgun(BW).bReady)
	{
		RCS715Shotgun(BW).PrepAltFire();
		return;		
	}
	else
	{
		super.ModeDoFire();
		RCS715Shotgun(BW).bReady = false;
		RCS715Shotgun(BW).PrepPriFire();
	}
	//return;	
}

defaultproperties
{
	SpawnOffset=(X=20.0000000,Y=9.0000000,Z=-9.0000000)
	FlashBone="tip2"
	BrassClass=Class'BallisticProV55.Brass_MRS138Shotgun'
	BrassOffset=(X=-1.0000000,Y=0.0000000,Z=-1.0000000)
	bUseWeaponMag=false
	MuzzleFlashClass=Class'BWBP_SKC_Pro.MK781FlashEmitter'
	FlashScaleFactor=0.5000000
	FireRecoil=650.0000000
	FirePushbackForce=180.0000000
	FireChaos=0.4500000
	XInaccuracy=384.0000000
	YInaccuracy=384.0000000
	BallisticFireSound=(Sound=Sound'BWBP_SKC_Sounds.Misc.GL-Fire',Volume=1.3000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	bSplashDamage=true
	bRecommendSplashDamage=true
	bTossed=true
	bModeExclusive=false
	FireAnim="GLFire"
	FireAnimRate=1.2500000
	FireForce="GLFire"
	FireRate=0.6500000
	AmmoClass=Class'BWBP_OP_Pro.Ammo_RCS715Grenades'
	AmmoPerFire=0
	ShakeRotMag=(X=128.0000000,Y=64.0000000,Z=0.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-12.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	ProjectileClass=Class'BWBP_OP_Pro.RCS715Projectile'
	BotRefireRate=0.6000000
	WarnTargetPct=0.4000000
}
