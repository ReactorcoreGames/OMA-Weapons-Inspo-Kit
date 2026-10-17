class R9A1Attachment extends BallisticAttachment;

var byte CurrentTracerMode;
var Class<BCTraceEmitter> TracerClasses[5];
var Class<BCImpactManager> ImpactManagers[5];
var BallisticWeapon BW;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		CurrentTracerMode;
}

simulated function PostNetBeginPlay()
{
	super.PostNetBeginPlay();
	// End:0x43
	if((int(Role) == int(ROLE_Authority)) || Instigator.IsLocallyControlled())
	{
		BW = BallisticWeapon(Instigator.Weapon);
	}
	// End:0x67
	if(int(Role) == int(ROLE_Authority))
	{
		CurrentTracerMode = BW.CurrentWeaponMode;
	}
	//return;	
}

simulated function InstantFireEffects(byte Mode)
{
	local Vector HitLocation, Dir, Start;
	local Material HitMat;

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
	SpawnTracer(Mode, mHitLocation);
	FlyByEffects(Mode, mHitLocation);
	// End:0x1F5
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
		mHitActor = Trace(HitLocation, mHitNormal, mHitLocation + (Dir * float(10)), mHitLocation - (Dir * float(10)), false,, HitMat);
		// End:0x190
		if((ImpactManagers[int(CurrentTracerMode)] != none) && bDoWaterSplash)
		{
			DoWaterTrace(int(Mode), Start, mHitLocation);
		}
		// End:0x19D
		if(mHitActor == none)
		{
			return;
		}
		// End:0x1B8
		if(Vehicle(mHitActor) != none)
		{
			mHitSurf = 3;			
		}
		else
		{
			// End:0x1DC
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
	// End:0x2D0
	if((((((int(Level.NetMode) != int(NM_Client)) && ImpactManagers[int(CurrentTracerMode)] != none) && WaterHitLocation != vect(0.0000000, 0.0000000, 0.0000000)) && bDoWaterSplash) && int(Level.DetailMode) >= int(1)) && int(Class'BCoreProV55.BallisticMod'.default.EffectsDetailMode) > 0)
	{
		ImpactManagers[int(CurrentTracerMode)].static.StartSpawn(WaterHitLocation, Normal((Instigator.Location + Instigator.EyePosition()) - WaterHitLocation), 9, Instigator);
	}
	// End:0x317
	if((mHitActor == none) || (!mHitActor.bWorldGeometry && Mover(mHitActor) == none) && Vehicle(mHitActor) == none)
	{
		return;
	}
	// End:0x355
	if(ImpactManagers[int(CurrentTracerMode)] != none)
	{
		ImpactManagers[int(CurrentTracerMode)].static.StartSpawn(HitLocation, mHitNormal, mHitSurf, Instigator);
	}
	//return;	
}

simulated function WallPenetrateEffect(byte Mode, Vector HitLocation, Vector HitNormal, int HitSurf, optional bool bExit)
{
	// End:0x63
	if((((int(Level.DetailMode) < int(1)) || int(Class'BCoreProV55.BallisticMod'.default.EffectsDetailMode) == 0) || int(Level.NetMode) == int(NM_DedicatedServer)) || ImpactManagers[int(CurrentTracerMode)] == none)
	{
		return;
	}
	// End:0xA1
	if(bExit && (int(Level.DetailMode) == int(1)) || int(Class'BCoreProV55.BallisticMod'.default.EffectsDetailMode) == 1)
	{
		return;
	}
	// End:0xDA
	if(bExit)
	{
		ImpactManagers[int(CurrentTracerMode)].static.StartSpawn(HitLocation, HitNormal, HitSurf, Instigator, 2);		
	}
	else
	{
		ImpactManagers[int(CurrentTracerMode)].static.StartSpawn(HitLocation, HitNormal, HitSurf, Instigator);
	}
	//return;	
}

simulated function DoDirectHit(byte Mode, Vector HitLocation, Vector HitNormal, int HitSurf)
{
	// End:0x66
	if(((int(Level.NetMode) != int(NM_DedicatedServer)) && Instigator != none) && ImpactManagers[int(CurrentTracerMode)] != none)
	{
		ImpactManagers[int(CurrentTracerMode)].static.StartSpawn(HitLocation, HitNormal, HitSurf, Instigator);
	}
	//return;	
}

simulated function SpawnTracer(byte Mode, Vector V)
{
	local BCTraceEmitter Tracer;
	local Vector TipLoc, WLoc, WNorm;
	local float dist;

	// End:0x33
	if((int(Level.DetailMode) < int(1)) || int(Class'BCoreProV55.BallisticMod'.default.EffectsDetailMode) == 0)
	{
		return;
	}
	TipLoc = GetModeTipLocation();
	dist = VSize(V - TipLoc);
	// End:0x8C
	if(dist > float(200))
	{
		Tracer = Spawn(TracerClasses[int(CurrentTracerMode)], self,, TipLoc, Rotator(V - TipLoc));
	}
	// End:0xAB
	if(Tracer != none)
	{
		Tracer.Initialize(dist);
	}
	// End:0x1DD
	if((((((Instigator != none) && Instigator.PhysicsVolume.bWaterVolume) && int(Level.DetailMode) == int(2)) && WaterTracerClass != none) && int(WaterTracerMode) != int(3)) && ((int(WaterTracerMode) == int(2)) || (int(WaterTracerMode) == int(1)) && int(Mode) != 0) || (int(WaterTracerMode) == int(0)) && int(Mode) == 0)
	{
		// End:0x1B5
		if(!Instigator.PhysicsVolume.TraceThisActor(WLoc, WNorm, TipLoc, V))
		{
			Tracer = Spawn(WaterTracerClass, self,, TipLoc, Rotator(WLoc - TipLoc));
		}
		// End:0x1DD
		if(Tracer != none)
		{
			Tracer.Initialize(VSize(WLoc - TipLoc));
		}
	}
	//return;	
}

simulated function Vector GetModeTipLocation(optional byte Mode)
{
	local Vector X, Y, Z;

	// End:0x11E
	if(((Instigator != none) && Instigator.IsFirstPerson()) && PlayerController(Instigator.Controller).ViewTarget == Instigator)
	{
		// End:0x85
		if(BW == none)
		{
			BW = BallisticWeapon(Instigator.Weapon);
			// End:0x85
			if(BW == none)
			{
				return Instigator.Location;
			}
		}
		// End:0x105
		if(BW.bScopeView && int(BW.ZoomType) != int(0))
		{
			Instigator.Weapon.GetViewAxes(X, Y, Z);
			return (Instigator.Location + (X * float(20))) + (Z * float(5));			
		}
		else
		{
			return Instigator.Weapon.GetEffectStart();
		}
	}
	return GetBoneCoords('tip').Origin;
	//return;	
}

defaultproperties
{
	TracerClasses[0]=Class'BallisticProV55.TraceEmitter_Default'
	TracerClasses[1]=Class'BallisticProV55.TraceEmitter_Freeze'
	TracerClasses[2]=Class'BallisticProV55.TraceEmitter_R9Laser'
	TracerClasses[3]=Class'BallisticProV55.TraceEmitter_Default'
	TracerClasses[4]=Class'BallisticProV55.TraceEmitter_Default'
	ImpactManagers[0]=Class'BallisticProV55.IM_Bullet'
	ImpactManagers[1]=Class'BallisticProV55.IM_FreezeHit'
	ImpactManagers[2]=Class'BallisticProV55.IM_R9Laser'
	ImpactManagers[3]=Class'BallisticProV55.IM_Bullet'
	ImpactManagers[4]=Class'BallisticProV55.IM_Bullet'
	WeaponClass=Class'BWBP_OP_Pro.R9A1RangerRifle'
	MuzzleFlashClass=Class'BWBP_OP_Pro.R9A1FlashEmitter'
	AltMuzzleFlashClass=Class'BallisticProV55.XK2SilencedFlash'
	ImpactManager=Class'BallisticProV55.IM_Bullet'
	FlashScale=2.0000000
	BrassClass=Class'BallisticProV55.Brass_Rifle'
	TracerMode=2
	InstantMode=2
	FlashMode=2
	WaterTracerClass=Class'BallisticProV55.TraceEmitter_WaterBullet'
	WaterTracerMode=2
	FlyBySound=(Sound=SoundGroup'BW_Core_WeaponSound.FlyBys.Bullet-Whizz',Volume=0.7000000,Radius=64.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	ReloadAnimRate=0.8000000
	CockAnimRate=0.9000000
	Mesh=SkeletalMesh'BWBP_OP_Anim.R9A1_TPm'
	RelativeLocation=(X=3.0000000,Y=0.0000000,Z=1.0000000)
	DrawScale=0.1600000
}
