class MK77Projectile extends AirstrikeProjectile;

const MaxZDist = 512;

var W54SmokeTrail SmokeTrail;
var ONSPowerNodeNeutral PowerNode;
var() Vector ShakeRotMag;
var() Vector ShakeRotRate;
var() float ShakeRotTime;
var() Vector ShakeOffsetMag;
var() Vector ShakeOffsetRate;
var() float ShakeOffsetTime;
var() float NDamage;
var Class<Emitter> ExplosionEffectClass;
var float ExploStart;
var byte Team;

simulated function Destroyed()
{
	// End:0x17
	if(SmokeTrail != none)
	{
		SmokeTrail.Destroy();
	}
	PowerNode.PowerCoreDestroyed();
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
		SmokeTrail = Spawn(Class'BWBPAirstrikesPro.W54SmokeTrail', self,, Location - (float(40) * Dir), Rotation);
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

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType)
{
	// End:0xF9
	if((Damage > 150000) && ((((instigatedBy == none) || instigatedBy.Controller == none) || Instigator == none) || Instigator.Controller == none) || !instigatedBy.Controller.SameTeamAs(Instigator.Controller))
	{
		// End:0xC0
		if(((instigatedBy == none) || DamageType.default.bVehicleHit) || DamageType == Class'Engine.Crushed')
		{
			BlowUp(Location);			
		}
		else
		{
			Spawn(Class'XEffects.SmallRedeemerExplosion');
			SetCollision(false, false, false);
			HurtRadius(float(Damage), DamageRadius * 0.1250000, MyDamageType, MomentumTransfer, Location);
			Destroy();
		}
	}
	//return;	
}

simulated event FellOutOfWorld(Actor.eKillZType KillType)
{
	BlowUp(Location);
	//return;	
}

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
	local Emitter E;

	E = Spawn(ExplosionEffectClass,,, HitLocation - (float(100) * Normal(Velocity)), rot(0, 16384, 0));
	// End:0x6F
	if((ExplosionDecal != none) && int(Level.NetMode) != int(NM_DedicatedServer))
	{
		Spawn(ExplosionDecal, self,, Location, Rotator(-HitNormal));
	}
	MakeNoise(1.0000000);
	SetPhysics(0);
	bHidden = true;
	GotoState('Dying');
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
	local Actor Victims;
	local float damageScale, dist;
	local Vector Dir;

	// End:0x0B
	if(bHurtEntry)
	{
		return;
	}
	bHurtEntry = true;
	// End:0x20E
	foreach CollidingActors(Class'Engine.Actor', Victims, DamageRadius, HitLocation)
	{
		// End:0x20D
		if((((Victims != self) && HurtWall != Victims) && int(Victims.Role) == int(ROLE_Authority)) && !Victims.IsA('FluidSurfaceInfo'))
		{
			Dir = Victims.Location - HitLocation;
			dist = FMax(1.0000000, VSize(Dir));
			Dir = Dir / dist;
			damageScale = 1.0000000;
			// End:0xEF
			if(!FastTrace(Victims.Location, Location))
			{
				damageScale *= 0.3000000;
			}
			// End:0x124
			if((Instigator == none) || Instigator.Controller == none)
			{
				Victims.SetDelayedDamageInstigatorController(InstigatorController);
			}
			// End:0x13A
			if(Victims == LastTouched)
			{
				LastTouched = none;
			}
			Victims.TakeDamage(int(damageScale * DamageAmount), Instigator, Victims.Location - ((0.5000000 * (Victims.CollisionHeight + Victims.CollisionRadius)) * Dir), (damageScale * Momentum) * Dir, DamageType);
			// End:0x20D
			if((Vehicle(Victims) != none) && Vehicle(Victims).Health > 0)
			{
				Vehicle(Victims).DriverRadiusDamage(DamageAmount, DamageRadius, InstigatorController, DamageType, Momentum, HitLocation);
			}
		}		
	}	
	bHurtEntry = false;
	//return;	
}

function NapalmRadius(float DamageAmount, float DamageRadius, Class<DamageType> DamageType, float Momentum, Vector HitLocation)
{
	local Actor Victims;
	local float damageScale, dist;
	local Vector Dir;

	// End:0x0B
	if(bHurtEntry)
	{
		return;
	}
	bHurtEntry = true;
	// End:0x24F
	foreach CollidingActors(Class'Engine.Actor', Victims, DamageRadius, HitLocation)
	{
		// End:0x24E
		if((((Victims != self) && HurtWall != Victims) && int(Victims.Role) == int(ROLE_Authority)) && !Victims.IsA('FluidSurfaceInfo'))
		{
			Dir = Victims.Location - HitLocation;
			// End:0xB3
			if(Abs(Dir.Z) > float(512))
			{
				continue;				
			}
			dist = FMax(1.0000000, VSize(Dir));
			Dir = Dir / dist;
			damageScale = 1.0000000 - FMax(0.0000000, (dist - Victims.CollisionRadius) / DamageRadius);
			// End:0x130
			if(!FastTrace(Victims.Location, Location))
			{
				damageScale *= 0.3000000;
			}
			// End:0x165
			if((Instigator == none) || Instigator.Controller == none)
			{
				Victims.SetDelayedDamageInstigatorController(InstigatorController);
			}
			// End:0x17B
			if(Victims == LastTouched)
			{
				LastTouched = none;
			}
			Victims.TakeDamage(int(damageScale * DamageAmount), Instigator, Victims.Location - ((0.5000000 * (Victims.CollisionHeight + Victims.CollisionRadius)) * Dir), (damageScale * Momentum) * Dir, DamageType);
			// End:0x24E
			if((Vehicle(Victims) != none) && Vehicle(Victims).Health > 0)
			{
				Vehicle(Victims).DriverRadiusDamage(DamageAmount, DamageRadius, InstigatorController, DamageType, Momentum, HitLocation);
			}
		}		
	}	
	bHurtEntry = false;
	//return;	
}

state Dying
{
	function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType)
	{
		//return;		
	}

	function Timer()
	{
		NapalmRadius(NDamage, DamageRadius, MyDamageType, MomentumTransfer, Location);
		// End:0x49
		if((Level.TimeSeconds - ExploStart) > float(16))
		{
			SetTimer(0.0000000, false);
			Destroy();
		}
		//return;		
	}

	function BeginState()
	{
		bHidden = true;
		SetPhysics(0);
		SetCollision(false, false, false);
		Spawn(Class'XEffects.IonCore',,, Location, Rotation);
		ShakeView();
		InitialState = 'Dying';
		// End:0x52
		if(SmokeTrail != none)
		{
			SmokeTrail.Kill();
		}
		SetTimer(0.5000000, true);
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
Begin:

	PlaySound(Sound'WeaponSounds.Misc.redeemer_explosionsound');
	HurtRadius(Damage, DamageRadius, MyDamageType, MomentumTransfer, Location);
	stop;					
}

defaultproperties
{
	ShakeRotMag=(X=0.0000000,Y=0.0000000,Z=250.0000000)
	ShakeRotRate=(X=0.0000000,Y=0.0000000,Z=2500.0000000)
	ShakeRotTime=6.0000000
	ShakeOffsetMag=(X=0.0000000,Y=0.0000000,Z=10.0000000)
	ShakeOffsetRate=(X=0.0000000,Y=0.0000000,Z=200.0000000)
	ShakeOffsetTime=10.0000000
	NDamage=80.0000000
	ExplosionEffectClass=Class'BWBPAirstrikesPro.MK77Explosion'
	Team=255
	Speed=3500.0000000
	MaxSpeed=3500.0000000
	Damage=200.0000000
	DamageRadius=2500.0000000
	MomentumTransfer=1.0000000
	MyDamageType=Class'BWBPAirstrikesPro.DamTypeMK77Bomb'
	ExplosionDecal=Class'BWBPAirstrikesPro.MK77BlastMark'
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
	DrawScale=0.5000000
	AmbientGlow=96
	bUnlit=false
	SoundVolume=255
	SoundRadius=100.0000000
	TransientSoundVolume=1.0000000
	TransientSoundRadius=5000.0000000
	CollisionRadius=24.0000000
	CollisionHeight=12.0000000
	bProjTarget=true
	bFixedRotationDir=true
	RotationRate=(Pitch=0,Yaw=0,Roll=50000)
	DesiredRotation=(Pitch=0,Yaw=0,Roll=30000)
	ForceType=1
	ForceRadius=100.0000000
	ForceScale=5.0000000
}
