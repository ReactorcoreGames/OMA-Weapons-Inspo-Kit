class GBU38Projectile extends AirstrikeProjectile;

var NewTracer SmokeTrail;
var ONSPowerNodeNeutral PowerNode;
var() Vector ShakeRotMag;
var() Vector ShakeRotRate;
var() float ShakeRotTime;
var() Vector ShakeOffsetMag;
var() Vector ShakeOffsetRate;
var() float ShakeOffsetTime;
var() Vector speedconst;
var() bool alreadyexploded;
var Class<Emitter> ExplosionEffectClass;
var() Vector Target;
var byte Team;
var() Vector Velocity1;
var() float impacttime;
var() float speed2;
var() Vector startpos;

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
	startpos = Location;
	super(Actor).BeginPlay();
	// End:0x33
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

	Velocity1 = Velocity;
	// End:0x23
	if(bDeleteMe || IsInState('Dying'))
	{
		return;
	}
	SetPhysics(2);
	Dir = Vector(Rotation);
	// End:0x82
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

simulated event Tick(float dt)
{
	local float tangtargetdir, tangveldir, rotmult;
	local Vector tvector, vvector, TRot, tempvel, tloc;

	SetRotation(Rotator(Velocity));
	SetPhysics(2);
	vvector = Velocity;
	vvector = vvector / VSize(vvector);
	tangveldir = ((vvector.X * vvector.X) + (vvector.Y * vvector.Y)) / ((vvector.Z * vvector.Z) + float(1));
	Log("tangveldir");
	Log(string(tangveldir));
	impacttime = impacttime - dt;
	Log("impacttime");
	Log(string(impacttime));
	tvector = Target - Location;
	tvector = tvector / VSize(tvector);
	speed2 = (Velocity.X * Velocity.X) + (Velocity.Y * Velocity.Y);
	tangtargetdir = ((tvector.X * tvector.X) + (tvector.Y * tvector.Y)) / (tvector.Z * tvector.Z);
	Log("tangtargetdir");
	Log(string(tangtargetdir));
	// End:0x2F1
	if((tangtargetdir < 0.2200000) && tangtargetdir < tangveldir)
	{
		tloc = Location;
		Log("conditions met");
		tempvel = Velocity;
		TRot = tvector - vvector;
		tangveldir = Sqrt(tangveldir);
		Log("Trot");
		Log(string(TRot));
		rotmult = 40.0000000 / (Sqrt(((((Target.X - tloc.X) * (Target.X - tloc.X)) + ((Target.Y - tloc.Y) * (Target.Y - tloc.Y))) + Abs(impacttime)) / speed2) + float(1));
		Log("rotmult");
		Log(string(rotmult));
		Velocity = Velocity + (TRot * rotmult);
		Log("velocity");
		tempvel = Velocity;
		Log(string(Sqrt((tempvel.X * tempvel.X) + (tempvel.Y * tempvel.Y))));
	}
	super(Actor).Tick(dt);
	//return;	
}

simulated function ProcessTouch(Actor Other, Vector HitLocation)
{
	// End:0x46
	if((Other != Instigator) && alreadyexploded == false)
	{
		Log(string(Velocity));
		alreadyexploded = true;
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
	// End:0x3B
	if(alreadyexploded == false)
	{
		Log(string(Velocity));
		alreadyexploded = true;
		Explode(Location + (ExploWallOut * HitNormal), HitNormal);
	}
	//return;	
}

simulated function HitWall(Vector HitNormal, Actor Wall)
{
	// End:0x3B
	if(alreadyexploded == false)
	{
		Log(string(Velocity));
		alreadyexploded = true;
		Explode(Location + (ExploWallOut * HitNormal), HitNormal);
	}
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
	Spawn(Class'BWBPAirstrikesPro.GBU38Dirt',,, HitLocation + (HitNormal * float(16)), Rotator(HitNormal) + rot(-16384, 0, 0));
	// End:0xA2
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
	// End:0x20C
	foreach CollidingActors(Class'Engine.Actor', Victims, DamageRadius, HitLocation)
	{
		// End:0x20B
		if((((Victims != self) && HurtWall != Victims) && int(Victims.Role) == int(ROLE_Authority)) && !Victims.IsA('FluidSurfaceInfo'))
		{
			Dir = Victims.Location - HitLocation;
			dist = FMax(1.0000000, VSize(Dir));
			Dir = Dir / dist;
			damageScale = 1.0000000 - FMax(0.0000000, (dist - Victims.CollisionRadius) / DamageRadius);
			// End:0x122
			if((Instigator == none) || Instigator.Controller == none)
			{
				Victims.SetDelayedDamageInstigatorController(InstigatorController);
			}
			// End:0x138
			if(Victims == LastTouched)
			{
				LastTouched = none;
			}
			Victims.TakeDamage(int(damageScale * DamageAmount), Instigator, Victims.Location - ((0.5000000 * (Victims.CollisionHeight + Victims.CollisionRadius)) * Dir), (damageScale * Momentum) * Dir, DamageType);
			// End:0x20B
			if((Vehicle(Victims) != none) && Vehicle(Victims).Health > 0)
			{
				Vehicle(Victims).DriverRadiusDamage(DamageAmount, DamageRadius, InstigatorController, DamageType, Momentum, HitLocation);
			}
		}		
	}	
	// End:0x413
	if((((LastTouched != none) && LastTouched != self) && int(LastTouched.Role) == int(ROLE_Authority)) && !LastTouched.IsA('FluidSurfaceInfo'))
	{
		Victims = LastTouched;
		LastTouched = none;
		Dir = Victims.Location - HitLocation;
		dist = FMax(1.0000000, VSize(Dir));
		Dir = Dir / dist;
		damageScale = FMax(Victims.CollisionRadius / (Victims.CollisionRadius + Victims.CollisionHeight), 1.0000000 - FMax(0.0000000, (dist - Victims.CollisionRadius) / DamageRadius));
		// End:0x340
		if((Instigator == none) || Instigator.Controller == none)
		{
			Victims.SetDelayedDamageInstigatorController(InstigatorController);
		}
		Victims.TakeDamage(int(damageScale * DamageAmount), Instigator, Victims.Location - ((0.5000000 * (Victims.CollisionHeight + Victims.CollisionRadius)) * Dir), (damageScale * Momentum) * Dir, DamageType);
		// End:0x413
		if((Vehicle(Victims) != none) && Vehicle(Victims).Health > 0)
		{
			Vehicle(Victims).DriverRadiusDamage(DamageAmount, DamageRadius, InstigatorController, DamageType, Momentum, HitLocation);
		}
	}
	bHurtEntry = false;
	//return;	
}

simulated function DmgRadius(Vector Flash, float dmgPctHard, float dmgPctThru, float DamageAmount, float DamageRadius, Class<DamageType> DamageType, float Momentum, Vector HitLocation)
{
	local Actor Victims;
	local float damageScale, dist;
	local Vector Dir;

	// End:0x1D
	if(bHurtEntry || int(Role) != int(ROLE_Authority))
	{
		return;
	}
	// End:0xE2
	if(Instigator == none)
	{
		// End:0x4B
		if(Pawn(Owner) != none)
		{
			Instigator = Pawn(Owner);			
		}
		else
		{
			// End:0x9E
			if((Instigator.Controller != none) && Instigator.Controller.Pawn != none)
			{
				Instigator = Instigator.Controller.Pawn;				
			}
			else
			{
				// End:0xE2
				if((Controller(Owner) != none) && Controller(Owner).Pawn != none)
				{
					Instigator = Controller(Owner).Pawn;
				}
			}
		}
	}
	bHurtEntry = true;
	// End:0x32C
	foreach CollidingActors(Class'Engine.Actor', Victims, DamageRadius, HitLocation)
	{
		// End:0x32B
		if((((Victims != none) && Victims != self) && int(Victims.Role) == int(ROLE_Authority)) && !Victims.IsA('FluidSurfaceInfo'))
		{
			Dir = Victims.Location - HitLocation;
			dist = FMax(1.0000000, VSize(Dir));
			Dir = Dir / dist;
			damageScale = 1.0000000 - FMax(0.0000000, (dist - Victims.CollisionRadius) / DamageRadius);
			// End:0x1E7
			if(!FastTrace(Victims.Location, HitLocation))
			{
				damageScale *= dmgPctThru;
			}
			// End:0x205
			if(Pawn(Victims) != none)
			{
				damageScale = damageScale;				
			}
			else
			{
				damageScale *= dmgPctHard;
			}
			// End:0x32B
			if(Damage > float(0))
			{
				Victims.TakeDamage(int(damageScale * DamageAmount), Instigator, Victims.Location - ((0.5000000 * (Victims.CollisionHeight + Victims.CollisionRadius)) * Dir), (damageScale * Momentum) * Dir, DamageType);
				// End:0x32B
				if((((Pawn(Victims) != none) && Pawn(Victims).Controller != none) && PlayerController(Pawn(Victims).Controller) != none) && Flash != vect(0.0000000, 0.0000000, 0.0000000))
				{
					PlayerController(Pawn(Victims).Controller).ClientFlash(0.1000000, Flash * damageScale);
				}
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
		SetTimer(0.0000000, false);
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
	HurtRadius(Damage, DamageRadius * 0.1250000, MyDamageType, MomentumTransfer, Location);
	Sleep(0.1000000);
	HurtRadius(Damage, DamageRadius * 0.3000000, MyDamageType, MomentumTransfer, Location);
	Sleep(0.1000000);
	HurtRadius(Damage, DamageRadius * 0.4750000, MyDamageType, MomentumTransfer, Location);
	Sleep(0.1000000);
	HurtRadius(Damage, DamageRadius * 0.6500000, MyDamageType, MomentumTransfer, Location);
	Sleep(0.1000000);
	HurtRadius(Damage, DamageRadius * 0.8250000, MyDamageType, MomentumTransfer, Location);
	Sleep(0.1000000);
	HurtRadius(Damage, DamageRadius * 1.0000000, MyDamageType, MomentumTransfer, Location);
	Destroy();
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
	ExplosionEffectClass=Class'BWBPAirstrikesPro.GBU38Explosion'
	Team=255
	MaxSpeed=0.0000000
	Damage=200.0000000
	DamageRadius=2048.0000000
	MomentumTransfer=1.0000000
	MyDamageType=Class'BWBPAirstrikesPro.DamTypeGBU38Bomb'
	ExplosionDecal=Class'BWBPAirstrikesPro.GBU38BlastMark'
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
	LifeSpan=80.0000000
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
	RotationRate=(Pitch=0,Yaw=0,Roll=500000)
	DesiredRotation=(Pitch=0,Yaw=0,Roll=300000)
}
