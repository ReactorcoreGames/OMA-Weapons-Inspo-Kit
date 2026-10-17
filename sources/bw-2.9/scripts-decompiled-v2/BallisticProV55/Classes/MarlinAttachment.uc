class MarlinAttachment extends BallisticAttachment;

var() Class<BCTraceEmitter> GaussTracerClass;
var() Class<BCImpactManager> GaussImpactManager;
var bool bGauss;
var bool bOldGauss;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		bGauss;
}

simulated event PostNetReceive()
{
	super.PostNetReceive();
	// End:0x24
	if(bGauss != bOldGauss)
	{
		bOldGauss = bGauss;
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
	// End:0x308
	if(ImpactManager != none)
	{
		// End:0x2E5
		if(bGauss)
		{
			GaussImpactManager.static.StartSpawn(HitLocation, mHitNormal, mHitSurf, Instigator);			
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
	// End:0x27
	if(int(Mode) == 1)
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
	// End:0x172
	if(((TracerClass != none) && bThisShot) && (TracerChance >= float(1)) || FRand() < TracerChance)
	{
		// End:0x14E
		if(dist > float(200))
		{
			// End:0x12B
			if(bGauss)
			{
				Tracer = Spawn(GaussTracerClass, self,, TipLoc, Rotator(V - TipLoc));				
			}
			else
			{
				Tracer = Spawn(TracerClass, self,, TipLoc, Rotator(V - TipLoc));
			}
		}
		// End:0x172
		if(Tracer != none)
		{
			Tracer.Initialize(dist, 0.2000000);
		}
	}
	// End:0x2A4
	if((((((Instigator != none) && Instigator.PhysicsVolume.bWaterVolume) && int(Level.DetailMode) == int(2)) && WaterTracerClass != none) && int(WaterTracerMode) != int(3)) && ((int(WaterTracerMode) == int(2)) || (int(WaterTracerMode) == int(1)) && int(Mode) != 0) || (int(WaterTracerMode) == int(0)) && int(Mode) == 0)
	{
		// End:0x27C
		if(!Instigator.PhysicsVolume.TraceThisActor(WLoc, WNorm, TipLoc, V))
		{
			Tracer = Spawn(WaterTracerClass, self,, TipLoc, Rotator(WLoc - TipLoc));
		}
		// End:0x2A4
		if(Tracer != none)
		{
			Tracer.Initialize(VSize(WLoc - TipLoc));
		}
	}
	//return;	
}

defaultproperties
{
	GaussTracerClass=Class'BallisticProV55.TraceEmitter_Gauss'
	GaussImpactManager=Class'BallisticProV55.IM_BulletGauss'
	WeaponClass=Class'BallisticProV55.MarlinRifle'
	MuzzleFlashClass=Class'BallisticProV55.R78FlashEmitter'
	ImpactManager=Class'BallisticProV55.IM_Bullet'
	MeleeImpactManager=Class'BallisticProV55.IM_GunHit'
	FlashScale=1.8000000
	BrassClass=Class'BallisticProV55.Brass_Rifle'
	TracerClass=Class'BallisticProV55.TraceEmitter_Default'
	WaterTracerClass=Class'BallisticProV55.TraceEmitter_WaterBullet'
	FlyByMode=0
	CockAnimRate=1.8000000
	MeleeStrikeAnim="Melee_Smash"
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.Marlin_TPm'
	DrawScale=0.1250000
}
