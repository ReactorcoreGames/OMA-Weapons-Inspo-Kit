class GRS9PrimaryFire extends BallisticProInstantFire;

simulated function OnEffectParamsChanged(int EffectIndex)
{
	super(BallisticFire).OnEffectParamsChanged(EffectIndex);
	// End:0x28
	if(GRS9Pistol(Weapon).bHasKnife)
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
		AimedFireAnim = 'OpenFire';
		FireAnim = 'OpenFire';		
	}
	else
	{
		BW.IdleAnim = 'Idle';
		BW.ReloadAnim = 'Reload';
		AimedFireAnim = 'Fire';
		FireAnim = 'Fire';
	}
	super(BallisticFire).PlayFiring();
	//return;	
}

defaultproperties
{
	TraceRange=(Min=4000.0000000,Max=4000.0000000)
	DamageType=Class'BallisticProV55.DTGRS9Pistol'
	DamageTypeHead=Class'BallisticProV55.DTGRS9PistolHead'
	DamageTypeArm=Class'BallisticProV55.DTGRS9Pistol'
	PenetrateForce=100
	bPenetrate=true
	BrassClass=Class'BallisticProV55.Brass_GRSNine'
	BrassBone="tip"
	BrassOffset=(X=-30.0000000,Y=1.0000000,Z=0.0000000)
	MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter'
	FlashScaleFactor=2.5000000
	AimedFireAnim="'"
	FireRecoil=120.0000000
	FireChaos=0.1200000
	XInaccuracy=64.0000000
	YInaccuracy=64.0000000
	BallisticFireSound=(Sound=Sound'BW_Core_WeaponSound.Glock.Glk-Fire',Volume=1.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	FireEndAnim="None"
	FireAnimRate=1.7000000
	FireRate=0.0500000
	AmmoClass=Class'BallisticProV55.Ammo_GRSNine'
	ShakeRotMag=(X=48.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotRate=(X=640.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-3.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-60.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	BotRefireRate=0.9900000
	WarnTargetPct=0.2000000
}
