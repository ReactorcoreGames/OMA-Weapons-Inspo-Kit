class PugPrimaryFire extends BallisticProShotgunFire;

simulated function DestroyEffects()
{
	// End:0x17
	if(MuzzleFlash != none)
	{
		MuzzleFlash.Destroy();
	}
	super(BallisticFire).DestroyEffects();
	//return;	
}

defaultproperties
{
	TraceCount=7
	TracerClass=Class'BallisticProV55.TraceEmitter_Shotgun'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	TraceRange=(Min=2560.0000000,Max=2560.0000000)
	DecayRange=(Min=1024.0000000,Max=1536.0000000)
	Damage=11.0000000
	RangeAtten=0.2500000
	DamageType=Class'BWBP_SKC_Pro.DTSKASShotgun'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTSKASShotgunHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTSKASShotgun'
	KickForce=400
	PenetrateForce=100
	bPenetrate=true
	BrassClass=Class'BallisticProV55.Brass_MRS138Shotgun'
	BrassOffset=(X=-1.0000000,Y=0.0000000,Z=-1.0000000)
	bCockAfterEmpty=true
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	FireRecoil=450.0000000
	FirePushbackForce=180.0000000
	FireChaos=0.3000000
	XInaccuracy=310.0000000
	YInaccuracy=310.0000000
	BallisticFireSound=(Sound=Sound'BWBP_SKC_Sounds.SKAS.SKAS-Single',Volume=1.3000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	FireEndAnim="None"
	FireAnimRate=1.5000000
	FireRate=0.3000000
	AmmoClass=Class'BallisticProV55.Ammo_12Gauge'
	ShakeRotMag=(X=128.0000000,Y=64.0000000,Z=0.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-15.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-300.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	BotRefireRate=0.8000000
	WarnTargetPct=0.4000000
}
