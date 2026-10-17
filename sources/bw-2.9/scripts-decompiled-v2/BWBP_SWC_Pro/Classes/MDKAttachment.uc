class MDKAttachment extends BallisticAttachment;

simulated function Vector GetModeTipLocation(optional byte Mode)
{
	local Vector X, Y, Z;

	// End:0xAE
	if((Instigator != none) && Instigator.IsFirstPerson())
	{
		// End:0x92
		if(MDKSubMachinegun(Instigator.Weapon).bScopeView)
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
	WeaponClass=Class'BWBP_SWC_Pro.MDKSubMachinegun'
	MuzzleFlashClass=Class'BWBP_SWC_Pro.MDKFlashEmitter'
	AltMuzzleFlashClass=Class'BWBP_SWC_Pro.MDKSilencedFlash'
	ImpactManager=Class'BallisticProV55.IM_Bullet'
	AltFlashBone="tip2"
	BrassClass=Class'BallisticProV55.Brass_Pistol'
	BrassMode=2
	InstantMode=2
	FlashMode=2
	TracerClass=Class'BallisticProV55.TraceEmitter_Default'
	TracerMix=-3
	WaterTracerClass=Class'BallisticProV55.TraceEmitter_WaterBullet'
	WaterTracerMode=2
	FlyBySound=(Sound=SoundGroup'BW_Core_WeaponSound.FlyBys.Bullet-Whizz',Volume=0.7000000,Radius=64.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	ReloadAnimRate=1.0750000
	CockAnimRate=0.9000000
	bRapidFire=true
	bAltRapidFire=true
	Mesh=SkeletalMesh'BWBP_SWC_Anims.MDK_TPm'
	RelativeLocation=(X=0.0000000,Y=0.0000000,Z=10.0000000)
	RelativeRotation=(Pitch=32768,Yaw=0,Roll=0)
	DrawScale=0.3500000
}
