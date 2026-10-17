class SKASAttachment extends BallisticShotgunAttachment;

simulated function FlashMuzzleFlash(byte Mode)
{
	local Rotator R;

	// End:0x54
	if(((int(FlashMode) == int(3)) || (int(FlashMode) == int(1)) && int(Mode) == 0) || (int(FlashMode) == int(0)) && int(Mode) != 0)
	{
		return;
	}
	// End:0x90
	if(Instigator.IsFirstPerson() && PlayerController(Instigator.Controller).ViewTarget == Instigator)
	{
		return;
	}
	// End:0xD3
	if((AltMuzzleFlashClass != none) && AltMuzzleFlash == none)
	{
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(AltMuzzleFlash, AltMuzzleFlashClass, DrawScale * FlashScale, self, AltFlashBone);
	}
	// End:0x116
	if((MuzzleFlashClass != none) && MuzzleFlash == none)
	{
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(MuzzleFlash, MuzzleFlashClass, DrawScale * FlashScale, self, FlashBone);
	}
	R = Instigator.Rotation;
	R.Pitch = Rotation.Pitch;
	// End:0x1A0
	if((int(Mode) == 0) || int(Mode) == 2)
	{
		// End:0x18B
		if(Class'BCoreProV55.BallisticMod'.default.bMuzzleSmoke)
		{
			Spawn(Class'BallisticProV55.MRT6Smoke',,, AltMuzzleFlash.Location, R);
		}
		AltMuzzleFlash.Trigger(self, Instigator);
	}
	// End:0x200
	if((int(Mode) == 0) || int(Mode) == 1)
	{
		// End:0x1EB
		if(Class'BCoreProV55.BallisticMod'.default.bMuzzleSmoke)
		{
			Spawn(Class'BallisticProV55.MRT6Smoke',,, MuzzleFlash.Location, R);
		}
		MuzzleFlash.Trigger(self, Instigator);
	}
	//return;	
}

function SKASUpdateHit(Actor HitActor, Vector HitLocation, Vector HitNormal, int HitSurf, optional bool bIsRight)
{
	mHitNormal = HitNormal;
	mHitActor = HitActor;
	mHitLocation = HitLocation;
	// End:0x35
	if(bIsRight)
	{
		FiringMode = 2;		
	}
	else
	{
		FiringMode = 1;
	}
	FireCount++;
	ThirdPersonEffects();
	//return;	
}

defaultproperties
{
	WeaponClass=Class'BWBP_SKC_Pro.SKASShotgun'
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	AltMuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	FlashScale=1.8000000
	BrassClass=Class'BallisticProV55.Brass_MRS138Shotgun'
	BrassMode=2
	InstantMode=2
	FlashMode=2
	LightMode=2
	TracerClass=Class'BallisticProV55.TraceEmitter_Shotgun'
	TracerChance=0.5000000
	ReloadAnim="Reload_AR"
	ReloadAnimRate=0.5750000
	CockAnimRate=0.7250000
	Mesh=SkeletalMesh'BWBP_SKC_Anim.SKAS_TPm'
	RelativeLocation=(X=-2.0000000,Y=0.0000000,Z=7.0000000)
	RelativeRotation=(Pitch=32768,Yaw=0,Roll=0)
	DrawScale=0.1300000
}
