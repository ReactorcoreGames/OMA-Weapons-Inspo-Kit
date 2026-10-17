class MRDRPrimaryFire extends BallisticProInstantFire;

function PlayFiring()
{
	// End:0x52
	if((BW.MagAmmo - ConsumedLoad) < 2)
	{
		BW.IdleAnim = 'OpenIdle';
		BW.ReloadAnim = 'OpenReload';
		FireAnim = 'OpenFire';		
	}
	else
	{
		BW.IdleAnim = 'Idle';
		BW.ReloadAnim = 'Reload';
		FireAnim = 'Fire';
	}
	super(BallisticFire).PlayFiring();
	//return;	
}

defaultproperties
{
	DamageType=Class'BWBP_SKC_Pro.DT_MRDR88Body'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_MRDR88Head'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_MRDR88Body'
	BrassClass=Class'BallisticProV55.Brass_Pistol'
	BrassOffset=(X=-25.0000000,Y=0.0000000,Z=-5.0000000)
	ClipFinishSound=(Sound=Sound'BW_Core_WeaponSound.Misc.ClipEnd-2',Volume=0.8000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	DryFireSound=(Sound=Sound'BW_Core_WeaponSound.Misc.DryPistol',Volume=0.7000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	MuzzleFlashClass=Class'BWBP_SKC_Pro.MRDRFlashEmitter'
	FlashScaleFactor=0.6000000
	FireRecoil=64.0000000
	XInaccuracy=48.0000000
	YInaccuracy=48.0000000
	BallisticFireSound=(Sound=Sound'BWBP_SKC_Sounds.MRDR.MRDR-Fire',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	bPawnRapidFireAnim=true
	FireRate=0.1200000
	AmmoClass=Class'BallisticProV55.Ammo_9mm'
	ShakeRotMag=(X=32.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotRate=(X=480.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-3.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-60.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
}
