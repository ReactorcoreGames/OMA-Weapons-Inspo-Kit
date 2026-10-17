class MJ51PrimaryFire extends BallisticProInstantFire;

simulated event ModeDoFire()
{
	// End:0x2D
	if(MJ51Carbine(Weapon).bLoaded)
	{
		MJ51Carbine(Weapon).IndirectLaunch();
		return;
	}
	// End:0x3A
	if(!AllowFire())
	{
		return;
	}
	super.ModeDoFire();
	//return;	
}

defaultproperties
{
	TraceRange=(Min=10000.0000000,Max=13000.0000000)
	DamageType=Class'BWBP_APC_Pro.DTMJ51Assault'
	DamageTypeHead=Class'BWBP_APC_Pro.DTMJ51AssaultHead'
	DamageTypeArm=Class'BWBP_APC_Pro.DTMJ51AssaultLimb'
	PenetrateForce=150
	bPenetrate=true
	BrassClass=Class'BallisticProV55.Brass_Rifle'
	BrassOffset=(X=-12.5000000,Y=1.0000000,Z=0.0000000)
	DryFireSound=(Sound=Sound'BW_Core_WeaponSound.D49.D49-DryFire',Volume=0.7000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	MuzzleFlashClass=Class'BWBP_SKC_Pro.G51FlashEmitter'
	FlashScaleFactor=0.5000000
	AimedFireAnim="SightFire"
	FireRecoil=128.0000000
	FireChaos=0.0400000
	XInaccuracy=16.0000000
	YInaccuracy=16.0000000
	BallisticFireSound=(Sound=Sound'BWBP_SKC_Sounds.MJ51.MJ55-Fire',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	bPawnRapidFireAnim=true
	AmmoClass=Class'BallisticProV55.Ammo_556mm'
	ShakeRotMag=(X=48.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotRate=(X=640.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-5.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-100.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	WarnTargetPct=0.2000000
}
