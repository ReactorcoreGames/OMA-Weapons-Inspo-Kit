class BallisticAttachment extends xWeaponAttachment;

enum EModeUsed
{
	MU_Primary,                     // 0
	MU_Secondary,                   // 1
	MU_Both,                        // 2
	MU_None                         // 3
};

struct ModeInfo
{
	var Class<BCImpactManager> ImpactManager;
	var Class<BCTraceEmitter> TracerClass;
	var Class<BCTraceEmitter> WaterTracerClass;
	var Class<Actor> MuzzleFlashClass;
	var float TracerChance;
	var int TracerMix;
	var int TracerCounter;
	var name FlashBone;
	var name TipBone;
	var bool bTrackAnim;
	var bool bInstant;
	var bool bTracer;
	var bool bWaterTracer;
	var bool bFlash;
	var bool bLight;
	var bool bBrass;
};

struct DirectImp
{
	var() byte Mode;
	var() Vector HitLoc;
	var() byte HitSurf;
	var() byte HitNorm;
};

struct BonePos
{
	var() Rotator offset;
	var() float Time;
};

struct BoneTrack
{
	var() name Bone;
	var() array<BonePos> Points;
};

var ModeInfo ModeInfos[2];
var() Class<BallisticWeapon> WeaponClass;
var() Class<Actor> MuzzleFlashClass;
var Actor MuzzleFlash;
var() Class<Actor> AltMuzzleFlashClass;
var Actor AltMuzzleFlash;
var() Class<BCImpactManager> ImpactManager;
var() Class<BCImpactManager> MeleeImpactManager;
var() bool bDoWaterSplash;
var() bool bRandomFlashRoll;
var Actor LightWeapon;
var() float WeaponLightTime;
var() name FlashBone;
var() name AltFlashBone;
var int mHitSurf;
var() float FlashScale;
var() Class<Actor> BrassClass;
var() BallisticAttachment.EModeUsed BrassMode;
var() name BrassBone;
var() BallisticAttachment.EModeUsed TracerMode;
var() BallisticAttachment.EModeUsed InstantMode;
var() BallisticAttachment.EModeUsed FlashMode;
var() BallisticAttachment.EModeUsed LightMode;
var() BallisticAttachment.EModeUsed TrackAnimMode;
var() Class<BCTraceEmitter> TracerClass;
var() float TracerChance;
var() int TracerMix;
var int TracerCounter;
var byte FireCount;
var byte OldFireCount;
var byte AltFireCount;
var byte OldAltFireCount;
var byte MeleeFireCount;
var byte OldMeleeFireCount;
var Vector WaterHitLocation;
var() Class<BCTraceEmitter> WaterTracerClass;
var() BallisticAttachment.EModeUsed WaterTracerMode;
var byte WallPenetrates;
var() FullSound FlyBySound;
var() BallisticAttachment.EModeUsed FlyByMode;
var() float FlybyRange;
var() float FlyByBulletSpeed;
var() int CamoIndex;
var() int LayoutIndex;
var() name ReloadAnim;
var() name CockingAnim;
var() name WeaponSpecialAnim;
var() name StaggerAnim;
var() float ReloadAnimRate;
var() float CockAnimRate;
var() float WeaponSpecialRate;
var() float StaggerRate;
var() name IdleHeavyAnim;
var() name IdleRifleAnim;
var() name MeleeStrikeAnim;
var() float MeleeAnimRate;
var() name MeleeBlockAnim;
var() name MeleeWindupAnim;
var bool bIsAimed;
var() name SingleFireAnim;
var() name SingleAimedFireAnim;
var() name RapidFireAnim;
var() name RapidAimedFireAnim;
var DirectImp DirectImpact;
var byte DirectImpactCount;
var byte OldDirectImpactCount;
var() array<BoneTrack> SlashTracks;
var() array<BoneTrack> ThrowTracks;
var float TrackStartTime;
var float TrackEndTime;
var bool bTrackPlaying;
var byte ActiveTrack;
var byte TrackNum[3];

replication
{
	// Pos:0x000
	reliable if(bNetDirty && int(Role) == int(ROLE_Authority))
		AltFireCount, DirectImpact, 
		DirectImpactCount, FireCount, 
		MeleeFireCount, WallPenetrates, 
		bIsAimed;

	// Pos:0x018
	reliable if(bNetInitial && int(Role) == int(ROLE_Authority))
		CamoIndex, LayoutIndex;
}

simulated function PostBeginPlay()
{
	super(Actor).PostBeginPlay();
	GenerateModeInfo();
	//return;	
}

function InitFor(Inventory BW)
{
	super.InitFor(BW);
	LayoutIndex = int(BallisticWeapon(BW).LayoutIndex);
	ApplyModel();
	CamoIndex = int(BallisticWeapon(BW).CamoIndex);
	ApplyCamo();
	//return;	
}

final simulated function bool FlaggedForMode(BallisticAttachment.EModeUsed Enum, int Mode)
{
	local byte Flags;

	Mode += 1;
	Flags = byte(int(Enum) + 1);
	return (int(Flags) & Mode) == Mode;
	//return;	
}

simulated function GenerateModeInfo()
{
	local int i;

	ModeInfos[0].MuzzleFlashClass = MuzzleFlashClass;
	ModeInfos[1].MuzzleFlashClass = AltMuzzleFlashClass;
	ModeInfos[0].FlashBone = FlashBone;
	ModeInfos[1].FlashBone = AltFlashBone;
	i = 0;
	J0x4F:

	// End:0x224 [Loop If]
	if(i < 2)
	{
		ModeInfos[i].ImpactManager = ImpactManager;
		ModeInfos[i].TracerClass = TracerClass;
		ModeInfos[i].WaterTracerClass = WaterTracerClass;
		ModeInfos[i].TracerChance = TracerChance;
		ModeInfos[i].TracerMix = TracerMix;
		ModeInfos[i].bTrackAnim = FlaggedForMode(TrackAnimMode, i);
		ModeInfos[i].bInstant = FlaggedForMode(InstantMode, i);
		ModeInfos[i].bTracer = FlaggedForMode(TracerMode, i);
		ModeInfos[i].bWaterTracer = FlaggedForMode(WaterTracerMode, i);
		ModeInfos[i].bFlash = FlaggedForMode(FlashMode, i);
		ModeInfos[i].bLight = FlaggedForMode(LightMode, i);
		ModeInfos[i].bBrass = FlaggedForMode(BrassMode, i);
		// End:0x21A
		if((ModeInfos[i].TracerChance < float(2)) && (int(Level.DetailMode) <= int(1)) || int(Class'BCoreProV55.BallisticMod'.default.EffectsDetailMode) <= 1)
		{
			ModeInfos[i].TracerChance *= 0.5000000;
		}
		++i;
		// [Loop Continue]
		goto J0x4F;
	}
	// End:0x259
	if(WeaponClass != none)
	{
		WeaponClass.default.ParamsClasses[int(Class'BCoreProV55.BallisticReplicationInfo'.default.GameStyle)].SetAttachmentParams(self);
	}
	//return;	
}

simulated function PostNetBeginPlay()
{
	super.PostNetBeginPlay();
	bHeavy = bIsAimed;
	// End:0x2F
	if(int(Role) < int(ROLE_Authority))
	{
		ApplyModel();
		ApplyCamo();
	}
	//return;	
}

simulated function ApplyModel()
{
	// End:0x92
	if(LayoutIndex >= WeaponClass.static.GetParams().default.Layouts.Length)
	{
		Log((((string(Name) $ "::ApplyModel: Layout index out of range: got ") $ string(LayoutIndex)) $ ", length ") $ string(WeaponClass.static.GetParams().default.Layouts.Length));
		return;
	}
	// End:0xEC
	if(WeaponClass.static.GetParams().default.Layouts[LayoutIndex].AttachmentMesh != none)
	{
		LinkMesh(WeaponClass.static.GetParams().default.Layouts[LayoutIndex].AttachmentMesh);
	}
	//return;	
}

simulated function ApplyCamo()
{
	local int i;
	local WeaponCamo WC;

	// End:0x5C
	if(WeaponClass == none)
	{
		Log(string(Name) $ "::ApplyCamo: No weapon class set - cannot read params to set camo!");
		return;
	}
	// End:0x6A
	if(CamoIndex == 255)
	{
		return;
	}
	// End:0xF9
	if(CamoIndex >= WeaponClass.static.GetParams().default.Camos.Length)
	{
		Log((((string(Name) $ "::ApplyCamo: Camo index out of range: got ") $ string(CamoIndex)) $ ", length ") $ string(WeaponClass.static.GetParams().default.Camos.Length));
		return;
	}
	WC = WeaponClass.static.GetParams().default.Camos[CamoIndex];
	i = 0;
	J0x124:

	// End:0x29F [Loop If]
	if(i < WC.WeaponMaterialSwaps.Length)
	{
		// End:0x295
		if(WC.WeaponMaterialSwaps[i].AIndex != -1)
		{
			// End:0x25C
			if(WC.WeaponMaterialSwaps[i].Material == none)
			{
				WC.WeaponMaterialSwaps[i].Material = Material(DynamicLoadObject(WC.WeaponMaterialSwaps[i].MaterialName, Class'Engine.Material'));
				// End:0x25C
				if(WC.WeaponMaterialSwaps[i].Material == none)
				{
					Log((string(Name) $ "::ApplyCamo: Failed dynamically loading material ") $ WC.WeaponMaterialSwaps[i].MaterialName);
					WC.WeaponMaterialSwaps[i].AIndex = -1;
					// [Explicit Continue]
					goto J0x295;
				}
			}
			Skins[WC.WeaponMaterialSwaps[i].AIndex] = WC.WeaponMaterialSwaps[i].Material;
		}
		J0x295:

		++i;
		// [Loop Continue]
		goto J0x124;
	}
	//return;	
}

simulated event PostNetReceive()
{
	// End:0x1B
	if(int(Level.NetMode) != int(NM_Client))
	{
		return;
	}
	// End:0x70
	if(int(DirectImpactCount) != int(OldDirectImpactCount))
	{
		DoDirectHit(0, DirectImpact.HitLoc, Class'BCoreProV55.BUtil'.static.ByteToNorm(DirectImpact.HitNorm), int(DirectImpact.HitSurf));
		OldDirectImpactCount = DirectImpactCount;
	}
	// End:0x9C
	if(int(FireCount) != int(OldFireCount))
	{
		FiringMode = 0;
		ThirdPersonEffects();
		OldFireCount = FireCount;
	}
	// End:0xC8
	if(int(AltFireCount) != int(OldAltFireCount))
	{
		FiringMode = 1;
		ThirdPersonEffects();
		OldAltFireCount = AltFireCount;
	}
	// End:0x101
	if(int(MeleeFireCount) != int(OldMeleeFireCount))
	{
		FiringMode = byte(255);
		MeleeFireEffects();
		PlayPawnFiring(FiringMode);
		OldMeleeFireCount = MeleeFireCount;
	}
	//return;	
}

simulated event ThirdPersonEffects()
{
	// End:0x76
	if((int(Level.NetMode) != int(NM_DedicatedServer)) && Instigator != none)
	{
		InstantFireEffects(FiringMode);
		FlashMuzzleFlash(FiringMode);
		FlashWeaponLight(FiringMode);
		PlayPawnFiring(FiringMode);
		// End:0x76
		if(int(Level.DetailMode) == int(2))
		{
			EjectBrass(FiringMode);
		}
	}
	//return;	
}

simulated function Vector GetTipLocation()
{
	return GetModeTipLocation(0);
	//return;	
}

simulated function Vector GetModeTipLocation(optional byte Mode)
{
	// End:0x63
	if(((Instigator != none) && Instigator.IsFirstPerson()) && PlayerController(Instigator.Controller).ViewTarget == Instigator)
	{
		return Instigator.Weapon.GetEffectStart();		
	}
	else
	{
		// End:0x94
		if((Level.TimeSeconds - LastRenderTime) < float(1))
		{
			return GetBoneCoords('tip').Origin;			
		}
		else
		{
			return Instigator.Location;
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
		C = GetBoneCoords(BrassBone);
	}
	// End:0xD3
	if((Instigator != none) && VSize(C.Origin - Instigator.Location) > float(200))
	{
		EjectorAngle = Instigator.Rotation;
		return Instigator.Location;
	}
	EjectorAngle = GetBoneRotation(BrassBone);
	return C.Origin;
	//return;	
}

simulated function EjectBrass(byte Mode)
{
	local Rotator R;

	// End:0x16
	if(!Class'BCoreProV55.BallisticMod'.default.bEjectBrass)
	{
		return;
	}
	// End:0x23
	if(BrassClass == none)
	{
		return;
	}
	Mode = byte(Min(int(Mode), 1));
	// End:0x4F
	if(!ModeInfos[int(Mode)].bBrass)
	{
		return;
	}
	// End:0x98
	if(((Instigator != none) && Instigator.IsFirstPerson()) && PlayerController(Instigator.Controller).ViewTarget == Instigator)
	{
		return;
	}
	Spawn(BrassClass, self,, GetEjectorLocation(R), R);
	//return;	
}

simulated function InstantFireEffects(byte Mode)
{
	local Vector HitLocation, Dir, Start;
	local Material HitMat;

	Mode = byte(Min(int(Mode), 1));
	// End:0x2C
	if(!ModeInfos[int(Mode)].bInstant)
	{
		return;
	}
	// End:0x45
	if(mHitLocation == vect(0.0000000, 0.0000000, 0.0000000))
	{
		return;
	}
	// End:0x52
	if(Instigator == none)
	{
		return;
	}
	SpawnTracer(Mode, mHitLocation);
	FlyByEffects(Mode, mHitLocation);
	// End:0x1D2
	if(int(Level.NetMode) == int(NM_Client))
	{
		mHitActor = none;
		Start = Instigator.Location + Instigator.EyePosition();
		// End:0xE1
		if(int(WallPenetrates) != 0)
		{
			WallPenetrates = 0;
			DoWallPenetrate(Mode, Start, mHitLocation);
		}
		Dir = Normal(mHitLocation - Start);
		mHitActor = Trace(HitLocation, mHitNormal, mHitLocation + (Dir * float(10)), mHitLocation - (Dir * float(10)), false,, HitMat);
		// End:0x16D
		if((ModeInfos[int(Mode)].ImpactManager != none) && bDoWaterSplash)
		{
			DoWaterTrace(int(Mode), Start, mHitLocation);
		}
		// End:0x17A
		if(mHitActor == none)
		{
			return;
		}
		// End:0x195
		if(Vehicle(mHitActor) != none)
		{
			mHitSurf = 3;			
		}
		else
		{
			// End:0x1B9
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
	// End:0x2B7
	if((((((int(Level.NetMode) != int(NM_Client)) && ModeInfos[int(Mode)].ImpactManager != none) && WaterHitLocation != vect(0.0000000, 0.0000000, 0.0000000)) && bDoWaterSplash) && int(Level.DetailMode) >= int(1)) && int(Class'BCoreProV55.BallisticMod'.default.EffectsDetailMode) > 0)
	{
		ModeInfos[int(Mode)].ImpactManager.static.StartSpawn(WaterHitLocation, Normal((Instigator.Location + Instigator.EyePosition()) - WaterHitLocation), 9, Instigator);
	}
	// End:0x2FE
	if((mHitActor == none) || (!mHitActor.bWorldGeometry && Mover(mHitActor) == none) && Vehicle(mHitActor) == none)
	{
		return;
	}
	// End:0x346
	if(ModeInfos[int(Mode)].ImpactManager != none)
	{
		ModeInfos[int(Mode)].ImpactManager.static.StartSpawn(HitLocation, mHitNormal, mHitSurf, Instigator);
	}
	//return;	
}

simulated function MeleeFireEffects()
{
	local Vector HitLocation, Dir, Start;
	local Material HitMat;

	// End:0x41
	if(((int(Level.NetMode) == int(NM_DedicatedServer)) || Instigator == none) || mHitLocation == vect(0.0000000, 0.0000000, 0.0000000))
	{
		return;
	}
	// End:0x138
	if(int(Level.NetMode) == int(NM_Client))
	{
		mHitActor = none;
		Start = Instigator.Location + Instigator.EyePosition();
		Dir = Normal(mHitLocation - Start);
		mHitActor = Trace(HitLocation, mHitNormal, mHitLocation + (Dir * float(10)), mHitLocation - (Dir * float(10)), false,, HitMat);
		// End:0xFB
		if((mHitActor == none) || !mHitActor.bWorldGeometry)
		{
			return;
		}
		// End:0x11F
		if(HitMat == none)
		{
			mHitSurf = int(mHitActor.SurfaceType);			
		}
		else
		{
			mHitSurf = int(HitMat.SurfaceType);
		}		
	}
	else
	{
		HitLocation = mHitLocation;
	}
	// End:0x18A
	if((mHitActor == none) || (!mHitActor.bWorldGeometry && Mover(mHitActor) == none) && Vehicle(mHitActor) == none)
	{
		return;
	}
	// End:0x1B8
	if(MeleeImpactManager != none)
	{
		MeleeImpactManager.static.StartSpawn(HitLocation, mHitNormal, mHitSurf, Instigator);
	}
	//return;	
}

simulated function FlyByEffects(byte Mode, Vector HitLoc)
{
	local Vector TipLoc, ViewLoc, PointX, Dir;
	local float DotResult, XDist;

	// End:0x43
	if(((int(Level.DetailMode) < int(1)) || !Class'BCoreProV55.BallisticMod'.default.bBulletFlybys) || FlyBySound.Sound == none)
	{
		return;
	}
	// End:0x97
	if(((int(FlyByMode) == int(3)) || (int(FlyByMode) == int(1)) && int(Mode) == 0) || (int(FlyByMode) == int(0)) && int(Mode) != 0)
	{
		return;
	}
	TipLoc = GetModeTipLocation(Mode);
	// End:0xF0
	if(Level.GetLocalPlayerController().ViewTarget != none)
	{
		ViewLoc = Level.GetLocalPlayerController().ViewTarget.Location;		
	}
	else
	{
		ViewLoc = Level.GetLocalPlayerController().Location;
	}
	Dir = Normal(HitLoc - TipLoc);
	DotResult = Dir Dot Normal(ViewLoc - TipLoc);
	// End:0x14C
	if(DotResult < float(0))
	{
		return;
	}
	XDist = DotResult * VSize(ViewLoc - TipLoc);
	PointX = TipLoc + (Dir * XDist);
	// End:0x19A
	if(VSize(PointX - ViewLoc) > FlybyRange)
	{
		return;
	}
	// End:0x1CD
	if((XDist < float(256)) || XDist > (VSize(HitLoc - TipLoc) - float(128)))
	{
		return;
	}
	FlyBySound.Pitch = 0.8500000 + (0.3000000 * FRand());
	Class'BCoreProV55.BCFlyByActor'.static.SoundOff(self, FlyBySound, PointX, XDist / FlyByBulletSpeed);
	//return;	
}

simulated function DoWallPenetrate(byte Mode, Vector Start, Vector End)
{
	local Vector HitLoc, HitNorm;
	local Actor Other;
	local int Surf;
	local Material HitMat;

	Other = Trace(HitLoc, HitNorm, End, Start, false,, HitMat);
	// End:0x107
	if(Other != none)
	{
		// End:0x53
		if(HitMat == none)
		{
			Surf = int(Other.SurfaceType);			
		}
		else
		{
			Surf = int(HitMat.SurfaceType);
		}
		WallPenetrateEffect(Mode, HitLoc, HitNorm, Surf);
		Other = Trace(HitLoc, HitNorm, Start, End, false,, HitMat);
		// End:0x107
		if(Other != none)
		{
			// End:0xD6
			if(HitMat == none)
			{
				Surf = int(Other.SurfaceType);				
			}
			else
			{
				Surf = int(HitMat.SurfaceType);
			}
			WallPenetrateEffect(Mode, HitLoc, HitNorm, Surf, true);
		}
	}
	//return;	
}

simulated function DoWaterTrace(int Mode, Vector Start, Vector End)
{
	local Vector HitLoc, HitNorm;
	local Actor Other;

	// End:0x33
	if((int(Level.DetailMode) < int(1)) || int(Class'BCoreProV55.BallisticMod'.default.EffectsDetailMode) == 0)
	{
		return;
	}
	bTraceWater = true;
	Other = Trace(HitLoc, HitNorm, End, Start, true);
	bTraceWater = false;
	// End:0xEB
	if((FluidSurfaceInfo(Other) != none) || ((PhysicsVolume(Other) != none) && PhysicsVolume(Other).bWaterVolume) && VSize(HitLoc - Start) > float(1))
	{
		ModeInfos[Mode].ImpactManager.static.StartSpawn(HitLoc, Normal(Start - HitLoc), 9, Instigator);		
	}
	else
	{
		WaterHitLocation = vect(0.0000000, 0.0000000, 0.0000000);
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
	// End:0x7B
	if(ModeInfos[int(Mode)].TracerMix == 0)
	{
		bThisShot = true;		
	}
	else
	{
		ModeInfos[int(Mode)].TracerCounter++;
		// End:0xEF
		if(TracerMix < 0)
		{
			// End:0xE4
			if(ModeInfos[int(Mode)].TracerCounter >= -ModeInfos[int(Mode)].TracerMix)
			{
				ModeInfos[int(Mode)].TracerCounter = 0;
				bThisShot = false;				
			}
			else
			{
				bThisShot = true;
			}			
		}
		else
		{
			// End:0x134
			if(ModeInfos[int(Mode)].TracerCounter >= ModeInfos[int(Mode)].TracerMix)
			{
				ModeInfos[int(Mode)].TracerCounter = 0;
				bThisShot = true;
			}
		}
	}
	// End:0x203
	if(((ModeInfos[int(Mode)].bTracer && ModeInfos[int(Mode)].TracerClass != none) && bThisShot) && (ModeInfos[int(Mode)].TracerChance >= float(1)) || FRand() < ModeInfos[int(Mode)].TracerChance)
	{
		// End:0x1E4
		if(dist > float(200))
		{
			Tracer = Spawn(ModeInfos[int(Mode)].TracerClass, self,, TipLoc, Rotator(V - TipLoc));
		}
		// End:0x203
		if(Tracer != none)
		{
			Tracer.Initialize(dist);
		}
	}
	// End:0x301
	if(((((Instigator != none) && Instigator.PhysicsVolume.bWaterVolume) && int(Level.DetailMode) == int(2)) && ModeInfos[int(Mode)].WaterTracerClass != none) && ModeInfos[int(Mode)].bWaterTracer)
	{
		// End:0x2D9
		if(!Instigator.PhysicsVolume.TraceThisActor(WLoc, WNorm, TipLoc, V))
		{
			Tracer = Spawn(ModeInfos[int(Mode)].WaterTracerClass, self,, TipLoc, Rotator(WLoc - TipLoc));
		}
		// End:0x301
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

	Mode = byte(Min(int(Mode), 1));
	// End:0x2C
	if(!ModeInfos[int(Mode)].bFlash)
	{
		return;
	}
	// End:0x75
	if(((Instigator != none) && Instigator.IsFirstPerson()) && PlayerController(Instigator.Controller).ViewTarget == Instigator)
	{
		return;
	}
	// End:0x90
	if(bRandomFlashRoll)
	{
		R.Roll = Rand(65536);
	}
	// End:0x12C
	if((int(Mode) != 0) && ModeInfos[1].MuzzleFlashClass != none)
	{
		// End:0xF5
		if(AltMuzzleFlash == none)
		{
			Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(AltMuzzleFlash, ModeInfos[1].MuzzleFlashClass, DrawScale * FlashScale, self, ModeInfos[1].FlashBone);
		}
		AltMuzzleFlash.Trigger(self, Instigator);
		// End:0x129
		if(bRandomFlashRoll)
		{
			SetBoneRotation(AltFlashBone, R, 0, 1.0000000);
		}		
	}
	else
	{
		// End:0x1CB
		if((int(Mode) == 0) && ModeInfos[int(Mode)].MuzzleFlashClass != none)
		{
			// End:0x197
			if(MuzzleFlash == none)
			{
				Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(MuzzleFlash, ModeInfos[0].MuzzleFlashClass, DrawScale * FlashScale, self, ModeInfos[0].FlashBone);
			}
			MuzzleFlash.Trigger(self, Instigator);
			// End:0x1CB
			if(bRandomFlashRoll)
			{
				SetBoneRotation(FlashBone, R, 0, 1.0000000);
			}
		}
	}
	//return;	
}

function SetAimed(bool bNewAimed)
{
	bIsAimed = bNewAimed;
	// End:0x2D
	if(bIsAimed)
	{
		Instigator.SetAnimAction('Raise');		
	}
	else
	{
		Instigator.SetAnimAction('Lower');
	}
	//return;	
}

function SetBlocked(bool bNewAimed)
{
	//return;	
}

simulated function PlayPawnFiring(byte Mode)
{
	// End:0x12
	if(xPawn(Instigator) == none)
	{
		return;
	}
	// End:0x28
	if(int(Mode) == 255)
	{
		PlayMeleeFiring();
		return;
	}
	Mode = byte(Min(int(Mode), 1));
	// End:0x5D
	if(ModeInfos[int(Mode)].bTrackAnim)
	{
		PlayPawnTrackAnim(Mode);
		return;
	}
	// End:0xAF
	if(int(FiringMode) == 0)
	{
		// End:0x91
		if(bIsAimed)
		{
			xPawn(Instigator).StartFiring(false, bRapidFire);			
		}
		else
		{
			xPawn(Instigator).StartFiring(true, bRapidFire);
		}		
	}
	else
	{
		// End:0xD6
		if(bIsAimed)
		{
			xPawn(Instigator).StartFiring(false, bAltRapidFire);			
		}
		else
		{
			xPawn(Instigator).StartFiring(true, bAltRapidFire);
		}
	}
	SetTimer(WeaponLightTime, false);
	//return;	
}

simulated function PlayMeleeFiring()
{
	// End:0x27
	if(!Instigator.IsA('BallisticPawn'))
	{
		PlayPawnTrackAnim(TrackNum[2]);		
	}
	else
	{
		Instigator.SetAnimAction('MeleeStrike');
	}
	//return;	
}

simulated function PlayPawnTrackAnim(byte Mode)
{
	local int i;

	// End:0x12
	if(xPawn(Instigator) == none)
	{
		return;
	}
	// End:0xB1
	if(((Instigator != none) && Level.TimeSeconds <= TrackEndTime) && int(TrackNum[int(Mode)]) != int(ActiveTrack))
	{
		i = 0;
		J0x5B:

		// End:0xB1 [Loop If]
		if(i < (GetTrackCount(ActiveTrack)))
		{
			Instigator.SetBoneRotation(GetTrack(ActiveTrack, i).Bone, rot(0, 0, 0), 0, 1.0000000);
			i++;
			// [Loop Continue]
			goto J0x5B;
		}
	}
	Instigator.PlayAnim(Instigator.IdleWeaponAnim,, 0.2000000, 1);
	TrackStartTime = Level.TimeSeconds;
	ActiveTrack = TrackNum[int(Mode)];
	TrackEndTime = TrackStartTime + (GetTrackTime(ActiveTrack));
	bTrackPlaying = true;
	SetTimer(WeaponLightTime, false);
	//return;	
}

simulated event Tick(float dt)
{
	local float TrackTime, PreviousTime, NextTime, SegmentTime;
	local Rotator PreviousOffset, nextOffset, NewOffset;
	local int i, j;

	super(Actor).Tick(dt);
	// End:0x46
	if(Level.TimeSeconds > TrackEndTime)
	{
		// End:0x30
		if(!bTrackPlaying)
		{
			return;
		}
		TrackTime = 1.0000000;
		bTrackPlaying = false;		
	}
	else
	{
		TrackTime = (Level.TimeSeconds - TrackStartTime) / (TrackEndTime - TrackStartTime);
	}
	i = 0;
	J0x76:

	// End:0x230 [Loop If]
	if(i < (GetTrackCount(ActiveTrack)))
	{
		j = 0;
		J0x92:

		// End:0x226 [Loop If]
		if(j < GetTrack(ActiveTrack, i).Points.Length)
		{
			// End:0x21C
			if(GetTrack(ActiveTrack, i).Points[j].Time >= TrackTime)
			{
				// End:0x108
				if(j == 0)
				{
					PreviousTime = 0.0000000;
					PreviousOffset = rot(0, 0, 0);					
				}
				else
				{
					PreviousTime = GetTrack(ActiveTrack, i).Points[j - 1].Time;
					PreviousOffset = GetTrack(ActiveTrack, i).Points[j - 1].offset;
				}
				NextTime = GetTrack(ActiveTrack, i).Points[j].Time;
				nextOffset = GetTrack(ActiveTrack, i).Points[j].offset;
				SegmentTime = (TrackTime - PreviousTime) / (NextTime - PreviousTime);
				NewOffset = Class'BCoreProV55.BUtil'.static.RSmerp(SegmentTime, PreviousOffset, nextOffset);
				Instigator.SetBoneRotation(GetTrack(ActiveTrack, i).Bone, NewOffset, 0, 1.0000000);
				// [Explicit Break]
				goto J0x226;
			}
			j++;
			// [Loop Continue]
			goto J0x92;
		}
		J0x226:

		i++;
		// [Loop Continue]
		goto J0x76;
	}
	//return;	
}

simulated function float GetTrackTime(byte Mode)
{
	switch(Mode)
	{
		// End:0x12
		case 2:
			return 0.5000000;
		// End:0x1D
		case 1:
			return 0.8000000;
		// End:0xFFFF
		default:
			return 0.5000000;
			break;
	}
	//return;	
}

simulated function int GetTrackCount(byte Mode)
{
	switch(Mode)
	{
		// End:0x13
		case 2:
			return SlashTracks.Length;
		// End:0x1F
		case 1:
			return ThrowTracks.Length;
		// End:0xFFFF
		default:
			return SlashTracks.Length;
			break;
	}
	//return;	
}

simulated function BoneTrack GetTrack(byte Mode, int Index)
{
	switch(Mode)
	{
		// End:0x18
		case 2:
			return SlashTracks[Index];
		// End:0x29
		case 1:
			return ThrowTracks[Index];
		// End:0xFFFF
		default:
			return SlashTracks[Index];
			break;
	}
	//return;	
}

simulated function FlashWeaponLight(byte Mode)
{
	Mode = byte(Min(int(Mode), 1));
	// End:0x2C
	if(!ModeInfos[int(Mode)].bLight)
	{
		return;
	}
	// End:0x89
	if(((Instigator == none) || Level.bDropDetail) || ((Level.TimeSeconds - LastRenderTime) > 0.2000000) && PlayerController(Instigator.Controller) == none)
	{
		return;
	}
	// End:0xB4
	if(Instigator.Weapon != none)
	{
		LightWeapon = Instigator.Weapon;		
	}
	else
	{
		LightWeapon = self;
	}
	LightWeapon.bDynamicLight = true;
	SetTimer(WeaponLightTime, false);
	//return;	
}

simulated event Destroyed()
{
	local int i;

	// End:0x82
	if((Instigator != none) && Level.TimeSeconds <= TrackEndTime)
	{
		i = 0;
		J0x2C:

		// End:0x82 [Loop If]
		if(i < (GetTrackCount(ActiveTrack)))
		{
			Instigator.SetBoneRotation(GetTrack(ActiveTrack, i).Bone, rot(0, 0, 0), 0, 1.0000000);
			i++;
			// [Loop Continue]
			goto J0x2C;
		}
	}
	Class'BCoreProV55.BUtil'.static.KillEmitterEffect(MuzzleFlash);
	Class'BCoreProV55.BUtil'.static.KillEmitterEffect(AltMuzzleFlash);
	super(Actor).Destroyed();
	//return;	
}

simulated function Timer()
{
	// End:0x24
	if(xPawn(Instigator) != none)
	{
		xPawn(Instigator).StopFiring();
	}
	// End:0x47
	if(LightWeapon != none)
	{
		LightWeapon.bDynamicLight = false;
		LightWeapon = none;
	}
	//return;	
}

function UpdateBlockHit()
{
	//return;	
}

function UpdateWallPenetrate(byte Mode, Vector HitLocation, Vector HitNormal, int HitSurf, optional bool bExit)
{
	WallPenetrates = byte(Max(int(WallPenetrates) + 1, 1));
	WallPenetrateEffect(Mode, HitLocation, HitNormal, HitSurf, bExit);
	//return;	
}

simulated function WallPenetrateEffect(byte Mode, Vector HitLocation, Vector HitNormal, int HitSurf, optional bool bExit)
{
	// End:0x68
	if((((int(Level.DetailMode) < int(1)) || int(Class'BCoreProV55.BallisticMod'.default.EffectsDetailMode) == 0) || int(Level.NetMode) == int(NM_DedicatedServer)) || ModeInfos[int(Mode)].ImpactManager == none)
	{
		return;
	}
	// End:0xA6
	if(bExit && (int(Level.DetailMode) == int(1)) || int(Class'BCoreProV55.BallisticMod'.default.EffectsDetailMode) == 1)
	{
		return;
	}
	// End:0xE4
	if(bExit)
	{
		ModeInfos[int(Mode)].ImpactManager.static.StartSpawn(HitLocation, HitNormal, HitSurf, Instigator, 2);		
	}
	else
	{
		ModeInfos[int(Mode)].ImpactManager.static.StartSpawn(HitLocation, HitNormal, HitSurf, Instigator);
	}
	//return;	
}

function BallisticUpdateHit(Actor HitActor, Vector HitLocation, Vector HitNormal, int HitSurf, optional bool bIsAlt, optional Vector WaterHitLoc)
{
	mHitSurf = HitSurf;
	WaterHitLocation = WaterHitLoc;
	// End:0x37
	if(bIsAlt)
	{
		AltUpdateHit(HitActor, HitLocation, HitNormal);		
	}
	else
	{
		UpdateHit(HitActor, HitLocation, HitNormal);
	}
	//return;	
}

function UpdateHit(Actor HitActor, Vector HitLocation, Vector HitNormal)
{
	mHitNormal = HitNormal;
	mHitActor = HitActor;
	mHitLocation = HitLocation;
	FiringMode = 0;
	FireCount++;
	NetUpdateTime = Level.TimeSeconds - float(1);
	ThirdPersonEffects();
	//return;	
}

function AltUpdateHit(Actor HitActor, Vector HitLocation, Vector HitNormal)
{
	mHitNormal = HitNormal;
	mHitActor = HitActor;
	mHitLocation = HitLocation;
	FiringMode = 1;
	AltFireCount++;
	NetUpdateTime = Level.TimeSeconds - float(1);
	ThirdPersonEffects();
	//return;	
}

function MeleeUpdateHit(Actor HitActor, Vector HitLocation, Vector HitNormal, int HitSurf)
{
	mHitSurf = HitSurf;
	mHitNormal = HitNormal;
	mHitActor = HitActor;
	mHitLocation = HitLocation;
	FiringMode = byte(255);
	MeleeFireCount++;
	NetUpdateTime = Level.TimeSeconds - float(1);
	PlayMeleeFiring();
	MeleeFireEffects();
	//return;	
}

simulated function DoDirectHit(byte Mode, Vector HitLocation, Vector HitNormal, int HitSurf)
{
	// End:0x70
	if(((int(Level.NetMode) != int(NM_DedicatedServer)) && Instigator != none) && ModeInfos[int(Mode)].ImpactManager != none)
	{
		ModeInfos[int(Mode)].ImpactManager.static.StartSpawn(HitLocation, HitNormal, HitSurf, Instigator);
	}
	//return;	
}

function UpdateDirectHit(byte Mode, Vector HitLocation, Vector HitNormal, int HitSurf)
{
	DirectImpact.Mode = Mode;
	DirectImpact.HitLoc = HitLocation;
	DirectImpact.HitNorm = Class'BCoreProV55.BUtil'.static.NormToByte(HitNormal);
	DirectImpact.HitSurf = byte(HitSurf);
	DirectImpactCount++;
	DoDirectHit(Mode, HitLocation, HitNormal, HitSurf);
	//return;	
}

defaultproperties
{
	bDoWaterSplash=true
	WeaponLightTime=0.1500000
	FlashBone="tip"
	AltFlashBone="tip"
	FlashScale=1.0000000
	BrassBone="ejector"
	TrackAnimMode=3
	TracerChance=1.0000000
	FlyBySound=(Sound=none,Volume=0.5000000,Radius=64.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	FlyByMode=2
	FlybyRange=384.0000000
	FlyByBulletSpeed=8000.0000000
	ReloadAnim="Reload_AR"
	CockingAnim="Cock_RearPull"
	StaggerAnim="Stagger"
	ReloadAnimRate=1.0000000
	CockAnimRate=1.0000000
	StaggerRate=1.0000000
	IdleHeavyAnim="RifleHip_Idle"
	IdleRifleAnim="RifleAimed_Idle"
	MeleeStrikeAnim="Melee_Stab"
	MeleeAnimRate=1.0000000
	SingleFireAnim="RifleHip_Fire"
	SingleAimedFireAnim="RifleAimed_Fire"
	RapidFireAnim="RifleHip_Burst"
	RapidAimedFireAnim="RifleAimed_Burst"
	SlashTracks[0]=(Bone="Bip01 R Forearm",Points=((offset=(Pitch=0,Yaw=0,Roll=0),Time=0.0000000),(offset=(Pitch=0,Yaw=-4096,Roll=0),Time=0.3000000),(offset=(Pitch=0,Yaw=10000,Roll=0),Time=0.4000000),(offset=(Pitch=0,Yaw=12000,Roll=0),Time=0.6000000),(offset=(Pitch=0,Yaw=0,Roll=0),Time=1.0000000)))
	SlashTracks[1]=(Bone="Bip01 R UpperArm",Points=((offset=(Pitch=0,Yaw=0,Roll=0),Time=0.0000000),(offset=(Pitch=-4096,Yaw=-2048,Roll=-8192),Time=0.3000000),(offset=(Pitch=8192,Yaw=4096,Roll=-8192),Time=0.6000000),(offset=(Pitch=0,Yaw=0,Roll=0),Time=1.0000000)))
	SlashTracks[2]=(Bone="Bip01 Spine1",Points=((offset=(Pitch=0,Yaw=0,Roll=0),Time=0.0000000),(offset=(Pitch=0,Yaw=-4096,Roll=-8192),Time=0.3000000),(offset=(Pitch=0,Yaw=2048,Roll=-8192),Time=0.7000000),(offset=(Pitch=0,Yaw=0,Roll=0),Time=1.0000000)))
	SlashTracks[3]=(Bone="Bip01 L UpperArm",Points=((offset=(Pitch=0,Yaw=0,Roll=0),Time=0.0000000),(offset=(Pitch=0,Yaw=8192,Roll=0),Time=0.3000000),(offset=(Pitch=0,Yaw=8192,Roll=0),Time=0.6000000),(offset=(Pitch=0,Yaw=0,Roll=0),Time=1.0000000)))
	SlashTracks[4]=(Bone="Bip01 R Hand",Points=((offset=(Pitch=0,Yaw=0,Roll=0),Time=0.0000000),(offset=(Pitch=6000,Yaw=4096,Roll=12000),Time=0.3000000),(offset=(Pitch=10000,Yaw=4096,Roll=4096),Time=0.6000000),(offset=(Pitch=0,Yaw=0,Roll=0),Time=1.0000000)))
	SlashTracks[5]=(Bone="Bip01 Head",Points=((offset=(Pitch=0,Yaw=0,Roll=0),Time=0.0000000),(offset=(Pitch=0,Yaw=0,Roll=8192),Time=0.3000000),(offset=(Pitch=0,Yaw=0,Roll=8192),Time=0.7000000),(offset=(Pitch=0,Yaw=0,Roll=0),Time=1.0000000)))
	ThrowTracks[0]=(Bone="Bip01 R UpperArm",Points=((offset=(Pitch=0,Yaw=0,Roll=0),Time=0.0000000),(offset=(Pitch=2048,Yaw=8192,Roll=-14000),Time=0.3000000),(offset=(Pitch=12000,Yaw=-8192,Roll=0),Time=0.6000000),(offset=(Pitch=0,Yaw=0,Roll=0),Time=1.0000000)))
	ThrowTracks[1]=(Bone="Bip01 R Forearm",Points=((offset=(Pitch=0,Yaw=0,Roll=0),Time=0.0000000),(offset=(Pitch=0,Yaw=4096,Roll=0),Time=0.3000000),(offset=(Pitch=0,Yaw=16384,Roll=0),Time=0.6000000),(offset=(Pitch=0,Yaw=0,Roll=0),Time=1.0000000)))
	ThrowTracks[2]=(Bone="Bip01 Spine1",Points=((offset=(Pitch=0,Yaw=0,Roll=0),Time=0.0000000),(offset=(Pitch=0,Yaw=0,Roll=4096),Time=0.3000000),(offset=(Pitch=0,Yaw=2048,Roll=-12000),Time=0.7000000),(offset=(Pitch=0,Yaw=0,Roll=0),Time=1.0000000)))
	ThrowTracks[3]=(Bone="Bip01 L UpperArm",Points=((offset=(Pitch=0,Yaw=0,Roll=0),Time=0.0000000),(offset=(Pitch=0,Yaw=8192,Roll=0),Time=0.3000000),(offset=(Pitch=0,Yaw=8192,Roll=0),Time=0.6000000),(offset=(Pitch=0,Yaw=0,Roll=0),Time=1.0000000)))
	ThrowTracks[4]=(Bone="Bip01 R Hand",Points=((offset=(Pitch=0,Yaw=0,Roll=0),Time=0.0000000),(offset=(Pitch=-8192,Yaw=0,Roll=0),Time=0.3000000),(offset=(Pitch=0,Yaw=0,Roll=0),Time=0.6000000),(offset=(Pitch=0,Yaw=0,Roll=0),Time=1.0000000)))
	ThrowTracks[5]=(Bone="Bip01 Head",Points=((offset=(Pitch=0,Yaw=0,Roll=0),Time=0.0000000),(offset=(Pitch=0,Yaw=0,Roll=-4096),Time=0.3000000),(offset=(Pitch=0,Yaw=0,Roll=12000),Time=0.7000000),(offset=(Pitch=0,Yaw=0,Roll=0),Time=1.0000000)))
	TrackNum[1]=1
	bNetNotify=true
}
