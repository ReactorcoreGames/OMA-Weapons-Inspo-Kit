class M353Attachment extends BallisticAttachment;

simulated event PostNetBeginPlay()
{
	super.PostNetBeginPlay();
	// End:0x1E
	if(BallisticTurret(Instigator) != none)
	{
		bHidden = true;
	}
	//return;	
}

simulated function Vector GetModeTipLocation(optional byte Mode)
{
	// End:0x60
	if(((Instigator != none) && Instigator.IsFirstPerson()) && PlayerController(Instigator.Controller).ViewTarget == Instigator)
	{
		return Instigator.Weapon.GetEffectStart();
	}
	// End:0x8A
	if(BallisticTurret(Instigator) != none)
	{
		return Instigator.GetBoneCoords('tip').Origin;
	}
	return GetBoneCoords('tip').Origin;
	//return;	
}

simulated function Vector GetEjectorLocation(optional out Rotator EjectorAngle)
{
	local Coords C;

	// End:0x6D
	if(((Instigator != none) && Instigator.IsFirstPerson()) && PlayerController(Instigator.Controller).ViewTarget == Instigator)
	{
		C = Instigator.Weapon.GetBoneCoords(BrassBone);		
	}
	else
	{
		// End:0x9A
		if(BallisticTurret(Instigator) != none)
		{
			C = Instigator.GetBoneCoords(BrassBone);			
		}
		else
		{
			C = GetBoneCoords(BrassBone);
		}
	}
	// End:0x100
	if((Instigator != none) && VSize(C.Origin - Instigator.Location) > float(200))
	{
		EjectorAngle = Instigator.Rotation;
		return Instigator.Location;
	}
	// End:0x12D
	if(BallisticTurret(Instigator) != none)
	{
		EjectorAngle = Instigator.GetBoneRotation(BrassBone);		
	}
	else
	{
		EjectorAngle = GetBoneRotation(BrassBone);
	}
	return C.Origin;
	//return;	
}

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
	// End:0x159
	if((int(Mode) != 0) && AltMuzzleFlashClass != none)
	{
		// End:0x122
		if(AltMuzzleFlash == none)
		{
			// End:0xF7
			if(BallisticTurret(Instigator) != none)
			{
				Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(AltMuzzleFlash, AltMuzzleFlashClass, DrawScale * 1.6660000, Instigator, AltFlashBone);				
			}
			else
			{
				Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(AltMuzzleFlash, AltMuzzleFlashClass, DrawScale * FlashScale, self, AltFlashBone);
			}
		}
		AltMuzzleFlash.Trigger(self, Instigator);
		// End:0x156
		if(bRandomFlashRoll)
		{
			SetBoneRotation(AltFlashBone, R, 0, 1.0000000);
		}		
	}
	else
	{
		// End:0x21F
		if((int(Mode) == 0) && MuzzleFlashClass != none)
		{
			// End:0x1EB
			if(MuzzleFlash == none)
			{
				// End:0x1C0
				if(BallisticTurret(Instigator) != none)
				{
					Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(MuzzleFlash, MuzzleFlashClass, DrawScale * 1.6660000, Instigator, FlashBone);					
				}
				else
				{
					Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(MuzzleFlash, MuzzleFlashClass, DrawScale * FlashScale, self, FlashBone);
				}
			}
			MuzzleFlash.Trigger(self, Instigator);
			// End:0x21F
			if(bRandomFlashRoll)
			{
				SetBoneRotation(FlashBone, R, 0, 1.0000000);
			}
		}
	}
	//return;	
}

defaultproperties
{
	WeaponClass=Class'BallisticProV55.M353Machinegun'
	MuzzleFlashClass=Class'BallisticProV55.M353FlashEmitter'
	ImpactManager=Class'BallisticProV55.IM_Bullet'
	BrassClass=Class'BallisticProV55.Brass_MG'
	TracerClass=Class'BallisticProV55.TraceEmitter_Default'
	WaterTracerClass=Class'BallisticProV55.TraceEmitter_WaterBullet'
	WaterTracerMode=2
	FlyBySound=(Sound=SoundGroup'BW_Core_WeaponSound.FlyBys.Bullet-Whizz',Volume=0.7000000,Radius=64.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	ReloadAnim="Reload_MG"
	ReloadAnimRate=0.9750000
	CockAnimRate=0.7900000
	bHeavy=true
	bRapidFire=true
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.M353_TPm'
	DrawScale=0.3400000
}
