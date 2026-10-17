class ONSAttackCraftMissle extends Projectile;

var Emitter TrailEmitter;
var Class<Emitter> TrailClass;
var float AccelRate;
var Vehicle HomingTarget;
var Vector InitialDir;

replication
{
	// Pos:0x000
	reliable if(bNetInitial && int(Role) == int(ROLE_Authority))
		HomingTarget;
}

simulated function Destroyed()
{
	// End:0x17
	if(TrailEmitter != none)
	{
		TrailEmitter.Destroy();
	}
	// End:0x43
	if((int(Role) == int(ROLE_Authority)) && HomingTarget != none)
	{
		HomingTarget.NotifyEnemyLostLock();
	}
	super(Actor).Destroyed();
	//return;	
}

simulated function PostBeginPlay()
{
	super.PostBeginPlay();
	InitialDir = Vector(Rotation);
	Velocity = InitialDir * Speed;
	// End:0x49
	if(PhysicsVolume.bWaterVolume)
	{
		Velocity = 0.6000000 * Velocity;
	}
	// End:0x91
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		TrailEmitter = Spawn(TrailClass, self,, Location - (float(15) * InitialDir));
		TrailEmitter.SetBase(self);
	}
	SetTimer(0.1000000, true);
	//return;	
}

simulated function PostNetBeginPlay()
{
	super(Actor).PostNetBeginPlay();
	Acceleration = Normal(Velocity) * AccelRate;
	//return;	
}

function SetHomingTarget(Vehicle NewTarget)
{
	// End:0x1A
	if(HomingTarget != none)
	{
		HomingTarget.NotifyEnemyLostLock();
	}
	HomingTarget = NewTarget;
	// End:0x3F
	if(HomingTarget != none)
	{
		HomingTarget.NotifyEnemyLockedOn();
	}
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
	// End:0x9D
	if((ForceDir Dot InitialDir) > float(0))
	{
		VelMag = VSize(Velocity);
		ForceDir = Normal(((ForceDir * 0.7000000) * VelMag) + Velocity);
		Velocity = VelMag * ForceDir;
		Acceleration = Normal(Velocity) * AccelRate;
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

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
	local PlayerController PC;

	PlaySound(Sound'WeaponSounds.BaseImpactAndExplosions.BExplosion3',, 2.5000000 * TransientSoundVolume);
	// End:0x36
	if(TrailEmitter != none)
	{
		TrailEmitter.Kill();
		TrailEmitter = none;
	}
	// End:0x113
	if(EffectIsRelevant(Location, false))
	{
		Spawn(Class'XEffects.NewExplosionA',,, HitLocation + (HitNormal * float(16)), Rotator(HitNormal));
		PC = Level.GetLocalPlayerController();
		// End:0xD5
		if((PC.ViewTarget != none) && VSize(PC.ViewTarget.Location - Location) < float(5000))
		{
			Spawn(Class'XEffects.ExplosionCrap',,, HitLocation, Rotator(HitNormal));
		}
		// End:0x113
		if((ExplosionDecal != none) && int(Level.NetMode) != int(NM_DedicatedServer))
		{
			Spawn(ExplosionDecal, self,, Location, Rotator(-HitNormal));
		}
	}
	BlowUp(HitLocation + (HitNormal * 2.0000000));
	Destroy();
	//return;	
}

function BlowUp(Vector HitLocation)
{
	HurtRadius(Damage, DamageRadius, MyDamageType, MomentumTransfer, Location);
	MakeNoise(1.0000000);
	//return;	
}

defaultproperties
{
	TrailClass=Class'Onslaught.ONSAvrilSmokeTrail'
	AccelRate=2000.0000000
	Speed=2000.0000000
	MaxSpeed=4000.0000000
	Damage=100.0000000
	DamageRadius=150.0000000
	MomentumTransfer=50000.0000000
	MyDamageType=Class'Onslaught.DamTypeAttackCraftMissle'
	ExplosionDecal=Class'Onslaught.ONSRocketScorch'
	DrawType=8
	StaticMesh=StaticMesh'WeaponStaticMesh.RocketProj'
	AmbientSound=Sound'WeaponSounds.RocketLauncher.RocketLauncherProjectile'
	LifeSpan=10.0000000
	DrawScale=0.5000000
	AmbientGlow=32
	SoundVolume=255
	SoundRadius=100.0000000
	bFixedRotationDir=true
	RotationRate=(Pitch=0,Yaw=0,Roll=50000)
	DesiredRotation=(Pitch=0,Yaw=0,Roll=30000)
	ForceType=2
	ForceRadius=100.0000000
	ForceScale=5.0000000
}
