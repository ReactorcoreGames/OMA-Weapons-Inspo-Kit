class Xk2Attachment extends BallisticAttachment;

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

simulated function SetAmped(bool bIsAmped)
{
	bAmped = bIsAmped;
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
	// End:0xC8
	if(int(AltFireCount) != int(OldAltFireCount))
	{
		FiringMode = 1;
		ThirdPersonEffects();
		OldAltFireCount = AltFireCount;
	}
	// End:0xF0
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
	// End:0x95
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
		// End:0x84
		if((int(FiringMode) == 1) && bAmped)
		{
			SetBoneScale(1, 1.0000000, 'AMP');			
		}
		else
		{
			SetBoneScale(1, 0.0000000, 'AMP');
		}
	}
	super.ThirdPersonEffects();
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
	// End:0x34
	if((int(Mode) == 1) && !bAmped)
	{
		return;
	}
	TipLoc = GetModeTipLocation();
	dist = VSize(V - TipLoc);
	// End:0x6A
	if(TracerMix == 0)
	{
		bThisShot = true;		
	}
	else
	{
		TracerCounter++;
		// End:0xAA
		if(TracerMix < 0)
		{
			// End:0x9F
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
			// End:0xC8
			if(TracerCounter >= TracerMix)
			{
				TracerCounter = 0;
				bThisShot = true;
			}
		}
	}
	// End:0x17A
	if(((TracerClass != none) && bThisShot) && (TracerChance >= float(1)) || FRand() < TracerChance)
	{
		// End:0x15B
		if(dist > float(200))
		{
			// End:0x138
			if(bAmped)
			{
				Tracer = Spawn(IceTracerClass, self,, TipLoc, Rotator(V - TipLoc));				
			}
			else
			{
				Tracer = Spawn(TracerClass, self,, TipLoc, Rotator(V - TipLoc));
			}
		}
		// End:0x17A
		if(Tracer != none)
		{
			Tracer.Initialize(dist);
		}
	}
	// End:0x2AC
	if((((((Instigator != none) && Instigator.PhysicsVolume.bWaterVolume) && int(Level.DetailMode) == int(2)) && WaterTracerClass != none) && int(WaterTracerMode) != int(3)) && ((int(WaterTracerMode) == int(2)) || (int(WaterTracerMode) == int(1)) && int(Mode) != 0) || (int(WaterTracerMode) == int(0)) && int(Mode) == 0)
	{
		// End:0x284
		if(!Instigator.PhysicsVolume.TraceThisActor(WLoc, WNorm, TipLoc, V))
		{
			Tracer = Spawn(WaterTracerClass, self,, TipLoc, Rotator(WLoc - TipLoc));
		}
		// End:0x2AC
		if(Tracer != none)
		{
			Tracer.Initialize(VSize(WLoc - TipLoc));
		}
	}
	//return;	
}

defaultproperties
{
	IceTracerClass=Class'BallisticProV55.TraceEmitter_Freeze'
	IceImpactManager=Class'BallisticProV55.IM_FreezeHit'
	WeaponClass=Class'BallisticProV55.XK2SubMachinegun'
	MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter'
	AltMuzzleFlashClass=Class'BallisticProV55.XK2SilencedFlash'
	ImpactManager=Class'BallisticProV55.IM_Bullet'
	AltFlashBone="tip2"
	BrassClass=Class'BallisticProV55.Brass_Pistol'
	TracerClass=Class'BallisticProV55.TraceEmitter_Default'
	TracerMix=-3
	WaterTracerClass=Class'BallisticProV55.TraceEmitter_WaterBullet'
	FlyBySound=(Sound=SoundGroup'BW_Core_WeaponSound.FlyBys.Bullet-Whizz',Volume=0.7000000,Radius=64.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	ReloadAnimRate=0.9750000
	CockAnimRate=0.7750000
	bRapidFire=true
	bAltRapidFire=true
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.XK2_TPm'
	DrawScale=0.1100000
}
