class LonghornGrenade extends BallisticGrenade;

enum EDetonationType
{
	DET_Shatter,                    // 0
	DET_ImpactTimed,                // 1
	DET_Manual,                     // 2
	DET_Artillery,                  // 3
	DET_Direct                      // 4
};

var bool bColored;
var bool bPrimaryGrenade;
var bool bFireReleased;
var bool bNoArtillery;
var LonghornGrenade.EDetonationType DetonationType;
var float ZBonus;
var float DamageDropoffFactor;
var int ExplosiveImpactDamage;
var protected const float MyArmingDelay;

replication
{
	// Pos:0x000
	reliable if(bTearOff && int(Role) == int(ROLE_Authority))
		DetonationType;
}

simulated function InitEffects()
{
	local Vector X, Y, Z;

	bDynamicLight = default.bDynamicLight;
	// End:0x12F
	if(((int(Level.NetMode) != int(NM_DedicatedServer)) && TrailClass != none) && Trail == none)
	{
		GetAxes(Rotation, X, Y, Z);
		Trail = Spawn(TrailClass, self,, ((Location + (X * TrailOffset.X)) + (Y * TrailOffset.Y)) + (Z * TrailOffset.Z), Rotation);
		// End:0xE9
		if((Instigator != none) && LonghornGrenadeTrail(Trail) != none)
		{
			LonghornGrenadeTrail(Trail).SetupColor(Instigator.GetTeamNum());
		}
		// End:0x117
		if(Emitter(Trail) != none)
		{
			Class'BCoreProV55.BallisticEmitter'.static.ScaleEmitter(Emitter(Trail), DrawScale);
		}
		// End:0x12F
		if(Trail != none)
		{
			Trail.SetBase(self);
		}
	}
	//return;	
}

simulated event TornOff()
{
	Explode(Location, vect(0.0000000, 0.0000000, 1.0000000));
	//return;	
}

function ManualDetonate(bool bBig)
{
	// End:0x0B
	if(bFireReleased)
	{
		return;
	}
	// End:0x35
	if(bBig)
	{
		FlakClass = Class'BWBP_SKC_Pro.LonghornMicroClusterFlakArtillery';
		DamageRadius *= float(2);
		DetonationType = 3;		
	}
	else
	{
		FlakClass = Class'BWBP_SKC_Pro.LonghornMicroClusterFlak';
		Damage = 60.0000000;
		DetonationType = 2;
		MomentumTransfer = 20000.0000000;
	}
	Explode(Location, vect(0.0000000, 0.0000000, 1.0000000));
	//return;	
}

simulated event HitWall(Vector HitNormal, Actor Wall)
{
	local Vector VNorm;

	// End:0x11D
	if(int(Role) == int(ROLE_Authority))
	{
		// End:0x76
		if((((int(DetonationType) == int(1)) && int(DetonateOn) == int(2)) && bFireReleased) && !bHasImpacted)
		{
			// End:0x5F
			if(ImpactSound != none)
			{
				PlaySound(ImpactSound, 1);
			}
			FlakClass = Class'BWBP_SKC_Pro.LonghornMicroClusterFlak';
			SetTimer(DetonateDelay, false);			
		}
		else
		{
			// End:0xF5
			if((int(DetonateOn) == int(1)) || ((int(DetonateOn) == int(2)) && bFireReleased) && !bHasImpacted)
			{
				// End:0xE3
				if(ImpactSound != none)
				{
					PlaySound(ImpactSound, 0,,, TransientSoundRadius * FMin(Speed / float(3500), 1.0000000));
				}
				Explode(Location, HitNormal);
				return;
			}
		}
		// End:0x11D
		if(Pawn(Wall) != none)
		{
			DampenFactor *= 0.5000000;
			DampenFactorParallel *= 0.5000000;
		}
	}
	bCanHitOwner = true;
	// End:0x136
	if(bFireReleased)
	{
		bHasImpacted = true;
	}
	bNoArtillery = true;
	VNorm = (Velocity Dot HitNormal) * HitNormal;
	Velocity = (-VNorm * DampenFactor) + ((Velocity - VNorm) * DampenFactorParallel);
	// End:0x198
	if(RandomSpin != float(0))
	{
		RandSpin(100000.0000000);
	}
	Speed = VSize(Velocity);
	// End:0x1EC
	if(Speed < float(20))
	{
		bBounce = false;
		SetPhysics(0);
		Damage = 75.0000000;
		// End:0x1E9
		if((Trail != none) && !TrailWhenStill)
		{
			DestroyEffects();
		}		
	}
	else
	{
		// End:0x31B
		if((((((Pawn(Wall) == none) && int(Level.NetMode) != int(NM_DedicatedServer)) && Speed > float(100)) && !Level.bDropDetail) && int(Level.DetailMode) != int(0)) && EffectIsRelevant(Location, false))
		{
			// End:0x29C
			if(ImpactSound != none)
			{
				PlaySound(ImpactSound, 0,,, TransientSoundRadius * FMin(Speed / float(3500), 1.0000000));
			}
			// End:0x31B
			if(ReflectImpactManager != none)
			{
				// End:0x2ED
				if(Instigator == none)
				{
					ReflectImpactManager.static.StartSpawn(Location, HitNormal, int(Wall.SurfaceType), Level.GetLocalPlayerController());					
				}
				else
				{
					ReflectImpactManager.static.StartSpawn(Location, HitNormal, int(Wall.SurfaceType), Instigator);
				}
			}
		}
	}
	//return;	
}

simulated function ProcessTouch(Actor Other, Vector HitLocation)
{
	local Vector ReflectNorm, VNorm;

	// End:0x3C
	if((Other == none) || !bCanHitOwner && (Other == Instigator) || Other == Owner)
	{
		return;
	}
	// End:0x90
	if((xPawn(Other) != none) && !xPawn(Other).bProjTarget)
	{
		HitWall(Normal(Location - xPawn(Other).Location), Other);
		return;
	}
	// End:0x231
	if((int(Role) == int(ROLE_Authority)) && HitActor != Other)
	{
		HitActor = Other;
		// End:0x147
		if((!bHasImpacted && !bFireReleased) && (default.LifeSpan - LifeSpan) > MyArmingDelay)
		{
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Other, float(ExplosiveImpactDamage), Instigator, HitLocation, MomentumTransfer * Normal(Velocity), ImpactDamageType);
			DetonationType = 4;
			Explode(HitLocation, vect(0.0000000, 0.0000000, 1.0000000));			
		}
		else
		{
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Other, (float(ImpactDamage) * VSize(Velocity)) / MaxSpeed, Instigator, HitLocation, MomentumTransfer * Normal(Velocity), ImpactDamageType);
			ReflectNorm = Location - Other.Location;
			ReflectNorm.Z = 0.0000000;
			ReflectNorm = Normal(ReflectNorm);
			VNorm = (Velocity Dot ReflectNorm) * ReflectNorm;
			Velocity = (-VNorm * DampenFactor) + ((Velocity - VNorm) * DampenFactorParallel);
			bHasImpacted = true;
			bFireReleased = true;
			Explode(HitLocation, vect(0.0000000, 0.0000000, 1.0000000));
		}
	}
	//return;	
}

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
	local int Surf;

	// End:0x0B
	if(bExploded)
	{
		return;
	}
	// End:0x32
	if((ShakeRadius > float(0)) || MotionBlurRadius > float(0))
	{
		ShakeView(HitLocation);
	}
	switch(DetonationType)
	{
		// End:0x4C
		case 0:
			ImpactManager = Class'BWBP_SKC_Pro.IM_LonghornShatter';
			// End:0x7C
			break;
		// End:0x66
		case 4:
			ImpactManager = Class'BWBP_SKC_Pro.IM_LonghornMax';
			FlakClass = none;
			// End:0x7C
			break;
		// End:0x79
		case 3:
			ImpactManager = Class'BWBP_SKC_Pro.IM_LonghornMax';
			// End:0x7C
			break;
		// End:0xFFFF
		default:
			break;
	}
	// End:0x11E
	if((ImpactManager != none) && int(Level.NetMode) != int(NM_DedicatedServer))
	{
		// End:0xC0
		if(bCheckHitSurface)
		{
			CheckSurface(HitLocation, HitNormal, Surf);
		}
		// End:0xFB
		if(Instigator == none)
		{
			ImpactManager.static.StartSpawn(HitLocation, HitNormal, Surf, Level.GetLocalPlayerController());			
		}
		else
		{
			ImpactManager.static.StartSpawn(HitLocation, HitNormal, Surf, Instigator);
		}
	}
	// End:0x134
	if(!bTearOff)
	{
		BlowUp(HitLocation);
	}
	bExploded = true;
	// End:0x1BE
	if((!bNetTemporary && bTearOnExplode) && (int(Level.NetMode) == int(NM_DedicatedServer)) || int(Level.NetMode) == int(NM_ListenServer))
	{
		Velocity = vect(0.0000000, 0.0000000, 0.0000000);
		SetCollision(false, false, false);
		TearOffHitNormal = HitNormal;
		bTearOff = true;
		GotoState('NetTrapped');		
	}
	else
	{
		Destroy();
	}
	//return;	
}

function BlowUp(Vector HitLocation)
{
	local Vector Start, X, Y, Z;
	local Rotator Dir;
	local int i;

	GetAxes(Rotation, X, Y, Z);
	Start = Location;
	// End:0x4D
	if(!FastTrace(Location - vect(0.0000000, 0.0000000, 32.0000000)))
	{
		Start.Z += float(16);
	}
	// End:0x12A
	if((flakcount > 0) && FlakClass != none)
	{
		Dir.Pitch = -16384;
		Dir.Yaw = Rotation.Yaw;
		Spawn(FlakClass,, 'None', Start, Dir);
		i = 1;
		J0xA9:

		// End:0x12A [Loop If]
		if(i < flakcount)
		{
			switch(DetonationType)
			{
				// End:0xD0
				case 0:
					Dir = RotRand();
					// End:0x108
					break;
				// End:0xFFFF
				default:
					Dir.Yaw += (65536 / (flakcount - 1));
					Dir.Pitch = -12386 - 2000;
					// End:0x108
					break;
					break;
			}
			Spawn(FlakClass,, 'None', Start, Dir);
			i++;
			// [Loop Continue]
			goto J0xA9;
		}
	}
	// End:0x15E
	if(int(DetonationType) != int(0))
	{
		TargetedHurtRadius(Damage, DamageRadius, MyRadiusDamageType, MomentumTransfer, HitLocation, HitActor);
	}
	// End:0x176
	if(int(Role) == int(ROLE_Authority))
	{
		MakeNoise(1.0000000);
	}
	//return;	
}

defaultproperties
{
	bPrimaryGrenade=true
	ZBonus=40000.0000000
	DamageDropoffFactor=0.1000000
	ExplosiveImpactDamage=130
	MyArmingDelay=0.1800000
	ArmedDetonateOn=2
	ArmedPlayerImpactType=1
	ReflectImpactManager=Class'BallisticProV55.IM_GunHit'
	DampenFactor=0.3000000
	DampenFactorParallel=0.4000000
	bNoInitialSpin=true
	bAlignToVelocity=true
	DetonateDelay=0.6500000
	flakcount=6
	FlakClass=Class'BWBP_SKC_Pro.LonghornMicroClusterDud'
	ImpactDamage=100
	ImpactDamageType=Class'BWBP_SKC_Pro.DT_LonghornBigDirect'
	WeaponClass=Class'BWBP_SKC_Pro.LonghornLauncher'
	ImpactManager=Class'BWBP_SKC_Pro.IM_SMARTGrenade'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	TrailClass=Class'BWBP_SKC_Pro.LonghornGrenadeTrail'
	MyRadiusDamageType=Class'BWBP_SKC_Pro.DT_LonghornBigRadius'
	WallPenetrationForce=32.0000000
	ShakeRadius=512.0000000
	MotionBlurRadius=384.0000000
	MotionBlurFactor=3.0000000
	MotionBlurTime=4.0000000
	Speed=6000.0000000
	MaxSpeed=6000.0000000
	Damage=130.0000000
	DamageRadius=450.0000000
	MyDamageType=Class'BWBP_SKC_Pro.DT_LonghornBigRadius'
	ImpactSound=SoundGroup'BW_Core_WeaponSound.NRP57.NRP57-Metal'
	LightType=1
	LightEffect=21
	LightHue=25
	LightSaturation=192
	LightBrightness=64.0000000
	LightRadius=12.0000000
	StaticMesh=StaticMesh'BWBP_SKC_Static.Longhorn.GrenadeProj'
	bDynamicLight=true
	bNetTemporary=false
	AmbientSound=Sound'GeneralAmbience.texture12'
	LifeSpan=20.0000000
	DrawScale=0.5000000
	bFullVolume=true
	SoundVolume=255
	SoundPitch=32
	SoundRadius=512.0000000
	TransientSoundVolume=0.7000000
	TransientSoundRadius=1024.0000000
	CollisionRadius=2.0000000
	CollisionHeight=2.0000000
	RotationRate=(Pitch=0,Yaw=0,Roll=32768)
}
