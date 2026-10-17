class CYLOAttachment extends BallisticAttachment;

var byte CurrentTracerMode;
var byte CurrentAltTracerMode;
var Class<BCTraceEmitter> TracerClasses[3];
var Class<BCImpactManager> ImpactManagers[3];
var Class<BCTraceEmitter> AltTracerClasses[3];
var Class<BCImpactManager> AltImpactManagers[3];
var() Class<BallisticShotgunFire> FireClass;
var BallisticWeapon myWeap;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		CurrentAltTracerMode, CurrentTracerMode;
}

function InitFor(Inventory i)
{
	super.InitFor(i);
	// End:0x2B
	if(BallisticWeapon(i) != none)
	{
		myWeap = BallisticWeapon(i);
	}
	// End:0xA8
	if(CYLOUAW(i) != none)
	{
		// End:0x62
		if(CYLOUAW(i).bExplosive)
		{
			CurrentTracerMode = 1;
			CurrentAltTracerMode = 1;
		}
		// End:0x89
		if(CYLOUAW(i).bExplosiveOnPlayers)
		{
			CurrentTracerMode = 2;
			CurrentAltTracerMode = 1;
		}
		// End:0xA8
		if(CYLOUAW(i).bSlugger)
		{
			CurrentAltTracerMode = 2;
		}
	}
	//return;	
}

simulated function InstantFireEffects(byte Mode)
{
	local Vector HitLocation, Dir, Start;
	local Material HitMat;

	// End:0x2A
	if((int(FiringMode) == 1) && int(CurrentAltTracerMode) != 2)
	{
		ShotgunFireEffects(FiringMode);
		return;
	}
	Mode = byte(Min(int(Mode), 1));
	// End:0x56
	if(!ModeInfos[int(Mode)].bInstant)
	{
		return;
	}
	// End:0x6F
	if(mHitLocation == vect(0.0000000, 0.0000000, 0.0000000))
	{
		return;
	}
	// End:0x7C
	if(Instigator == none)
	{
		return;
	}
	SpawnTracer(Mode, mHitLocation);
	FlyByEffects(Mode, mHitLocation);
	// End:0x1F7
	if(int(Level.NetMode) == int(NM_Client))
	{
		mHitActor = none;
		Start = Instigator.Location + Instigator.EyePosition();
		// End:0x10B
		if(int(WallPenetrates) != 0)
		{
			WallPenetrates = 0;
			DoWallPenetrate(Mode, Start, mHitLocation);
		}
		Dir = Normal(mHitLocation - Start);
		mHitActor = Trace(HitLocation, mHitNormal, mHitLocation + (Dir * float(10)), mHitLocation - (Dir * float(10)), false,, HitMat);
		// End:0x192
		if((ImpactManagers[int(CurrentTracerMode)] != none) && bDoWaterSplash)
		{
			DoWaterTrace(int(Mode), Start, mHitLocation);
		}
		// End:0x19F
		if(mHitActor == none)
		{
			return;
		}
		// End:0x1BA
		if(Vehicle(mHitActor) != none)
		{
			mHitSurf = 3;			
		}
		else
		{
			// End:0x1DE
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
	// End:0x2DC
	if((((((int(Level.NetMode) != int(NM_Client)) && ModeInfos[int(Mode)].ImpactManager != none) && WaterHitLocation != vect(0.0000000, 0.0000000, 0.0000000)) && bDoWaterSplash) && int(Level.DetailMode) >= int(1)) && int(Class'BCoreProV55.BallisticMod'.default.EffectsDetailMode) > 0)
	{
		ModeInfos[int(Mode)].ImpactManager.static.StartSpawn(WaterHitLocation, Normal((Instigator.Location + Instigator.EyePosition()) - WaterHitLocation), 9, Instigator);
	}
	// End:0x323
	if((mHitActor == none) || (!mHitActor.bWorldGeometry && Mover(mHitActor) == none) && Vehicle(mHitActor) == none)
	{
		return;
	}
	// End:0x361
	if(ImpactManagers[int(CurrentTracerMode)] != none)
	{
		ImpactManagers[int(CurrentTracerMode)].static.StartSpawn(HitLocation, mHitNormal, mHitSurf, Instigator);
	}
	//return;	
}

simulated function ShotgunFireEffects(byte Mode)
{
	local Vector HitLocation, Start, End;
	local Rotator R;
	local Material HitMat;
	local int i;
	local float Xs, Ys, RMin, RMax, Range, fX;

	// End:0x3BA
	if((int(Level.NetMode) == int(NM_Client)) && FireClass != none)
	{
		Xs = FireClass.default.XInaccuracy;
		Ys = FireClass.default.YInaccuracy;
		// End:0x71
		if(!bIsAimed)
		{
			Xs *= 2.5000000;
			Ys *= 2.5000000;
		}
		RMin = FireClass.default.TraceRange.Min;
		RMax = FireClass.default.TraceRange.Max;
		Start = Instigator.Location + Instigator.EyePosition();
		i = 0;
		J0xCF:

		// End:0x3BA [Loop If]
		if(i < FireClass.default.TraceCount)
		{
			mHitActor = none;
			Range = Lerp(FRand(), RMin, RMax);
			R = Rotator(mHitLocation);
			switch(FireClass.default.FireSpreadMode)
			{
				// End:0x193
				case 1:
					fX = FRand();
					R.Yaw += int((Xs * ((FRand() * float(2)) - float(1))) * Sin(fX * 1.5707960));
					R.Pitch += int((Ys * ((FRand() * float(2)) - float(1))) * Cos(fX * 1.5707960));
					// End:0x267
					break;
				// End:0x219
				case 2:
					fX = FRand();
					R.Yaw += int((Xs * Sin(((FRand() * float(2)) - float(1)) * 1.5707960)) * Sin(fX * 1.5707960));
					R.Pitch += int((Ys * Sin(((FRand() * float(2)) - float(1)) * 1.5707960)) * Cos(fX * 1.5707960));
					// End:0x267
					break;
				// End:0xFFFF
				default:
					R.Yaw += int(((FRand() * Xs) * float(2)) - Xs);
					R.Pitch += int(((FRand() * Ys) * float(2)) - Ys);
					// End:0x267
					break;
					break;
			}
			End = Start + (Vector(R) * Range);
			mHitActor = Trace(HitLocation, mHitNormal, End, Start, false,, HitMat);
			// End:0x2DB
			if(mHitActor == none)
			{
				DoWaterTrace(int(Mode), Start, End);
				SpawnAltTracer(Mode, End);				
			}
			else
			{
				DoWaterTrace(int(Mode), Start, HitLocation);
				SpawnAltTracer(Mode, HitLocation);
			}
			// End:0x338
			if((mHitActor == none) || !mHitActor.bWorldGeometry && Mover(mHitActor) == none)
			{
				// [Explicit Continue]
				goto J0x3B0;
			}
			// End:0x35C
			if(HitMat == none)
			{
				mHitSurf = int(mHitActor.SurfaceType);				
			}
			else
			{
				mHitSurf = int(HitMat.SurfaceType);
			}
			// End:0x3B0
			if(AltImpactManagers[int(CurrentTracerMode)] != none)
			{
				AltImpactManagers[int(CurrentTracerMode)].static.StartSpawn(HitLocation, mHitNormal, mHitSurf, Instigator);
			}
			J0x3B0:

			i++;
			// [Loop Continue]
			goto J0xCF;
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
	// End:0x1F9
	if(((ModeInfos[int(Mode)].bTracer && TracerClasses[int(CurrentTracerMode)] != none) && bThisShot) && (ModeInfos[int(Mode)].TracerChance >= float(1)) || FRand() < ModeInfos[int(Mode)].TracerChance)
	{
		// End:0x1DA
		if(dist > float(200))
		{
			Tracer = Spawn(TracerClasses[int(CurrentTracerMode)], self,, TipLoc, Rotator(V - TipLoc));
		}
		// End:0x1F9
		if(Tracer != none)
		{
			Tracer.Initialize(dist);
		}
	}
	// End:0x2F7
	if(((((Instigator != none) && Instigator.PhysicsVolume.bWaterVolume) && int(Level.DetailMode) == int(2)) && ModeInfos[int(Mode)].WaterTracerClass != none) && ModeInfos[int(Mode)].bWaterTracer)
	{
		// End:0x2CF
		if(!Instigator.PhysicsVolume.TraceThisActor(WLoc, WNorm, TipLoc, V))
		{
			Tracer = Spawn(ModeInfos[int(Mode)].WaterTracerClass, self,, TipLoc, Rotator(WLoc - TipLoc));
		}
		// End:0x2F7
		if(Tracer != none)
		{
			Tracer.Initialize(VSize(WLoc - TipLoc));
		}
	}
	//return;	
}

simulated function SpawnAltTracer(byte Mode, Vector V)
{
	local BCTraceEmitter Tracer;
	local Vector TipLoc, WLoc, WNorm;
	local float dist;
	local bool bThisShot;

	// End:0x27
	if((int(Class'BCoreProV55.BallisticMod'.default.EffectsDetailMode) == 0) && int(Mode) == 0)
	{
		return;
	}
	TipLoc = GetModeTipLocation();
	dist = VSize(V - TipLoc);
	// End:0x5D
	if(TracerMix == 0)
	{
		bThisShot = true;		
	}
	else
	{
		TracerCounter++;
		// End:0x9D
		if(TracerMix < 0)
		{
			// End:0x92
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
			// End:0xBB
			if(TracerCounter >= TracerMix)
			{
				TracerCounter = 0;
				bThisShot = true;
			}
		}
	}
	// End:0x1F9
	if(((((AltTracerClasses[int(CurrentTracerMode)] != none) && int(TracerMode) != int(3)) && ((int(TracerMode) == int(2)) || (int(TracerMode) == int(1)) && int(Mode) != 0) || (int(TracerMode) == int(0)) && int(Mode) == 0) && bThisShot) && ((int(Mode) == 1) || TracerChance >= float(1)) || FRand() < TracerChance)
	{
		// End:0x1D3
		if(int(Mode) == 0)
		{
			// End:0x1B1
			if(dist > float(200))
			{
				Tracer = Spawn(AltTracerClasses[int(CurrentTracerMode)], self,, TipLoc, Rotator(V - TipLoc));
			}
			// End:0x1D0
			if(Tracer != none)
			{
				Tracer.Initialize(dist);
			}			
		}
		else
		{
			Tracer = Spawn(AltTracerClasses[2], self,, TipLoc, Rotator(V - TipLoc));
		}
	}
	// End:0x33A
	if(((((((int(Mode) == 0) && Instigator != none) && Instigator.PhysicsVolume.bWaterVolume) && int(Level.DetailMode) == int(2)) && WaterTracerClass != none) && int(WaterTracerMode) != int(3)) && ((int(WaterTracerMode) == int(2)) || (int(WaterTracerMode) == int(1)) && int(Mode) != 0) || (int(WaterTracerMode) == int(0)) && int(Mode) == 0)
	{
		// End:0x312
		if(!Instigator.PhysicsVolume.TraceThisActor(WLoc, WNorm, TipLoc, V))
		{
			Tracer = Spawn(WaterTracerClass, self,, TipLoc, Rotator(WLoc - TipLoc));
		}
		// End:0x33A
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
	// End:0x13F
	if((int(Mode) != 0) && AltMuzzleFlashClass != none)
	{
		// End:0x108
		if(AltMuzzleFlash == none)
		{
			Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(AltMuzzleFlash, AltMuzzleFlashClass, DrawScale * 2.0000000, self, AltFlashBone);
		}
		AltMuzzleFlash.Trigger(self, Instigator);
		// End:0x13C
		if(bRandomFlashRoll)
		{
			SetBoneRotation(AltFlashBone, R, 0, 1.0000000);
		}		
	}
	else
	{
		// End:0x1C3
		if((int(Mode) == 0) && MuzzleFlashClass != none)
		{
			// End:0x18F
			if(MuzzleFlash == none)
			{
				Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(MuzzleFlash, MuzzleFlashClass, DrawScale * 1.0000000, self, FlashBone);
			}
			MuzzleFlash.Trigger(self, Instigator);
			// End:0x1C3
			if(bRandomFlashRoll)
			{
				SetBoneRotation(FlashBone, R, 0, 1.0000000);
			}
		}
	}
	//return;	
}

defaultproperties
{
	TracerClasses[0]=Class'BallisticProV55.TraceEmitter_Default'
	TracerClasses[1]=Class'BWBP_SKC_Pro.TraceEmitter_Incendiary'
	TracerClasses[2]=Class'BWBP_SKC_Pro.TraceEmitter_Incendiary'
	ImpactManagers[0]=Class'BallisticProV55.IM_Bullet'
	ImpactManagers[1]=Class'BallisticProV55.IM_IncendiaryHMGBullet'
	ImpactManagers[2]=Class'BallisticProV55.IM_IncendiaryBullet'
	AltTracerClasses[0]=Class'BallisticProV55.TraceEmitter_Shotgun'
	AltTracerClasses[1]=Class'BWBP_SKC_Pro.TraceEmitter_ShotgunFlameLight'
	AltImpactManagers[0]=Class'BallisticProV55.IM_Shell'
	AltImpactManagers[1]=Class'BWBP_SKC_Pro.IM_ShellHE'
	FireClass=Class'BWBP_SKC_Pro.CYLOSecondaryFire'
	WeaponClass=Class'BWBP_SKC_Pro.CYLOUAW'
	MuzzleFlashClass=Class'BallisticProV55.M50FlashEmitter'
	AltMuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
	ImpactManager=Class'BallisticProV55.IM_Bullet'
	MeleeImpactManager=Class'BallisticProV55.IM_Knife'
	AltFlashBone="tip2"
	BrassClass=Class'BallisticProV55.Brass_Shotgun'
	BrassMode=1
	FlashMode=2
	LightMode=2
	TracerClass=Class'BallisticProV55.TraceEmitter_Default'
	WaterTracerClass=Class'BallisticProV55.TraceEmitter_WaterBullet'
	FlyBySound=(Sound=SoundGroup'BW_Core_WeaponSound.FlyBys.Bullet-Whizz',Volume=0.7000000,Radius=64.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	ReloadAnimRate=0.9250000
	CockAnimRate=1.0500000
	bHeavy=true
	bRapidFire=true
	Mesh=SkeletalMesh'BWBP_SKC_Anim.CYLOUAW_TPm'
	RelativeLocation=(X=0.0000000,Y=0.0000000,Z=1.0000000)
	RelativeRotation=(Pitch=32768,Yaw=0,Roll=0)
	DrawScale=0.3000000
}
