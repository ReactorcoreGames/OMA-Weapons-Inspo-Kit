class M575Attachment extends BallisticAttachment;

var int IceFireCount;
var int OldIceFireCount;
var() Class<BCTraceEmitter> IceTracerClass;
var() Class<BCImpactManager> IceImpactManager;
var() array<Material> AmpMaterials;
var bool bAmped;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		IceFireCount, bAmped;
}

simulated event PreBeginPlay()
{
	super(Actor).PreBeginPlay();
	// End:0x25
	if(!Class'BCoreProV55.BallisticReplicationInfo'.static.IsArena())
	{
		TracerClass = Class'BallisticProV55.TraceEmitter_FiftyNine';
	}
	//return;	
}

simulated event PostBeginPlay()
{
	super.PostBeginPlay();
	SetBoneScale(3, 0.0000000, 'AMP');
	//return;	
}

simulated function SetAmped(bool bIsAmped)
{
	bAmped = bIsAmped;
	// End:0x2B
	if(bAmped)
	{
		SetBoneScale(3, 1.0000000, 'AMP');		
	}
	else
	{
		SetBoneScale(3, 0.0000000, 'AMP');
	}
	//return;	
}

function IceUpdateHit(Actor HitActor, Vector HitLocation, Vector HitNormal, int HitSurf, optional bool bIsAlt, optional Vector WaterHitLoc)
{
	mHitSurf = HitSurf;
	WaterHitLocation = WaterHitLoc;
	mHitNormal = HitNormal;
	mHitActor = HitActor;
	mHitLocation = HitLocation;
	FiringMode = 1;
	IceFireCount++;
	NetUpdateTime = Level.TimeSeconds - float(1);
	ThirdPersonEffects();
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
	// End:0xC4
	if(IceFireCount != OldIceFireCount)
	{
		FiringMode = 1;
		ThirdPersonEffects();
		OldIceFireCount = IceFireCount;
	}
	//return;	
}

simulated event ThirdPersonEffects()
{
	// End:0x5A
	if((int(Level.NetMode) != int(NM_DedicatedServer)) && Instigator != none)
	{
		// End:0x48
		if(int(FiringMode) == 1)
		{
			SetBoneScale(3, 1.0000000, 'AMP');			
		}
		else
		{
			SetBoneScale(3, 0.0000000, 'AMP');
		}
	}
	super.ThirdPersonEffects();
	//return;	
}

simulated function Vector GetModeTipLocation(optional byte Mode)
{
	local Coords C;
	local Vector X, Y, Z;

	// End:0xE0
	if(((Instigator != none) && Instigator.IsFirstPerson()) && PlayerController(Instigator.Controller).ViewTarget == Instigator)
	{
		// End:0xBA
		if(M575Machinegun(Instigator.Weapon).bScopeView)
		{
			Instigator.Weapon.GetViewAxes(X, Y, Z);
			return (Instigator.Location + (X * float(20))) + (Z * float(5));			
		}
		else
		{
			C = Instigator.Weapon.GetBoneCoords('tip');
		}		
	}
	else
	{
		// End:0x10D
		if(BallisticTurret(Instigator) != none)
		{
			C = Instigator.GetBoneCoords('tip');			
		}
		else
		{
			C = GetBoneCoords('tip');
		}
	}
	// End:0x15F
	if((Instigator != none) && VSize(C.Origin - Instigator.Location) > float(250))
	{
		return Instigator.Location;
	}
	return C.Origin;
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
	// End:0x178
	if(((ModeInfos[int(Mode)].TracerClass != none) && bThisShot) && (TracerChance >= float(1)) || FRand() < TracerChance)
	{
		// End:0x159
		if(dist > float(200))
		{
			// End:0x129
			if(bAmped)
			{
				Tracer = Spawn(IceTracerClass, self,, TipLoc, Rotator(V - TipLoc));				
			}
			else
			{
				Tracer = Spawn(ModeInfos[int(Mode)].TracerClass, self,, TipLoc, Rotator(V - TipLoc));
			}
		}
		// End:0x178
		if(Tracer != none)
		{
			Tracer.Initialize(dist);
		}
	}
	// End:0x2C4
	if((((((Instigator != none) && Instigator.PhysicsVolume.bWaterVolume) && int(Level.DetailMode) == int(2)) && ModeInfos[int(Mode)].WaterTracerClass != none) && int(WaterTracerMode) != int(3)) && ((int(WaterTracerMode) == int(2)) || (int(WaterTracerMode) == int(1)) && int(Mode) != 0) || (int(WaterTracerMode) == int(0)) && int(Mode) == 0)
	{
		// End:0x29C
		if(!Instigator.PhysicsVolume.TraceThisActor(WLoc, WNorm, TipLoc, V))
		{
			Tracer = Spawn(ModeInfos[int(Mode)].WaterTracerClass, self,, TipLoc, Rotator(WLoc - TipLoc));
		}
		// End:0x2C4
		if(Tracer != none)
		{
			Tracer.Initialize(VSize(WLoc - TipLoc));
		}
	}
	//return;	
}

simulated function InstantFireEffects(byte Mode)
{
	local Vector HitLocation, Dir, Start;
	local Material HitMat;

	// End:0x19
	if(mHitLocation == vect(0.0000000, 0.0000000, 0.0000000))
	{
		return;
	}
	// End:0x26
	if(Instigator == none)
	{
		return;
	}
	SpawnTracer(Mode, mHitLocation);
	FlyByEffects(Mode, mHitLocation);
	// End:0x199
	if(int(Level.NetMode) == int(NM_Client))
	{
		mHitActor = none;
		Start = Instigator.Location + Instigator.EyePosition();
		// End:0xB5
		if(int(WallPenetrates) != 0)
		{
			WallPenetrates = 0;
			DoWallPenetrate(Mode, Start, mHitLocation);
		}
		Dir = Normal(mHitLocation - Start);
		mHitActor = Trace(HitLocation, mHitNormal, mHitLocation + (Dir * float(10)), mHitLocation - (Dir * float(10)), false,, HitMat);
		// End:0x134
		if((ImpactManager != none) && bDoWaterSplash)
		{
			DoWaterTrace(int(Mode), Start, mHitLocation);
		}
		// End:0x141
		if(mHitActor == none)
		{
			return;
		}
		// End:0x15C
		if(Vehicle(mHitActor) != none)
		{
			mHitSurf = 3;			
		}
		else
		{
			// End:0x180
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
	// End:0x264
	if((((((int(Level.NetMode) != int(NM_Client)) && ImpactManager != none) && WaterHitLocation != vect(0.0000000, 0.0000000, 0.0000000)) && bDoWaterSplash) && int(Level.DetailMode) >= int(1)) && int(Class'BCoreProV55.BallisticMod'.default.EffectsDetailMode) > 0)
	{
		ImpactManager.static.StartSpawn(WaterHitLocation, Normal((Instigator.Location + Instigator.EyePosition()) - WaterHitLocation), 9, Instigator);
	}
	// End:0x2AB
	if((mHitActor == none) || (!mHitActor.bWorldGeometry && Mover(mHitActor) == none) && Vehicle(mHitActor) == none)
	{
		return;
	}
	// End:0x308
	if(ImpactManager != none)
	{
		// End:0x2E5
		if(bAmped)
		{
			IceImpactManager.static.StartSpawn(HitLocation, mHitNormal, mHitSurf, Instigator);			
		}
		else
		{
			ImpactManager.static.StartSpawn(HitLocation, mHitNormal, mHitSurf, Instigator);
		}
	}
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
			Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(AltMuzzleFlash, AltMuzzleFlashClass, DrawScale * 0.3000000, self, AltFlashBone);
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
	IceTracerClass=Class'BallisticProV55.TraceEmitter_Freeze'
	IceImpactManager=Class'BWBP_SKC_Pro.IM_BulletAmpFrostHE'
	WeaponClass=Class'BWBP_OP_Pro.M575Machinegun'
	MuzzleFlashClass=Class'BallisticProV55.Fifty9FlashEmitter'
	AltMuzzleFlashClass=Class'BWBP_SKC_Pro.SX45CryoFlash'
	ImpactManager=Class'BallisticProV55.IM_Bullet'
	FlashScale=0.2000000
	BrassClass=Class'BallisticProV55.Brass_MG'
	BrassMode=2
	TracerMode=2
	InstantMode=2
	FlashMode=2
	TracerClass=Class'BallisticProV55.TraceEmitter_Default'
	TracerMix=-3
	WaterTracerClass=Class'BallisticProV55.TraceEmitter_WaterBullet'
	WaterTracerMode=2
	FlyBySound=(Sound=SoundGroup'BW_Core_WeaponSound.FlyBys.Bullet-Whizz',Volume=0.7000000,Radius=64.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	ReloadAnim="Reload_MG"
	ReloadAnimRate=1.2100000
	CockAnimRate=0.9750000
	bHeavy=true
	bRapidFire=true
	Mesh=SkeletalMesh'BWBP_OP_Anim.M575_TPm'
	RelativeLocation=(X=1.0000000,Y=0.0000000,Z=4.0000000)
	DrawScale=0.7500000
}
