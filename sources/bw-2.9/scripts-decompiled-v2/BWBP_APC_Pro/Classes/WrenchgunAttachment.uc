class WrenchgunAttachment extends BallisticShotgunAttachment;

var byte SideFireCount;
var byte OldSideFireCount;
var bool Side;
var() Class<BCImpactManager> ImpactManagerAlt;
var() Class<BCTraceEmitter> TracerClassAlt;
var Actor MuzzleFlashRight;
var Actor sHitActor;
var int sHitSurf;
var Vector sHitLocation;
var Vector sHitNormal;
var Vector sWaterHitLocation;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		SideFireCount;
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
	if(int(SideFireCount) != int(OldSideFireCount))
	{
		FiringMode = 2;
		ThirdPersonEffects();
		OldSideFireCount = SideFireCount;
	}
	// End:0xF4
	if(int(AltFireCount) != int(OldAltFireCount))
	{
		FiringMode = 1;
		ThirdPersonEffects();
		OldAltFireCount = AltFireCount;
	}
	//return;	
}

function DoubleUpdateHit(Actor HitActor, Vector HitLocation, Vector HitNormal, Actor sideHitActor, Vector sideHitLocation, Vector sideHitNormal, int HitSurf, int sideHitSurf, optional Vector WaterHitLoc, optional Vector sideWaterHitLoc)
{
	mHitSurf = HitSurf;
	sHitSurf = sideHitSurf;
	WaterHitLocation = WaterHitLoc;
	sWaterHitLocation = sideWaterHitLoc;
	mHitNormal = HitNormal;
	mHitActor = HitActor;
	mHitLocation = HitLocation;
	FiringMode = 0;
	FireCount++;
	ThirdPersonEffects();
	sHitNormal = sideHitNormal;
	sHitActor = sideHitActor;
	sHitLocation = sideHitLocation;
	FiringMode = 2;
	SideFireCount++;
	NetUpdateTime = Level.TimeSeconds - float(1);
	ThirdPersonEffects();
	//return;	
}

simulated function ShotgunFireEffects(byte Mode)
{
	local Vector HitLocation, Start, End;
	local Rotator R;
	local Material HitMat;
	local int i;
	local float RMin, RMax, Range, fX;

	// End:0x32C
	if(int(Level.NetMode) == int(NM_Client))
	{
		RMin = float(GetTraceRange());
		RMax = float(GetTraceRange());
		Start = Instigator.Location + Instigator.EyePosition();
		i = 0;
		J0x61:

		// End:0x32C [Loop If]
		if(i < (GetTraceCount()))
		{
			mHitActor = none;
			Range = Lerp(FRand(), RMin, RMax);
			R = Rotator(mHitLocation);
			switch(GetSpreadMode())
			{
				// End:0x119
				case 1:
					fX = FRand();
					R.Yaw += int((float(XInaccuracy) * ((FRand() * float(2)) - float(1))) * Sin(fX * 1.5707960));
					R.Pitch += int((float(YInaccuracy) * ((FRand() * float(2)) - float(1))) * Cos(fX * 1.5707960));
					// End:0x1F9
					break;
				// End:0x1A3
				case 2:
					fX = FRand();
					R.Yaw += int((float(XInaccuracy) * Sin(((FRand() * float(2)) - float(1)) * 1.5707960)) * Sin(fX * 1.5707960));
					R.Pitch += int((float(YInaccuracy) * Sin(((FRand() * float(2)) - float(1)) * 1.5707960)) * Cos(fX * 1.5707960));
					// End:0x1F9
					break;
				// End:0xFFFF
				default:
					R.Yaw += int(((FRand() * float(XInaccuracy)) * float(2)) - float(XInaccuracy));
					R.Pitch += int(((FRand() * float(YInaccuracy)) * float(2)) - float(YInaccuracy));
					// End:0x1F9
					break;
					break;
			}
			End = Start + (Vector(R) * Range);
			mHitActor = Trace(HitLocation, mHitNormal, End, Start, false,, HitMat);
			// End:0x267
			if(mHitActor == none)
			{
				DoWaterTrace(0, Start, End);
				SpawnTracer(Mode, End);				
			}
			else
			{
				DoWaterTrace(0, Start, HitLocation);
				SpawnTracer(Mode, HitLocation);
			}
			// End:0x2BE
			if((mHitActor == none) || !mHitActor.bWorldGeometry && Mover(mHitActor) == none)
			{
				// [Explicit Continue]
				goto J0x322;
			}
			// End:0x2E2
			if(HitMat == none)
			{
				mHitSurf = int(mHitActor.SurfaceType);				
			}
			else
			{
				mHitSurf = int(HitMat.SurfaceType);
			}
			// End:0x322
			if(ImpactManager != none)
			{
				ImpactManager.static.StartSpawn(HitLocation, mHitNormal, mHitSurf, self);
			}
			J0x322:

			i++;
			// [Loop Continue]
			goto J0x61;
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
	// End:0x14A
	if(((TracerClass != none) && bThisShot) && (TracerChance >= float(1)) || FRand() < TracerChance)
	{
		// End:0x12B
		if(dist > float(200))
		{
			Tracer = Spawn(TracerClass, self,, TipLoc, Rotator(V - TipLoc));
		}
		// End:0x14A
		if(Tracer != none)
		{
			Tracer.Initialize(dist);
		}
	}
	// End:0x27C
	if((((((Instigator != none) && Instigator.PhysicsVolume.bWaterVolume) && int(Level.DetailMode) == int(2)) && WaterTracerClass != none) && int(WaterTracerMode) != int(3)) && ((int(WaterTracerMode) == int(2)) || (int(WaterTracerMode) == int(1)) && int(Mode) == 1) || (int(WaterTracerMode) == int(0)) && int(Mode) != 1)
	{
		// End:0x254
		if(!Instigator.PhysicsVolume.TraceThisActor(WLoc, WNorm, TipLoc, V))
		{
			Tracer = Spawn(WaterTracerClass, self,, TipLoc, Rotator(WLoc - TipLoc));
		}
		// End:0x27C
		if(Tracer != none)
		{
			Tracer.Initialize(VSize(WLoc - TipLoc));
		}
	}
	//return;	
}

simulated function Vector GetModeTipLocation(optional byte Mode)
{
	local Coords C;

	// End:0xA1
	if(((Instigator != none) && Instigator.IsFirstPerson()) && PlayerController(Instigator.Controller).ViewTarget == Instigator)
	{
		// End:0x7B
		if(int(FiringMode) == 2)
		{
			C = Instigator.Weapon.GetBoneCoords('tip');			
		}
		else
		{
			C = Instigator.Weapon.GetBoneCoords('tip2');
		}		
	}
	else
	{
		// End:0xC2
		if(int(FiringMode) == 0)
		{
			C = GetBoneCoords(FlashBone);			
		}
		else
		{
			C = GetBoneCoords(AltFlashBone);
		}
	}
	// End:0x14D
	if((((Instigator != none) && int(Level.NetMode) != int(NM_Standalone)) && int(Level.NetMode) != int(NM_ListenServer)) && VSize(C.Origin - Instigator.Location) > float(300))
	{
		return Instigator.Location;
	}
	return C.Origin;
	//return;	
}

simulated function FlashMuzzleFlash(byte Mode)
{
	local Rotator R;

	// End:0x54
	if(((int(FlashMode) == int(3)) || (int(FlashMode) == int(1)) && int(Mode) != 1) || (int(FlashMode) == int(0)) && int(Mode) == 1)
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
	// End:0x178
	if((int(Mode) == 1) && AltMuzzleFlashClass != none)
	{
		// End:0x141
		if(AltMuzzleFlash == none)
		{
			// End:0x116
			if(!Side)
			{
				Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(AltMuzzleFlash, AltMuzzleFlashClass, DrawScale * FlashScale, self, AltFlashBone);				
			}
			else
			{
				Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(AltMuzzleFlash, AltMuzzleFlashClass, DrawScale * FlashScale, self, FlashBone);
			}
		}
		AltMuzzleFlash.Trigger(self, Instigator);
		// End:0x175
		if(bRandomFlashRoll)
		{
			SetBoneRotation(AltFlashBone, R, 0, 1.0000000);
		}		
	}
	else
	{
		// End:0x275
		if(MuzzleFlashClass != none)
		{
			// End:0x1FD
			if(int(Mode) == 0)
			{
				// End:0x1C6
				if(MuzzleFlash == none)
				{
					Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(MuzzleFlash, MuzzleFlashClass, DrawScale * FlashScale, self, FlashBone);
				}
				MuzzleFlash.Trigger(self, Instigator);
				// End:0x1FA
				if(bRandomFlashRoll)
				{
					SetBoneRotation(FlashBone, R, 0, 1.0000000);
				}				
			}
			else
			{
				// End:0x275
				if(int(Mode) == 2)
				{
					// End:0x241
					if(MuzzleFlashRight == none)
					{
						Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(MuzzleFlashRight, MuzzleFlashClass, DrawScale * FlashScale, self, AltFlashBone);
					}
					MuzzleFlashRight.Trigger(self, Instigator);
					// End:0x275
					if(bRandomFlashRoll)
					{
						SetBoneRotation(AltFlashBone, R, 0, 1.0000000);
					}
				}
			}
		}
	}
	//return;	
}

simulated function EjectBrass(byte Mode)
{
	//return;	
}

defaultproperties
{
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	MeleeImpactManager=Class'BallisticProV55.IM_GunHit'
	FlashBone="Tip1"
	AltFlashBone="tip2"
	FlashScale=1.5000000
	BrassClass=Class'BallisticProV55.Brass_MRS138Shotgun'
	BrassMode=2
	FlashMode=2
	LightMode=2
	TracerClass=Class'BallisticProV55.TraceEmitter_Shotgun'
	ReloadAnim="Reload_MuzzlePistol"
	RelativeLocation=(X=5.0000000,Y=0.0000000,Z=4.0000000)
	RelativeRotation=(Pitch=32768,Yaw=0,Roll=0)
	DrawScale=0.4500000
}
