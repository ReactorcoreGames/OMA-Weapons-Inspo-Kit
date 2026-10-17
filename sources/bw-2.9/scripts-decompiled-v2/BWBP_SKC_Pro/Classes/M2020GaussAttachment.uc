class M2020GaussAttachment extends BallisticAttachment;

var byte CurrentTracerMode;
var Class<BCTraceEmitter> TracerClasses[4];
var Class<BCImpactManager> ImpactManagers[4];
var bool bLaserOn;
var bool bOldLaserOn;
var LaserActor Laser;
var Rotator LaserRot;
var BallisticWeapon myWeap;
var Vector SpawnOffset;
var byte OldBlockEffectCount;
var byte BlockEffectCount;
var M2020BlockEffect M2020BlockEffect;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		BlockEffectCount, CurrentTracerMode, 
		bLaserOn;

	// Pos:0x00D
	reliable if(int(Role) == int(ROLE_Authority))
		LaserRot;
}

function InitFor(Inventory i)
{
	super.InitFor(i);
	// End:0x2B
	if(BallisticWeapon(i) != none)
	{
		myWeap = BallisticWeapon(i);
	}
	// End:0x7F
	if((M2020GaussDMR(i) != none) && (int(M2020GaussDMR(i).CurrentWeaponMode) == 2) || int(M2020GaussDMR(i).CurrentWeaponMode) == 3)
	{
		CurrentTracerMode = 0;
	}
	// End:0xB0
	if((M2020GaussDMR(i) != none) && M2020GaussDMR(i).bSuppressed)
	{
		CurrentTracerMode = 1;
	}
	//return;	
}

simulated function SetTracerMode(byte newTracerMode)
{
	CurrentTracerMode = newTracerMode;
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
	// End:0x2C0
	if((((((int(Level.NetMode) != int(NM_Client)) && ImpactManager != none) && WaterHitLocation != vect(0.0000000, 0.0000000, 0.0000000)) && bDoWaterSplash) && int(Level.DetailMode) >= int(1)) && int(Class'BCoreProV55.BallisticMod'.default.EffectsDetailMode) > 0)
	{
		ImpactManager.static.StartSpawn(WaterHitLocation, Normal((Instigator.Location + Instigator.EyePosition()) - WaterHitLocation), 9, Instigator);
	}
	// End:0x307
	if((mHitActor == none) || (!mHitActor.bWorldGeometry && Mover(mHitActor) == none) && Vehicle(mHitActor) == none)
	{
		return;
	}
	// End:0x345
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
	TipLoc = GetTipLocation();
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

simulated function Tick(float dt)
{
	local Vector HitLocation, Start, End, HitNormal, Scale3D, loc;

	local Rotator X;
	local Actor Other;

	super.Tick(dt);
	// End:0x76
	if((bLaserOn && int(Role) == int(ROLE_Authority)) && myWeap != none)
	{
		LaserRot = Instigator.GetViewRotation();
		LaserRot += myWeap.GetAimPivot();
		LaserRot += myWeap.GetRecoilPivot();
	}
	// End:0x91
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		return;
	}
	// End:0xB1
	if(Laser == none)
	{
		Laser = Spawn(Class'BallisticProV55.LaserActor_Third',,, Location);
	}
	// End:0xCF
	if(bLaserOn != bOldLaserOn)
	{
		bOldLaserOn = bLaserOn;
	}
	// End:0x13B
	if(((!bLaserOn || Instigator == none) || Instigator.IsFirstPerson()) || Instigator.DrivenVehicle != none)
	{
		// End:0x136
		if(!Laser.bHidden)
		{
			Laser.bHidden = true;
		}
		return;		
	}
	else
	{
		// End:0x15E
		if(Laser.bHidden)
		{
			Laser.bHidden = false;
		}
	}
	// End:0x191
	if(Instigator != none)
	{
		Start = Instigator.Location + Instigator.EyePosition();		
	}
	else
	{
		Start = Location;
	}
	X = LaserRot;
	loc = GetBoneCoords('tip2').Origin;
	End = Start + (Vector(X) * float(5000));
	Other = Trace(HitLocation, HitNormal, End, Start, true);
	// End:0x20E
	if(Other == none)
	{
		HitLocation = End;
	}
	Laser.SetLocation(loc);
	Laser.SetRotation(Rotator(HitLocation - loc));
	Scale3D.X = VSize(HitLocation - Laser.Location) / float(128);
	Scale3D.Y = 1.0000000;
	Scale3D.Z = 1.0000000;
	Laser.SetDrawScale3D(Scale3D);
	//return;	
}

simulated function Vector GetModeTipLocation(optional byte Mode)
{
	local Vector X, Y, Z, loc;

	// End:0xBF
	if(Instigator.IsFirstPerson())
	{
		// End:0x9E
		if(M2020GaussDMR(Instigator.Weapon).bScopeView)
		{
			Instigator.Weapon.GetViewAxes(X, Y, Z);
			loc = ((Instigator.Location + Instigator.EyePosition()) + (X * float(20))) + (Z * float(-10));			
		}
		else
		{
			loc = Instigator.Weapon.GetEffectStart();
		}		
	}
	else
	{
		loc = GetBoneCoords('tip').Origin;
	}
	return loc;
	//return;	
}

simulated function PostNetReceive()
{
	// End:0x24
	if(int(OldBlockEffectCount) != int(BlockEffectCount))
	{
		OldBlockEffectCount = BlockEffectCount;
		DoBlockEffect();
	}
	super.PostNetReceive();
	//return;	
}

simulated function DoBlockEffect()
{
	Spawn(Class'BWBP_SKC_Pro.M2020BlockEffect', Instigator,, GetModeTipLocation(), Instigator.GetViewRotation());
	//return;	
}

simulated function Destroyed()
{
	// End:0x17
	if(Laser != none)
	{
		Laser.Destroy();
	}
	super.Destroyed();
	//return;	
}

defaultproperties
{
	CurrentTracerMode=3
	TracerClasses[0]=Class'BallisticProV55.TraceEmitter_Default'
	TracerClasses[1]=Class'BallisticProV55.TraceEmitter_AP'
	TracerClasses[2]=Class'BallisticProV55.TraceEmitter_Gauss'
	TracerClasses[3]=Class'BWBP_SKC_Pro.TraceEmitter_GaussSuper'
	ImpactManagers[0]=Class'BallisticProV55.IM_Bullet'
	ImpactManagers[1]=Class'BallisticProV55.IM_BulletGauss'
	ImpactManagers[2]=Class'BallisticProV55.IM_BulletGauss'
	ImpactManagers[3]=Class'BallisticProV55.IM_BulletGauss'
	WeaponClass=Class'BWBP_SKC_Pro.M2020GaussDMR'
	MuzzleFlashClass=Class'BWBP_SKC_Pro.M2020FlashEmitter'
	AltMuzzleFlashClass=Class'BallisticProV55.M806FlashEmitter'
	ImpactManager=Class'BallisticProV55.IM_Bullet'
	BrassClass=Class'BallisticProV55.Brass_Rifle'
	InstantMode=2
	FlashMode=2
	LightMode=2
	TracerClass=Class'BWBP_SKC_Pro.TraceEmitter_GaussSuper'
	TracerChance=2.0000000
	WaterTracerClass=Class'BallisticProV55.TraceEmitter_WaterBullet'
	WaterTracerMode=2
	FlyBySound=(Sound=SoundGroup'BW_Core_WeaponSound.FlyBys.Bullet-Whizz',Volume=0.7000000,Radius=64.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	ReloadAnimRate=0.7000000
	CockAnimRate=0.9500000
	bRapidFire=true
	AmbientSound=Sound'BW_Core_WeaponSound.M75.M75Hum'
	Mesh=SkeletalMesh'BWBP_SKC_Anim.M2020_TPm'
	RelativeRotation=(Pitch=32768,Yaw=0,Roll=0)
	DrawScale=0.3500000
	SoundVolume=48
	SoundRadius=128.0000000
}
