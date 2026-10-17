class RGPXRocket extends BallisticProjectile;

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
	Damage *= (float(1) + FClamp(default.LifeSpan - (LifeSpan + ArmingDelay), 0.0000000, 0.5000000));
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
		Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Other, Damage, Instigator, HitLocation, MomentumTransfer * Normal(Velocity), MyDamageType);
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
		// End:0x230
		if(int(Role) == int(ROLE_Authority))
		{
			MakeNoise(1.0000000);
			Damage *= (float(1) + FClamp(default.LifeSpan - (LifeSpan + ArmingDelay), 0.0000000, 0.5000000));
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
	ImpactDamage=70.0000000
	ArmedImpactDamage=150.0000000
	ImpactMomentumTransfer=60000.0000000
	ImpactDamageType=Class'BWBP_JCF_Pro.DTRGPXUnarmed'
	ArmingDelay=0.0500000
	WeaponClass=Class'BWBP_JCF_Pro.RGPXBazooka'
	ImpactManager=Class'BWBP_JCF_Pro.IM_RGPX'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	TrailClass=Class'BWBP_JCF_Pro.RGPXRocketTrail'
	TrailOffset=(X=-14.0000000,Y=0.0000000,Z=0.0000000)
	bRandomStartRotation=false
	MyRadiusDamageType=Class'BWBP_JCF_Pro.DTRGPXBazookaRadius'
	WallPenetrationForce=384.0000000
	MotionBlurRadius=512.0000000
	AccelSpeed=5000.0000000
	Speed=2000.0000000
	MaxSpeed=25000.0000000
	Damage=80.0000000
	DamageRadius=768.0000000
	MomentumTransfer=75000.0000000
	MyDamageType=Class'BWBP_JCF_Pro.DTRGPXBazooka'
	LightType=1
	LightEffect=21
	LightHue=25
	LightSaturation=100
	LightBrightness=200.0000000
	LightRadius=15.0000000
	StaticMesh=StaticMesh'BWBP_JCF_Static.RGP-X350.RGP-X350_ProjMini'
	bDynamicLight=true
	bNetTemporary=false
	bUpdateSimulatedPosition=true
	AmbientSound=Sound'BW_Core_WeaponSound.G5.G5-RocketFly'
	DrawScale=0.1800000
	SoundVolume=192
	SoundRadius=128.0000000
	CollisionRadius=4.0000000
	CollisionHeight=4.0000000
	bUseCollisionStaticMesh=true
	bFixedRotationDir=true
	RotationRate=(Pitch=0,Yaw=0,Roll=32768)
}
