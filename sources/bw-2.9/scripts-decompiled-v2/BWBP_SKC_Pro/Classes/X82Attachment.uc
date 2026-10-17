class X82Attachment extends BallisticAttachment;

simulated event PreBeginPlay()
{
	super(Actor).PreBeginPlay();
	// End:0x35
	if(Class'BCoreProV55.BallisticReplicationInfo'.static.IsClassic())
	{
		TracerClass = Class'BWBP_SKC_Pro.TraceEmitter_X83AM';
		TracerChance = 1.0000000;
		TracerMix = 0;
	}
	//return;	
}

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
	local Coords C;
	local Vector X, Y, Z, loc;

	// End:0xF5
	if(((Instigator != none) && Instigator.IsFirstPerson()) && PlayerController(Instigator.Controller).ViewTarget == Instigator)
	{
		// End:0xD9
		if(X82Rifle(Instigator.Weapon).bScopeView)
		{
			Instigator.Weapon.GetViewAxes(X, Y, Z);
			loc = ((Instigator.Location + Instigator.EyePosition()) + (X * float(20))) + (Z * float(-10));
			return loc;			
		}
		else
		{
			return Instigator.Weapon.GetEffectStart();
		}		
	}
	else
	{
		// End:0x12D
		if(BallisticTurret(Instigator) != none)
		{
			C = Instigator.GetBoneCoords('tip');
			return C.Origin;			
		}
		else
		{
			C = GetBoneCoords('tip');
			return C.Origin;
		}
	}
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
	WeaponClass=Class'BWBP_SKC_Pro.X82Rifle'
	MuzzleFlashClass=Class'BallisticProV55.R78FlashEmitter'
	ImpactManager=Class'BWBP_SKC_Pro.IM_ExpBullet'
	BrassClass=Class'BWBP_SKC_Pro.Brass_BMG'
	TracerClass=Class'BWBP_SKC_Pro.TraceEmitter_HMG'
	WaterTracerClass=Class'BallisticProV55.TraceEmitter_WaterBullet'
	WaterTracerMode=2
	FlyBySound=(Sound=Sound'BWBP_SKC_Sounds.X82.X83-FlyBy',Volume=2.5000000,Radius=64.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	ReloadAnimRate=0.4800000
	CockAnimRate=1.0750000
	Mesh=SkeletalMesh'BWBP_SKC_Anim.X83_TPm'
	RelativeLocation=(X=-17.0000000,Y=0.0000000,Z=-4.0000000)
	RelativeRotation=(Pitch=32768,Yaw=0,Roll=0)
	DrawScale=0.2500000
}
