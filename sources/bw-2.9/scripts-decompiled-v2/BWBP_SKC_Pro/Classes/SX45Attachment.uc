class SX45Attachment extends HandgunAttachment;

var bool bLightsOn;
var bool bLightsOnOld;
var Projector FlashLightProj;
var Emitter FlashLightEmitter;
var() Class<BCImpactManager> ImpactManagerAmp1;
var() Class<BCImpactManager> ImpactManagerAmp2;
var() Class<BCTraceEmitter> TracerClassAmp1;
var() Class<BCTraceEmitter> TracerClassAmp2;
var() Class<Actor> MuzzleFlashClassAmp1;
var Actor MuzzleFlashAmp1;
var() Class<Actor> MuzzleFlashClassAmp2;
var Actor MuzzleFlashAmp2;
var() array<Material> AmpMaterials;
var bool bAmp1;
var bool bOldAmp1;
var bool bAmp2;
var bool bOldAmp2;
var bool bAmped;
var bool bOldAmped;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		bAmp1, bAmp2, 
		bAmped, bLightsOn;
}

simulated function PostNetBeginPlay()
{
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
			SetBoneScale(0, 1.0000000, 'AMP');			
		}
		else
		{
			SetBoneScale(0, 0.0000000, 'AMP');
		}
	}
	// End:0x9F
	if(bAmp1 != bOldAmp1)
	{
		bOldAmp1 = bAmp1;
		// End:0x9F
		if(bAmped && bAmp1)
		{
			Skins[5] = AmpMaterials[1];
			Skins[6] = AmpMaterials[2];
		}
	}
	// End:0xF2
	if(bAmp2 != bOldAmp2)
	{
		bOldAmp2 = bAmp2;
		// End:0xF2
		if(bAmped && bAmp1)
		{
			Skins[5] = AmpMaterials[0];
			Skins[6] = AmpMaterials[3];
		}
	}
	super(BallisticAttachment).PostNetReceive();
	//return;	
}

simulated function SetAmped(bool bIsAmped)
{
	bAmped = bIsAmped;
	// End:0x2A
	if(bAmped)
	{
		SetBoneScale(0, 1.0000000, 'AMP');		
	}
	else
	{
		SetBoneScale(0, 0.0000000, 'AMP');
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
			SetBoneScale(0, 1.0000000, 'AMP');			
		}
		else
		{
			SetBoneScale(0, 0.0000000, 'AMP');
		}
	}
	super(BallisticAttachment).ThirdPersonEffects();
	//return;	
}

simulated function SetAmpColour(bool bIsAmp1, bool bIsAmp2)
{
	bAmp1 = bIsAmp1;
	bAmp2 = bIsAmp2;
	// End:0x4F
	if(bAmped && bAmp1)
	{
		Skins[5] = AmpMaterials[1];
		Skins[6] = AmpMaterials[2];
	}
	// End:0x84
	if(bAmped && bAmp2)
	{
		Skins[5] = AmpMaterials[0];
		Skins[6] = AmpMaterials[3];
	}
	//return;	
}

simulated function InstantFireEffects(byte Mode)
{
	local Vector HitLocation, Dir, Start;
	local Material HitMat;

	// End:0x1A
	if(!ModeInfos[int(Mode)].bInstant)
	{
		return;
	}
	// End:0x33
	if(mHitLocation == vect(0.0000000, 0.0000000, 0.0000000))
	{
		return;
	}
	// End:0x40
	if(Instigator == none)
	{
		return;
	}
	SpawnTracer(Mode, mHitLocation);
	FlyByEffects(Mode, mHitLocation);
	// End:0x1B3
	if(int(Level.NetMode) == int(NM_Client))
	{
		mHitActor = none;
		Start = Instigator.Location + Instigator.EyePosition();
		// End:0xCF
		if(int(WallPenetrates) != 0)
		{
			WallPenetrates = 0;
			DoWallPenetrate(Mode, Start, mHitLocation);
		}
		Dir = Normal(mHitLocation - Start);
		mHitActor = Trace(HitLocation, mHitNormal, mHitLocation + (Dir * float(10)), mHitLocation - (Dir * float(10)), false,, HitMat);
		// End:0x14E
		if((ImpactManager != none) && bDoWaterSplash)
		{
			DoWaterTrace(int(Mode), Start, mHitLocation);
		}
		// End:0x15B
		if(mHitActor == none)
		{
			return;
		}
		// End:0x176
		if(Vehicle(mHitActor) != none)
		{
			mHitSurf = 3;			
		}
		else
		{
			// End:0x19A
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
	// End:0x28B
	if((((((int(Level.NetMode) != int(NM_Client)) && ImpactManager != none) && WaterHitLocation != vect(0.0000000, 0.0000000, 0.0000000)) && bDoWaterSplash) && int(Level.DetailMode) >= int(1)) && int(Class'BCoreProV55.BallisticMod'.default.EffectsDetailMode) > 0)
	{
		ModeInfos[int(Mode)].ImpactManager.static.StartSpawn(WaterHitLocation, Normal((Instigator.Location + Instigator.EyePosition()) - WaterHitLocation), 9, Instigator);
	}
	// End:0x2D2
	if((mHitActor == none) || (!mHitActor.bWorldGeometry && Mover(mHitActor) == none) && Vehicle(mHitActor) == none)
	{
		return;
	}
	// End:0x319
	if(((ImpactManagerAmp1 != none) && bAmped) && bAmp1)
	{
		ImpactManagerAmp1.static.StartSpawn(HitLocation, mHitNormal, mHitSurf, Instigator);		
	}
	else
	{
		// End:0x360
		if(((ImpactManagerAmp2 != none) && bAmped) && bAmp2)
		{
			ImpactManagerAmp2.static.StartSpawn(HitLocation, mHitNormal, mHitSurf, Instigator);			
		}
		else
		{
			// End:0x39B
			if(ImpactManager != none)
			{
				ModeInfos[int(Mode)].ImpactManager.static.StartSpawn(HitLocation, mHitNormal, mHitSurf, Instigator);
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
	TipLoc = GetModeTipLocation(Mode);
	dist = VSize(V - TipLoc);
	// End:0x6E
	if(TracerMix == 0)
	{
		bThisShot = true;		
	}
	else
	{
		TracerCounter++;
		// End:0xAE
		if(TracerMix < 0)
		{
			// End:0xA3
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
			// End:0xCC
			if(TracerCounter >= TracerMix)
			{
				TracerCounter = 0;
				bThisShot = true;
			}
		}
	}
	// End:0x148
	if((((TracerClassAmp1 != none) && bThisShot) && bAmp1) && bAmped)
	{
		// End:0x129
		if(dist > float(200))
		{
			Tracer = Spawn(TracerClassAmp1, self,, TipLoc, Rotator(V - TipLoc));
		}
		// End:0x148
		if(Tracer != none)
		{
			Tracer.Initialize(dist);
		}
	}
	// End:0x1C7
	if((((TracerClassAmp1 != none) && bThisShot) && bAmp2) && bAmped)
	{
		// End:0x1A5
		if(dist > float(200))
		{
			Tracer = Spawn(TracerClassAmp2, self,, TipLoc, Rotator(V - TipLoc));
		}
		// End:0x1C4
		if(Tracer != none)
		{
			Tracer.Initialize(dist);
		}		
	}
	else
	{
		// End:0x249
		if((((TracerClass != none) && bThisShot) && int(Mode) == 0) && !bAmped)
		{
			// End:0x22A
			if(dist > float(200))
			{
				Tracer = Spawn(TracerClass, self,, TipLoc, Rotator(V - TipLoc));
			}
			// End:0x249
			if(Tracer != none)
			{
				Tracer.Initialize(dist);
			}
		}
	}
	// End:0x37B
	if((((((Instigator != none) && Instigator.PhysicsVolume.bWaterVolume) && int(Level.DetailMode) == int(2)) && WaterTracerClass != none) && int(WaterTracerMode) != int(3)) && ((int(WaterTracerMode) == int(2)) || (int(WaterTracerMode) == int(1)) && int(Mode) != 0) || (int(WaterTracerMode) == int(0)) && int(Mode) == 0)
	{
		// End:0x353
		if(!Instigator.PhysicsVolume.TraceThisActor(WLoc, WNorm, TipLoc, V))
		{
			Tracer = Spawn(WaterTracerClass, self,, TipLoc, Rotator(WLoc - TipLoc));
		}
		// End:0x37B
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
	if(((MuzzleFlashClassAmp1 != none) && bAmp1) && bAmped)
	{
		// End:0x10F
		if(MuzzleFlashAmp1 == none)
		{
			Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(MuzzleFlashAmp1, MuzzleFlashClassAmp1, DrawScale * FlashScale, self, AltFlashBone);
		}
		MuzzleFlashAmp1.Trigger(self, Instigator);
		// End:0x143
		if(bRandomFlashRoll)
		{
			SetBoneRotation(AltFlashBone, R, 0, 1.0000000);
		}
	}
	// End:0x1CE
	if(((MuzzleFlashClassAmp2 != none) && bAmp2) && bAmped)
	{
		// End:0x19A
		if(MuzzleFlashAmp2 == none)
		{
			Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(MuzzleFlashAmp2, MuzzleFlashClassAmp2, DrawScale * FlashScale, self, AltFlashBone);
		}
		MuzzleFlashAmp2.Trigger(self, Instigator);
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

simulated function Hide(bool NewbHidden)
{
	super.Hide(NewbHidden);
	SwitchFlashLight();
	// End:0x3B
	if(NewbHidden)
	{
		KillProjector();
		// End:0x38
		if(FlashLightEmitter != none)
		{
			FlashLightEmitter.Destroy();
		}		
	}
	else
	{
		// End:0x4A
		if(bLightsOn)
		{
			SwitchFlashLight();
		}
	}
	//return;	
}

simulated function StartProjector()
{
	// End:0x20
	if(FlashLightProj == none)
	{
		FlashLightProj = Spawn(Class'BallisticProV55.MRS138TorchProjector', self,, Location);
	}
	AttachToBone(FlashLightProj, 'tip2');
	FlashLightProj.SetRelativeLocation(vect(-32.0000000, 0.0000000, 0.0000000));
	//return;	
}

simulated function KillProjector()
{
	// End:0x1E
	if(FlashLightProj != none)
	{
		FlashLightProj.Destroy();
		FlashLightProj = none;
	}
	//return;	
}

simulated function SwitchFlashLight()
{
	// End:0x91
	if(bLightsOn)
	{
		// End:0x74
		if(FlashLightEmitter == none)
		{
			FlashLightEmitter = Spawn(Class'BallisticProV55.MRS138TorchEffect', self,, Location);
			Class'BCoreProV55.BallisticEmitter'.static.ScaleEmitter(FlashLightEmitter, DrawScale);
			AttachToBone(FlashLightEmitter, 'tip2');
			FlashLightEmitter.bHidden = false;
			FlashLightEmitter.bCorona = true;
		}
		// End:0x8E
		if(!Instigator.IsFirstPerson())
		{
			StartProjector();
		}		
	}
	else
	{
		FlashLightEmitter.Destroy();
		KillProjector();
	}
	//return;	
}

simulated event Tick(float dt)
{
	super.Tick(dt);
	// End:0x26
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		return;
	}
	// End:0x4A
	if(bLightsOn != bLightsOnOld)
	{
		SwitchFlashLight();
		bLightsOnOld = bLightsOn;
	}
	// End:0x57
	if(!bLightsOn)
	{
		return;
	}
	// End:0xA2
	if(Instigator.IsFirstPerson())
	{
		KillProjector();
		// End:0x9F
		if((FlashLightEmitter != none) && FlashLightEmitter.bCorona)
		{
			FlashLightEmitter.bCorona = false;
		}		
	}
	else
	{
		// End:0xB3
		if(FlashLightProj == none)
		{
			StartProjector();
		}
		// End:0xE5
		if((FlashLightEmitter != none) && !FlashLightEmitter.bCorona)
		{
			FlashLightEmitter.bCorona = true;
		}
	}
	//return;	
}

simulated function Destroyed()
{
	// End:0x17
	if(FlashLightEmitter != none)
	{
		FlashLightEmitter.Destroy();
	}
	KillProjector();
	super.Destroyed();
	//return;	
}

defaultproperties
{
	ImpactManagerAmp1=Class'BWBP_SKC_Pro.IM_BulletAmpFrostHE'
	ImpactManagerAmp2=Class'BWBP_SKC_Pro.IM_BulletAmpRad'
	TracerClassAmp1=Class'BWBP_SKC_Pro.TraceEmitter_FreezeBig'
	TracerClassAmp2=Class'BWBP_SKC_Pro.TraceEmitter_HMG'
	MuzzleFlashClassAmp1=Class'BWBP_SKC_Pro.SX45CryoFlash'
	MuzzleFlashClassAmp2=Class'BWBP_SKC_Pro.SX45RadMuzzleFlash'
	AmpMaterials[0]=Shader'BW_Core_WeaponTex.AMP.Amp-FinalYellow'
	AmpMaterials[1]=Shader'BW_Core_WeaponTex.AMP.Amp-FinalCyan'
	AmpMaterials[2]=Shader'BW_Core_WeaponTex.AMP.Amp-GlowCyanShader'
	AmpMaterials[3]=Shader'BW_Core_WeaponTex.AMP.Amp-GlowYellowShader'
	WeaponClass=Class'BWBP_SKC_Pro.SX45Pistol'
	MuzzleFlashClass=Class'BWBP_SKC_Pro.SX45FlashEmitter'
	AltMuzzleFlashClass=Class'BWBP_SKC_Pro.SX45FlashEmitter'
	ImpactManager=Class'BallisticProV55.IM_Bullet'
	AltFlashBone="tip2"
	FlashScale=0.2500000
	BrassClass=Class'BallisticProV55.Brass_Pistol'
	BrassMode=2
	InstantMode=2
	FlashMode=2
	TracerClass=Class'BallisticProV55.TraceEmitter_Default'
	TracerMix=-3
	WaterTracerClass=Class'BallisticProV55.TraceEmitter_WaterBullet'
	WaterTracerMode=2
	FlyBySound=(Sound=SoundGroup'BW_Core_WeaponSound.FlyBys.Bullet-Whizz',Volume=0.7000000,Radius=64.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	ReloadAnim="Reload_Pistol"
	ReloadAnimRate=0.9000000
	CockAnimRate=0.8000000
	Mesh=SkeletalMesh'BWBP_SKC_Anim.SX45_TPm'
	RelativeLocation=(X=0.0000000,Y=0.0000000,Z=10.0000000)
	DrawScale=1.0000000
	Skins[0]=Texture'BWBP_SKC_Tex.SX45.SX45-Mag'
}
