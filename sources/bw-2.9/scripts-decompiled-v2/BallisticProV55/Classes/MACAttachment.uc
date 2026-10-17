class MACAttachment extends BallisticAttachment;

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
	// End:0x6D
	if(((Instigator != none) && Instigator.IsFirstPerson()) && PlayerController(Instigator.Controller).ViewTarget == Instigator)
	{
		return Instigator.Weapon.GetBoneCoords('tip').Origin;		
	}
	else
	{
		// End:0x97
		if(BallisticTurret(Instigator) != none)
		{
			return Instigator.GetBoneCoords('tip').Origin;
		}
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
			C = Instigator.GetBoneCoords('RightHandle');			
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
	// End:0x15B
	if(BallisticTurret(Instigator) != none)
	{
		EjectorAngle = Instigator.GetBoneRotation('RightHandle');
		return C.Origin + Class'BCoreProV55.BUtil'.static.AlignedOffset(EjectorAngle, vect(-12.0000000, -8.0000000, -4.0000000));		
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

simulated function Tick(float dt)
{
	local Rotator newRot;

	// End:0x5C
	if((Instigator != none) && !bHidden)
	{
		newRot = Instigator.Rotation;
		newRot.Pitch = Instigator.SmoothViewPitch;
		SetBoneDirection('Artillery', newRot,, 1.0000000, 1);
	}
	//return;	
}

defaultproperties
{
	WeaponClass=Class'BallisticProV55.MACWeapon'
	MuzzleFlashClass=Class'BallisticProV55.R78FlashEmitter'
	FlashScale=2.5000000
	BrassClass=Class'BallisticProV55.Brass_HAMR'
	InstantMode=3
	ReloadAnimRate=0.2650000
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.HAMR_TPm'
	DrawScale=0.2000000
}
