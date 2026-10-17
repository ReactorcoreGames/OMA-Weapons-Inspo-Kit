class GBU57Projectile extends AirstrikeProjectile;

var NewTracer SmokeTrail;
var ONSPowerNodeNeutral PowerNode;
var() Vector ShakeRotMag;
var() Vector ShakeRotRate;
var() float ShakeRotTime;
var() Vector ShakeOffsetMag;
var() Vector ShakeOffsetRate;
var() float ShakeOffsetTime;
var Vector DeformLocation;
var Class<Emitter> ExplosionEffectClass;
var byte Team;

replication
{
	// Pos:0x000
	reliable if(bTearOff && int(Role) == int(ROLE_Authority))
		DeformLocation;
}

simulated function Destroyed()
{
	// End:0x17
	if(SmokeTrail != none)
	{
		SmokeTrail.Destroy();
	}
	// End:0x31
	if(PowerNode != none)
	{
		PowerNode.PowerCoreDestroyed();
	}
	super(Actor).Destroyed();
	//return;	
}

function BeginPlay()
{
	super(Actor).BeginPlay();
	// End:0x28
	if(Instigator != none)
	{
		Team = byte(Instigator.GetTeamNum());
	}
	SetTimer(0.5000000, true);
	//return;	
}

simulated function PostBeginPlay()
{
	local Vector Dir;

	// End:0x18
	if(bDeleteMe || IsInState('Dying'))
	{
		return;
	}
	Dir = Vector(Rotation);
	Velocity = Speed * Dir;
	// End:0x84
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		SmokeTrail = Spawn(Class'XEffects.NewTracer', self,, Location - (float(40) * Dir), Rotation);
		SmokeTrail.SetBase(self);
	}
	super(Projectile).PostBeginPlay();
	//return;	
}

event bool EncroachingOn(Actor Other)
{
	// End:0x14
	if(Other.bWorldGeometry)
	{
		return true;
	}
	return false;
	//return;	
}

simulated function ProcessTouch(Actor Other, Vector HitLocation)
{
	// End:0x27
	if(Other != Instigator)
	{
		Explode(HitLocation, vect(0.0000000, 0.0000000, 1.0000000));
	}
	//return;	
}

simulated function PhysicsVolumeChange(PhysicsVolume Volume)
{
	//return;	
}

simulated function Landed(Vector HitNormal)
{
	Explode(Location + (ExploWallOut * HitNormal), HitNormal);
	//return;	
}

simulated function HitWall(Vector HitNormal, Actor Wall)
{
	Explode(Location + (ExploWallOut * HitNormal), HitNormal);
	//return;	
}

simulated event FellOutOfWorld(Actor.eKillZType KillType)
{
	BlowUp(Location);
	//return;	
}

function ShakeView()
{
	local Controller C;
	local PlayerController PC;
	local float dist, Scale;

	C = Level.ControllerList;
	J0x14:

	// End:0x11B [Loop If]
	if(C != none)
	{
		PC = PlayerController(C);
		// End:0x104
		if((PC != none) && PC.ViewTarget != none)
		{
			dist = VSize(Location - PC.ViewTarget.Location);
			// End:0x104
			if(dist < (DamageRadius * 2.0000000))
			{
				// End:0xA9
				if(dist < DamageRadius)
				{
					Scale = 1.0000000;					
				}
				else
				{
					Scale = ((DamageRadius * 2.0000000) - dist) / DamageRadius;
				}
				C.ShakeView(ShakeRotMag * Scale, ShakeRotRate, ShakeRotTime, ShakeOffsetMag * Scale, ShakeOffsetRate, ShakeOffsetTime);
			}
		}
		C = C.nextController;
		// [Loop Continue]
		goto J0x14;
	}
	//return;	
}

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
	local Emitter E;

	// End:0x44
	if(int(Role) == int(ROLE_Authority))
	{
		HurtRadius(Damage, DamageRadius, MyDamageType, MomentumTransfer, Location + vect(0.0000000, 0.0000000, 256.0000000));
		ShakeView();
	}
	PlaySound(Sound'WeaponSounds.Misc.redeemer_explosionsound');
	E = Spawn(ExplosionEffectClass,,, HitLocation - (float(100) * Normal(Velocity)), rot(0, 16384, 0));
	Spawn(Class'BWBPAirstrikesPro.GBU38Dirt',,, HitLocation + (HitNormal * float(16)), Rotator(HitNormal) + rot(-16384, 0, 0));
	// End:0xFD
	if((ExplosionDecal != none) && int(Level.NetMode) != int(NM_DedicatedServer))
	{
		Spawn(ExplosionDecal, self,, Location + vect(0.0000000, 0.0000000, 256.0000000), Rotator(-HitNormal));
	}
	MakeNoise(1.0000000);
	Destroy();
	//return;	
}

function Timer()
{
	local Controller C;

	C = Level.ControllerList;
	J0x14:

	// End:0x12C [Loop If]
	if(C != none)
	{
		// End:0x115
		if(((((((AIController(C) != none) && C.Pawn != none) && C.GetTeamNum() != int(Team)) && AIController(C).Skill >= 2.0000000) && !C.Pawn.IsFiring()) && (C.Enemy == none) || !C.LineOfSightTo(C.Enemy)) && C.Pawn.CanAttack(self))
		{
			C.Focus = self;
			C.FireWeaponAt(self);
		}
		C = C.nextController;
		// [Loop Continue]
		goto J0x14;
	}
	//return;	
}

simulated function HurtRadius(float DamageAmount, float DamageRadius, Class<DamageType> DamageType, float Momentum, Vector HitLocation)
{
	local Pawn Victims;
	local float damageScale, dist;
	local Vector Dir;

	// End:0x0B
	if(bHurtEntry)
	{
		return;
	}
	bHurtEntry = true;
	// End:0x21D
	foreach CollidingActors(Class'Engine.Pawn', Victims, DamageRadius, HitLocation)
	{
		// End:0x21C
		if((((Victims != self) && HurtWall != Victims) && int(Victims.Role) == int(ROLE_Authority)) && !Victims.IsA('FluidSurfaceInfo'))
		{
			Dir = Victims.Location - HitLocation;
			dist = FMax(1.0000000, VSize(Dir));
			Dir = Dir / dist;
			damageScale = 1.0000000 - FMax(0.0000000, (dist - Victims.CollisionRadius) / DamageRadius);
			// End:0x114
			if(!FastTrace(Victims.Location, Location))
			{
				damageScale *= 0.5000000;
			}
			// End:0x149
			if((Instigator == none) || Instigator.Controller == none)
			{
				Victims.SetDelayedDamageInstigatorController(InstigatorController);
			}
			Victims.TakeDamage(int(damageScale * DamageAmount), Instigator, Victims.Location - ((0.5000000 * (Victims.CollisionHeight + Victims.CollisionRadius)) * Dir), (damageScale * Momentum) * Dir, DamageType);
			// End:0x21C
			if((Vehicle(Victims) != none) && Vehicle(Victims).Health > 0)
			{
				Vehicle(Victims).DriverRadiusDamage(DamageAmount, DamageRadius, InstigatorController, DamageType, Momentum, HitLocation);
			}
		}		
	}	
	bHurtEntry = false;
	//return;	
}

defaultproperties
{
	ShakeRotMag=(X=0.0000000,Y=0.0000000,Z=250.0000000)
	ShakeRotRate=(X=0.0000000,Y=0.0000000,Z=2500.0000000)
	ShakeRotTime=6.0000000
	ShakeOffsetMag=(X=0.0000000,Y=0.0000000,Z=10.0000000)
	ShakeOffsetRate=(X=0.0000000,Y=0.0000000,Z=200.0000000)
	ShakeOffsetTime=10.0000000
	ExplosionEffectClass=Class'BWBPAirstrikesPro.GBU57Explosion'
	Team=255
	Speed=2000.0000000
	Damage=500.0000000
	DamageRadius=1536.0000000
	MomentumTransfer=1.0000000
	MyDamageType=Class'BWBPAirstrikesPro.DamTypeGBU57Bomb'
	ExplosionDecal=Class'BWBPAirstrikesPro.GBU57BlastMark'
	LightType=1
	LightEffect=21
	LightHue=28
	LightBrightness=255.0000000
	LightRadius=6.0000000
	DrawType=8
	StaticMesh=StaticMesh'WeaponStaticMesh.RedeemerMissile'
	bDynamicLight=true
	bNetTemporary=false
	AmbientSound=Sound'WeaponSounds.Misc.redeemer_flight'
	LifeSpan=50.0000000
	DrawScale=0.7500000
	AmbientGlow=96
	bUnlit=false
	SoundVolume=255
	SoundRadius=100.0000000
	TransientSoundVolume=1.0000000
	TransientSoundRadius=5000.0000000
	CollisionRadius=24.0000000
	CollisionHeight=12.0000000
	bProjTarget=true
	bNetNotify=true
	bFixedRotationDir=true
	RotationRate=(Pitch=0,Yaw=0,Roll=50000)
	DesiredRotation=(Pitch=0,Yaw=0,Roll=30000)
	ForceType=1
	ForceRadius=100.0000000
	ForceScale=5.0000000
}
