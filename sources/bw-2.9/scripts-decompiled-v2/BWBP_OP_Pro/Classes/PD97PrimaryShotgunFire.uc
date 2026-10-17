class PD97PrimaryShotgunFire extends BallisticProShotgunFire;

simulated function PlayFiring()
{
	// End:0x2B
	if(PD97Bloodhound(BW).bNeedRotate)
	{
		PD97Bloodhound(BW).CycleDrum();
	}
	// End:0x87
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
	PD97Bloodhound(BW).ShellFired();
	//return;	
}

defaultproperties
{
	TraceCount=9
	TracerClass=Class'BallisticProV55.TraceEmitter_Shotgun'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	TraceRange=(Min=5000.0000000,Max=5000.0000000)
	Damage=4.0000000
	RangeAtten=0.7500000
	DamageType=Class'BWBP_SKC_Pro.DTCYLOShotgun'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTCYLOShotgunHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTCYLOShotgun'
	KickForce=400
	PenetrateForce=100
	bPenetrate=true
	BrassClass=Class'BallisticProV55.Brass_Shotgun'
	bBrassOnCock=true
	BrassOffset=(X=-30.0000000,Y=-5.0000000,Z=5.0000000)
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	FireRecoil=512.0000000
	FirePushbackForce=150.0000000
	FireChaos=0.5000000
	XInaccuracy=350.0000000
	YInaccuracy=350.0000000
	BallisticFireSound=(Sound=Sound'BWBP_SKC_Sounds.CYLO.CYLO-FireSG',Volume=1.3000000,Radius=256.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	JamSound=(Sound=Sound'BW_Core_WeaponSound.Misc.ClipEnd-1',Volume=0.9000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	FireAnim="FireSG"
	FireEndAnim="None"
	FireRate=0.7000000
	AmmoClass=Class'BWBP_OP_Pro.Ammo_BloodhoundDarts'
	ShakeRotMag=(X=128.0000000,Y=64.0000000,Z=0.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-12.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	BotRefireRate=0.7000000
	WarnTargetPct=0.5000000
}
