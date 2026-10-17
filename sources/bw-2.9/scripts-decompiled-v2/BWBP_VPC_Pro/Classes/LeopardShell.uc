class LeopardShell extends Projectile;

var Emitter SmokeTrailEffect;
var bool bHitWater;
var Effects Corona;
var Vector Dir;
var(Effects) Class<Emitter> ExplosionEffect;
var(Effects) Class<Emitter> SmokeTrailClass;
var(Effects) Class<Effects> CoronaClass;
var(Effects) Sound ExplosionSound;
var(Effects) float ExplosionSoundVolume;
var(Effects) float ExplosionSoundRadius;
var(Effects) float ExplosionSoundPitch;

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
	// End:0x37
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		SmokeTrailEffect = Spawn(SmokeTrailClass, self);
		Corona = Spawn(CoronaClass, self);
	}
	Dir = Vector(Rotation);
	Velocity = Speed * Dir;
	// End:0x82
	if(PhysicsVolume.bWaterVolume)
	{
		bHitWater = true;
		Velocity = 0.6000000 * Velocity;
	}
	// End:0xA4
	if(Level.bDropDetail)
	{
		bDynamicLight = false;
		LightType = 0;
	}
	super.PostBeginPlay();
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
	PlaySound(ExplosionSound,, ExplosionSoundVolume,, ExplosionSoundRadius, ExplosionSoundPitch);
	// End:0x99
	if(EffectIsRelevant(Location, false))
	{
		Spawn(ExplosionEffect,,, HitLocation + (HitNormal * float(16)), Rotator(HitNormal) + rot(-16384, 0, 0));
		// End:0x99
		if((ExplosionDecal != none) && int(Level.NetMode) != int(NM_DedicatedServer))
		{
			Spawn(ExplosionDecal, self,, Location, Rotator(-HitNormal));
		}
	}
	BlowUp(HitLocation);
	Destroy();
	//return;	
}

defaultproperties
{
	ExplosionEffect=Class'BWBP_VPC_Pro.RocketExplosionEffect'
	SmokeTrailClass=Class'BWBP_VPC_Pro.LeopardShellTrail'
	ExplosionSound=SoundGroup'BWBP_Vehicles_Sound.Effects.ExplosionsSmall'
	ExplosionSoundVolume=2.0000000
	ExplosionSoundRadius=900.0000000
	ExplosionSoundPitch=1.0000000
	Speed=250000.0000000
	MaxSpeed=250000.0000000
	Damage=1000.0000000
	DamageRadius=660.0000000
	MomentumTransfer=40000.0000000
	MyDamageType=Class'BWBP_VPC_Pro.LeopardDamTypeShell'
	ExplosionDecal=Class'BWBP_VPC_Pro.ExplosionDecal'
	DrawType=8
	StaticMesh=StaticMesh'WeaponStaticMesh.RocketProj'
	Physics=2
	AmbientSound=Sound'VMVehicleSounds-S.HoverTank.IncomingShell'
	LifeSpan=9.0000000
	Acceleration=(X=0.0000000,Y=0.0000000,Z=600.0000000)
	AmbientGlow=96
	FluidSurfaceShootStrengthMod=10.0000000
	bFullVolume=true
	SoundVolume=255
	SoundRadius=1000.0000000
	TransientSoundVolume=1.0000000
	TransientSoundRadius=1000.0000000
	bFixedRotationDir=true
	Mass=0.1000000
	RotationRate=(Pitch=0,Yaw=0,Roll=50000)
	DesiredRotation=(Pitch=0,Yaw=0,Roll=30000)
	ForceType=2
	ForceRadius=100.0000000
	ForceScale=5.0000000
}
