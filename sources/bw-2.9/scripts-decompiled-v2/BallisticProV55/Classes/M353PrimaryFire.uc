class M353PrimaryFire extends BallisticProInstantFire;

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
	WallPenetrationForce=24.0000000
	RangeAtten=0.3500000
	WaterRangeAtten=0.8000000
	DamageType=Class'BallisticProV55.DTM353MG'
	DamageTypeHead=Class'BallisticProV55.DTM353MGHead'
	DamageTypeArm=Class'BallisticProV55.DTM353MG'
	PenetrateForce=150
	bPenetrate=true
	BrassClass=Class'BallisticProV55.Brass_MG'
	BrassOffset=(X=6.0000000,Y=10.0000000,Z=0.0000000)
	bCockAfterEmpty=true
	DryFireSound=(Sound=Sound'BW_Core_WeaponSound.Misc.DryRifle',Volume=0.7000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	MuzzleFlashClass=Class'BallisticProV55.M353FlashEmitter'
	FlashScaleFactor=0.7000000
	AimedFireAnim="SightFire"
	FireRecoil=96.0000000
	FireChaosCurve=(Points=((InVal=0.0000000,OutVal=1.0000000),(InVal=0.2400000,OutVal=1.0000000),(InVal=0.3500000,OutVal=1.5000000),(InVal=0.6600000,OutVal=2.2500000),(InVal=1.0000000,OutVal=3.5000000)))
	XInaccuracy=16.0000000
	YInaccuracy=16.0000000
	BallisticFireSound=(Sound=Sound'BW_Core_WeaponSound.M353.M353-Fire1',Volume=0.6000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	bPawnRapidFireAnim=true
	FireEndAnim="None"
	FireRate=0.0800000
	AmmoClass=Class'BallisticProV55.Ammo_556mmBelt'
	ShakeRotMag=(X=48.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotRate=(X=640.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-5.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-100.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	WarnTargetPct=0.2000000
	aimerror=900.0000000
}
