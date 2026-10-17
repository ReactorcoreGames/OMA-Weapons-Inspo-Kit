class MD24PrimaryFire extends BallisticProInstantFire;

simulated function OnEffectParamsChanged(int EffectIndex)
{
	super(BallisticFire).OnEffectParamsChanged(EffectIndex);
	// End:0x28
	if(MD24Pistol(Weapon).bHasKnife)
	{
		ApplyTacKnifeEffectParams();
	}
	//return;	
}

simulated function ApplyTacKnifeEffectParams()
{
	FireRecoil *= 1.5000000;
	FireChaos = 1.0000000;
	XInaccuracy = 256.0000000;
	YInaccuracy = 256.0000000;
	//return;	
}

function PlayFiring()
{
	// End:0x5C
	if((BW.MagAmmo - ConsumedLoad) < 1)
	{
		BW.IdleAnim = 'OpenIdle';
		BW.ReloadAnim = 'OpenReload';
		AimedFireAnim = 'SightOpenFire';
		FireAnim = 'NewOpenFire';		
	}
	else
	{
		BW.IdleAnim = 'Idle';
		BW.ReloadAnim = 'Reload';
		AimedFireAnim = 'SightFire';
		FireAnim = 'NewFire';
	}
	super(BallisticFire).PlayFiring();
	//return;	
}

defaultproperties
{
	TraceRange=(Min=4000.0000000,Max=4000.0000000)
	WallPenetrationForce=8.0000000
	WaterRangeAtten=0.5000000
	DamageType=Class'BallisticProV55.DTMD24Pistol'
	DamageTypeHead=Class'BallisticProV55.DTMD24PistolHead'
	DamageTypeArm=Class'BallisticProV55.DTMD24Pistol'
	PenetrateForce=150
	bPenetrate=true
	BrassClass=Class'BallisticProV55.Brass_Pistol'
	BrassOffset=(X=-10.0000000,Y=0.0000000,Z=0.0000000)
	MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter'
	FlashScaleFactor=0.7500000
	AimedFireAnim="SightFire"
	FireRecoil=140.0000000
	FireChaos=0.2000000
	XInaccuracy=96.0000000
	YInaccuracy=96.0000000
	BallisticFireSound=(Sound=Sound'BW_Core_WeaponSound.MD24.MD24_Fire',Volume=4.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	FireEndAnim="None"
	FireAnimRate=1.4500000
	FireRate=0.1300000
	AmmoClass=Class'BallisticProV55.Ammo_MD24Clip'
	ShakeRotMag=(X=48.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotRate=(X=640.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-3.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-60.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	BotRefireRate=0.9000000
	WarnTargetPct=0.3000000
}
