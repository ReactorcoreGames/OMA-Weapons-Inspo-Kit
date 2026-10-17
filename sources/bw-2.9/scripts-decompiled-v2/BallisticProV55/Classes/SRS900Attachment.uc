class SRS900Attachment extends BallisticAttachment;

simulated function Vector GetModeTipLocation(optional byte Mode)
{
	local Vector X, Y, Z;

	// End:0xAE
	if((Instigator != none) && Instigator.IsFirstPerson())
	{
		// End:0x92
		if(SRS900Rifle(Instigator.Weapon).bScopeView)
		{
			Instigator.Weapon.GetViewAxes(X, Y, Z);
			return (Instigator.Location + (X * float(20))) + (Z * float(5));			
		}
		else
		{
			return Instigator.Weapon.GetEffectStart();
		}		
	}
	else
	{
		return GetBoneCoords('tip').Origin;
	}
	//return;	
}

simulated event ThirdPersonEffects()
{
	// End:0x58
	if((int(Level.NetMode) != int(NM_DedicatedServer)) && Instigator != none)
	{
		// End:0x47
		if(int(FiringMode) == 1)
		{
			SetBoneScale(0, 1.0000000, 'Silencer');			
		}
		else
		{
			SetBoneScale(0, 0.0000000, 'Silencer');
		}
	}
	super.ThirdPersonEffects();
	//return;	
}

simulated event PostBeginPlay()
{
	super.PostBeginPlay();
	SetBoneScale(0, 0.0000000, 'Silencer');
	//return;	
}

simulated function FlashMuzzleFlash(byte Mode)
{
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
	// End:0xF8
	if((int(Mode) != 0) && AltMuzzleFlashClass != none)
	{
		// End:0xE0
		if(AltMuzzleFlash == none)
		{
			Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(AltMuzzleFlash, AltMuzzleFlashClass, DrawScale * 0.6000000, self, AltFlashBone);
		}
		AltMuzzleFlash.Trigger(self, Instigator);		
	}
	else
	{
		// End:0x15D
		if((int(Mode) == 0) && MuzzleFlashClass != none)
		{
			// End:0x148
			if(MuzzleFlash == none)
			{
				Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(MuzzleFlash, MuzzleFlashClass, DrawScale * FlashScale, self, FlashBone);
			}
			MuzzleFlash.Trigger(self, Instigator);
		}
	}
	//return;	
}

defaultproperties
{
	WeaponClass=Class'BallisticProV55.SRS900Rifle'
	MuzzleFlashClass=Class'BallisticProV55.M50FlashEmitter'
	AltMuzzleFlashClass=Class'BallisticProV55.XK2SilencedFlash'
	ImpactManager=Class'BallisticProV55.IM_Bullet'
	AltFlashBone="tip2"
	FlashScale=0.8000000
	BrassClass=Class'BallisticProV55.Brass_Rifle'
	BrassMode=2
	InstantMode=2
	FlashMode=2
	TracerClass=Class'BallisticProV55.TraceEmitter_Default'
	WaterTracerClass=Class'BallisticProV55.TraceEmitter_WaterBullet'
	WaterTracerMode=2
	FlyBySound=(Sound=SoundGroup'BW_Core_WeaponSound.FlyBys.Bullet-Whizz',Volume=0.7000000,Radius=64.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	ReloadAnimRate=0.8000000
	CockAnimRate=1.2000000
	bRapidFire=true
	bAltRapidFire=true
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.SRS900_TPm'
	RelativeLocation=(X=2.0000000,Y=0.0000000,Z=2.5000000)
	DrawScale=0.2500000
}
