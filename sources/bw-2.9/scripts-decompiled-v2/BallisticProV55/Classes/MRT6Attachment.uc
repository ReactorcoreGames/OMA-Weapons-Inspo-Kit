class MRT6Attachment extends BallisticShotgunAttachment;

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

simulated function EjectBrass(byte Mode)
{
	// End:0x3B
	if((int(Mode) == 0) || int(Mode) == 2)
	{
		BrassBone = 'EjectorR';
		BrassClass = Class'BallisticProV55.Brass_MRT6Right';
		super(BallisticAttachment).EjectBrass(0);
	}
	// End:0x75
	if((int(Mode) == 0) || int(Mode) == 1)
	{
		BrassBone = 'EjectorR';
		BrassClass = Class'BallisticProV55.Brass_MRT6Left';
		super(BallisticAttachment).EjectBrass(0);
	}
	//return;	
}

function MRT6UpdateHit(Actor HitActor, Vector HitLocation, Vector HitNormal, int HitSurf, optional bool bIsRight)
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
	WeaponClass=Class'BallisticProV55.MRT6Shotgun'
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	AltMuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	AltFlashBone="tip2"
	FlashScale=1.8000000
	BrassClass=Class'BallisticProV55.Brass_MRT6Left'
	BrassMode=2
	InstantMode=2
	FlashMode=2
	LightMode=2
	TracerClass=Class'BallisticProV55.TraceEmitter_MRTsix'
	TracerChance=0.5000000
	ReloadAnim="Reload_Pistol"
	CockingAnim="Cock_RearPull"
	ReloadAnimRate=0.9500000
	CockAnimRate=1.1000000
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.MRT6_TPm'
	DrawScale=0.2500000
}
