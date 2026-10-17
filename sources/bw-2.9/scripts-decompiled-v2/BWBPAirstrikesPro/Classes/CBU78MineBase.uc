class CBU78MineBase extends AirstrikeProjectile;

var bool bCanHitOwner;
var xEmitter Trail;
var() float DampenFactor;
var() float DampenFactorParallel;
var Class<xEmitter> HitEffectClass;
var float LastSparkTime;
var Actor IgnoreActor;
var byte Team;
var Emitter Beacon;

replication
{
	// Pos:0x000
	reliable if(bNetDirty && int(Role) == int(ROLE_Authority))
		IgnoreActor, Team;
}

simulated function Destroyed()
{
	// End:0x1C
	if(Trail != none)
	{
		Trail.mRegen = false;
	}
	// End:0x87
	if(!bNoFX)
	{
		// End:0x72
		if(EffectIsRelevant(Location, false))
		{
			Spawn(Class'BWBPAirstrikesPro.MineExplosion',,, Location, Rotator(vect(-16384.0000000, 0.0000000, 0.0000000)));
			Spawn(ExplosionDecal, self,, Location, Rotator(vect(0.0000000, 0.0000000, -1.0000000)));
		}
		PlaySound(Sound'WeaponSounds.BaseImpactAndExplosions.BExplosion3',, 2.5000000 * TransientSoundVolume);
	}
	// End:0xAC
	if(ONSGrenadeLauncher(Owner) != none)
	{
		ONSGrenadeLauncher(Owner).CurrentGrenades--;
	}
	// End:0xC3
	if(Beacon != none)
	{
		Beacon.Destroy();
	}
	super(Actor).Destroyed();
	//return;	
}

simulated function PostBeginPlay()
{
	local PlayerController PC;

	super(Projectile).PostBeginPlay();
	// End:0x90
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		PC = Level.GetLocalPlayerController();
		// End:0x90
		if((PC.ViewTarget != none) && VSize(PC.ViewTarget.Location - Location) < float(5500))
		{
			Trail = Spawn(Class'XEffects.GrenadeSmokeTrail', self,, Location, Rotation);
		}
	}
	Velocity = Speed * Vector(Rotation);
	RandSpin(25000.0000000);
	// End:0xD3
	if(PhysicsVolume.bWaterVolume)
	{
		Velocity = 0.6000000 * Velocity;
	}
	// End:0x107
	if((int(Role) == int(ROLE_Authority)) && Instigator != none)
	{
		Team = byte(Instigator.GetTeamNum());
	}
	//return;	
}

simulated function PostNetBeginPlay()
{
	// End:0x5F
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		// End:0x38
		if(int(Team) == 1)
		{
			Beacon = Spawn(Class'Onslaught.ONSGrenadeBeaconBlue', self);			
		}
		else
		{
			Beacon = Spawn(Class'Onslaught.ONSGrenadeBeaconRed', self);
		}
		// End:0x5F
		if(Beacon != none)
		{
			Beacon.SetBase(self);
		}
	}
	super(Actor).PostNetBeginPlay();
	//return;	
}

simulated function Landed(Vector HitNormal)
{
	HitWall(HitNormal, none);
	//return;	
}

simulated function ProcessTouch(Actor Other, Vector HitLocation)
{
	// End:0x85
	if(((!bPendingDelete && Base == none) && Other != IgnoreActor) && (!Other.bWorldGeometry && Other.Class != Class) && (Other != Instigator) || bCanHitOwner)
	{
		Stick(Other, HitLocation);
	}
	//return;	
}

simulated function HitWall(Vector HitNormal, Actor Wall)
{
	local Vector VNorm;
	local PlayerController PC;

	// End:0x1D
	if(Vehicle(Wall) != none)
	{
		Touch(Wall);
		return;
	}
	VNorm = (Velocity Dot HitNormal) * HitNormal;
	Velocity = (-VNorm * DampenFactor) + ((Velocity - VNorm) * DampenFactorParallel);
	RandSpin(100000.0000000);
	Speed = VSize(Velocity);
	// End:0xB1
	if(Speed < float(40))
	{
		bBounce = false;
		SetPhysics(0);
		// End:0xAE
		if(Trail != none)
		{
			Trail.mRegen = false;
		}		
	}
	else
	{
		// End:0xE4
		if((int(Level.NetMode) != int(NM_DedicatedServer)) && Speed > float(250))
		{
			PlaySound(ImpactSound, 1);
		}
		// End:0x1C6
		if(((!Level.bDropDetail && int(Level.DetailMode) != int(0)) && (Level.TimeSeconds - LastSparkTime) > 0.5000000) && EffectIsRelevant(Location, false))
		{
			PC = Level.GetLocalPlayerController();
			// End:0x1B2
			if((PC.ViewTarget != none) && VSize(PC.ViewTarget.Location - Location) < float(2000))
			{
				Spawn(HitEffectClass,,, Location, Rotator(HitNormal));
			}
			LastSparkTime = Level.TimeSeconds;
		}
	}
	//return;	
}

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
	LastTouched = Base;
	BlowUp(HitLocation);
	Destroy();
	//return;	
}

simulated function TakeDamage(int Damage, Pawn EventInstigator, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType)
{
	local Actor A;

	// End:0x94
	if(Damage > 0)
	{
		// End:0x4E
		if((Base != none) && DamageType != MyDamageType)
		{
			// End:0x4B
			if((EventInstigator == none) || EventInstigator != Instigator)
			{
				UnStick();
				return;
			}			
		}
		else
		{
			// End:0x7C
			if(IgnoreActor != none)
			{
				// End:0x7B
				foreach VisibleCollidingActors(IgnoreActor.Class, A, DamageRadius)
				{					
					return;					
				}				
			}
		}
		Explode(Location, vect(0.0000000, 0.0000000, 1.0000000));
	}
	//return;	
}

simulated function Stick(Actor HitActor, Vector HitLocation)
{
	// End:0x1C
	if(Trail != none)
	{
		Trail.mRegen = false;
	}
	bBounce = false;
	LastTouched = HitActor;
	SetPhysics(0);
	SetBase(HitActor);
	// End:0x4F
	if(Base == none)
	{
		UnStick();
		return;
	}
	bCollideWorld = false;
	bProjTarget = true;
	PlaySound(Sound'MenuSounds.select3',, 2.5000000 * TransientSoundVolume);
	//return;	
}

simulated function UnStick()
{
	Velocity = vect(0.0000000, 0.0000000, 0.0000000);
	IgnoreActor = Base;
	SetBase(none);
	SetPhysics(2);
	bCollideWorld = true;
	bProjTarget = false;
	LastTouched = none;
	//return;	
}

simulated function BaseChange()
{
	// End:0x30
	if((!bPendingDelete && int(Physics) == int(0)) && Base == none)
	{
		UnStick();
	}
	//return;	
}

simulated function PawnBaseDied()
{
	Explode(Location, vect(0.0000000, 0.0000000, 1.0000000));
	//return;	
}

defaultproperties
{
	DampenFactor=0.5000000
	DampenFactorParallel=0.8000000
	HitEffectClass=Class'XEffects.WallSparks'
	Speed=1200.0000000
	MaxSpeed=1200.0000000
	TossZ=0.0000000
	bSwitchToZeroCollision=true
	Damage=100.0000000
	DamageRadius=175.0000000
	MomentumTransfer=50000.0000000
	MyDamageType=Class'Onslaught.DamTypeONSGrenade'
	ImpactSound=ProceduralSound'WeaponSounds.PGrenFloor1.P1GrenFloor1'
	ExplosionDecal=Class'Onslaught.ONSRocketScorch'
	DrawType=8
	StaticMesh=StaticMesh'VMWeaponsSM.PlayerWeaponsGroup.VMGrenade'
	CullDistance=5000.0000000
	bNetTemporary=false
	bOnlyDirtyReplication=true
	Physics=2
	LifeSpan=0.0000000
	DrawScale=0.0750000
	AmbientGlow=100
	bHardAttach=true
	CollisionRadius=1.0000000
	CollisionHeight=1.0000000
	bProjTarget=true
	bUseCollisionStaticMesh=true
	bBounce=true
	bFixedRotationDir=true
	DesiredRotation=(Pitch=12000,Yaw=5666,Roll=2334)
}
