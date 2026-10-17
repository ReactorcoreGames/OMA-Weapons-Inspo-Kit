class FMPAttachment extends BallisticAttachment;

var() Class<BCImpactManager> ImpactManagerRed;
var() Class<BCImpactManager> ImpactManagerGreen;
var() Class<BCTraceEmitter> TracerClassRed;
var() Class<BCTraceEmitter> TracerClassGreen;
var() Class<Actor> MuzzleFlashClassRed;
var Actor MuzzleFlashRed;
var() Class<Actor> MuzzleFlashClassGreen;
var Actor MuzzleFlashGreen;
var float AmpFlashScale;
var() name AmpBone;
var() array<Material> CamoMaterials;
var bool bRedAmp;
var bool bOldRedAmp;
var bool bGreenAmp;
var bool bOldGreenAmp;
var bool bAmped;
var bool bOldAmped;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		bAmped, bGreenAmp, 
		bRedAmp;
}

simulated function PostNetBeginPlay()
{
	SetBoneScale(0, 0.0000000, AmpBone);
	super.PostNetBeginPlay();
	//return;	
}

simulated event PostNetReceive()
{
	// End:0x4C
	if(bAmped != bOldAmped)
	{
		bOldAmped = bAmped;
		// End:0x3B
		if(bAmped)
		{
			SetBoneScale(0, 1.0000000, AmpBone);			
		}
		else
		{
			SetBoneScale(0, 0.0000000, AmpBone);
		}
	}
	// End:0x9F
	if(bRedAmp != bOldRedAmp)
	{
		bOldRedAmp = bRedAmp;
		// End:0x9F
		if(bAmped && bRedAmp)
		{
			Skins[2] = CamoMaterials[0];
			Skins[3] = CamoMaterials[2];
		}
	}
	// End:0xF2
	if(bGreenAmp != bOldGreenAmp)
	{
		bOldGreenAmp = bGreenAmp;
		// End:0xF2
		if(bAmped && bGreenAmp)
		{
			Skins[2] = CamoMaterials[1];
			Skins[3] = CamoMaterials[3];
		}
	}
	super.PostNetReceive();
	//return;	
}

simulated function SetAmped(bool bIsAmped)
{
	bAmped = bIsAmped;
	// End:0x2A
	if(bAmped)
	{
		SetBoneScale(0, 1.0000000, AmpBone);		
	}
	else
	{
		SetBoneScale(0, 0.0000000, AmpBone);
	}
	//return;	
}

simulated event ThirdPersonEffects()
{
	// End:0x54
	if((int(Level.NetMode) != int(NM_DedicatedServer)) && Instigator != none)
	{
		// End:0x43
		if(bAmped)
		{
			SetBoneScale(0, 1.0000000, AmpBone);			
		}
		else
		{
			SetBoneScale(0, 0.0000000, AmpBone);
		}
	}
	super.ThirdPersonEffects();
	//return;	
}

simulated function SetAmpColour(bool bIsRedAmp, bool bIsGreenAmp)
{
	bRedAmp = bIsRedAmp;
	bGreenAmp = bIsGreenAmp;
	// End:0x4F
	if(bAmped && bRedAmp)
	{
		Skins[2] = CamoMaterials[0];
		Skins[3] = CamoMaterials[2];
	}
	// End:0x84
	if(bAmped && bGreenAmp)
	{
		Skins[2] = CamoMaterials[1];
		Skins[3] = CamoMaterials[3];
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
	if(((ImpactManagerRed != none) && bAmped) && bRedAmp)
	{
		ImpactManagerRed.static.StartSpawn(HitLocation, mHitNormal, mHitSurf, Instigator);		
	}
	else
	{
		// End:0x38D
		if(((ImpactManagerGreen != none) && bAmped) && bGreenAmp)
		{
			ImpactManagerGreen.static.StartSpawn(HitLocation, mHitNormal, mHitSurf, Instigator);			
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
	if((((TracerClassRed != none) && bThisShot) && bRedAmp) && bAmped)
	{
		// End:0x124
		if(dist > float(200))
		{
			Tracer = Spawn(TracerClassRed, self,, TipLoc, Rotator(V - TipLoc));
		}
		// End:0x143
		if(Tracer != none)
		{
			Tracer.Initialize(dist);
		}
	}
	// End:0x1C2
	if((((TracerClassGreen != none) && bThisShot) && bGreenAmp) && bAmped)
	{
		// End:0x1A0
		if(dist > float(200))
		{
			Tracer = Spawn(TracerClassGreen, self,, TipLoc, Rotator(V - TipLoc));
		}
		// End:0x1BF
		if(Tracer != none)
		{
			Tracer.Initialize(dist);
		}		
	}
	else
	{
		// End:0x244
		if((((TracerClass != none) && bThisShot) && int(Mode) == 0) && !bAmped)
		{
			// End:0x225
			if(dist > float(200))
			{
				Tracer = Spawn(TracerClass, self,, TipLoc, Rotator(V - TipLoc));
			}
			// End:0x244
			if(Tracer != none)
			{
				Tracer.Initialize(dist);
			}
		}
	}
	// End:0x376
	if((((((Instigator != none) && Instigator.PhysicsVolume.bWaterVolume) && int(Level.DetailMode) == int(2)) && WaterTracerClass != none) && int(WaterTracerMode) != int(3)) && ((int(WaterTracerMode) == int(2)) || (int(WaterTracerMode) == int(1)) && int(Mode) != 0) || (int(WaterTracerMode) == int(0)) && int(Mode) == 0)
	{
		// End:0x34E
		if(!Instigator.PhysicsVolume.TraceThisActor(WLoc, WNorm, TipLoc, V))
		{
			Tracer = Spawn(WaterTracerClass, self,, TipLoc, Rotator(WLoc - TipLoc));
		}
		// End:0x376
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

	// End:0x54
	if(((int(FlashMode) == int(3)) || (int(FlashMode) == int(1)) && int(Mode) == 0) || (int(FlashMode) == int(0)) && int(Mode) != 0)
	{
		return;
	}
	// End:0x9D
	if(((Instigator != none) && Instigator.IsFirstPerson()) && PlayerController(Instigator.Controller).ViewTarget == Instigator)
	{
		return;
	}
	// End:0xB8
	if(bRandomFlashRoll)
	{
		R.Roll = Rand(65536);
	}
	// End:0x143
	if(((MuzzleFlashClassRed != none) && bRedAmp) && bAmped)
	{
		// End:0x10F
		if(MuzzleFlashRed == none)
		{
			Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(MuzzleFlashRed, MuzzleFlashClassRed, DrawScale * AmpFlashScale, self, AltFlashBone);
		}
		MuzzleFlashRed.Trigger(self, Instigator);
		// End:0x143
		if(bRandomFlashRoll)
		{
			SetBoneRotation(AltFlashBone, R, 0, 1.0000000);
		}
	}
	// End:0x1CE
	if(((MuzzleFlashClassGreen != none) && bGreenAmp) && bAmped)
	{
		// End:0x19A
		if(MuzzleFlashGreen == none)
		{
			Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(MuzzleFlashGreen, MuzzleFlashClassGreen, DrawScale * AmpFlashScale, self, AltFlashBone);
		}
		MuzzleFlashGreen.Trigger(self, Instigator);
		// End:0x1CE
		if(bRandomFlashRoll)
		{
			SetBoneRotation(AltFlashBone, R, 0, 1.0000000);
		}
	}
	// End:0x25F
	if(((MuzzleFlashClass != none) && int(Mode) == 0) && !bAmped)
	{
		// End:0x22B
		if(MuzzleFlash == none)
		{
			Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(MuzzleFlash, MuzzleFlashClass, DrawScale * FlashScale, self, FlashBone);
		}
		MuzzleFlash.Trigger(self, Instigator);
		// End:0x25F
		if(bRandomFlashRoll)
		{
			SetBoneRotation(FlashBone, R, 0, 1.0000000);
		}
	}
	//return;	
}

defaultproperties
{
	ImpactManagerRed=Class'BWBP_SKC_Pro.IM_BulletHE'
	ImpactManagerGreen=Class'BWBP_SKC_Pro.IM_BulletAmpAcid'
	TracerClassRed=Class'BWBP_SKC_Pro.TraceEmitter_HMG'
	TracerClassGreen=Class'BWBP_SKC_Pro.TraceEmitter_Tranq'
	MuzzleFlashClassRed=Class'BWBP_SKC_Pro.SRXFlashEmitter'
	MuzzleFlashClassGreen=Class'BallisticProV55.A500FlashEmitter'
	AmpFlashScale=0.2000000
	AmpBone="SatansCrustyButthole"
	CamoMaterials[0]=Shader'BW_Core_WeaponTex.AMP.Amp-FinalRed'
	CamoMaterials[1]=Shader'BW_Core_WeaponTex.AMP.Amp-FinalGreen'
	CamoMaterials[2]=Shader'BW_Core_WeaponTex.AMP.Amp-GlowRedShader'
	CamoMaterials[3]=Shader'BW_Core_WeaponTex.AMP.Amp-GlowGreenShader'
	WeaponClass=Class'BWBP_SKC_Pro.FMPMachinePistol'
	MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter'
	ImpactManager=Class'BallisticProV55.IM_Bullet'
	AltFlashBone="tip2"
	FlashScale=0.5000000
	BrassClass=Class'BallisticProV55.Brass_Rifle'
	InstantMode=2
	FlashMode=2
	LightMode=2
	TracerClass=Class'BWBP_SKC_Pro.TraceEmitter_MARS'
	WaterTracerClass=Class'BallisticProV55.TraceEmitter_WaterBullet'
	WaterTracerMode=2
	FlyBySound=(Sound=SoundGroup'BW_Core_WeaponSound.FlyBys.Bullet-Whizz',Volume=0.7000000,Radius=64.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	ReloadAnimRate=0.9500000
	CockAnimRate=0.9500000
	bRapidFire=true
	Mesh=SkeletalMesh'BWBP_SKC_Anim.MP40_TPm'
	RelativeLocation=(X=0.0000000,Y=0.0000000,Z=7.0000000)
	RelativeRotation=(Pitch=32768,Yaw=0,Roll=0)
	DrawScale=0.3500000
	Skins[0]=Texture'BWBP_SKC_Tex.MP40.MP40-Main'
	Skins[1]=Texture'BWBP_SKC_Tex.MP40.MP40-Mag'
}
