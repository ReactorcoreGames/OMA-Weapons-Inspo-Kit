class AY90BoltProjectile extends BallisticGrenade;

var() Sound FlySound;
var Actor StuckActor;
var bool bPlaced;

simulated function PreBeginPlay()
{
	local BallisticWeapon BW;

	super(Actor).PreBeginPlay();
	// End:0x13
	if(Instigator == none)
	{
		return;
	}
	BW = BallisticWeapon(Instigator.Weapon);
	// End:0x39
	if(BW == none)
	{
		return;
	}
	BW.default.ParamsClasses[int(BW.GameStyleIndex)].static.OverrideProjectileParams(self, 0);
	//return;	
}

simulated event ProcessTouch(Actor Other, Vector HitLocation)
{
	// End:0x1E
	if((Other == Instigator) && !bCanHitOwner)
	{
		return;
	}
	// End:0x2B
	if(Base != none)
	{
		return;
	}
	// End:0xA5
	if(Pawn(Other) != none)
	{
		StuckActor = Other;
		HitActor = Other;
		Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Other, float(ImpactDamage), Instigator, HitLocation, Velocity, ImpactDamageType);
		Explode(HitLocation, Normal(HitLocation - Other.Location));		
	}
	else
	{
		super(BallisticProjectile).ProcessTouch(Other, HitLocation);
	}
	//return;	
}

simulated event HitWall(Vector HitNormal, Actor Wall)
{
	// End:0x1B
	if(Pawn(Wall) != none)
	{
		StuckActor = Wall;
	}
	Explode(Location, HitNormal);
	//return;	
}

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
	local Actor LastTrace;
	local Vector Start, End, LastHitLoc, LastHitNorm;
	local Rotator R;
	local Projectile proj;

	// End:0x0B
	if(bPlaced)
	{
		return;
	}
	bPlaced = true;
	// End:0x74
	if(ImpactManager != none)
	{
		// End:0x55
		if(Instigator == none)
		{
			ImpactManager.static.StartSpawn(HitLocation, HitNormal, 0, Level.GetLocalPlayerController());			
		}
		else
		{
			ImpactManager.static.StartSpawn(HitLocation, HitNormal, 0, Instigator);
		}
	}
	// End:0x89
	if(int(Role) != int(ROLE_Authority))
	{
		Destroy();
		return;
	}
	// End:0x14C
	if(StuckActor == none)
	{
		Start = HitLocation - (Normal(Velocity) * 16.0000000);
		End = Start + (Normal(Velocity) * float(128));
		LastTrace = Trace(LastHitLoc, LastHitNorm, End, Start, false);
		// End:0x11C
		if((LastTrace == none) || !LastTrace.bWorldGeometry && Mover(LastTrace) == none)
		{
			return;
		}
		// End:0x129
		if(LastTrace == none)
		{
			return;
		}
		LastHitLoc += (5.0000000 * LastHitNorm);
		LastHitNorm = -LastHitNorm;		
	}
	else
	{
		R = Rotation;
		LastHitLoc = Location;
		LastHitNorm = Normal(Velocity);
	}
	R = Rotator(LastHitNorm);
	R.Roll = Rand(65536);
	// End:0x219
	if(StuckActor == none)
	{
		proj = Spawn(Class'BWBP_SKC_Pro.AY90Mine',,, LastHitLoc, R);
		proj.Instigator = Instigator;
		proj.bHardAttach = true;
		proj.SetBase(LastTrace);
		proj.SetRotation(R);
		proj.Velocity = vect(0.0000000, 0.0000000, 0.0000000);		
	}
	else
	{
		proj = Spawn(Class'BWBP_SKC_Pro.AY90Mine',,, LastHitLoc, R);
		proj.Instigator = Instigator;
		proj.SetPhysics(0);
		proj.bHardAttach = true;
		proj.SetBase(StuckActor);
	}
	Destroy();
	//return;	
}

simulated function StickActor(Actor A)
{
	local AY90ActorExploder AE;

	AE = Spawn(Class'BWBP_SKC_Pro.AY90ActorExploder');
	AE.Instigator = Instigator;
	AE.Initialize(A);
	//return;	
}

simulated function PostBeginPlay()
{
	SetTimer(0.3000000, false);
	super.PostBeginPlay();
	// End:0x48
	if(FastTrace(Location + (Vector(Rotation) * float(3000)), Location))
	{
		PlaySound(FlySound, 3, 1.0000000,, 512.0000000,, false);
	}
	//return;	
}

simulated event Tick(float dt)
{
	local Rotator R;

	R.Roll = Rotation.Roll;
	SetRotation(Rotator(Velocity) + R);
	//return;	
}

simulated event Timer()
{
	SetPhysics(2);
	//return;	
}

defaultproperties
{
	ArmedDetonateOn=1
	DetonateDelay=0.0000000
	ImpactDamage=30
	ImpactDamageType=Class'BWBP_SKC_Pro.DTAY90Skrith_BoltDirect'
	WeaponClass=Class'BWBP_SKC_Pro.AY90SkrithBoltcaster'
	ImpactManager=Class'BallisticProV55.IM_A73Projectile'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	TrailClass=Class'BallisticProV55.A73TrailEmitter'
	bRandomStartRotation=false
	bCheckHitSurface=true
	DamageTypeHead=Class'BWBP_SKC_Pro.DTAY90Skrith_BoltDirect'
	MyRadiusDamageType=Class'BWBP_SKC_Pro.DTAY90SkrithRadius'
	ShakeRadius=1024.0000000
	MotionBlurRadius=200.0000000
	AccelSpeed=35000.0000000
	Speed=2000.0000000
	MaxSpeed=35000.0000000
	DamageRadius=30.0000000
	MomentumTransfer=30000.0000000
	MyDamageType=Class'BWBP_SKC_Pro.DTAY90Skrith'
	LightType=1
	LightEffect=21
	LightHue=150
	LightBrightness=192.0000000
	LightRadius=6.0000000
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.A73.A73Projectile'
	bDynamicLight=true
	AmbientSound=Sound'BW_Core_WeaponSound.A73.A73ProjFly'
	LifeSpan=6.0000000
	DrawScale=0.5000000
	DrawScale3D=(X=0.5000000,Y=1.0000000,Z=1.0000000)
	Skins[0]=FinalBlend'BWBP_SKC_Tex.SkrithBow.AY90Projectile2-Final'
	Skins[1]=FinalBlend'BWBP_SKC_Tex.SkrithBow.AY90ProjectileFast1-Final'
	Style=6
	SoundVolume=255
	SoundRadius=75.0000000
	RotationRate=(Pitch=0,Yaw=0,Roll=12384)
}
