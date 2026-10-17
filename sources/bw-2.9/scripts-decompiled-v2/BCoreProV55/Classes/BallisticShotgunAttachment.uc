class BallisticShotgunAttachment extends BallisticAttachment;

var int XInaccuracy;
var int YInaccuracy;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		XInaccuracy, YInaccuracy;
}

simulated function int GetTraceCount()
{
	// End:0x5A
	if(WeaponClass != none)
	{
		return ShotgunEffectParams(WeaponClass.default.ParamsClasses[int(Class'BCoreProV55.BallisticReplicationInfo'.default.GameStyle)].default.Layouts[0].FireParams[0].FireEffectParams[0]).TraceCount;
	}
	return 10;
	//return;	
}

final simulated function int GetTraceRange()
{
	// End:0x61
	if(WeaponClass != none)
	{
		return int(InstantEffectParams(WeaponClass.default.ParamsClasses[int(Class'BCoreProV55.BallisticReplicationInfo'.default.GameStyle)].default.Layouts[0].FireParams[0].FireEffectParams[0]).TraceRange.Max);
	}
	return 3000;
	//return;	
}

final simulated function FireEffectParams.FireSpreadMode GetSpreadMode()
{
	// End:0x55
	if(WeaponClass != none)
	{
		return WeaponClass.default.ParamsClasses[int(Class'BCoreProV55.BallisticReplicationInfo'.default.GameStyle)].default.Layouts[0].FireParams[0].FireEffectParams[0].SpreadMode;
	}
	return 2;
	//return;	
}

simulated function InstantFireEffects(byte Mode)
{
	local Vector HitLocation, Start, End;
	local Rotator R;
	local Material HitMat;
	local int i;
	local float RMin, RMax, Range, fX;

	// End:0x54
	if(((int(InstantMode) == int(3)) || (int(InstantMode) == int(1)) && int(Mode) != 1) || (int(InstantMode) == int(0)) && int(Mode) != 0)
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
	// End:0x3B2
	if(int(Level.NetMode) == int(NM_Client))
	{
		RMin = float(GetTraceRange());
		RMax = float(GetTraceRange());
		Start = Instigator.Location + Instigator.EyePosition();
		i = 0;
		J0xDB:

		// End:0x3B2 [Loop If]
		if(i < (GetTraceCount()))
		{
			mHitActor = none;
			Range = Lerp(FRand(), RMin, RMax);
			R = Rotator(mHitLocation);
			switch(GetSpreadMode())
			{
				// End:0x193
				case 1:
					fX = FRand();
					R.Yaw += int((float(XInaccuracy) * ((FRand() * float(2)) - float(1))) * Sin(fX * 1.5707960));
					R.Pitch += int((float(YInaccuracy) * ((FRand() * float(2)) - float(1))) * Cos(fX * 1.5707960));
					// End:0x273
					break;
				// End:0x21D
				case 2:
					fX = FRand();
					R.Yaw += int((float(XInaccuracy) * Sin(((FRand() * float(2)) - float(1)) * 1.5707960)) * Sin(fX * 1.5707960));
					R.Pitch += int((float(YInaccuracy) * Sin(((FRand() * float(2)) - float(1)) * 1.5707960)) * Cos(fX * 1.5707960));
					// End:0x273
					break;
				// End:0xFFFF
				default:
					R.Yaw += int(((FRand() * float(XInaccuracy)) * float(2)) - float(XInaccuracy));
					R.Pitch += int(((FRand() * float(YInaccuracy)) * float(2)) - float(YInaccuracy));
					// End:0x273
					break;
					break;
			}
			End = Start + (Vector(R) * Range);
			mHitActor = Trace(HitLocation, mHitNormal, End, Start, false,, HitMat);
			// End:0x2E7
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
			// End:0x344
			if((mHitActor == none) || !mHitActor.bWorldGeometry && Mover(mHitActor) == none)
			{
				// [Explicit Continue]
				goto J0x3A8;
			}
			// End:0x368
			if(HitMat == none)
			{
				mHitSurf = int(mHitActor.SurfaceType);				
			}
			else
			{
				mHitSurf = int(HitMat.SurfaceType);
			}
			// End:0x3A8
			if(ImpactManager != none)
			{
				ImpactManager.static.StartSpawn(HitLocation, mHitNormal, mHitSurf, self);
			}
			J0x3A8:

			i++;
			// [Loop Continue]
			goto J0xDB;
		}
	}
	//return;	
}

defaultproperties
{
	ReloadAnim="Reload_ShovelBottom"
	CockingAnim="Cock_PumpSlow"
}
