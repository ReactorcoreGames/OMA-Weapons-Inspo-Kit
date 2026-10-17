class SPASAttachment extends BallisticShotgunAttachment;

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
	if((SPASShotgun(i) != none) && SPASShotgun(i).bIsSlug)
	{
		CurrentTracerMode = 1;
	}
	//return;	
}

simulated function InstantFireEffects(byte Mode)
{
	local Vector HitLocation, Start, End;
	local Rotator R;
	local Material HitMat;
	local int i;
	local float RMin, RMax, Range, fX;

	// End:0x34C
	if(int(Level.NetMode) == int(NM_Client))
	{
		RMin = float(GetTraceRange());
		RMax = float(GetTraceRange());
		Start = Instigator.Location + Instigator.EyePosition();
		i = 0;
		J0x61:

		// End:0x34C [Loop If]
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
			// End:0x26D
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
			// End:0x2CA
			if((mHitActor == none) || !mHitActor.bWorldGeometry && Mover(mHitActor) == none)
			{
				// [Explicit Continue]
				goto J0x342;
			}
			// End:0x2EE
			if(HitMat == none)
			{
				mHitSurf = int(mHitActor.SurfaceType);				
			}
			else
			{
				mHitSurf = int(HitMat.SurfaceType);
			}
			// End:0x342
			if(ImpactManagers[int(CurrentTracerMode)] != none)
			{
				ImpactManagers[int(CurrentTracerMode)].static.StartSpawn(HitLocation, mHitNormal, mHitSurf, Instigator);
			}
			J0x342:

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
	// End:0x1F8
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
			Tracer = Spawn(TracerClasses[0], self,, TipLoc, Rotator(V - TipLoc));
		}
	}
	// End:0x339
	if(((((((int(Mode) == 0) && Instigator != none) && Instigator.PhysicsVolume.bWaterVolume) && int(Level.DetailMode) == int(2)) && WaterTracerClass != none) && int(WaterTracerMode) != int(3)) && ((int(WaterTracerMode) == int(2)) || (int(WaterTracerMode) == int(1)) && int(Mode) != 0) || (int(WaterTracerMode) == int(0)) && int(Mode) == 0)
	{
		// End:0x311
		if(!Instigator.PhysicsVolume.TraceThisActor(WLoc, WNorm, TipLoc, V))
		{
			Tracer = Spawn(WaterTracerClass, self,, TipLoc, Rotator(WLoc - TipLoc));
		}
		// End:0x339
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
	ImpactManagers[0]=Class'BallisticProV55.IM_Shell'
	ImpactManagers[1]=Class'BallisticProV55.IM_BigBulletHMG'
	WeaponClass=Class'BWBP_JCF_Pro.SPASShotgun'
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	AltMuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	FlashScale=2.3000000
	BrassClass=Class'BallisticProV55.Brass_Shotgun'
	BrassMode=2
	InstantMode=2
	FlashMode=2
	LightMode=2
	TracerChance=0.5000000
	Mesh=SkeletalMesh'BWBP_JCF_Anims.SPAS_TPm'
	DrawScale=0.3000000
}
