class AS50Attachment extends BallisticAttachment;

var() Class<BCTraceEmitter> AltTracerClass;

simulated event PreBeginPlay()
{
	super(Actor).PreBeginPlay();
	// End:0x23
	if(Class'BCoreProV55.BallisticReplicationInfo'.static.IsClassicOrRealism())
	{
		ImpactManager = Class'BallisticProV55.IM_IncendiaryHMGBullet';
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
	local Vector X, Y, Z, loc;

	// End:0xF5
	if(((Instigator != none) && Instigator.IsFirstPerson()) && PlayerController(Instigator.Controller).ViewTarget == Instigator)
	{
		// End:0xD9
		if(AS50Rifle(Instigator.Weapon).bScopeView)
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
		return GetBoneCoords('tip').Origin;
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

simulated function SpawnTracer(byte Mode, Vector V)
{
	local BCTraceEmitter Tracer;
	local Vector TipLoc, WLoc, WNorm;
	local float dist;
	local bool bThisShot;

	// End:0x18
	if(int(Class'BCoreProV55.BallisticMod'.default.EffectsDetailMode) == 0)
	{
		return;
	}
	TipLoc = GetModeTipLocation();
	dist = VSize(V - TipLoc);
	// End:0x4E
	if(TracerMix == 0)
	{
		bThisShot = true;		
	}
	else
	{
		TracerCounter++;
		// End:0x8E
		if(TracerMix < 0)
		{
			// End:0x83
			if(TracerCounter >= -TracerMix)
			{
				TracerCounter = 0;
				bThisShot = false;				
			}
			else
			{
				bThisShot = true;
			}			
		}
		else
		{
			// End:0xAC
			if(TracerCounter >= TracerMix)
			{
				TracerCounter = 0;
				bThisShot = true;
			}
		}
	}
	// End:0x1C8
	if(((((TracerClass != none) && int(TracerMode) != int(3)) && ((int(TracerMode) == int(2)) || (int(TracerMode) == int(1)) && int(Mode) != 0) || (int(TracerMode) == int(0)) && int(Mode) == 0) && bThisShot) && (TracerChance >= float(1)) || FRand() < TracerChance)
	{
		// End:0x1A9
		if(dist > float(200))
		{
			// End:0x186
			if(int(Mode) == 0)
			{
				Tracer = Spawn(TracerClass, self,, TipLoc, Rotator(V - TipLoc));				
			}
			else
			{
				Tracer = Spawn(AltTracerClass, self,, TipLoc, Rotator(V - TipLoc));
			}
		}
		// End:0x1C8
		if(Tracer != none)
		{
			Tracer.Initialize(dist);
		}
	}
	// End:0x2FA
	if((((((Instigator != none) && Instigator.PhysicsVolume.bWaterVolume) && int(Level.DetailMode) == int(2)) && WaterTracerClass != none) && int(WaterTracerMode) != int(3)) && ((int(WaterTracerMode) == int(2)) || (int(WaterTracerMode) == int(1)) && int(Mode) != 0) || (int(WaterTracerMode) == int(0)) && int(Mode) == 0)
	{
		// End:0x2D2
		if(!Instigator.PhysicsVolume.TraceThisActor(WLoc, WNorm, TipLoc, V))
		{
			Tracer = Spawn(WaterTracerClass, self,, TipLoc, Rotator(WLoc - TipLoc));
		}
		// End:0x2FA
		if(Tracer != none)
		{
			Tracer.Initialize(VSize(WLoc - TipLoc));
		}
	}
	//return;	
}

defaultproperties
{
	AltTracerClass=Class'BWBP_SKC_Pro.TraceEmitter_Incendiary'
	WeaponClass=Class'BWBP_SKC_Pro.AS50Rifle'
	MuzzleFlashClass=Class'BallisticProV55.M925FlashEmitter'
	ImpactManager=Class'BallisticProV55.IM_IncendiaryBullet'
	FlashScale=0.7000000
	BrassClass=Class'BWBP_SKC_Pro.Brass_BMGInc'
	TracerMode=1
	InstantMode=2
	TracerClass=Class'BWBP_SKC_Pro.TraceEmitter_HMG'
	TracerChance=2.0000000
	WaterTracerClass=Class'BallisticProV55.TraceEmitter_WaterBullet'
	WaterTracerMode=2
	FlyBySound=(Sound=Sound'BWBP_SKC_Sounds.AH104.AH104-FlyBy',Volume=1.8000000,Radius=64.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	ReloadAnimRate=0.5000000
	CockAnimRate=0.6650000
	Mesh=SkeletalMesh'BWBP_SKC_Anim.FSSG-50_TPm'
	RelativeLocation=(X=1.0000000,Y=0.0000000,Z=2.0000000)
	RelativeRotation=(Pitch=32768,Yaw=0,Roll=0)
	PrePivot=(X=0.0000000,Y=0.0000000,Z=-1.0000000)
	Skins[0]=Texture'BWBP_SKC_Tex.FSG50.FSG-Main'
	Skins[1]=Texture'BWBP_SKC_Tex.FSG50.FSG-Scope'
	Skins[2]=Texture'BWBP_SKC_Tex.FSG50.FSG-Misc'
	Skins[3]=Texture'BWBP_SKC_Tex.FSG50.FSG-Stock'
}
