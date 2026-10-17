class PKMPrimaryFire extends BallisticProInstantFire;

event ModeDoFire()
{
	// End:0x0D
	if(!AllowFire())
	{
		return;
	}
	BallisticMachinegun(Weapon).SetBeltVisibility(BallisticMachinegun(Weapon).MagAmmo);
	super.ModeDoFire();
	//return;	
}

simulated function Vector GetFireDir(out Vector StartTrace)
{
	// End:0x4E
	if(BallisticTurret(Instigator) != none)
	{
		StartTrace = (Instigator.Location + Instigator.EyePosition()) + (Vector(Instigator.GetViewRotation()) * float(64));
	}
	return super(BallisticFire).GetFireDir(StartTrace);
	//return;	
}

defaultproperties
{
	TraceRange=(Min=15000.0000000,Max=15000.0000000)
	DecayRange=(Min=2560.0000000,Max=4096.0000000)
	WallPenetrationForce=24.0000000
	Damage=27.0000000
	RangeAtten=0.3500000
	WaterRangeAtten=0.8000000
	DamageType=Class'BWBP_APC_Pro.DTPKM'
	DamageTypeHead=Class'BWBP_APC_Pro.DTPKMHead'
	DamageTypeArm=Class'BWBP_APC_Pro.DTPKM'
	KickForce=2000
	PenetrateForce=150
	bPenetrate=true
	BrassClass=Class'BallisticProV55.Brass_MG'
	BrassOffset=(X=6.0000000,Y=10.0000000,Z=0.0000000)
	bCockAfterEmpty=true
	DryFireSound=(Sound=Sound'BW_Core_WeaponSound.Misc.DryRifle',Volume=0.7000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	MuzzleFlashClass=Class'BWBP_APC_Pro.PKMFlashEmitter'
	FlashScaleFactor=0.7000000
	AimedFireAnim="SightFire"
	FireRecoil=192.0000000
	FireChaosCurve=(Points=((InVal=0.0000000,OutVal=1.0000000),(InVal=0.2400000,OutVal=1.0000000),(InVal=0.3500000,OutVal=1.5000000),(InVal=0.6600000,OutVal=2.2500000),(InVal=1.0000000,OutVal=3.5000000)))
	XInaccuracy=16.0000000
	YInaccuracy=16.0000000
	BallisticFireSound=(Sound=SoundGroup'BWBP_APC_Sounds.rpk940.RPK-Fire',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	bPawnRapidFireAnim=true
	FireEndAnim="None"
	FireRate=0.1100000
	AmmoClass=Class'BWBP_APC_Pro.Ammo_PKMBelt'
	ShakeRotMag=(X=64.0000000,Y=64.0000000,Z=128.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-10.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=1.5000000
	WarnTargetPct=0.2000000
	aimerror=900.0000000
}
