class MACShell extends BallisticProjectile;

var() Sound FlySound;
var() float ShellTime;

simulated function PostBeginPlay()
{
	super.PostBeginPlay();
	SetTimer(0.1500000, false);
	// End:0x48
	if(FastTrace(Location + (Vector(Rotation) * float(3000)), Location))
	{
		PlaySound(FlySound, 3, 1.0000000,, 512.0000000,, false);
	}
	//return;	
}

simulated event Landed(Vector HitNormal)
{
	HitWall(HitNormal, none);
	//return;	
}

simulated event HitWall(Vector HitNormal, Actor Wall)
{
	Explode(Location, HitNormal);
	//return;	
}

simulated function Timer()
{
	// End:0x15
	if(StartDelay > float(0))
	{
		super.Timer();
		return;
	}
	DamageRadius = 400.0000000;
	WallPenetrationForce = 256.0000000;
	//return;	
}

simulated event Tick(float dt)
{
	local Rotator R;

	R.Roll = Rotation.Roll;
	SetRotation(Rotator(Velocity) + R);
	//return;	
}

simulated function bool CanTouch(Actor Other)
{
	// End:0x31
	if((Vehicle(Instigator) != none) && Other == Vehicle(Instigator).Driver)
	{
		return false;
	}
	return super.CanTouch(Other);
	//return;	
}

simulated function ApplyImpactEffect(Actor Other, Vector HitLocation)
{
	// End:0x35
	if((Instigator == none) || Instigator.Controller == none)
	{
		Other.SetDelayedDamageInstigatorController(InstigatorController);
	}
	Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Other, Damage + ((float(75) * FMin(default.LifeSpan - LifeSpan, 0.4000000)) / 0.4000000), Instigator, HitLocation, (MomentumTransfer * Normal(Velocity)) + vect(0.0000000, 0.0000000, 250.0000000), MyDamageType);
	//return;	
}

final function bool PointInSolid(Vector V)
{
	return !FastTrace(V, V + vect(1.0000000, 1.0000000, 1.0000000));
	//return;	
}

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
	local int Surf;
	local Material HitMaterial;
	local bool bNoSecondary;
	local Vector tHitNorm, tHitLoc;

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
	// End:0x1D5
	if((ImpactManager != none) && int(Level.NetMode) != int(NM_DedicatedServer))
	{
		CheckSurface(HitLocation, HitNormal, Surf);
		Trace(tHitLoc, tHitNorm, HitLocation, HitLocation + ((DamageRadius * (SurfaceScale(Surf))) * Normal(Velocity)), false,, HitMaterial);
		// End:0xF1
		if(((tHitLoc == vect(0.0000000, 0.0000000, 0.0000000)) || PointInSolid(tHitLoc)) || WallPenetrationForce < VSize(Location - HitLocation))
		{
			bNoSecondary = true;
		}
		// End:0x16F
		if(Instigator == none)
		{
			ImpactManager.static.StartSpawn(HitLocation, HitNormal, Surf, Level.GetLocalPlayerController());
			// End:0x16C
			if(!bNoSecondary)
			{
				ImpactManager.static.StartSpawn(tHitLoc, tHitNorm, int(HitMaterial.SurfaceType), Level.GetLocalPlayerController());
			}			
		}
		else
		{
			ImpactManager.static.StartSpawn(HitLocation, HitNormal, Surf, Instigator);
			// End:0x1D5
			if(!bNoSecondary)
			{
				ImpactManager.static.StartSpawn(tHitLoc, tHitNorm, int(HitMaterial.SurfaceType), Level.GetLocalPlayerController());
			}
		}
	}
	BlowUp(HitLocation);
	bExploded = true;
	// End:0x26A
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

simulated function Actor GetDamageVictim(Actor Other, Vector HitLocation, Vector Dir, out float Dmg, optional out Class<DamageType> dt)
{
	Dmg = Damage + ((float(50) * FMin(default.LifeSpan - LifeSpan, 0.4000000)) / 0.4000000);
	return Other;
	//return;	
}

defaultproperties
{
	FlySound=Sound'BW_Core_WeaponSound.Artillery.Art-FlyBy'
	WeaponClass=Class'BallisticProV55.MACWeapon'
	ImpactManager=Class'BallisticProV55.IM_HAMR'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	TrailClass=Class'BallisticProV55.HAMRShellTrail'
	bRandomStartRotation=false
	bCheckHitSurface=true
	MyRadiusDamageType=Class'BallisticProV55.DT_MACRadius'
	bLimitMomentumZ=false
	WallPenetrationForce=128.0000000
	ShakeRadius=512.0000000
	ShakeRotMag=(X=512.0000000,Y=400.0000000,Z=350.0000000)
	ShakeRotRate=(X=7000.0000000,Y=7000.0000000,Z=5500.0000000)
	ShakeRotTime=8.0000000
	ShakeOffsetMag=(X=30.0000000,Y=30.0000000,Z=30.0000000)
	ShakeOffsetRate=(X=600.0000000,Y=600.0000000,Z=600.0000000)
	ShakeOffsetTime=10.0000000
	MotionBlurRadius=384.0000000
	MotionBlurFactor=6.0000000
	MotionBlurTime=8.0000000
	Speed=9000.0000000
	MaxSpeed=9000.0000000
	Damage=160.0000000
	DamageRadius=192.0000000
	MomentumTransfer=70000.0000000
	MyDamageType=Class'BallisticProV55.DT_MAC'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.Artillery.Artillery-Projectile'
	Physics=2
	DrawScale=0.3000000
	SoundVolume=192
	SoundRadius=256.0000000
	bFixedRotationDir=true
	bIgnoreTerminalVelocity=true
	RotationRate=(Pitch=0,Yaw=0,Roll=32768)
}
