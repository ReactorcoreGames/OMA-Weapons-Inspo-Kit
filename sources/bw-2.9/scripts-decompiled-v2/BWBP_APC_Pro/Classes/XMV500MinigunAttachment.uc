class XMV500MinigunAttachment extends BallisticAttachment;

var float LastShotTime;
var byte YawSpeed;
var byte PitchSpeed;
var bool bLaserOn;
var bool bOldLaserOn;
var LaserActor Laser;
var Rotator LaserRot;
var BallisticWeapon Heavy;
var() Class<BallisticInstantFire> FireClass;
var XMV500Pack Pack;
var byte NetBarrelSpeed;
var int BarrelTurn;
var float BarrelSpeed;
var float LastMinigunFlashTime;
var float LastMinigunAltFlashTime;

replication
{
	// Pos:0x000
	reliable if(bNetDirty && int(Role) == int(ROLE_Authority))
		PitchSpeed, YawSpeed, 
		bLaserOn;

	// Pos:0x018
	reliable if(int(Role) == int(ROLE_Authority))
		LaserRot, NetBarrelSpeed;
}

simulated function SetOverlayMaterial(Material mat, float Time, bool bOverride)
{
	super(Actor).SetOverlayMaterial(mat, Time, bOverride);
	// End:0x40
	if(Pack != none)
	{
		Pack.SetOverlayMaterial(mat, Time, bOverride);
	}
	//return;	
}

simulated function Hide(bool NewbHidden)
{
	super(xWeaponAttachment).Hide(NewbHidden);
	// End:0x2D
	if(Pack != none)
	{
		Pack.bHidden = NewbHidden;
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

simulated function Tick(float dt)
{
	local Rotator bt, X;
	local Vector HitLocation, Start, End, HitNormal, Scale3D, loc;

	local Actor Other;

	super.Tick(dt);
	// End:0x8A
	if(int(Role) == int(ROLE_Authority))
	{
		NetBarrelSpeed = byte(BarrelSpeed * float(255));
		// End:0x87
		if(bLaserOn && Heavy != none)
		{
			LaserRot = Instigator.GetViewRotation();
			LaserRot += Heavy.GetAimPivot();
			LaserRot += Heavy.GetRecoilPivot();
		}		
	}
	else
	{
		BarrelSpeed = float(NetBarrelSpeed) / 255.0000000;
	}
	// End:0xF5
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		BarrelTurn += int((BarrelSpeed * float(655360)) * dt);
		bt.Roll = BarrelTurn;
		SetBoneRotation('Barrels', bt);
	}
	// End:0x138
	if((bLaserOn && int(Role) == int(ROLE_Authority)) && Heavy != none)
	{
		// End:0x138
		if(int(Level.NetMode) == int(NM_DedicatedServer))
		{
			return;
		}
	}
	// End:0x158
	if(Laser == none)
	{
		Laser = Spawn(Class'BallisticProV55.LaserActor_Third',,, Location);
	}
	// End:0x176
	if(bLaserOn != bOldLaserOn)
	{
		bOldLaserOn = bLaserOn;
	}
	// End:0x1E2
	if(((!bLaserOn || Instigator == none) || Instigator.IsFirstPerson()) || Instigator.DrivenVehicle != none)
	{
		// End:0x1DD
		if(!Laser.bHidden)
		{
			Laser.bHidden = true;
		}
		return;		
	}
	else
	{
		// End:0x205
		if(Laser.bHidden)
		{
			Laser.bHidden = false;
		}
	}
	// End:0x238
	if(Instigator != none)
	{
		Start = Instigator.Location + Instigator.EyePosition();		
	}
	else
	{
		Start = Location;
	}
	X = LaserRot;
	loc = GetTipLocation();
	End = Start + (Vector(X) * float(5000));
	Other = Trace(HitLocation, HitNormal, End, Start, true);
	// End:0x2AB
	if(Other == none)
	{
		HitLocation = End;
	}
	Laser.SetLocation(loc);
	Laser.SetRotation(Rotator(HitLocation - loc));
	Scale3D.X = VSize(HitLocation - Laser.Location) / float(128);
	Scale3D.Y = 1.0000000;
	Scale3D.Z = 1.0000000;
	Laser.SetDrawScale3D(Scale3D);
	//return;	
}

function InitFor(Inventory i)
{
	super.InitFor(i);
	// End:0x2B
	if(BallisticWeapon(i) != none)
	{
		Heavy = BallisticWeapon(i);
	}
	//return;	
}

simulated function TestBoneMove()
{
	local Vector NewLoc;

	SetBoneDirection('Stock', rot(0, 0, 0), vect(0.0000000, 0.0000000, 0.0000000), 1.0000000, 0);
	NewLoc = Instigator.Location - GetBoneCoords('Stock').Origin;
	SetBoneDirection('Stock', rot(0, 0, 0), NewLoc, 1.0000000, 0);
	//return;	
}

simulated function SpawnPack()
{
	// End:0x19
	if(Pack == none)
	{
		Pack = Spawn(Class'BWBP_APC_Pro.XMV500Pack');
	}
	// End:0x9B
	if(Pack != none)
	{
		// End:0x77
		if(BallisticTurret(Instigator) != none)
		{
			// End:0x74
			if(BallisticTurret(Instigator).Driver != none)
			{
				BallisticTurret(Instigator).Driver.AttachToBone(Pack, 'spine');
			}			
		}
		else
		{
			// End:0x9B
			if(Instigator != none)
			{
				Instigator.AttachToBone(Pack, 'spine');
			}
		}
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
			AimRef = Rotator(mHitLocation - (Instigator.Location + Instigator.EyePosition()));			
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
	t = Trace(HitLoc, HitNorm, End, Start, false,, HitMat);
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
	// End:0x13E
	if((t == none) || !t.bWorldGeometry && Mover(t) == none)
	{
		return;
	}
	// End:0x162
	if(HitMat == none)
	{
		HitSurf = int(t.SurfaceType);		
	}
	else
	{
		HitSurf = int(HitMat.SurfaceType);
	}
	// End:0x1A2
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
	TipLoc = GetModeTipLocation(Mode);
	ViewLoc = Level.GetLocalPlayerController().ViewTarget.Location;
	Dir = Normal(HitLoc - TipLoc);
	DotResult = Dir Dot Normal(ViewLoc - TipLoc);
	// End:0x109
	if(DotResult < float(0))
	{
		return;
	}
	XDist = DotResult * VSize(ViewLoc - TipLoc);
	PointX = TipLoc + (Dir * XDist);
	// End:0x157
	if(VSize(PointX - ViewLoc) > FlybyRange)
	{
		return;
	}
	// End:0x18A
	if((XDist < float(256)) || XDist > (VSize(HitLoc - TipLoc) - float(128)))
	{
		return;
	}
	FlyBySound.Pitch = 0.8500000 + (0.3000000 * FRand());
	Class'BCoreProV55.BCFlyByActor'.static.SoundOff(self, FlyBySound, PointX, XDist / FlyByBulletSpeed);
	//return;	
}

simulated function Destroyed()
{
	// End:0x17
	if(Pack != none)
	{
		Pack.Destroy();
	}
	// End:0x2E
	if(Laser != none)
	{
		Laser.Destroy();
	}
	super.Destroyed();
	//return;	
}

simulated event PostNetBeginPlay()
{
	super.PostNetBeginPlay();
	super.PostNetBeginPlay();
	// End:0x24
	if(BallisticTurret(Instigator) != none)
	{
		bHidden = true;
	}
	SpawnPack();
	//return;	
}

simulated function Vector GetModeTipLocation(optional byte Mode)
{
	local Coords C;

	// End:0x6D
	if(((Instigator != none) && Instigator.IsFirstPerson()) && PlayerController(Instigator.Controller).ViewTarget == Instigator)
	{
		C = Instigator.Weapon.GetBoneCoords('tip');		
	}
	else
	{
		// End:0x9A
		if(BallisticTurret(Instigator) != none)
		{
			C = Instigator.GetBoneCoords('tip');			
		}
		else
		{
			C = GetBoneCoords('tip');
		}
	}
	// End:0xEC
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

defaultproperties
{
	FireClass=Class'BWBP_APC_Pro.XMV500MinigunPrimaryFire'
	WeaponClass=Class'BWBP_APC_Pro.XMV500Minigun'
	MuzzleFlashClass=Class'BallisticProV55.XMV850FlashEmitter'
	AltMuzzleFlashClass=Class'BallisticProV55.XMV850FlashEmitter'
	ImpactManager=Class'BallisticProV55.IM_IncendiaryHMGBullet'
	BrassClass=Class'BallisticProV55.Brass_Minigun'
	TracerClass=Class'BWBP_SKC_Pro.TraceEmitter_Incendiary'
	TracerChance=0.8000000
	FlyBySound=(Sound=SoundGroup'BW_Core_WeaponSound.FlyBys.Bullet-Whizz',Volume=0.7000000,Radius=64.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	bHeavy=true
	bRapidFire=true
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.XMV850_TPm'
	DrawScale=0.3000000
}
