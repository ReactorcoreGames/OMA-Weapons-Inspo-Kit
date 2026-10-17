class HydraRocket extends BallisticProjectile;

var Sound ImpactSounds[6];
var float ImpactDamage;
var float ArmedImpactDamage;
var float ImpactMomentumTransfer;
var Class<DamageType> ImpactDamageType;
var float ArmingDelay;
var float FlightTime;
var bool bArmed;
//var delegate<OnDie> __OnDie__Delegate;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		bArmed;
}

delegate OnDie(Actor cam)
{
	//return;	
}

simulated function InitProjectile()
{
	super.InitProjectile();
	// End:0x1F
	if(int(Role) == int(ROLE_Authority))
	{
		SetTimer(ArmingDelay, false);
	}
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
	// End:0x2D
	if(int(Role) == int(ROLE_Authority))
	{
		bArmed = true;
	}
	//return;	
}

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
	OnDie(self);
	super.Explode(HitLocation, HitNormal);
	//return;	
}

simulated function ApplyImpactEffect(Actor Other, Vector HitLocation)
{
	// End:0x35
	if((Instigator == none) || Instigator.Controller == none)
	{
		Other.SetDelayedDamageInstigatorController(InstigatorController);
	}
	// End:0x79
	if(!bArmed)
	{
		Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Other, ImpactDamage, Instigator, HitLocation, ImpactMomentumTransfer * Normal(Velocity), ImpactDamageType);		
	}
	else
	{
		Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Other, ArmedImpactDamage, Instigator, HitLocation, MomentumTransfer * Normal(Velocity), MyDamageType);
	}
	//return;	
}

simulated function bool Impact(Actor Other, Vector HitLocation)
{
	// End:0x0B
	if(bArmed)
	{
		return false;
	}
	Destroy();
	return true;
	//return;	
}

singular simulated function HitWall(Vector HitNormal, Actor Wall)
{
	// End:0x137
	if((!Wall.bStatic && !Wall.bWorldGeometry) && (Mover(Wall) == none) || Mover(Wall).bDamageTriggered)
	{
		// End:0x8A
		if((Instigator == none) || Instigator.Controller == none)
		{
			Wall.SetDelayedDamageInstigatorController(InstigatorController);
		}
		Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Wall, Damage, Instigator, Location, MomentumTransfer * Normal(Velocity), MyDamageType);
		// End:0x12C
		if(((DamageRadius > float(0)) && Vehicle(Wall) != none) && Vehicle(Wall).Health > 0)
		{
			Vehicle(Wall).DriverRadiusDamage(Damage, DamageRadius, InstigatorController, MyDamageType, MomentumTransfer, Location);
		}
		HurtWall = Wall;
	}
	// End:0x1C8
	if(!bArmed)
	{
		// End:0x163
		if(!Level.bDropDetail)
		{
			PlaySound(ImpactSounds[Rand(6)]);
		}
		Velocity = 0.4500000 * (Velocity - ((1.3300000 * HitNormal) * (Velocity Dot HitNormal)));
		SetRotation(Rotator(Velocity));
		AccelSpeed *= 0.7500000;
		Acceleration = AccelSpeed * Normal(Velocity);
		MakeNoise(1.0000000);
		return;		
	}
	else
	{
		// End:0x205
		if(int(Role) == int(ROLE_Authority))
		{
			MakeNoise(1.0000000);
			Explode(Location + (ExploWallOut * HitNormal), HitNormal);
			HurtWall = none;
		}
	}
	//return;	
}

defaultproperties
{
	ImpactSounds[0]=Sound'XEffects.Impact4Snd'
	ImpactSounds[1]=Sound'XEffects.Impact6Snd'
	ImpactSounds[2]=Sound'XEffects.Impact7Snd'
	ImpactSounds[3]=Sound'XEffects.Impact3'
	ImpactSounds[4]=Sound'XEffects.Impact1'
	ImpactSounds[5]=Sound'XEffects.Impact2'
	ImpactDamage=100.0000000
	ArmedImpactDamage=150.0000000
	ImpactMomentumTransfer=60000.0000000
	ImpactDamageType=Class'BWBP_APC_Pro.DTHydraUnarmed'
	ArmingDelay=0.2000000
	WeaponClass=Class'BWBP_APC_Pro.HydraBazooka'
	ImpactManager=Class'BWBP_SKC_Pro.IM_AGLGrenade'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	TrailClass=Class'BWBP_APC_Pro.HydraRocketTrail'
	TrailOffset=(X=-14.0000000,Y=0.0000000,Z=0.0000000)
	bRandomStartRotation=false
	MyRadiusDamageType=Class'BWBP_APC_Pro.DTHydraBazookaRadius'
	WallPenetrationForce=384.0000000
	ShakeRadius=378.0000000
	ShakeRotMag=(X=512.0000000,Y=400.0000000,Z=256.0000000)
	ShakeRotRate=(X=3000.0000000,Y=2500.0000000,Z=3000.0000000)
	ShakeOffsetMag=(X=20.0000000,Y=30.0000000,Z=30.0000000)
	MotionBlurRadius=512.0000000
	AccelSpeed=5000.0000000
	Speed=2000.0000000
	MaxSpeed=25000.0000000
	Damage=120.0000000
	DamageRadius=768.0000000
	MomentumTransfer=75000.0000000
	MyDamageType=Class'BWBP_APC_Pro.DTHydraBazooka'
	LightType=1
	LightEffect=21
	LightHue=25
	LightSaturation=100
	LightBrightness=200.0000000
	LightRadius=15.0000000
	StaticMesh=StaticMesh'BWBP_APC_Static.RL.CruRLRocket'
	bDynamicLight=true
	bNetTemporary=false
	bUpdateSimulatedPosition=true
	AmbientSound=Sound'BWBP_APC_Sounds.Launcher.Launcher-Fly1'
	LifeSpan=8.0000000
	DrawScale=0.5000000
	SoundVolume=192
	SoundRadius=128.0000000
	CollisionRadius=4.0000000
	CollisionHeight=4.0000000
	bUseCollisionStaticMesh=true
	bFixedRotationDir=true
	RotationRate=(Pitch=0,Yaw=0,Roll=32768)
}
