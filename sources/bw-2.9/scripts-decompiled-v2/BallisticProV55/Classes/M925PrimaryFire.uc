class M925PrimaryFire extends BallisticProInstantFire;

simulated function ModeDoFire()
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

simulated function PreBeginPlay()
{
	// End:0x1B
	if(M925Machinegun_TW(Weapon) != none)
	{
		FireChaos = 0.0350000;
	}
	super(BallisticFire).PreBeginPlay();
	//return;	
}

defaultproperties
{
	TraceRange=(Min=15000.0000000,Max=15000.0000000)
	DamageType=Class'BallisticProV55.DTM925MG'
	DamageTypeHead=Class'BallisticProV55.DTM925MGHead'
	DamageTypeArm=Class'BallisticProV55.DTM925MG'
	KickForce=2000
	PenetrateForce=300
	bPenetrate=true
	BrassClass=Class'BallisticProV55.Brass_BigMG'
	BrassOffset=(X=6.0000000,Y=10.0000000,Z=0.0000000)
	bCockAfterEmpty=true
	DryFireSound=(Sound=Sound'BW_Core_WeaponSound.Misc.DryRifle',Volume=0.7000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	MuzzleFlashClass=Class'BallisticProV55.M925FlashEmitter'
	AimedFireAnim="AimedFire"
	FireRecoil=450.0000000
	FirePushbackForce=128.0000000
	FireChaos=0.1500000
	FireChaosCurve=(Points=((InVal=0.0000000,OutVal=1.0000000),(InVal=0.2400000,OutVal=1.0000000),(InVal=0.3500000,OutVal=1.5000000),(InVal=0.6600000,OutVal=2.2500000),(InVal=1.0000000,OutVal=3.5000000)))
	XInaccuracy=4.0000000
	YInaccuracy=4.0000000
	BallisticFireSound=(Sound=SoundGroup'BW_Core_WeaponSound.M925.M925-Fire',Volume=0.8000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	bPawnRapidFireAnim=true
	FireEndAnim="None"
	FireRate=0.2500000
	AmmoClass=Class'BallisticProV55.Ammo_50CalBelt'
	ShakeRotMag=(X=64.0000000,Y=64.0000000,Z=128.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-20.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-400.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=1.5000000
	WarnTargetPct=0.2000000
	aimerror=800.0000000
}
