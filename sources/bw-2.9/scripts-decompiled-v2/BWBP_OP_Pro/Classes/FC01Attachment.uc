class FC01Attachment extends BallisticAttachment;

var int PhotonFireCount;
var int OldPhotonFireCount;
var() Class<BCTraceEmitter> PhotonTracerClass;
var() Class<BCImpactManager> PhotonImpactManager;
var() Actor PhotonMuzzleFlash;
var() Class<Actor> PhotonMuzzleFlashClass;
var bool bLaserOn;
var bool bOldLaserOn;
var LaserActor Laser;
var Vector LaserEndLoc;
var Emitter LaserDot;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		PhotonFireCount, bLaserOn;

	// Pos:0x00D
	reliable if((int(Role) == int(ROLE_Authority)) && !bNetOwner)
		LaserEndLoc;
}

simulated function KillLaserDot()
{
	// End:0x21
	if(LaserDot != none)
	{
		LaserDot.Kill();
		LaserDot = none;
	}
	//return;	
}

simulated function SpawnLaserDot(optional Vector loc)
{
	// End:0x20
	if(LaserDot == none)
	{
		LaserDot = Spawn(Class'BallisticProV55.G5LaserDot',,, loc);
	}
	LaserDot.bHidden = false;
	//return;	
}

simulated function Tick(float dt)
{
	local Vector Scale3D, loc;

	super.Tick(dt);
	// End:0x26
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		return;
	}
	// End:0x46
	if(Laser == none)
	{
		Laser = Spawn(Class'BallisticProV55.LaserActor_G5Painter',,, Location);
	}
	// End:0x64
	if(bLaserOn != bOldLaserOn)
	{
		bOldLaserOn = bLaserOn;
	}
	// End:0xD6
	if(((!bLaserOn || Instigator == none) || Instigator.IsFirstPerson()) || Instigator.DrivenVehicle != none)
	{
		// End:0xCB
		if(!Laser.bHidden)
		{
			Laser.bHidden = true;
		}
		KillLaserDot();
		return;		
	}
	else
	{
		// End:0xF9
		if(Laser.bHidden)
		{
			Laser.bHidden = false;
		}
		SpawnLaserDot();
	}
	// End:0x11B
	if(LaserDot != none)
	{
		LaserDot.SetLocation(LaserEndLoc);
	}
	loc = GetModeTipLocation();
	Laser.SetLocation(loc);
	Laser.SetRotation(Rotator(LaserEndLoc - loc));
	Scale3D.X = VSize(LaserEndLoc - Laser.Location) / float(128);
	Scale3D.Y = 1.5000000;
	Scale3D.Z = 1.5000000;
	Laser.SetDrawScale3D(Scale3D);
	//return;	
}

simulated function Destroyed()
{
	// End:0x17
	if(LaserDot != none)
	{
		LaserDot.Destroy();
	}
	// End:0x2E
	if(Laser != none)
	{
		Laser.Destroy();
	}
	super.Destroyed();
	//return;	
}

function PhotonUpdateHit(Actor HitActor, Vector HitLocation, Vector HitNormal, int HitSurf, optional bool bIsAlt, optional Vector WaterHitLoc)
{
	mHitSurf = HitSurf;
	WaterHitLocation = WaterHitLoc;
	mHitNormal = HitNormal;
	mHitActor = HitActor;
	mHitLocation = HitLocation;
	FiringMode = 2;
	PhotonFireCount++;
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
	if(PhotonFireCount != OldPhotonFireCount)
	{
		FiringMode = 2;
		ThirdPersonEffects();
		OldPhotonFireCount = PhotonFireCount;
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
	// End:0x30D
	if(ImpactManager != none)
	{
		// End:0x2EA
		if(int(FiringMode) == 2)
		{
			PhotonImpactManager.static.StartSpawn(HitLocation, mHitNormal, mHitSurf, Instigator);			
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
	// End:0x163
	if(((TracerClass != none) && bThisShot) && (TracerChance >= float(1)) || FRand() < TracerChance)
	{
		// End:0x144
		if(dist > float(200))
		{
			// End:0x121
			if(int(FiringMode) == 2)
			{
				Tracer = Spawn(PhotonTracerClass, self,, TipLoc, Rotator(V - TipLoc));				
			}
			else
			{
				Tracer = Spawn(TracerClass, self,, TipLoc, Rotator(V - TipLoc));
			}
		}
		// End:0x163
		if(Tracer != none)
		{
			Tracer.Initialize(dist);
		}
	}
	// End:0x295
	if((((((Instigator != none) && Instigator.PhysicsVolume.bWaterVolume) && int(Level.DetailMode) == int(2)) && WaterTracerClass != none) && int(WaterTracerMode) != int(3)) && ((int(WaterTracerMode) == int(2)) || (int(WaterTracerMode) == int(1)) && int(Mode) != 0) || (int(WaterTracerMode) == int(0)) && int(Mode) == 0)
	{
		// End:0x26D
		if(!Instigator.PhysicsVolume.TraceThisActor(WLoc, WNorm, TipLoc, V))
		{
			Tracer = Spawn(WaterTracerClass, self,, TipLoc, Rotator(WLoc - TipLoc));
		}
		// End:0x295
		if(Tracer != none)
		{
			Tracer.Initialize(VSize(WLoc - TipLoc));
		}
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
	// End:0x7F
	if(int(FiringMode) == 2)
	{
		return GetBoneCoords('tipalt').Origin;
	}
	return GetBoneCoords('tip').Origin;
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
	// End:0x13D
	if((PhotonMuzzleFlashClass != none) && int(FiringMode) == 2)
	{
		// End:0x109
		if(PhotonMuzzleFlash == none)
		{
			Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(PhotonMuzzleFlash, PhotonMuzzleFlashClass, DrawScale * FlashScale, self, AltFlashBone);
		}
		PhotonMuzzleFlash.Trigger(self, Instigator);
		// End:0x13D
		if(bRandomFlashRoll)
		{
			SetBoneRotation(AltFlashBone, R, 0, 1.0000000);
		}
	}
	// End:0x1C1
	if((MuzzleFlashClass != none) && int(FiringMode) == 0)
	{
		// End:0x18D
		if(MuzzleFlash == none)
		{
			Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(MuzzleFlash, MuzzleFlashClass, DrawScale * FlashScale, self, FlashBone);
		}
		MuzzleFlash.Trigger(self, Instigator);
		// End:0x1C1
		if(bRandomFlashRoll)
		{
			SetBoneRotation(FlashBone, R, 0, 1.0000000);
		}
	}
	//return;	
}

defaultproperties
{
	PhotonTracerClass=Class'BWBP_OP_Pro.TraceEmitter_FC01Photon'
	PhotonImpactManager=Class'BWBP_OP_Pro.IM_FC01Photon'
	PhotonMuzzleFlashClass=Class'BWBP_OP_Pro.FC01PhotonFlashEmitter'
	WeaponClass=Class'BWBP_OP_Pro.FC01SmartGun'
	MuzzleFlashClass=Class'BallisticProV55.M50FlashEmitter'
	ImpactManager=Class'BallisticProV55.IM_Bullet'
	AltFlashBone="tipalt"
	FlashScale=0.2750000
	BrassClass=Class'BallisticProV55.Brass_Shotgun'
	BrassMode=1
	FlashMode=2
	LightMode=2
	TracerClass=Class'BallisticProV55.TraceEmitter_Default'
	WaterTracerClass=Class'BallisticProV55.TraceEmitter_WaterBullet'
	FlyBySound=(Sound=SoundGroup'BW_Core_WeaponSound.FlyBys.Bullet-Whizz',Volume=0.7000000,Radius=64.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	ReloadAnimRate=0.6600000
	CockAnimRate=0.8500000
	bHeavy=true
	bRapidFire=true
	Mesh=SkeletalMesh'BWBP_OP_Anim.FC01_TPm'
	RelativeLocation=(X=0.0000000,Y=0.0000000,Z=10.0000000)
	RelativeRotation=(Pitch=32768,Yaw=0,Roll=0)
	DrawScale=0.9000000
}
