class AIM9RocketBase extends AIM9RocketMissile;

var(Explosion) Sound ExplosionSound;
var(Explosion) float ExplosionCullDistance;
var(Explosion) Class<Emitter> Explosion;
var(Trail) Class<Emitter> SmokeTrailClass;
var(Trail) Class<Effects> CoronaClass;
var(Lock) Pawn LockTarget;
var(Lock) float WarnTargetInterval;
var(Lock) float LastWarnTargetTime;

event PostBeginPlay()
{
	SpawnTrail();
	Launch();
	super(Projectile).PostBeginPlay();
	//return;	
}

simulated event Tick(float DeltaTime)
{
	CheckHoming(DeltaTime);
	//return;	
}

event Destroyed()
{
	DestroyTrail();
	SpawnExplosion(Location, Rotation * float(-1));
	//return;	
}

function SpawnTrail()
{
	// End:0x7B
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		SmokeTrail = Spawn(SmokeTrailClass,,, Location - (float(15) * Vector(Rotation)));
		SmokeTrail.SetBase(self);
		Corona = Spawn(CoronaClass, self);
		// End:0x7B
		if(Level.bDropDetail)
		{
			bDynamicLight = false;
			LightType = 0;
		}
	}
	//return;	
}

function DestroyTrail()
{
	// End:0x2A
	if(SmokeTrail != none)
	{
		SmokeTrail.AmbientSound = none;
		SmokeTrail.Kill();
	}
	// End:0x41
	if(Corona != none)
	{
		Corona.Destroy();
	}
	//return;	
}

function SpawnExplosion(Vector HitLocation, Rotator HitNormal)
{
	local PlayerController PC;

	// End:0xBB
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		PlaySound(ExplosionSound,, TransientSoundVolume);
		// End:0xBB
		if(!bNoFX && EffectIsRelevant(Location, false))
		{
			PC = Level.GetLocalPlayerController();
			// End:0xBB
			if((PC.ViewTarget != none) && VSize(PC.ViewTarget.Location - Location) < ExplosionCullDistance)
			{
				Spawn(Explosion,,, HitLocation + (Vector(HitNormal) * float(16)), HitNormal);
			}
		}
	}
	//return;	
}

function Launch()
{
	Velocity = Vector(Rotation) * Speed;
	// End:0x32
	if(PhysicsVolume.bWaterVolume)
	{
		Velocity *= 0.6000000;
	}
	LastWarnTargetTime = Level.TimeSeconds;
	//return;	
}

function Accelerate(float DeltaTime)
{
	// End:0x30
	if(VSize(Velocity) <= MaxSpeed)
	{
		Acceleration += ((Normal(Velocity) * AccelerationAddPerSec) * DeltaTime);		
	}
	else
	{
		Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
	}
	//return;	
}

function OrientToVelocity()
{
	SetRotation(Rotator(Velocity));
	//return;	
}

function CheckHoming(float DeltaTime)
{
	local Actor Target;

	// End:0x48
	if(int(Role) == int(ROLE_Authority))
	{
		Target = GetTarget();
		// End:0x37
		if(Target != none)
		{
			home(Target, DeltaTime);
		}
		Accelerate(DeltaTime);
		OrientToVelocity();
	}
	//return;	
}

function Actor GetTarget()
{
	// End:0x17
	if(IsValidTarget(OverrideTarget))
	{
		return OverrideTarget;		
	}
	else
	{
		// End:0x2E
		if(IsValidTarget(LockTarget))
		{
			return LockTarget;			
		}
		else
		{
			return none;
		}
	}
	//return;	
}

function bool IsValidTarget(Actor Target)
{
	local bool bValid;

	// End:0x47
	if(Target != none)
	{
		// End:0x3F
		if(Pawn(Target) != none)
		{
			// End:0x3C
			if(Pawn(Target).Health > 0)
			{
				bValid = true;
			}			
		}
		else
		{
			bValid = true;
		}
	}
	return bValid;
	//return;	
}

simulated function home(Actor Target, float DeltaTime)
{
	local Vector HomingLocation, HomingDirection;

	HomingLocation = GetHomingLocation(Target);
	HomingDirection = HomingLocation - Location;
	Velocity = Normal(HomingDirection) * VSize(Velocity);
	//return;	
}

function Vector GetHomingLocation(Actor Target)
{
	return GetTargetLocation(Target);
	//return;	
}

function Vector GetTargetLocation(Actor Target)
{
	// End:0x28
	if(Pawn(Target) != none)
	{
		return Pawn(Target).GetTargetLocation();		
	}
	else
	{
		return Target.Location;
	}
	//return;	
}

function AlertTarget()
{
	// End:0x47
	if(((LockTarget != none) && LockTarget.Controller != none) && OverrideTarget != none)
	{
		LockTarget.Controller.ReceiveProjectileWarning(self);
	}
	// End:0x6C
	if(Vehicle(LockTarget) != none)
	{
		Vehicle(LockTarget).IncomingMissile(self);
	}
	AttractBotFire();
	//return;	
}

function AttractBotFire()
{
	local array<Vehicle> TargetPawns;
	local int i;

	// End:0x78
	if(Vehicle(LockTarget) != none)
	{
		TargetPawns = Vehicle(LockTarget).GetTurrets();
		TargetPawns[TargetPawns.Length] = Vehicle(LockTarget);
		i = 0;
		J0x48:

		// End:0x78 [Loop If]
		if(i < TargetPawns.Length)
		{
			TargetPawns[i].ShouldTargetMissile(self);
			i++;
			// [Loop Continue]
			goto J0x48;
		}
	}
	//return;	
}

function WarnTarget(Actor Target)
{
	// End:0x39
	if(Level.TimeSeconds > (LastWarnTargetTime + WarnTargetInterval))
	{
		AlertTarget();
		LastWarnTargetTime = Level.TimeSeconds;
	}
	//return;	
}

function CheckOverrideTargetProximity()
{
	//return;	
}

defaultproperties
{
	ExplosionSound=Sound'WeaponSounds.BaseImpactAndExplosions.BExplosion3'
	ExplosionCullDistance=65000.0000000
	Explosion=Class'BWBPAirstrikesPro.CarpetBombExplosion'
	SmokeTrailClass=Class'BWBPAirstrikesPro.AIM9MissileTrail'
	CoronaClass=Class'XEffects.RocketCorona'
	WarnTargetInterval=1.0000000
	MomentumTransfer=100000.0000000
	LifeSpan=30.0000000
	SoundRadius=256.0000000
	TransientSoundVolume=1.0000000
	TransientSoundRadius=500.0000000
}
