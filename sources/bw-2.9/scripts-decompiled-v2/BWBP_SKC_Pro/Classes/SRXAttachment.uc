class SRXAttachment extends BallisticAttachment;

var() Class<BCImpactManager> ImpactManagerAmp1;
var() Class<BCImpactManager> ImpactManagerAmp2;
var() Class<BCTraceEmitter> TracerClassAmp1;
var() Class<BCTraceEmitter> TracerClassAmp2;
var() Class<Actor> MuzzleFlashClassAmp1;
var Actor MuzzleFlashAmp1;
var() Class<Actor> MuzzleFlashClassAmp2;
var Actor MuzzleFlashAmp2;
var() array<Material> CamoMaterials;
var bool bAmp1;
var bool bOldAmp1;
var bool bAmp2;
var bool bOldAmp2;
var bool bAmped;
var bool bOldAmped;
var bool bSilenced;
var bool bOldSilenced;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		bAmp1, bAmp2, 
		bAmped, bSilenced;
}

simulated function PostNetBeginPlay()
{
	SetBoneScale(0, 0.0000000, 'Silencer');
	SetBoneScale(1, 0.0000000, 'AMP');
	super.PostNetBeginPlay();
	//return;	
}

simulated event PostNetReceive()
{
	// End:0x4C
	if(bSilenced != bOldSilenced)
	{
		bOldSilenced = bSilenced;
		// End:0x3B
		if(bSilenced)
		{
			SetBoneScale(0, 1.0000000, 'Silencer');			
		}
		else
		{
			SetBoneScale(0, 0.0000000, 'Silencer');
		}
	}
	// End:0x98
	if(bAmped != bOldAmped)
	{
		bOldAmped = bAmped;
		// End:0x87
		if(bAmped)
		{
			SetBoneScale(1, 1.0000000, 'AMP');			
		}
		else
		{
			SetBoneScale(1, 0.0000000, 'AMP');
		}
	}
	// End:0xEB
	if(bAmp1 != bOldAmp1)
	{
		bOldAmp1 = bAmp1;
		// End:0xEB
		if(bAmped && bAmp1)
		{
			Skins[13] = CamoMaterials[0];
			Skins[14] = CamoMaterials[2];
		}
	}
	// End:0x13E
	if(bAmp2 != bOldAmp2)
	{
		bOldAmp2 = bAmp2;
		// End:0x13E
		if(bAmped && bAmp2)
		{
			Skins[13] = CamoMaterials[1];
			Skins[14] = CamoMaterials[3];
		}
	}
	super.PostNetReceive();
	//return;	
}

simulated function SetSilenced(bool bIsSilenced)
{
	bSilenced = bIsSilenced;
	// End:0x2A
	if(bSilenced)
	{
		SetBoneScale(0, 1.0000000, 'Silencer');		
	}
	else
	{
		SetBoneScale(0, 0.0000000, 'Silencer');
	}
	//return;	
}

simulated function SetAmped(bool bIsAmped)
{
	bAmped = bIsAmped;
	// End:0x2A
	if(bAmped)
	{
		SetBoneScale(1, 1.0000000, 'AMP');		
	}
	else
	{
		SetBoneScale(1, 0.0000000, 'AMP');
	}
	//return;	
}

simulated event ThirdPersonEffects()
{
	// End:0xA4
	if((int(Level.NetMode) != int(NM_DedicatedServer)) && Instigator != none)
	{
		// End:0x54
		if(bSilenced)
		{
			SetBoneScale(0, 1.0000000, 'Silencer');
			SetBoneScale(1, 0.0000000, 'AMP');			
		}
		else
		{
			// End:0x82
			if(bAmped)
			{
				SetBoneScale(0, 0.0000000, 'Silencer');
				SetBoneScale(1, 1.0000000, 'AMP');				
			}
			else
			{
				SetBoneScale(0, 0.0000000, 'Silencer');
				SetBoneScale(0, 0.0000000, 'AMP');
			}
		}
	}
	super.ThirdPersonEffects();
	//return;	
}

simulated function SetAmpColour(bool bIsAmp1, bool bIsAmp2)
{
	bAmp1 = bIsAmp1;
	bAmp2 = bIsAmp2;
	// End:0x4F
	if(bAmped && bAmp1)
	{
		Skins[13] = CamoMaterials[0];
		Skins[14] = CamoMaterials[2];
	}
	// End:0x84
	if(bAmped && bAmp2)
	{
		Skins[13] = CamoMaterials[1];
		Skins[14] = CamoMaterials[3];
	}
	//return;	
}

simulated function Vector GetModeTipLocation(optional byte Mode)
{
	local Vector X, Y, Z;

	// End:0xAE
	if((Instigator != none) && Instigator.IsFirstPerson())
	{
		// End:0x92
		if(SRXRifle(Instigator.Weapon).bScopeView)
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

simulated function InstantFireEffects(byte Mode)
{
	local Vector HitLocation, Dir, Start;
	local Material HitMat;

	// End:0x54
	if(((int(InstantMode) == int(3)) || (int(InstantMode) == int(1)) && int(Mode) == 0) || (int(InstantMode) == int(0)) && int(Mode) != 0)
	{
		return;
	}
	// End:0x6D
	if(mHitLocation == vect(0.0000000, 0.0000000, 0.0000000))
	{
		return;
	}
	// End:0x7A
	if(Instigator == none)
	{
		return;
	}
	SpawnTracer(Mode, mHitLocation);
	FlyByEffects(Mode, mHitLocation);
	// End:0x1ED
	if(int(Level.NetMode) == int(NM_Client))
	{
		mHitActor = none;
		Start = Instigator.Location + Instigator.EyePosition();
		// End:0x109
		if(int(WallPenetrates) != 0)
		{
			WallPenetrates = 0;
			DoWallPenetrate(Mode, Start, mHitLocation);
		}
		Dir = Normal(mHitLocation - Start);
		mHitActor = Trace(HitLocation, mHitNormal, mHitLocation + (Dir * float(10)), mHitLocation - (Dir * float(10)), false,, HitMat);
		// End:0x188
		if((ImpactManager != none) && bDoWaterSplash)
		{
			DoWaterTrace(int(Mode), Start, mHitLocation);
		}
		// End:0x195
		if(mHitActor == none)
		{
			return;
		}
		// End:0x1B0
		if(Vehicle(mHitActor) != none)
		{
			mHitSurf = 3;			
		}
		else
		{
			// End:0x1D4
			if(HitMat == none)
			{
				mHitSurf = int(mHitActor.SurfaceType);				
			}
			else
			{
				mHitSurf = int(HitMat.SurfaceType);
			}
		}		
	}
	else
	{
		HitLocation = mHitLocation;
	}
	// End:0x2B8
	if((((((int(Level.NetMode) != int(NM_Client)) && ImpactManager != none) && WaterHitLocation != vect(0.0000000, 0.0000000, 0.0000000)) && bDoWaterSplash) && int(Level.DetailMode) >= int(1)) && int(Class'BCoreProV55.BallisticMod'.default.EffectsDetailMode) > 0)
	{
		ImpactManager.static.StartSpawn(WaterHitLocation, Normal((Instigator.Location + Instigator.EyePosition()) - WaterHitLocation), 9, Instigator);
	}
	// End:0x2FF
	if((mHitActor == none) || (!mHitActor.bWorldGeometry && Mover(mHitActor) == none) && Vehicle(mHitActor) == none)
	{
		return;
	}
	// End:0x346
	if(((ImpactManagerAmp1 != none) && bAmped) && bAmp1)
	{
		ImpactManagerAmp1.static.StartSpawn(HitLocation, mHitNormal, mHitSurf, Instigator);		
	}
	else
	{
		// End:0x38D
		if(((ImpactManagerAmp2 != none) && bAmped) && bAmp2)
		{
			ImpactManagerAmp2.static.StartSpawn(HitLocation, mHitNormal, mHitSurf, Instigator);			
		}
		else
		{
			// End:0x3BB
			if(ImpactManager != none)
			{
				ImpactManager.static.StartSpawn(HitLocation, mHitNormal, mHitSurf, Instigator);
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

	// End:0x33
	if((int(Level.DetailMode) < int(1)) || int(Class'BCoreProV55.BallisticMod'.default.EffectsDetailMode) == 0)
	{
		return;
	}
	TipLoc = GetModeTipLocation();
	dist = VSize(V - TipLoc);
	// End:0x69
	if(TracerMix == 0)
	{
		bThisShot = true;		
	}
	else
	{
		TracerCounter++;
		// End:0xA9
		if(TracerMix < 0)
		{
			// End:0x9E
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
			// End:0xC7
			if(TracerCounter >= TracerMix)
			{
				TracerCounter = 0;
				bThisShot = true;
			}
		}
	}
	// End:0x143
	if((((TracerClassAmp1 != none) && bThisShot) && bAmp1) && bAmped)
	{
		// End:0x124
		if(dist > float(200))
		{
			Tracer = Spawn(TracerClassAmp1, self,, TipLoc, Rotator(V - TipLoc));
		}
		// End:0x143
		if(Tracer != none)
		{
			Tracer.Initialize(dist);
		}
	}
	// End:0x1BF
	if((((TracerClassAmp2 != none) && bThisShot) && bAmp2) && bAmped)
	{
		// End:0x1A0
		if(dist > float(200))
		{
			Tracer = Spawn(TracerClassAmp2, self,, TipLoc, Rotator(V - TipLoc));
		}
		// End:0x1BF
		if(Tracer != none)
		{
			Tracer.Initialize(dist);
		}
	}
	// End:0x24E
	if(((((TracerClass != none) && bThisShot) && int(Mode) == 0) && !bAmped) && !bSilenced)
	{
		// End:0x22F
		if(dist > float(200))
		{
			Tracer = Spawn(TracerClass, self,, TipLoc, Rotator(V - TipLoc));
		}
		// End:0x24E
		if(Tracer != none)
		{
			Tracer.Initialize(dist);
		}
	}
	// End:0x380
	if((((((Instigator != none) && Instigator.PhysicsVolume.bWaterVolume) && int(Level.DetailMode) == int(2)) && WaterTracerClass != none) && int(WaterTracerMode) != int(3)) && ((int(WaterTracerMode) == int(2)) || (int(WaterTracerMode) == int(1)) && int(Mode) != 0) || (int(WaterTracerMode) == int(0)) && int(Mode) == 0)
	{
		// End:0x358
		if(!Instigator.PhysicsVolume.TraceThisActor(WLoc, WNorm, TipLoc, V))
		{
			Tracer = Spawn(WaterTracerClass, self,, TipLoc, Rotator(WLoc - TipLoc));
		}
		// End:0x380
		if(Tracer != none)
		{
			Tracer.Initialize(VSize(WLoc - TipLoc));
		}
	}
	//return;	
}

simulated function FlashMuzzleFlash(byte Mode)
{
	local Rotator R;

	// End:0x1B
	if(bRandomFlashRoll)
	{
		R.Roll = Rand(65536);
	}
	// End:0x6F
	if(((int(FlashMode) == int(3)) || (int(FlashMode) == int(1)) && int(Mode) == 0) || (int(FlashMode) == int(0)) && int(Mode) != 0)
	{
		return;
	}
	// End:0xAB
	if(Instigator.IsFirstPerson() && PlayerController(Instigator.Controller).ViewTarget == Instigator)
	{
		return;
	}
	// End:0x136
	if(((MuzzleFlashClassAmp1 != none) && bAmp1) && bAmped)
	{
		// End:0x102
		if(MuzzleFlashAmp1 == none)
		{
			Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(MuzzleFlashAmp1, MuzzleFlashClassAmp1, DrawScale * 0.1000000, self, AltFlashBone);
		}
		MuzzleFlashAmp1.Trigger(self, Instigator);
		// End:0x136
		if(bRandomFlashRoll)
		{
			SetBoneRotation(AltFlashBone, R, 0, 1.0000000);
		}
	}
	// End:0x1C1
	if(((MuzzleFlashClassAmp2 != none) && bAmp2) && bAmped)
	{
		// End:0x18D
		if(MuzzleFlashAmp2 == none)
		{
			Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(MuzzleFlashAmp2, MuzzleFlashClassAmp2, DrawScale * 0.1000000, self, AltFlashBone);
		}
		MuzzleFlashAmp2.Trigger(self, Instigator);
		// End:0x1C1
		if(bRandomFlashRoll)
		{
			SetBoneRotation(AltFlashBone, R, 0, 1.0000000);
		}
	}
	// End:0x22F
	if(((AltMuzzleFlashClass != none) && !bAmped) && bSilenced)
	{
		// End:0x21A
		if(AltMuzzleFlash == none)
		{
			Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(AltMuzzleFlash, AltMuzzleFlashClass, DrawScale * 0.1000000, self, AltFlashBone);
		}
		AltMuzzleFlash.Trigger(self, Instigator);
	}
	// End:0x2AE
	if((((MuzzleFlashClass != none) && int(Mode) == 0) && !bAmped) && !bSilenced)
	{
		// End:0x299
		if(MuzzleFlash == none)
		{
			Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(MuzzleFlash, MuzzleFlashClass, DrawScale * 0.1000000, self, FlashBone);
		}
		MuzzleFlash.Trigger(self, Instigator);
	}
	//return;	
}

defaultproperties
{
	ImpactManagerAmp1=Class'BWBP_SKC_Pro.IM_BulletAmpInc'
	ImpactManagerAmp2=Class'BWBP_SKC_Pro.IM_BulletAmpAcid'
	TracerClassAmp1=Class'BWBP_SKC_Pro.TraceEmitter_HMG'
	TracerClassAmp2=Class'BWBP_SKC_Pro.TraceEmitter_Tranq'
	MuzzleFlashClassAmp1=Class'BWBP_SKC_Pro.SRXFlashEmitter'
	MuzzleFlashClassAmp2=Class'BallisticProV55.A500FlashEmitter'
	CamoMaterials[0]=Shader'BW_Core_WeaponTex.AMP.Amp-FinalRed'
	CamoMaterials[1]=Shader'BW_Core_WeaponTex.AMP.Amp-FinalGreen'
	CamoMaterials[2]=Shader'BW_Core_WeaponTex.AMP.Amp-GlowRedShader'
	CamoMaterials[3]=Shader'BW_Core_WeaponTex.AMP.Amp-GlowGreenShader'
	WeaponClass=Class'BWBP_SKC_Pro.SRXRifle'
	MuzzleFlashClass=Class'BallisticProV55.M50FlashEmitter'
	AltMuzzleFlashClass=Class'BWBP_SKC_Pro.SRXSilencedFlash'
	ImpactManager=Class'BallisticProV55.IM_Bullet'
	AltFlashBone="tip2"
	FlashScale=0.9000000
	BrassClass=Class'BallisticProV55.Brass_Rifle'
	TracerClass=Class'BallisticProV55.TraceEmitter_Default'
	WaterTracerClass=Class'BallisticProV55.TraceEmitter_WaterBullet'
	WaterTracerMode=2
	FlyBySound=(Sound=SoundGroup'BW_Core_WeaponSound.FlyBys.Bullet-Whizz',Volume=0.7000000,Radius=64.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	ReloadAnimRate=0.9250000
	CockAnimRate=0.9500000
	bRapidFire=true
	Mesh=SkeletalMesh'BWBP_SKC_Anim.SRX_TPm'
	RelativeLocation=(X=5.0000000,Y=0.0000000,Z=4.0000000)
	RelativeRotation=(Pitch=32768,Yaw=0,Roll=0)
	DrawScale=0.6500000
	Skins[0]=Texture'BWBP_SKC_Tex.SRX.SRX-Rifle'
	Skins[1]=Texture'BWBP_SKC_Tex.SRX.SRX-StockBlack'
	Skins[2]=Texture'BWBP_SKC_Tex.SRX.SRX-Irons'
	Skins[3]=Texture'BWBP_SKC_Tex.SRX.SRX-Holo'
	Skins[4]=Texture'BWBP_SKC_Tex.SRX.SRX-Cable'
	Skins[5]=Texture'BWBP_SKC_Tex.SRX.SRX-Plating'
	Skins[6]=Texture'BWBP_SKC_Tex.SRX.SRX-Barrel'
	Skins[7]=Texture'BWBP_SKC_Tex.SRX.SRX-Misc'
	Skins[8]=Texture'BWBP_SKC_Tex.SRX.SRX-Muzzle'
	Skins[9]=Texture'UCGeneric.SolidColours.Black'
	Skins[10]=none
	Skins[11]=none
	Skins[12]=Texture'BWBP_SKC_Tex.SRX.SRX-Supp'
	Skins[13]=Texture'BW_Core_WeaponTex.AMP.Amp-BaseRed'
	Skins[14]=Texture'BW_Core_WeaponTex.AMP.Amp-GlowRed'
}
