class MG36Attachment extends BallisticAttachment;

var BallisticWeapon myWeap;
var() Material InvisTex;
var() Class<BCImpactManager> ImpactManagerAlt;
var() Class<BCTraceEmitter> TracerClassAlt;
var() bool bHasGauss;
var() bool bIsOldGauss;
var() bool bSilenced;
var() bool bOldSilenced;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		bHasGauss, bSilenced;
}

simulated event PostNetBeginPlay()
{
	super.PostNetBeginPlay();
	// End:0x1E
	if(BallisticTurret(Instigator) != none)
	{
		bHidden = true;
	}
	//return;	
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
			SetBoneScale(0, 1.0000000, 'Silencer');			
		}
		else
		{
			SetBoneScale(0, 0.0000000, 'Silencer');
		}
	}
	// End:0x98
	if(bHasGauss != bIsOldGauss)
	{
		bIsOldGauss = bHasGauss;
		// End:0x87
		if(bHasGauss)
		{
			SetBoneScale(1, 1.0000000, 'Reciever');			
		}
		else
		{
			SetBoneScale(1, 0.0000000, 'Reciever');
		}
	}
	super.PostNetReceive();
	//return;	
}

function IAOverride(bool bSilenced)
{
	// End:0x1D
	if(bSilenced)
	{
		SetBoneScale(0, 1.0000000, 'Silencer');		
	}
	else
	{
		SetBoneScale(0, 0.0000000, 'Silencer');
	}
	//return;	
}

simulated event PostBeginPlay()
{
	super.PostBeginPlay();
	SetBoneScale(0, 0.0000000, 'Silencer');
	//return;	
}

function InitFor(Inventory i)
{
	super.InitFor(i);
	// End:0x2B
	if(BallisticWeapon(i) != none)
	{
		myWeap = BallisticWeapon(i);
	}
	// End:0x10E
	if(MG36Machinegun(i) != none)
	{
		// End:0x6E
		if(MG36Machinegun(i).bHasGauss)
		{
			bHasGauss = true;
			SetBoneScale(1, 1.0000000, 'Reciever');			
		}
		else
		{
			SetBoneScale(1, 0.0000000, 'Reciever');
		}
		// End:0xAA
		if(!MG36Machinegun(i).bHasScope)
		{
			SetBoneScale(2, 0.0000000, 'Scope');
		}
		// End:0xEA
		if(!MG36Machinegun(i).bHasDrum)
		{
			SetBoneScale(3, 0.0000000, 'MagDrum');
			SetBoneScale(4, 1.0000000, 'MagSmall');			
		}
		else
		{
			SetBoneScale(3, 1.0000000, 'MagDrum');
			SetBoneScale(4, 0.0000000, 'MagSmall');
		}
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
	// End:0x2FF
	if((mHitActor == none) || (!mHitActor.bWorldGeometry && Mover(mHitActor) == none) && Vehicle(mHitActor) == none)
	{
		return;
	}
	// End:0x33D
	if((ImpactManager != none) && !bHasGauss)
	{
		ImpactManager.static.StartSpawn(HitLocation, mHitNormal, mHitSurf, Instigator);		
	}
	else
	{
		// End:0x376
		if((ImpactManagerAlt != none) && bHasGauss)
		{
			ImpactManagerAlt.static.StartSpawn(HitLocation, mHitNormal, mHitSurf, Instigator);
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
	TipLoc = GetTipLocation();
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
	// End:0x18A
	if((((((TracerClass != none) && int(TracerMode) != int(3)) && (int(TracerMode) == int(2)) && int(Mode) == 0) && bThisShot) && (TracerChance >= float(1)) || FRand() < TracerChance) && !bHasGauss)
	{
		// End:0x16B
		if(dist > float(200))
		{
			Tracer = Spawn(TracerClass, self,, TipLoc, Rotator(V - TipLoc));
		}
		// End:0x18A
		if(Tracer != none)
		{
			Tracer.Initialize(dist);
		}
	}
	// End:0x202
	if(((TracerClassAlt != none) && int(TracerMode) != int(3)) && bHasGauss)
	{
		// End:0x1E3
		if(dist > float(200))
		{
			Tracer = Spawn(TracerClassAlt, self,, TipLoc, Rotator(V - TipLoc));
		}
		// End:0x202
		if(Tracer != none)
		{
			Tracer.Initialize(dist);
		}
	}
	// End:0x334
	if((((((Instigator != none) && Instigator.PhysicsVolume.bWaterVolume) && int(Level.DetailMode) == int(2)) && WaterTracerClass != none) && int(WaterTracerMode) != int(3)) && ((int(WaterTracerMode) == int(2)) || (int(WaterTracerMode) == int(1)) && int(Mode) != 0) || (int(WaterTracerMode) == int(0)) && int(Mode) == 0)
	{
		// End:0x30C
		if(!Instigator.PhysicsVolume.TraceThisActor(WLoc, WNorm, TipLoc, V))
		{
			Tracer = Spawn(WaterTracerClass, self,, TipLoc, Rotator(WLoc - TipLoc));
		}
		// End:0x334
		if(Tracer != none)
		{
			Tracer.Initialize(VSize(WLoc - TipLoc));
		}
	}
	//return;	
}

defaultproperties
{
	ImpactManagerAlt=Class'BallisticProV55.IM_BulletGauss'
	TracerClassAlt=Class'BallisticProV55.TraceEmitter_Gauss'
	WeaponClass=Class'BWBP_SKC_Pro.MG36Machinegun'
	MuzzleFlashClass=Class'BallisticProV55.M50FlashEmitter'
	AltMuzzleFlashClass=Class'BWBP_SKC_Pro.MG36SilencedFlash'
	ImpactManager=Class'BallisticProV55.IM_Bullet'
	AltFlashBone="tip2"
	FlashScale=0.2500000
	BrassClass=Class'BallisticProV55.Brass_Rifle'
	InstantMode=2
	FlashMode=2
	LightMode=2
	TracerClass=Class'BWBP_SKC_Pro.TraceEmitter_MG36Bullet'
	WaterTracerClass=Class'BallisticProV55.TraceEmitter_WaterBullet'
	WaterTracerMode=2
	FlyBySound=(Sound=SoundGroup'BW_Core_WeaponSound.FlyBys.Bullet-Whizz',Volume=0.7000000,Radius=64.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	ReloadAnimRate=0.6800000
	CockAnimRate=0.7750000
	Mesh=SkeletalMesh'BWBP_SKC_Anim.MG36_TPm'
	RelativeRotation=(Pitch=32768,Yaw=0,Roll=0)
	DrawScale=1.0000000
	PrePivot=(X=0.0000000,Y=0.0000000,Z=-10.0000000)
}
