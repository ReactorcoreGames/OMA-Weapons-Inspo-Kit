class SRKSmgPrimaryFire extends BallisticProInstantFire;

simulated event ModeDoFire()
{
	// End:0x2D
	if(SRKSubMachinegun(Weapon).bLoaded)
	{
		SRKSubMachinegun(Weapon).IndirectLaunch();
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
	WallPenetrationForce=18.0000000
	Damage=26.0000000
	RangeAtten=0.9000000
	WaterRangeAtten=0.7000000
	DamageType=Class'BWBP_APC_Pro.DTSRKSmg'
	DamageTypeHead=Class'BWBP_APC_Pro.DTSRKSmgHead'
	DamageTypeArm=Class'BWBP_APC_Pro.DTSRKSmg'
	KickForce=18000
	PenetrateForce=150
	bPenetrate=true
	BrassClass=Class'BallisticProV55.Brass_Rifle'
	BrassOffset=(X=-20.0000000,Y=1.0000000,Z=0.0000000)
	DryFireSound=(Sound=Sound'BW_Core_WeaponSound.D49.D49-DryFire',Volume=0.7000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	MuzzleFlashClass=Class'BWBP_APC_Pro.SRKSmgFlashEmitter'
	FlashScaleFactor=0.5000000
	AimedFireAnim="SightFire"
	BurstFireRateFactor=0.9000000
	FireRecoil=128.0000000
	FireChaos=0.0400000
	XInaccuracy=16.0000000
	YInaccuracy=16.0000000
	BallisticFireSound=(Sound=Sound'BWBP_APC_Sounds.SRKS.SRKS-Fire',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	bPawnRapidFireAnim=true
	FireEndAnim="None"
	FireRate=0.1000000
	AmmoClass=Class'BWBP_APC_Pro.Ammo_SRK'
	ShakeRotMag=(X=128.0000000,Y=64.0000000,Z=0.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-20.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	WarnTargetPct=0.2000000
}
