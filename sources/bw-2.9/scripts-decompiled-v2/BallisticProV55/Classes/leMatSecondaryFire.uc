class leMatSecondaryFire extends BallisticProShotgunFire;

simulated function bool CheckShotgun()
{
	local int Channel;
	local name seq;
	local float frame, Rate;

	// End:0xF7
	if(!leMatRevolver(Weapon).bSecLoaded)
	{
		Weapon.GetAnimParams(Channel, seq, frame, Rate);
		// End:0x5B
		if(seq == leMatRevolver(Weapon).SGLoadAnim)
		{
			return false;
		}
		// End:0xD7
		if(!bPlayedDryFire && DryFireSound.Sound != none)
		{
			Weapon.PlayOwnedSound(DryFireSound.Sound, DryFireSound.Slot, DryFireSound.Volume, DryFireSound.bNoOverride, DryFireSound.Radius, DryFireSound.Pitch, DryFireSound.bAtten);
			bPlayedDryFire = true;
		}
		BW.EmptyFire(byte(ThisModeNum));
		bIsFiring = false;
		return false;
	}
	return true;
	//return;	
}

simulated event ModeDoFire()
{
	// End:0x0D
	if(!AllowFire())
	{
		return;
	}
	// End:0x1A
	if(!CheckShotgun())
	{
		return;
	}
	super.ModeDoFire();
	leMatRevolver(Weapon).ShotgunFired();
	//return;	
}

defaultproperties
{
	TraceCount=8
	TracerClass=Class'BallisticProV55.TraceEmitter_Shotgun'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	TraceRange=(Min=2500.0000000,Max=2500.0000000)
	DamageType=Class'BallisticProV55.DTleMatShotgun'
	DamageTypeHead=Class'BallisticProV55.DTleMatShotgunHead'
	DamageTypeArm=Class'BallisticProV55.DTleMatShotgun'
	PenetrateForce=100
	bPenetrate=true
	FlashBone="tip2"
	BrassOffset=(X=-1.0000000,Y=0.0000000,Z=-1.0000000)
	bUseWeaponMag=false
	DryFireSound=(Sound=Sound'BW_Core_WeaponSound.D49.D49-DryFire',Volume=0.6000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	FlashScaleFactor=2.0000000
	FireRecoil=512.0000000
	FireChaos=0.3000000
	XInaccuracy=350.0000000
	YInaccuracy=350.0000000
	BallisticFireSound=(Sound=Sound'BW_Core_WeaponSound.leMat.LM-SecFire',Volume=1.3000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	FireAnim="Fire2"
	FireEndAnim="None"
	AmmoClass=Class'BallisticProV55.Ammo_16GaugeleMat'
	ShakeRotMag=(X=128.0000000,Y=64.0000000,Z=0.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-12.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	BotRefireRate=0.7000000
	WarnTargetPct=0.5000000
}
