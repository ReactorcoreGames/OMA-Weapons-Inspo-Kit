class PS9mAttachment extends HandgunAttachment;

var bool bGrenadier;
var bool bOldGrenadier;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		bGrenadier;
}

simulated event PostNetReceive()
{
	// End:0x6E
	if(bGrenadier != bOldGrenadier)
	{
		bOldGrenadier = bGrenadier;
		// End:0x4C
		if(bGrenadier)
		{
			SetBoneScale(0, 1.0000000, 'Dart');
			SetBoneScale(1, 1.0000000, 'FartAssist');			
		}
		else
		{
			SetBoneScale(0, 0.0000000, 'Dart');
			SetBoneScale(1, 0.0000000, 'FartAssist');
		}
	}
	super(BallisticAttachment).PostNetReceive();
	//return;	
}

function IAOverride(bool bDart)
{
	// End:0x2E
	if(bDart)
	{
		SetBoneScale(0, 1.0000000, 'Dart');
		SetBoneScale(1, 1.0000000, 'FartAssist');		
	}
	else
	{
		SetBoneScale(0, 0.0000000, 'Dart');
		SetBoneScale(1, 0.0000000, 'FartAssist');
	}
	//return;	
}

simulated event PostBeginPlay()
{
	super(BallisticAttachment).PostBeginPlay();
	SetBoneScale(0, 0.0000000, 'Dart');
	SetBoneScale(1, 0.0000000, 'FartAssist');
	//return;	
}

simulated event PreBeginPlay()
{
	super(Actor).PreBeginPlay();
	// End:0x2A
	if(Class'BCoreProV55.BallisticReplicationInfo'.static.IsClassic())
	{
		TracerChance = 1.0000000;
		TracerMix = 0;
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
		mHitActor = Trace(HitLocation, mHitNormal, mHitLocation + (Dir * float(10)), mHitLocation - (Dir * float(10)), false,, HitMat);
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
	// End:0x32D
	if(ImpactManager != none)
	{
		ImpactManager.static.StartSpawn(HitLocation, mHitNormal, mHitSurf, Instigator);
	}
	//return;	
}

simulated function Vector GetModeTipLocation(optional byte Mode)
{
	local Coords C;

	// End:0x95
	if(((Instigator != none) && Instigator.IsFirstPerson()) && PlayerController(Instigator.Controller).ViewTarget == Instigator)
	{
		// End:0x6F
		if(HandGun != none)
		{
			C = HandGun.GetBoneCoords('Muzzle');			
		}
		else
		{
			C = Instigator.Weapon.GetBoneCoords('Muzzle');
		}		
	}
	else
	{
		C = GetBoneCoords('tip');
	}
	return C.Origin;
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
	// End:0x1B0
	if(((((TracerClass != none) && int(TracerMode) != int(3)) && ((int(TracerMode) == int(2)) || (int(TracerMode) == int(1)) && int(Mode) != 0) || (int(TracerMode) == int(0)) && int(Mode) == 0) && bThisShot) && (TracerChance >= float(1)) || FRand() < TracerChance)
	{
		// End:0x191
		if(dist > float(200))
		{
			Tracer = Spawn(TracerClass, self,, TipLoc, Rotator(V - TipLoc));
		}
		// End:0x1B0
		if(Tracer != none)
		{
			Tracer.Initialize(dist);
		}
	}
	// End:0x2E2
	if((((((Instigator != none) && Instigator.PhysicsVolume.bWaterVolume) && int(Level.DetailMode) == int(2)) && WaterTracerClass != none) && int(WaterTracerMode) != int(3)) && ((int(WaterTracerMode) == int(2)) || (int(WaterTracerMode) == int(1)) && int(Mode) != 0) || (int(WaterTracerMode) == int(0)) && int(Mode) == 0)
	{
		// End:0x2BA
		if(!Instigator.PhysicsVolume.TraceThisActor(WLoc, WNorm, TipLoc, V))
		{
			Tracer = Spawn(WaterTracerClass, self,, TipLoc, Rotator(WLoc - TipLoc));
		}
		// End:0x2E2
		if(Tracer != none)
		{
			Tracer.Initialize(VSize(WLoc - TipLoc));
		}
	}
	//return;	
}

defaultproperties
{
	WeaponClass=Class'BWBP_SKC_Pro.PS9mPistol'
	MuzzleFlashClass=Class'BWBP_SKC_Pro.VSKSilencedFlash'
	ImpactManager=Class'BWBP_SKC_Pro.IM_Tranq'
	FlashScale=0.3000000
	BrassClass=Class'BWBP_SKC_Pro.Brass_Tranq'
	TracerClass=Class'BWBP_SKC_Pro.TraceEmitter_Tranq'
	TracerChance=0.0000000
	WaterTracerClass=Class'BallisticProV55.TraceEmitter_WaterBullet'
	WaterTracerMode=2
	FlyBySound=(Sound=SoundGroup'BW_Core_WeaponSound.FlyBys.Bullet-Whizz',Volume=0.7000000,Radius=64.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	ReloadAnim="Reload_Pistol"
	ReloadAnimRate=0.9500000
	CockAnimRate=0.7750000
	bRapidFire=true
	Mesh=SkeletalMesh'BWBP_SKC_Anim.PS9M_TPm'
	RelativeLocation=(X=0.0000000,Y=0.0000000,Z=5.0000000)
	DrawScale=0.2500000
	Skins[0]=Texture'BWBP_SKC_Tex.Stealth.Stealth-Main'
}
