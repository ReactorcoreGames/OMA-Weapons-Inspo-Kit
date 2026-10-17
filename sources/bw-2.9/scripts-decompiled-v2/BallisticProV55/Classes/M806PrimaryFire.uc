class M806PrimaryFire extends BallisticProInstantFire;

function PlayFiring()
{
	// End:0x75
	if((BW.MagAmmo - ConsumedLoad) < 1)
	{
		BW.IdleAnim = 'OpenIdle';
		BW.ReloadAnim = 'OpenReload';
		AimedFireAnim = 'SightFireOpen';
		FireAnim = 'OpenFire';
		M806Pistol(BW).ReloadAltAnim = 'ReloadAltOpen';		
	}
	else
	{
		BW.IdleAnim = 'Idle';
		BW.ReloadAnim = 'Reload';
		AimedFireAnim = 'SightFire';
		FireAnim = 'Fire';
		M806Pistol(BW).ReloadAltAnim = 'ReloadAlt';
	}
	super(BallisticFire).PlayFiring();
	//return;	
}

defaultproperties
{
	TraceRange=(Min=4000.0000000,Max=4000.0000000)
	WallPenetrationForce=8.0000000
	DamageType=Class'BallisticProV55.DTM806Pistol'
	DamageTypeHead=Class'BallisticProV55.DTM806PistolHead'
	DamageTypeArm=Class'BallisticProV55.DTM806Pistol'
	PenetrateForce=150
	bPenetrate=true
	BrassClass=Class'BallisticProV55.Brass_Pistol'
	BrassBone="tip"
	BrassOffset=(X=-30.0000000,Y=1.0000000,Z=0.0000000)
	MuzzleFlashClass=Class'BallisticProV55.M806FlashEmitter'
	AimedFireAnim="SightFire"
	FireRecoil=256.0000000
	FireChaos=0.2000000
	BallisticFireSound=(Sound=Sound'BW_Core_WeaponSound.M806.M806Fire',Volume=0.7000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	FireEndAnim="None"
	FireAnimRate=2.0000000
	FireRate=0.2500000
	AmmoClass=Class'BallisticProV55.Ammo_45HV'
	ShakeRotMag=(X=48.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotRate=(X=640.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-8.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-160.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
}
