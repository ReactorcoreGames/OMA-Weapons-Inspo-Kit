class T9CNPrimaryFire extends BallisticProInstantFire;

function PlayFiring()
{
	// End:0x5C
	if((BW.MagAmmo - ConsumedLoad) < 1)
	{
		BW.IdleAnim = 'IdleOpen';
		BW.ReloadAnim = 'ReloadOpen';
		FireAnim = 'FireOpen';
		AimedFireAnim = 'SightFireOpen';		
	}
	else
	{
		BW.IdleAnim = 'Idle';
		BW.ReloadAnim = 'Reload';
		FireAnim = 'Fire';
		AimedFireAnim = 'SightFire';
	}
	super(BallisticFire).PlayFiring();
	//return;	
}

defaultproperties
{
	DamageType=Class'BWBP_SKC_Pro.DTT9CN'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTT9CNHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTT9CN'
	BrassClass=Class'BallisticProV55.Brass_GRSNine'
	BrassOffset=(X=-25.0000000,Y=0.0000000,Z=-5.0000000)
	ClipFinishSound=(Sound=Sound'BW_Core_WeaponSound.Misc.ClipEnd-2',Volume=0.8000000,Radius=48.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	DryFireSound=(Sound=Sound'BW_Core_WeaponSound.Misc.DryPistol',Volume=0.7000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	MuzzleFlashClass=Class'BWBP_SKC_Pro.T9CNFlashEmitter'
	FlashScaleFactor=0.6000000
	FireRecoil=64.0000000
	XInaccuracy=48.0000000
	YInaccuracy=48.0000000
	BallisticFireSound=(Sound=Sound'BWBP_SKC_Sounds.T9CN.T9CN-FireOld',Volume=1.3000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	bPawnRapidFireAnim=true
	FireRate=0.1200000
	AmmoClass=Class'BallisticProV55.Ammo_GRSNine'
	ShakeRotMag=(X=48.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotRate=(X=640.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-3.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-60.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
}
