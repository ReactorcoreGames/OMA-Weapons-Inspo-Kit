class AH250PrimaryFire extends BallisticProInstantFire;

function PlayFiring()
{
	// End:0x5C
	if((BW.MagAmmo - ConsumedLoad) < 1)
	{
		BW.IdleAnim = 'OpenIdle';
		BW.ReloadAnim = 'OpenReload';
		AimedFireAnim = 'OpenSightFire';
		FireAnim = 'OpenFire';		
	}
	else
	{
		BW.IdleAnim = 'Idle';
		BW.ReloadAnim = 'Reload';
		AimedFireAnim = 'SightFire';
		FireAnim = 'Fire';
	}
	super(BallisticFire).PlayFiring();
	//return;	
}

defaultproperties
{
	TraceRange=(Min=8000.0000000,Max=9000.0000000)
	DamageType=Class'BWBP_SKC_Pro.DTAH250Pistol'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTAH250PistolHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTAH250Pistol'
	PenetrateForce=200
	bPenetrate=true
	BrassClass=Class'BallisticProV55.Brass_Pistol'
	BrassBone="tip"
	BrassOffset=(X=-30.0000000,Y=1.0000000,Z=0.0000000)
	MuzzleFlashClass=Class'BallisticProV55.D49FlashEmitter'
	FlashScaleFactor=0.5000000
	AimedFireAnim="'"
	FireRecoil=512.0000000
	FirePushbackForce=150.0000000
	FireChaos=0.2000000
	XInaccuracy=2.0000000
	YInaccuracy=2.0000000
	BallisticFireSound=(Sound=Sound'BWBP_SKC_Sounds.Eagle.Eagle-Fire3',Volume=4.1000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	FireEndAnim="None"
	FireRate=0.4000000
	AmmoClass=Class'BallisticProV55.Ammo_44Magnum'
	ShakeRotMag=(X=64.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotRate=(X=960.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-8.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-100.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
}
