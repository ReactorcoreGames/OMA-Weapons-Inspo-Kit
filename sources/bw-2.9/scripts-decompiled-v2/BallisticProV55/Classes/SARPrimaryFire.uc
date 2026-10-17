class SARPrimaryFire extends BallisticProInstantFire;

function PlayFiring()
{
	// End:0x46
	if(SARAssaultRifle(Weapon).bStockExtended && !SARAssaultRifle(Weapon).bStockBoneOpen)
	{
		SARAssaultRifle(Weapon).SetStockRotation();
	}
	PlayFireAnimations();
	// End:0xB3
	if(BallisticFireSound.Sound != none)
	{
		Weapon.PlayOwnedSound(BallisticFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);
	}
	CheckClipFinished();
	//return;	
}

function EjectBrass()
{
	local Vector Start, X, Y, Z;
	local Coords C;
	local Actor BrassActor;

	// End:0x1B
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		return;
	}
	// End:0x4C
	if(!Class'BCoreProV55.BallisticMod'.default.bEjectBrass || int(Level.DetailMode) < int(1))
	{
		return;
	}
	// End:0x59
	if(BrassClass == none)
	{
		return;
	}
	// End:0x97
	if(!Instigator.IsFirstPerson() || PlayerController(Instigator.Controller).ViewTarget != Instigator)
	{
		return;
	}
	// End:0xB2
	if(AIController(Instigator.Controller) != none)
	{
		return;
	}
	C = Weapon.GetBoneCoords(BrassBone);
	Weapon.GetViewAxes(X, Y, Z);
	Start = ((C.Origin + (X * BrassOffset.X)) + (Y * BrassOffset.Y)) + (Z * BrassOffset.Z);
	BrassActor = Spawn(BrassClass, Weapon,, Start, Rotator(C.XAxis));
	// End:0x21F
	if(BrassActor != none)
	{
		BrassActor.bHidden = true;
		SARAssaultRifle(Weapon).UziBrassList.Length = SARAssaultRifle(Weapon).UziBrassList.Length + 1;
		SARAssaultRifle(Weapon).UziBrassList[SARAssaultRifle(Weapon).UziBrassList.Length - 1].Actor = BrassActor;
		SARAssaultRifle(Weapon).UziBrassList[SARAssaultRifle(Weapon).UziBrassList.Length - 1].KillTime = Level.TimeSeconds + 0.2000000;
	}
	//return;	
}

defaultproperties
{
	TraceRange=(Min=9000.0000000,Max=9000.0000000)
	DamageType=Class'BallisticProV55.DTSARRifle'
	DamageTypeHead=Class'BallisticProV55.DTSARRifleHead'
	DamageTypeArm=Class'BallisticProV55.DTSARRifle'
	PenetrateForce=150
	bPenetrate=true
	BrassClass=Class'BallisticProV55.Brass_SAR'
	BrassBone="tip"
	BrassOffset=(X=-105.0000000,Y=-10.0000000,Z=-1.0000000)
	bCockAfterEmpty=true
	ClipFinishSound=(Sound=Sound'BW_Core_WeaponSound.Misc.ClipEnd-1',Volume=0.8000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	DryFireSound=(Sound=Sound'BW_Core_WeaponSound.Misc.DryRifle',Volume=0.7000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	MuzzleFlashClass=Class'BallisticProV55.FlashEmitter_AR'
	FlashScaleFactor=0.9000000
	AimedFireAnim="AimedFire"
	FireRecoil=180.0000000
	FireChaos=0.0220000
	FireChaosCurve=(Points=((InVal=0.0000000,OutVal=1.0000000),(InVal=0.1600000,OutVal=1.0000000),(InVal=0.2500000,OutVal=1.5000000),(InVal=0.5000000,OutVal=2.2500000),(InVal=0.7500000,OutVal=3.5000000),(InVal=1.0000000,OutVal=5.0000000)))
	XInaccuracy=48.0000000
	YInaccuracy=48.0000000
	BallisticFireSound=(Sound=Sound'BW_Core_WeaponSound.SAR.SAR-Fire',Volume=0.9000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	bPawnRapidFireAnim=true
	bModeExclusive=false
	FireEndAnim="None"
	FireRate=0.0900000
	AmmoClass=Class'BallisticProV55.Ammo_556mm'
	ShakeRotMag=(X=48.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotRate=(X=640.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-5.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-100.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	WarnTargetPct=0.2000000
	aimerror=900.0000000
}
