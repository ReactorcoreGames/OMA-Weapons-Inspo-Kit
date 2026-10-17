class SPASPrimarySlugFire extends BallisticInstantFire;

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
	TraceRange=(Min=4000.0000000,Max=6000.0000000)
	Damage=100.0000000
	RangeAtten=0.3000000
	DamageType=Class'BWBP_JCF_Pro.DTSPASShotgun'
	DamageTypeHead=Class'BWBP_JCF_Pro.DTSPASShotgunHead'
	DamageTypeArm=Class'BWBP_JCF_Pro.DTSPASShotgun'
	KickForce=5000
	PenetrateForce=100
	bPenetrate=true
	BrassClass=Class'BallisticProV55.Brass_Shotgun'
	bBrassOnCock=true
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	FlashScaleFactor=0.1000000
	AimedFireAnim="SightFireCock"
	FireRecoil=900.0000000
	FirePushbackForce=180.0000000
	FireChaos=0.5000000
	XInaccuracy=32.0000000
	YInaccuracy=32.0000000
	BallisticFireSound=(Sound=Sound'BWBP_JCF_Sounds.SPAS.SPAS-FireOld2',Volume=1.5000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	FireAnim="FireCock"
	FireEndAnim="None"
	FireRate=0.8000000
	AmmoClass=Class'BallisticProV55.Ammo_12Gauge'
	ShakeRotMag=(X=128.0000000,Y=64.0000000,Z=0.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-30.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	BotRefireRate=0.9000000
	WarnTargetPct=0.5000000
}
