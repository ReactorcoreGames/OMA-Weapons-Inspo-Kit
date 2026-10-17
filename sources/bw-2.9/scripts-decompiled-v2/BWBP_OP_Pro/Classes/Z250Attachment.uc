class Z250Attachment extends BallisticAttachment;

var float LastShotTime;
var byte YawSpeed;
var byte PitchSpeed;
var() Class<BallisticInstantFire> FireClass;
var byte NetBarrelSpeed;
var int BarrelTurn;
var float BarrelSpeed;
var float LastMinigunFlashTime;
var float LastMinigunAltFlashTime;

replication
{
	// Pos:0x000
	reliable if(bNetDirty && int(Role) == int(ROLE_Authority))
		PitchSpeed, YawSpeed;

	// Pos:0x018
	reliable if(int(Role) == int(ROLE_Authority))
		NetBarrelSpeed;
}

simulated event PostNetBeginPlay()
{
	super.PostNetBeginPlay();
	// End:0x25
	if(!Class'BCoreProV55.BallisticReplicationInfo'.static.IsArena())
	{
		ImpactManager = Class'BWBP_SKC_Pro.IM_ExpBulletLarge';
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
	// End:0xD4
	if(LastMinigunFlashTime != Level.TimeSeconds)
	{
		LastMinigunFlashTime = Level.TimeSeconds;
		Mode = 0;		
	}
	else
	{
		// End:0x10B
		if(LastMinigunAltFlashTime != Level.TimeSeconds)
		{
			LastMinigunAltFlashTime = Level.TimeSeconds;
			Mode = 1;			
		}
		else
		{
			return;
		}
	}
	// End:0x128
	if(bRandomFlashRoll)
	{
		R.Roll = Rand(65536);
	}
	// End:0x1F1
	if((int(Mode) != 0) && AltMuzzleFlashClass != none)
	{
		// End:0x1BA
		if(AltMuzzleFlash == none)
		{
			// End:0x18F
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
		// End:0x1EE
		if(bRandomFlashRoll)
		{
			SetBoneRotation(AltFlashBone, R, 0, 1.0000000);
		}		
	}
	else
	{
		// End:0x2B7
		if((int(Mode) == 0) && MuzzleFlashClass != none)
		{
			// End:0x283
			if(MuzzleFlash == none)
			{
				// End:0x258
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
			// End:0x2B7
			if(bRandomFlashRoll)
			{
				SetBoneRotation(FlashBone, R, 0, 1.0000000);
			}
		}
	}
	//return;	
}

simulated event Tick(float dt)
{
	local Rotator bt;

	super.Tick(dt);
	// End:0x31
	if(int(Role) == int(ROLE_Authority))
	{
		NetBarrelSpeed = byte(BarrelSpeed * float(255));		
	}
	else
	{
		BarrelSpeed = float(NetBarrelSpeed) / 255.0000000;
	}
	// End:0x9C
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		BarrelTurn += int((BarrelSpeed * float(655360)) * dt);
		bt.Roll = BarrelTurn;
		SetBoneRotation('BarrelArray', bt);
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
	// End:0xA1
	if(int(FireCount) != int(OldFireCount))
	{
		// End:0x61
		if(int(FireCount) < int(OldFireCount))
		{
			MinigunEffects((int(FireCount) + 256) - int(OldFireCount));			
		}
		else
		{
			MinigunEffects(int(FireCount) - int(OldFireCount));
		}
		FiringMode = 0;
		OldFireCount = FireCount;
		LastShotTime = Level.TimeSeconds;		
	}
	else
	{
		super.PostNetReceive();
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
		mHitActor = Trace(HitLocation, mHitNormal, mHitLocation + (Dir * float(10)), mHitLocation - (Dir * float(10)), true,, HitMat);
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
	// End:0x2C5
	if(mHitActor == none)
	{
		return;
	}
	// End:0x310
	if((!mHitActor.bWorldGeometry && Mover(mHitActor) == none) && mHitActor.bProjTarget)
	{
		Spawn(Class'BallisticProV55.IE_IncBulletMetal',,, HitLocation);
		return;
	}
	// End:0x33E
	if(ImpactManager != none)
	{
		ImpactManager.static.StartSpawn(HitLocation, mHitNormal, mHitSurf, Instigator);
	}
	//return;	
}

simulated function MinigunEffects(int ShotCount)
{
	local int i;
	local Rotator RotSpeed, AimRef, AimDir, AimInterval;
	local float dt;

	RotSpeed.Yaw = -16384 + (129 * int(YawSpeed));
	RotSpeed.Pitch = -16384 + (129 * int(PitchSpeed));
	InstantFireEffects(FiringMode);
	FlashMuzzleFlash(FiringMode);
	FlashWeaponLight(FiringMode);
	PlayPawnFiring(FiringMode);
	EjectBrass(FiringMode);
	// End:0x1EB
	if(ShotCount > 1)
	{
		// End:0xB9
		if((Level.TimeSeconds - LastShotTime) < 0.2000000)
		{
			dt = Level.TimeSeconds - LastShotTime;			
		}
		else
		{
			dt = 0.1000000;
		}
		AimInterval = RotSpeed * dt;
		// End:0x113
		if(Instigator != none)
		{
			AimRef = Rotator((mHitLocation - Instigator.Location) + Instigator.EyePosition());			
		}
		else
		{
			AimRef = Rotator(mHitLocation - Location);
		}
		i = 1;
		J0x12E:

		// End:0x1EB [Loop If]
		if(i < ShotCount)
		{
			EjectBrass(FiringMode);
			AimDir = AimRef - (AimInterval * float(i));
			AimDir.Yaw += int(((FireClass.default.XInaccuracy * float(2)) * FRand()) - FireClass.default.XInaccuracy);
			AimDir.Pitch += int(((FireClass.default.YInaccuracy * float(2)) * FRand()) - FireClass.default.YInaccuracy);
			MinigunShotEffects(AimDir, FiringMode);
			i++;
			// [Loop Continue]
			goto J0x12E;
		}
	}
	//return;	
}

simulated function MinigunShotEffects(Rotator Aim, byte Mode)
{
	local Vector HitLoc, HitNorm, Start, End, X;

	local Actor t;
	local Material HitMat;
	local int HitSurf;

	X = Vector(Aim);
	// End:0x40
	if(Instigator != none)
	{
		Start = Instigator.Location + Instigator.EyePosition();		
	}
	else
	{
		Start = Location;
	}
	End = Start + (X * Lerp(FRand(), FireClass.default.TraceRange.Min, FireClass.default.TraceRange.Max));
	t = Trace(HitLoc, HitNorm, End, Start, true,, HitMat);
	// End:0xE2
	if(t == none)
	{
		DoWaterTrace(int(Mode), Start, End);
		SpawnTracer(Mode, End);		
	}
	else
	{
		DoWaterTrace(int(Mode), Start, HitLoc);
		SpawnTracer(Mode, HitLoc);
	}
	// End:0x154
	if((!t.bWorldGeometry && Mover(t) == none) && t.bProjTarget)
	{
		Spawn(Class'BallisticProV55.IE_IncBulletMetal',,, HitLoc);
		return;
	}
	// End:0x189
	if((t == none) || !t.bWorldGeometry && Mover(t) == none)
	{
		return;
	}
	// End:0x1AD
	if(HitMat == none)
	{
		HitSurf = int(t.SurfaceType);		
	}
	else
	{
		HitSurf = int(HitMat.SurfaceType);
	}
	// End:0x1ED
	if(ImpactManager != none)
	{
		ImpactManager.static.StartSpawn(HitLoc, HitNorm, HitSurf, self);
	}
	//return;	
}

function UpdateTurnVelocity(Rotator TurnVelocity)
{
	YawSpeed = byte(float(Clamp(TurnVelocity.Yaw + 16384, 0, 32768)) / 128.5000000);
	PitchSpeed = byte(float(Clamp(TurnVelocity.Pitch + 16384, 0, 32768)) / 128.5000000);
	//return;	
}

simulated function FlyByEffects(byte Mode, Vector HitLoc)
{
	local Vector TipLoc, ViewLoc, PointX, Dir;
	local float DotResult, XDist;

	// End:0x3F
	if(((int(Level.DetailMode) < int(1)) || !Class'BCoreProV55.BallisticMod'.default.bBulletFlybys) || FRand() > 0.3000000)
	{
		return;
	}
	// End:0x93
	if(((int(FlyByMode) == int(3)) || (int(FlyByMode) == int(1)) && int(Mode) == 0) || (int(FlyByMode) == int(0)) && int(Mode) != 0)
	{
		return;
	}
	TipLoc = GetModeTipLocation();
	ViewLoc = Level.GetLocalPlayerController().ViewTarget.Location;
	Dir = Normal(HitLoc - TipLoc);
	DotResult = Dir Dot Normal(ViewLoc - TipLoc);
	// End:0x104
	if(DotResult < float(0))
	{
		return;
	}
	XDist = DotResult * VSize(ViewLoc - TipLoc);
	PointX = TipLoc + (Dir * XDist);
	// End:0x152
	if(VSize(PointX - ViewLoc) > FlybyRange)
	{
		return;
	}
	// End:0x185
	if((XDist < float(256)) || XDist > (VSize(HitLoc - TipLoc) - float(128)))
	{
		return;
	}
	FlyBySound.Pitch = 0.8500000 + (0.3000000 * FRand());
	Class'BCoreProV55.BCFlyByActor'.static.SoundOff(self, FlyBySound, PointX, XDist / FlyByBulletSpeed);
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

simulated function Vector GetModeTipLocation(optional byte Mode)
{
	// End:0x60
	if(((Instigator != none) && Instigator.IsFirstPerson()) && PlayerController(Instigator.Controller).ViewTarget == Instigator)
	{
		return Instigator.Weapon.GetEffectStart();
	}
	return GetBoneCoords('tip').Origin;
	//return;	
}

defaultproperties
{
	FireClass=Class'BWBP_OP_Pro.Z250PrimaryFire'
	WeaponClass=Class'BWBP_OP_Pro.Z250Minigun'
	MuzzleFlashClass=Class'BallisticProV55.XMV850FlashEmitter'
	AltMuzzleFlashClass=Class'BallisticProV55.XMV850FlashEmitter'
	ImpactManager=Class'BallisticProV55.IM_MinigunBullet'
	FlashScale=0.4500000
	BrassClass=Class'BallisticProV55.Brass_Minigun'
	TracerClass=Class'BWBP_SKC_Pro.TraceEmitter_Incendiary'
	FlyBySound=(Sound=SoundGroup'BW_Core_WeaponSound.FlyBys.Bullet-Whizz',Volume=0.7000000,Radius=64.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	ReloadAnim="Reload_MG"
	ReloadAnimRate=2.1500000
	bHeavy=true
	bRapidFire=true
	Mesh=SkeletalMesh'BWBP_OP_Anim.Z250_TPm'
	RelativeLocation=(X=3.0000000,Y=0.0000000,Z=8.0000000)
	DrawScale=0.3500000
}
