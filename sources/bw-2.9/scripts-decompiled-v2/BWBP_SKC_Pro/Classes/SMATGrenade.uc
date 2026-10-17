class SMATGrenade extends BallisticGrenade;

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
	ArmedPlayerImpactType=1
	PlayerImpactType=1
	bNoInitialSpin=true
	bAlignToVelocity=true
	bArmed=true
	DetonateDelay=0.0000010
	ImpactDamage=120
	bApplyParams=false
	WeaponClass=Class'BWBP_SKC_Pro.SMATLauncher'
	ImpactManager=Class'BallisticProV55.IM_RPG'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	TrailClass=Class'BallisticProV55.M50GrenadeTrail'
	TrailOffset=(X=-8.0000000,Y=0.0000000,Z=0.0000000)
	MyRadiusDamageType=Class'BWBP_SKC_Pro.DTSMATSuicide'
	ShakeRadius=2048.0000000
	ShakeRotMag=(X=512.0000000,Y=400.0000000,Z=256.0000000)
	ShakeRotRate=(X=3000.0000000,Y=2500.0000000,Z=3000.0000000)
	ShakeOffsetMag=(X=20.0000000,Y=30.0000000,Z=30.0000000)
	MotionBlurRadius=1768.0000000
	MotionBlurFactor=3.0000000
	MotionBlurTime=4.0000000
	Speed=0.0100000
	MaxSpeed=10000.0000000
	Damage=1512.0000000
	DamageRadius=768.0000000
	MomentumTransfer=180000.0000000
	MyDamageType=Class'BWBP_SKC_Pro.DTSMATSuicide'
	LightType=1
	LightEffect=21
	LightHue=25
	LightSaturation=100
	LightBrightness=200.0000000
	LightRadius=15.0000000
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.G5.G5Rocket'
	bDynamicLight=true
	AmbientSound=Sound'BW_Core_WeaponSound.G5.G5-RocketFly'
	DrawScale=0.5000000
	SoundVolume=192
	SoundRadius=128.0000000
	RotationRate=(Pitch=0,Yaw=0,Roll=32768)
}
