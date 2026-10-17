class ZX98Attachment extends BallisticAttachment;

var() Class<BCTraceEmitter> AltTracerClass;
var float LastShotTime;
var byte YawSpeed;
var byte PitchSpeed;
var byte NetBarrelSpeed;
var int BarrelTurn;
var float BarrelSpeed;
var() Class<BCImpactManager> ImpactManagerAlt;

replication
{
	// Pos:0x000
	reliable if(bNetDirty && int(Role) == int(ROLE_Authority))
		PitchSpeed, YawSpeed;

	// Pos:0x018
	reliable if(int(Role) == int(ROLE_Authority))
		NetBarrelSpeed;
}

simulated event Tick(float dt)
{
	local Rotator bt;

	super.Tick(dt);
	// End:0x31
	if(int(Role) == int(ROLE_Authority))
	{
		NetBarrelSpeed = byte(BarrelSpeed * float(255));		
	}
	else
	{
		BarrelSpeed = float(NetBarrelSpeed) / 255.0000000;
	}
	// End:0x9C
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		BarrelTurn += int((BarrelSpeed * float(655360)) * dt);
		bt.Roll = BarrelTurn;
		SetBoneRotation('RotatingBarrel', bt);
	}
	//return;	
}

function UpdateTurnVelocity(Rotator TurnVelocity)
{
	YawSpeed = byte(float(Clamp(TurnVelocity.Yaw + 16384, 0, 32768)) / 128.5000000);
	PitchSpeed = byte(float(Clamp(TurnVelocity.Pitch + 16384, 0, 32768)) / 128.5000000);
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
	// End:0x33C
	if((ImpactManagerAlt != none) && int(Mode) == 1)
	{
		ImpactManagerAlt.static.StartSpawn(HitLocation, mHitNormal, mHitSurf, Instigator);
	}
	// End:0x379
	if((ImpactManager != none) && int(Mode) == 0)
	{
		ImpactManager.static.StartSpawn(HitLocation, mHitNormal, mHitSurf, Instigator);
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
	TipLoc = GetModeTipLocation();
	dist = VSize(V - TipLoc);
	// End:0x4B
	if(TracerMix == 0)
	{
		bThisShot = true;
	}
	// End:0x101
	if(((((TracerClass != none) && int(TracerMode) != int(3)) && (int(TracerMode) == int(2)) && int(Mode) == 0) && bThisShot) && (TracerChance >= float(1)) || FRand() < TracerChance)
	{
		// End:0xE2
		if(dist > float(200))
		{
			Tracer = Spawn(TracerClass, self,, TipLoc, Rotator(V - TipLoc));
		}
		// End:0x101
		if(Tracer != none)
		{
			Tracer.Initialize(dist);
		}
	}
	// End:0x1B7
	if(((((AltTracerClass != none) && int(TracerMode) != int(3)) && (int(TracerMode) == int(2)) && int(Mode) != 0) && bThisShot) && (TracerChance >= float(1)) || FRand() < TracerChance)
	{
		// End:0x198
		if(dist > float(200))
		{
			Tracer = Spawn(AltTracerClass, self,, TipLoc, Rotator(V - TipLoc));
		}
		// End:0x1B7
		if(Tracer != none)
		{
			Tracer.Initialize(dist);
		}
	}
	// End:0x2E9
	if((((((Instigator != none) && Instigator.PhysicsVolume.bWaterVolume) && int(Level.DetailMode) == int(2)) && WaterTracerClass != none) && int(WaterTracerMode) != int(3)) && ((int(WaterTracerMode) == int(2)) || (int(WaterTracerMode) == int(1)) && int(Mode) != 0) || (int(WaterTracerMode) == int(0)) && int(Mode) == 0)
	{
		// End:0x2C1
		if(!Instigator.PhysicsVolume.TraceThisActor(WLoc, WNorm, TipLoc, V))
		{
			Tracer = Spawn(WaterTracerClass, self,, TipLoc, Rotator(WLoc - TipLoc));
		}
		// End:0x2E9
		if(Tracer != none)
		{
			Tracer.Initialize(VSize(WLoc - TipLoc));
		}
	}
	//return;	
}

defaultproperties
{
	AltTracerClass=Class'BWBP_APC_Pro.TraceEmitter_ZX98Gauss'
	ImpactManagerAlt=Class'BallisticProV55.IM_BulletGauss'
	WeaponClass=Class'BWBP_APC_Pro.ZX98AssaultRifle'
	MuzzleFlashClass=Class'BallisticProV55.M50FlashEmitter'
	ImpactManager=Class'BallisticProV55.IM_Bullet'
	MeleeImpactManager=Class'BallisticProV55.IM_Knife'
	BrassClass=Class'BallisticProV55.Brass_SAR'
	BrassMode=2
	TracerMode=2
	InstantMode=2
	FlashMode=2
	TracerClass=Class'BallisticProV55.TraceEmitter_Default'
	WaterTracerClass=Class'BallisticProV55.TraceEmitter_WaterBullet'
	FlyBySound=(Sound=SoundGroup'BW_Core_WeaponSound.FlyBys.Bullet-Whizz',Volume=0.7000000,Radius=64.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	ReloadAnimRate=1.0750000
	CockAnimRate=1.1000000
	bHeavy=true
	bRapidFire=true
	Mesh=SkeletalMesh'BWBP_APC_Anim.ZX98_TPm'
	RelativeLocation=(X=0.0000000,Y=0.0000000,Z=1.0000000)
	RelativeRotation=(Pitch=32768,Yaw=0,Roll=0)
	DrawScale=0.2000000
	PrePivot=(X=0.0000000,Y=0.0000000,Z=-3.0000000)
}
