class M763Attachment extends BallisticShotgunAttachment;

var byte CurrentTracerMode;
var Class<BCTraceEmitter> TracerClasses[3];
var Class<BCImpactManager> ImpactManagers[3];
var BallisticWeapon myWeap;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		CurrentTracerMode;
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
	if((M763Shotgun(i) != none) && M763Shotgun(i).bIsSlug)
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

simulated function InstantFireEffects(byte Mode)
{
	local Vector HitLocation, Start, End;
	local Rotator R;
	local Material HitMat;
	local int i;
	local float RMin, RMax, Range, fX;

	// End:0x15
	if(int(Mode) == 1)
	{
		GasShotFX();
		return;
	}
	// End:0x361
	if(int(Level.NetMode) == int(NM_Client))
	{
		RMin = float(GetTraceRange());
		RMax = float(GetTraceRange());
		Start = Instigator.Location + Instigator.EyePosition();
		i = 0;
		J0x76:

		// End:0x361 [Loop If]
		if(i < (GetTraceCount()))
		{
			mHitActor = none;
			Range = Lerp(FRand(), RMin, RMax);
			R = Rotator(mHitLocation);
			switch(GetSpreadMode())
			{
				// End:0x12E
				case 1:
					fX = FRand();
					R.Yaw += int((float(XInaccuracy) * ((FRand() * float(2)) - float(1))) * Sin(fX * 1.5707960));
					R.Pitch += int((float(YInaccuracy) * ((FRand() * float(2)) - float(1))) * Cos(fX * 1.5707960));
					// End:0x20E
					break;
				// End:0x1B8
				case 2:
					fX = FRand();
					R.Yaw += int((float(XInaccuracy) * Sin(((FRand() * float(2)) - float(1)) * 1.5707960)) * Sin(fX * 1.5707960));
					R.Pitch += int((float(YInaccuracy) * Sin(((FRand() * float(2)) - float(1)) * 1.5707960)) * Cos(fX * 1.5707960));
					// End:0x20E
					break;
				// End:0xFFFF
				default:
					R.Yaw += int(((FRand() * float(XInaccuracy)) * float(2)) - float(XInaccuracy));
					R.Pitch += int(((FRand() * float(YInaccuracy)) * float(2)) - float(YInaccuracy));
					// End:0x20E
					break;
					break;
			}
			End = Start + (Vector(R) * Range);
			mHitActor = Trace(HitLocation, mHitNormal, End, Start, false,, HitMat);
			// End:0x282
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
			// End:0x2DF
			if((mHitActor == none) || !mHitActor.bWorldGeometry && Mover(mHitActor) == none)
			{
				// [Explicit Continue]
				goto J0x357;
			}
			// End:0x303
			if(HitMat == none)
			{
				mHitSurf = int(mHitActor.SurfaceType);				
			}
			else
			{
				mHitSurf = int(HitMat.SurfaceType);
			}
			// End:0x357
			if(ImpactManagers[int(CurrentTracerMode)] != none)
			{
				ImpactManagers[int(CurrentTracerMode)].static.StartSpawn(HitLocation, mHitNormal, mHitSurf, Instigator);
			}
			J0x357:

			i++;
			// [Loop Continue]
			goto J0x76;
		}
	}
	//return;	
}

simulated function GasShotFX()
{
	// End:0x26
	if((mHitLocation == vect(0.0000000, 0.0000000, 0.0000000)) || Instigator == none)
	{
		return;
	}
	SpawnTracer(1, mHitLocation);
	FlyByEffects(1, mHitLocation);
	//return;	
}

simulated function SpawnTracer(byte Mode, Vector V)
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
	if(((((TracerClasses[int(CurrentTracerMode)] != none) && int(TracerMode) != int(3)) && ((int(TracerMode) == int(2)) || (int(TracerMode) == int(1)) && int(Mode) != 0) || (int(TracerMode) == int(0)) && int(Mode) == 0) && bThisShot) && ((int(Mode) == 1) || TracerChance >= float(1)) || FRand() < TracerChance)
	{
		// End:0x1D3
		if(int(Mode) == 0)
		{
			// End:0x1B1
			if(dist > float(200))
			{
				Tracer = Spawn(TracerClasses[int(CurrentTracerMode)], self,, TipLoc, Rotator(V - TipLoc));
			}
			// End:0x1D0
			if(Tracer != none)
			{
				Tracer.Initialize(dist);
			}			
		}
		else
		{
			Tracer = Spawn(TracerClasses[2], self,, TipLoc, Rotator(V - TipLoc));
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

defaultproperties
{
	TracerClasses[0]=Class'BallisticProV55.TraceEmitter_Shotgun'
	TracerClasses[1]=Class'BallisticProV55.TraceEmitter_Default'
	TracerClasses[2]=Class'BallisticProV55.TraceEmitter_M763Gas'
	ImpactManagers[0]=Class'BallisticProV55.IM_Shell'
	ImpactManagers[1]=Class'BallisticProV55.IM_BigBulletHMG'
	WeaponClass=Class'BallisticProV55.M763Shotgun'
	MuzzleFlashClass=Class'BallisticProV55.M763FlashEmitter'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	MeleeImpactManager=Class'BallisticProV55.IM_GunHit'
	FlashScale=1.8000000
	BrassClass=Class'BallisticProV55.Brass_Shotgun'
	TracerMode=2
	TracerClass=Class'BallisticProV55.TraceEmitter_Shotgun'
	TracerChance=0.5000000
	CockAnimRate=1.8500000
	MeleeStrikeAnim="Melee_swing"
	SingleFireAnim="RifleHip_FireCock"
	SingleAimedFireAnim="RifleAimed_FireCock"
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.M763_TPm'
	DrawScale=0.0800000
}
