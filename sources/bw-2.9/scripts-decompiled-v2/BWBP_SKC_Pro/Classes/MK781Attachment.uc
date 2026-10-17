class MK781Attachment extends BallisticShotgunAttachment;

var() Class<BallisticShotgunFire> FireClassAlt;
var byte CurrentTracerMode;
var Class<BCTraceEmitter> TracerClasses[3];
var Class<BCImpactManager> ImpactManagers[3];
var bool bSilenced;
var bool bOldSilenced;
var bool bLightsOn;
var bool bLightsOnOld;
var Projector FlashLightProj;
var Emitter FlashLightEmitter;
var bool bLaserOn;
var bool bOldLaserOn;
var LaserActor Laser;
var Rotator LaserRot;
var BallisticWeapon myWeap;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		CurrentTracerMode, bLaserOn, 
		bLightsOn, bSilenced;

	// Pos:0x00D
	reliable if(int(Role) == int(ROLE_Authority))
		LaserRot;
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
			SetBoneScale(0, 1.0000000, 'Muzzle2');			
		}
		else
		{
			SetBoneScale(0, 0.0000000, 'Muzzle2');
		}
	}
	super(BallisticAttachment).PostNetReceive();
	//return;	
}

function InitFor(Inventory i)
{
	super(BallisticAttachment).InitFor(i);
	// End:0x2B
	if(BallisticWeapon(i) != none)
	{
		myWeap = BallisticWeapon(i);
	}
	// End:0x5C
	if((MK781Shotgun(i) != none) && MK781Shotgun(i).bIsSlug)
	{
		CurrentTracerMode = 1;
	}
	//return;	
}

simulated function int GetTraceCount()
{
	// End:0x6C
	if(WeaponClass != none)
	{
		// End:0x1D
		if(int(CurrentTracerMode) == 1)
		{
			return 1;			
		}
		else
		{
			return ShotgunEffectParams(WeaponClass.default.ParamsClasses[int(Class'BCoreProV55.BallisticReplicationInfo'.default.GameStyle)].default.Layouts[0].FireParams[0].FireEffectParams[0]).TraceCount;
		}
	}
	return 10;
	//return;	
}

function SetSilenced(bool bIsSilenced)
{
	bSilenced = bIsSilenced;
	// End:0x2A
	if(bSilenced)
	{
		SetBoneScale(0, 1.0000000, 'Muzzle2');		
	}
	else
	{
		SetBoneScale(0, 0.0000000, 'Muzzle2');
	}
	//return;	
}

simulated event PostBeginPlay()
{
	super(BallisticAttachment).PostBeginPlay();
	SetBoneScale(0, 0.0000000, 'Muzzle2');
	//return;	
}

simulated function InstantFireEffects(byte Mode)
{
	local Vector HitLocation, Start, End;
	local Rotator R;
	local Material HitMat;
	local int i;
	local float Xs, Ys, RMin, RMax, Range, fX;

	// End:0x357
	if((int(Level.NetMode) == int(NM_Client)) && int(Mode) == 0)
	{
		RMin = float(GetTraceRange());
		RMax = float(GetTraceRange());
		Start = Instigator.Location + Instigator.EyePosition();
		i = 0;
		J0x70:

		// End:0x357 [Loop If]
		if(i < (GetTraceCount()))
		{
			mHitActor = none;
			Range = Lerp(FRand(), RMin, RMax);
			R = Rotator(mHitLocation);
			switch(GetSpreadMode())
			{
				// End:0x128
				case 1:
					fX = FRand();
					R.Yaw += int((float(XInaccuracy) * ((FRand() * float(2)) - float(1))) * Sin(fX * 1.5707960));
					R.Pitch += int((float(YInaccuracy) * ((FRand() * float(2)) - float(1))) * Cos(fX * 1.5707960));
					// End:0x208
					break;
				// End:0x1B2
				case 2:
					fX = FRand();
					R.Yaw += int((float(XInaccuracy) * Sin(((FRand() * float(2)) - float(1)) * 1.5707960)) * Sin(fX * 1.5707960));
					R.Pitch += int((float(YInaccuracy) * Sin(((FRand() * float(2)) - float(1)) * 1.5707960)) * Cos(fX * 1.5707960));
					// End:0x208
					break;
				// End:0xFFFF
				default:
					R.Yaw += int(((FRand() * float(XInaccuracy)) * float(2)) - float(XInaccuracy));
					R.Pitch += int(((FRand() * float(YInaccuracy)) * float(2)) - float(YInaccuracy));
					// End:0x208
					break;
					break;
			}
			End = Start + (Vector(R) * Range);
			mHitActor = Trace(HitLocation, mHitNormal, End, Start, false,, HitMat);
			// End:0x27C
			if(mHitActor == none)
			{
				DoWaterTrace(int(Mode), Start, End);
				SpawnTracer(Mode, End);				
			}
			else
			{
				DoWaterTrace(int(Mode), Start, HitLocation);
				SpawnTracer(Mode, HitLocation);
			}
			// End:0x2D9
			if((mHitActor == none) || !mHitActor.bWorldGeometry && Mover(mHitActor) == none)
			{
				// [Explicit Continue]
				goto J0x34D;
			}
			// End:0x2FD
			if(HitMat == none)
			{
				mHitSurf = int(mHitActor.SurfaceType);				
			}
			else
			{
				mHitSurf = int(HitMat.SurfaceType);
			}
			// End:0x34D
			if(ImpactManagers[int(CurrentTracerMode)] != none)
			{
				ImpactManagers[int(CurrentTracerMode)].static.StartSpawn(HitLocation, mHitNormal, mHitSurf, self);
			}
			J0x34D:

			i++;
			// [Loop Continue]
			goto J0x70;
		}
	}
	// End:0x6FC
	if((((int(Level.NetMode) == int(NM_Client)) && FireClassAlt != none) && int(Mode) == 1) && !bSilenced)
	{
		Xs = FireClassAlt.default.XInaccuracy;
		Ys = FireClassAlt.default.YInaccuracy;
		RMin = FireClassAlt.default.TraceRange.Min;
		RMax = FireClassAlt.default.TraceRange.Max;
		Start = Instigator.Location + Instigator.EyePosition();
		i = 0;
		J0x41F:

		// End:0x6FC [Loop If]
		if(i < FireClassAlt.default.TraceCount)
		{
			mHitActor = none;
			Range = Lerp(FRand(), RMin, RMax);
			R = Rotator(mHitLocation);
			switch(FireClassAlt.default.FireSpreadMode)
			{
				// End:0x4E3
				case 1:
					fX = FRand();
					R.Yaw += int((Xs * ((FRand() * float(2)) - float(1))) * Sin(fX * 1.5707960));
					R.Pitch += int((Ys * ((FRand() * float(2)) - float(1))) * Cos(fX * 1.5707960));
					// End:0x5B7
					break;
				// End:0x569
				case 2:
					fX = FRand();
					R.Yaw += int((Xs * Sin(((FRand() * float(2)) - float(1)) * 1.5707960)) * Sin(fX * 1.5707960));
					R.Pitch += int((Ys * Sin(((FRand() * float(2)) - float(1)) * 1.5707960)) * Cos(fX * 1.5707960));
					// End:0x5B7
					break;
				// End:0xFFFF
				default:
					R.Yaw += int(((FRand() * Xs) * float(2)) - Xs);
					R.Pitch += int(((FRand() * Ys) * float(2)) - Ys);
					// End:0x5B7
					break;
					break;
			}
			End = Start + (Vector(R) * Range);
			mHitActor = Trace(HitLocation, mHitNormal, End, Start, false,, HitMat);
			// End:0x62B
			if(mHitActor == none)
			{
				DoWaterTrace(int(Mode), Start, End);
				SpawnTracer(Mode, End);				
			}
			else
			{
				DoWaterTrace(int(Mode), Start, HitLocation);
				SpawnTracer(Mode, HitLocation);
			}
			// End:0x688
			if((mHitActor == none) || !mHitActor.bWorldGeometry && Mover(mHitActor) == none)
			{
				// [Explicit Continue]
				goto J0x6F2;
			}
			// End:0x6AC
			if(HitMat == none)
			{
				mHitSurf = int(mHitActor.SurfaceType);				
			}
			else
			{
				mHitSurf = int(HitMat.SurfaceType);
			}
			// End:0x6F2
			if(ImpactManagers[2] != none)
			{
				ImpactManagers[2].static.StartSpawn(HitLocation, mHitNormal, mHitSurf, self);
			}
			J0x6F2:

			i++;
			// [Loop Continue]
			goto J0x41F;
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
	// End:0x19A
	if((((((TracerClasses[int(CurrentTracerMode)] != none) && int(TracerMode) != int(3)) && (int(TracerMode) == int(2)) && int(Mode) == 0) && bThisShot) && (TracerChance >= float(1)) || FRand() < TracerChance) && !bSilenced)
	{
		// End:0x17B
		if(dist > float(200))
		{
			Tracer = Spawn(TracerClasses[int(CurrentTracerMode)], self,, TipLoc, Rotator(V - TipLoc));
		}
		// End:0x19A
		if(Tracer != none)
		{
			Tracer.Initialize(dist);
		}
	}
	// End:0x258
	if(((((TracerClasses[2] != none) && !bSilenced) && int(TracerMode) != int(3)) && (int(TracerMode) == int(2)) && int(Mode) != 0) && (TracerChance >= float(1)) || FRand() < TracerChance)
	{
		// End:0x239
		if(dist > float(200))
		{
			Tracer = Spawn(TracerClasses[2], self,, TipLoc, Rotator(V - TipLoc));
		}
		// End:0x258
		if(Tracer != none)
		{
			Tracer.Initialize(dist);
		}
	}
	// End:0x38A
	if((((((Instigator != none) && Instigator.PhysicsVolume.bWaterVolume) && int(Level.DetailMode) == int(2)) && WaterTracerClass != none) && int(WaterTracerMode) != int(3)) && ((int(WaterTracerMode) == int(2)) || (int(WaterTracerMode) == int(1)) && int(Mode) != 0) || (int(WaterTracerMode) == int(0)) && int(Mode) == 0)
	{
		// End:0x362
		if(!Instigator.PhysicsVolume.TraceThisActor(WLoc, WNorm, TipLoc, V))
		{
			Tracer = Spawn(WaterTracerClass, self,, TipLoc, Rotator(WLoc - TipLoc));
		}
		// End:0x38A
		if(Tracer != none)
		{
			Tracer.Initialize(VSize(WLoc - TipLoc));
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
			Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(AltMuzzleFlash, AltMuzzleFlashClass, DrawScale * 0.6000000, self, AltFlashBone);
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

simulated function Vector GetModeTipLocation(optional byte Mode)
{
	local Coords C;

	// End:0x12
	if(!bSilenced)
	{
		return super(BallisticAttachment).GetModeTipLocation();
	}
	// End:0x7F
	if(((Instigator != none) && Instigator.IsFirstPerson()) && PlayerController(Instigator.Controller).ViewTarget == Instigator)
	{
		C = Instigator.Weapon.GetBoneCoords('tip2');		
	}
	else
	{
		C = GetBoneCoords('tip2');
	}
	return C.Origin;
	//return;	
}

simulated function Hide(bool NewbHidden)
{
	super(xWeaponAttachment).Hide(NewbHidden);
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
	AttachToBone(FlashLightProj, 'tip');
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
			AttachToBone(FlashLightEmitter, 'tip');
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

simulated function Tick(float dt)
{
	local Vector HitLocation, Start, End, HitNormal, Scale3D, loc;

	local Rotator X;
	local Actor Other;

	super(BallisticAttachment).Tick(dt);
	// End:0x76
	if((bLaserOn && int(Role) == int(ROLE_Authority)) && myWeap != none)
	{
		LaserRot = Instigator.GetViewRotation();
		LaserRot += myWeap.GetAimPivot();
		LaserRot += myWeap.GetRecoilPivot();
	}
	// End:0x91
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		return;
	}
	// End:0xB5
	if(bLightsOn != bLightsOnOld)
	{
		SwitchFlashLight();
		bLightsOnOld = bLightsOn;
	}
	// End:0x14C
	if(bLightsOn)
	{
		// End:0x109
		if(Instigator.IsFirstPerson())
		{
			KillProjector();
			// End:0x106
			if((FlashLightEmitter != none) && FlashLightEmitter.bCorona)
			{
				FlashLightEmitter.bCorona = false;
			}			
		}
		else
		{
			// End:0x11A
			if(FlashLightProj == none)
			{
				StartProjector();
			}
			// End:0x14C
			if((FlashLightEmitter != none) && !FlashLightEmitter.bCorona)
			{
				FlashLightEmitter.bCorona = true;
			}
		}
	}
	// End:0x16C
	if(Laser == none)
	{
		Laser = Spawn(Class'BallisticProV55.LaserActor_Third',,, Location);
	}
	// End:0x18A
	if(bLaserOn != bOldLaserOn)
	{
		bOldLaserOn = bLaserOn;
	}
	// End:0x1F6
	if(((!bLaserOn || Instigator == none) || Instigator.IsFirstPerson()) || Instigator.DrivenVehicle != none)
	{
		// End:0x1F1
		if(!Laser.bHidden)
		{
			Laser.bHidden = true;
		}
		return;		
	}
	else
	{
		// End:0x219
		if(Laser.bHidden)
		{
			Laser.bHidden = false;
		}
	}
	// End:0x24C
	if(Instigator != none)
	{
		Start = Instigator.Location + Instigator.EyePosition();		
	}
	else
	{
		Start = Location;
	}
	X = LaserRot;
	loc = GetBoneCoords('tip').Origin;
	End = Start + (Vector(X) * float(5000));
	Other = Trace(HitLocation, HitNormal, End, Start, true);
	// End:0x2C9
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

simulated function Destroyed()
{
	// End:0x17
	if(Laser != none)
	{
		Laser.Destroy();
	}
	// End:0x2E
	if(FlashLightEmitter != none)
	{
		FlashLightEmitter.Destroy();
	}
	KillProjector();
	super(BallisticAttachment).Destroyed();
	//return;	
}

defaultproperties
{
	FireClassAlt=Class'BWBP_SKC_Pro.MK781SecondaryFire'
	TracerClasses[0]=Class'BWBP_SKC_Pro.TraceEmitter_Flechette'
	TracerClasses[1]=Class'BallisticProV55.TraceEmitter_AP'
	TracerClasses[2]=Class'BWBP_SKC_Pro.TraceEmitter_Supercharge'
	ImpactManagers[0]=Class'BallisticProV55.IM_Shell'
	ImpactManagers[1]=Class'BallisticProV55.IM_BigBulletHMG'
	ImpactManagers[2]=Class'BWBP_SKC_Pro.IM_Supercharge'
	WeaponClass=Class'BWBP_SKC_Pro.MK781Shotgun'
	MuzzleFlashClass=Class'BWBP_SKC_Pro.MK781FlashEmitter'
	AltMuzzleFlashClass=Class'BallisticProV55.XK2SilencedFlash'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	FlashScale=0.8000000
	BrassClass=Class'BallisticProV55.Brass_Shotgun'
	BrassMode=2
	TracerMode=2
	InstantMode=2
	FlashMode=2
	LightMode=2
	TracerClass=Class'BWBP_SKC_Pro.TraceEmitter_Flechette'
	CockAnimRate=0.8000000
	Mesh=SkeletalMesh'BWBP_SKC_Anim.MK781_TPm'
	RelativeRotation=(Pitch=32768,Yaw=0,Roll=0)
	DrawScale=0.5000000
	PrePivot=(X=0.0000000,Y=0.0000000,Z=-5.0000000)
	Skins[0]=Texture'BWBP_SKC_Tex.M1014.M1014-Misc'
}
