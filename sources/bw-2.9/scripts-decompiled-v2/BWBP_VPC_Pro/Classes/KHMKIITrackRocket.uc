class KHMKIITrackRocket extends Projectile;

var Actor HomingTarget;
var Vector InitialDir;
var float AccelerationAddPerSec;
var float LeadTargetDelay;
var float LeadTargetStartTime;
var Emitter SmokeTrailEffect;
var Effects Corona;
var(Effects) Class<Emitter> SmokeTrailClass;
var(Effects) Class<Effects> CoronaClass;
var(Effects) Class<Emitter> ExplosionEffect;
var(Effects) Sound ExplosionSound;
var(Effects) float ExplosionSoundVolume;
var(Effects) float ExplosionSoundRadius;
var(Effects) float ExplosionSoundPitch;

replication
{
	// Pos:0x000
	reliable if(bNetInitial && int(Role) == int(ROLE_Authority))
		HomingTarget, InitialDir;
}

simulated function Destroyed()
{
	// End:0x1A
	if(SmokeTrailEffect != none)
	{
		SmokeTrailEffect.Kill();
	}
	// End:0x31
	if(Corona != none)
	{
		Corona.Destroy();
	}
	super(Actor).Destroyed();
	//return;	
}

simulated function PostBeginPlay()
{
	local Vector Dir;

	// End:0x5B
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		SmokeTrailEffect = Spawn(SmokeTrailClass, self);
		Corona = Spawn(CoronaClass, self);
		Corona.SetDrawScale(4.5000000 * Corona.default.DrawScale);
	}
	InitialDir = Vector(Rotation);
	Velocity = InitialDir * Speed;
	// End:0x9E
	if(PhysicsVolume.bWaterVolume)
	{
		Velocity = 0.6000000 * Velocity;
	}
	SetTimer(0.1000000, true);
	Dir = Vector(Rotation);
	Velocity = Speed * Dir;
	Acceleration = Dir;
	// End:0xF5
	if(PhysicsVolume.bWaterVolume)
	{
		Velocity = 0.6000000 * Velocity;
	}
	// End:0x117
	if(Level.bDropDetail)
	{
		bDynamicLight = false;
		LightType = 0;
	}
	SetTimer(0.1000000, true);
	LeadTargetStartTime = Level.TimeSeconds + LeadTargetDelay;
	super.PostBeginPlay();
	//return;	
}

simulated function Timer()
{
	local float VelMag;
	local Vector ForceDir;

	// End:0x0D
	if(HomingTarget == none)
	{
		return;
	}
	ForceDir = Normal(HomingTarget.Location - Location);
	// End:0x9A
	if((ForceDir Dot InitialDir) > float(0))
	{
		VelMag = VSize(Velocity);
		ForceDir = Normal(((ForceDir * 0.7500000) * VelMag) + Velocity);
		Velocity = VelMag * ForceDir;
		Acceleration = float(5) * ForceDir;
		SetRotation(Rotator(Velocity));
	}
	//return;	
}

simulated function Landed(Vector HitNormal)
{
	Explode(Location, HitNormal);
	//return;	
}

simulated function ProcessTouch(Actor Other, Vector HitLocation)
{
	// End:0x53
	if((Other != Instigator) && !Other.IsA('Projectile') || Other.bProjTarget)
	{
		Explode(HitLocation, vect(0.0000000, 0.0000000, 1.0000000));
	}
	//return;	
}

function BlowUp(Vector HitLocation)
{
	HurtRadius(Damage, DamageRadius, MyDamageType, MomentumTransfer, HitLocation);
	MakeNoise(1.0000000);
	//return;	
}

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
	local PlayerController PC;

	PlaySound(ExplosionSound,, ExplosionSoundVolume,, ExplosionSoundRadius, ExplosionSoundPitch);
	// End:0xD1
	if(EffectIsRelevant(Location, false))
	{
		Spawn(Class'XEffects.NewExplosionA',,, HitLocation + (HitNormal * float(20)), Rotator(HitNormal));
		PC = Level.GetLocalPlayerController();
		// End:0xD1
		if((PC.ViewTarget != none) && VSize(PC.ViewTarget.Location - Location) > float(0))
		{
			Spawn(ExplosionEffect,,, HitLocation + (HitNormal * float(32)), Rotator(HitNormal) + rot(-16384, 0, 0));
		}
	}
	BlowUp(HitLocation);
	Destroy();
	//return;	
}

simulated function Tick(float DeltaTime)
{
	// End:0x2E
	if(VSize(Velocity) >= MaxSpeed)
	{
		Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
		Disable('Tick');		
	}
	else
	{
		Acceleration += (Normal(Velocity) * (AccelerationAddPerSec * DeltaTime));
	}
	//return;	
}

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType)
{
	// End:0x23
	if(Damage > 0)
	{
		Explode(HitLocation, vect(0.0000000, 0.0000000, 0.0000000));
	}
	//return;	
}

defaultproperties
{
	LeadTargetStartTime=3.5000000
	SmokeTrailClass=Class'BWBP_VPC_Pro.KHMKIIRocketTrail'
	CoronaClass=Class'BWBP_VPC_Pro.KHMKIIRocketFlare'
	ExplosionEffect=Class'BWBP_VPC_Pro.RocketExplosionEffect'
	ExplosionSound=SoundGroup'BWBP_Vehicles_Sound.Effects.ExplosionsSmall'
	ExplosionSoundVolume=2.0000000
	ExplosionSoundRadius=900.0000000
	ExplosionSoundPitch=1.0000000
	Speed=4000.0000000
	MaxSpeed=4000.0000000
	Damage=75.0000000
	DamageRadius=900.0000000
	MomentumTransfer=30000.0000000
	MyDamageType=Class'BWBP_VPC_Pro.KHMKIIDamTypeRocket'
	ExplosionDecal=Class'BWBP_VPC_Pro.ExplosionDecal'
	LightType=1
	LightEffect=21
	LightHue=25
	LightSaturation=100
	LightBrightness=200.0000000
	LightRadius=15.0000000
	DrawType=8
	StaticMesh=StaticMesh'BWBP_Vehicles_Static.Effects.Missile'
	CullDistance=3000.0000000
	bDynamicLight=true
	AmbientSound=Sound'BWBP_Vehicles_Sound.Effects.MissileFly'
	LifeSpan=12.0000000
	FluidSurfaceShootStrengthMod=0.0000000
	bFullVolume=true
	SoundVolume=128
	SoundRadius=1000.0000000
	CollisionRadius=16.0000000
	bFixedRotationDir=true
	RotationRate=(Pitch=0,Yaw=0,Roll=50000)
	DesiredRotation=(Pitch=0,Yaw=0,Roll=900000)
	ForceType=2
	ForceRadius=100.0000000
	ForceScale=5.0000000
}
