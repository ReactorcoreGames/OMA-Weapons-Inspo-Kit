class Supercharger_Detonator extends BallisticGrenade;

var Vector EndPoint;
var Vector StartPoint;
var array<Actor> AlreadyHit;
var Rotator VelocityDir;
var bool bDestroyMe;

simulated event PostBeginPlay()
{
	super.PostBeginPlay();
	VelocityDir = Rotation;
	// End:0x59
	if(((StartDelay > float(0)) && int(Role) == int(ROLE_Authority)) || bAlwaysRelevant)
	{
		SetPhysics(0);
		SetCollision(false, false, false);
		bHidden = true;
		SetTimer(StartDelay, false);
		return;
	}
	InitProjectile();
	//return;	
}

simulated function InitProjectile()
{
	Velocity = Speed * Vector(VelocityDir);
	// End:0x39
	if((RandomSpin != float(0)) && !bNoInitialSpin)
	{
		RandSpin(RandomSpin);
	}
	// End:0x52
	if(int(DetonateOn) == int(0))
	{
		SetTimer(DetonateDelay, false);
	}
	super(BallisticProjectile).InitProjectile();
	//return;	
}

simulated event PreBeginPlay()
{
	// End:0x2D
	if((Owner != none) && Pawn(Owner) != none)
	{
		Instigator = Pawn(Owner);
	}
	super(Actor).PreBeginPlay();
	//return;	
}

function InitFlame(Vector End)
{
	EndPoint = End;
	StartPoint = Location;
	//return;	
}

simulated function bool CanTouch(Actor Other)
{
	local int i;

	// End:0x12
	if(!super.CanTouch(Other))
	{
		return false;
	}
	// End:0x2C
	if(Other.Base == Instigator)
	{
		return false;
	}
	i = 0;
	J0x33:

	// End:0x64 [Loop If]
	if(i < AlreadyHit.Length)
	{
		// End:0x5A
		if(AlreadyHit[i] == Other)
		{
			return false;
		}
		i++;
		// [Loop Continue]
		goto J0x33;
	}
	return true;
	//return;	
}

simulated function ApplyImpactEffect(Actor Other, Vector HitLocation)
{
	// End:0x35
	if((Instigator == none) || Instigator.Controller == none)
	{
		Other.SetDelayedDamageInstigatorController(InstigatorController);
	}
	Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Other, Damage, Instigator, HitLocation, MomentumTransfer * Normal(Velocity), MyDamageType);
	//return;	
}

simulated function Penetrate(Actor Other, Vector HitLocation)
{
	AlreadyHit[AlreadyHit.Length] = Other;
	//return;	
}

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
	local Actor A;
	local Vector HitLoc, HitNorm, End;

	// End:0x18
	if(ShakeRadius > float(0))
	{
		ShakeView(HitLocation);
	}
	BlowUp(HitLocation);
	End.Z = -DamageRadius;
	A = Trace(HitLoc, HitNorm, End,, false);
	// End:0xB0
	if(ImpactManager != none)
	{
		// End:0x91
		if(Instigator == none)
		{
			ImpactManager.static.StartSpawn(HitLocation, HitNormal, 0, Level.GetLocalPlayerController());			
		}
		else
		{
			ImpactManager.static.StartSpawn(HitLocation, HitNormal, 0, Instigator);
		}
	}
	// End:0x132
	if(((bTearOnExplode && !bNetTemporary) && int(Level.NetMode) == int(NM_DedicatedServer)) || int(Level.NetMode) == int(NM_ListenServer))
	{
		Velocity = vect(0.0000000, 0.0000000, 0.0000000);
		SetCollision(false, false, false);
		TearOffHitNormal = HitNormal;
		bTearOff = true;
		GotoState('NetTrapped');		
	}
	else
	{
		bDestroyMe = true;
		SetTimer(1.0000000, false);
	}
	//return;	
}

simulated event Timer()
{
	// End:0x0E
	if(bDestroyMe)
	{
		Destroy();
		return;
	}
	Explode(Location, vect(0.0000000, 0.0000000, 1.0000000));
	//return;	
}

defaultproperties
{
	UnarmedDetonateOn=1
	ArmedDetonateOn=1
	PlayerImpactType=1
	bNoInitialSpin=true
	bAlignToVelocity=true
	bArmed=true
	DetonateDelay=0.1000000
	ImpactDamage=120
	bApplyParams=false
	WeaponClass=Class'BWBP_SKC_Pro.Supercharger_AssaultWeapon'
	ImpactManager=Class'BWBP_SKC_Pro.IM_XMExplosion'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	TrailClass=Class'BallisticProV55.M50GrenadeTrail'
	TrailOffset=(X=-8.0000000,Y=0.0000000,Z=0.0000000)
	bRandomStartRotation=false
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_Supercharge'
	MyRadiusDamageType=Class'BWBP_SKC_Pro.DT_Supercharge'
	ShakeRadius=1024.0000000
	ShakeRotMag=(X=512.0000000,Y=400.0000000,Z=256.0000000)
	ShakeRotRate=(X=3000.0000000,Y=2500.0000000,Z=3000.0000000)
	ShakeOffsetMag=(X=20.0000000,Y=30.0000000,Z=30.0000000)
	MotionBlurRadius=1024.0000000
	MotionBlurFactor=3.0000000
	MotionBlurTime=4.0000000
	Speed=0.0100000
	MaxSpeed=10000.0000000
	Damage=400.0000000
	DamageRadius=300.0000000
	MomentumTransfer=180000.0000000
	MyDamageType=Class'BWBP_SKC_Pro.DT_Supercharge'
	LightType=1
	LightEffect=21
	LightHue=25
	LightSaturation=100
	LightBrightness=200.0000000
	LightRadius=15.0000000
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.A73.A73Projectile'
	bDynamicLight=true
	AmbientSound=Sound'BW_Core_WeaponSound.A73.A73ProjFly'
	DrawScale=0.5000000
	SoundVolume=192
	SoundRadius=128.0000000
	RotationRate=(Pitch=0,Yaw=0,Roll=32768)
}
