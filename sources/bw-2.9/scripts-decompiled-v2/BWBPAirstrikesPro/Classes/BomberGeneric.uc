class BomberGeneric extends Actor
	notplaceable;

var() float BombInterval;
var() Vector BombOffset;
var() Class<Emitter> WarpEffectClass;
var Vector BombTargetCenter;
var float Speed;
var float BombRange;
var Class<Projectile> BombClass;
var int Health;
var byte Team;
var Controller DelayedDamageInstigatorController;
var bool bShotDown;
var bool bEntryEffect;
var float Damage;
var float DamageRadius;
var float MomentumTransfer;
var Class<DamageType> MyDamageType;
var bool bInitialized;
var() Vector ShakeRotMag;
var() Vector ShakeRotRate;
var() float ShakeRotTime;
var() Vector ShakeOffsetMag;
var() Vector ShakeOffsetRate;
var() float ShakeOffsetTime;
var Class<Emitter> DyingEffectClass;
var Emitter DyingEffect;

replication
{
	// Pos:0x000
	reliable if(bNetInitial && int(Role) == int(ROLE_Authority))
		BombRange, BombTargetCenter, 
		Speed;

	// Pos:0x018
	reliable if(bNetDirty && int(Role) == int(ROLE_Authority))
		bShotDown;
}

simulated function PostBeginPlay()
{
	super.PostBeginPlay();
	// End:0x3A
	if((int(Role) == int(ROLE_Authority)) && Instigator != none)
	{
		Team = byte(Instigator.GetTeamNum());
	}
	// End:0x94
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		Spawn(Class'XEffects.NewTracer',,,, Rotation + rot(0, 16384, 0));
		Level.GetLocalPlayerController().PlayStatusAnnouncement('Incoming_air', 0, true);
	}
	//return;	
}

function Touch(Actor Other)
{
	// End:0x84
	if(Vehicle(Other) != none)
	{
		Vehicle(Other).TakeDamage(Vehicle(Other).Health, none, Other.Location, vect(0.0000000, 0.0000000, 0.0000000), Class'Onslaught.DamTypeONSVehicle');
		TakeDamage(Health, Pawn(Other), Location, vect(0.0000000, 0.0000000, 0.0000000), Class'Onslaught.DamTypeONSVehicle');
	}
	//return;	
}

function Bump(Actor Other)
{
	Touch(Other);
	//return;	
}

function SetDelayedDamageInstigatorController(Controller C)
{
	DelayedDamageInstigatorController = C;
	//return;	
}

function TakeDamage(int Damage, Pawn EventInstigator, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType)
{
	local Controller InstigatorController;

	// End:0x22
	if(EventInstigator != none)
	{
		InstigatorController = EventInstigator.Controller;		
	}
	else
	{
		InstigatorController = DelayedDamageInstigatorController;
	}
	// End:0x57
	if((InstigatorController == none) || InstigatorController.GetTeamNum() == int(Team))
	{
		return;
	}
	Health -= Damage;
	// End:0x75
	if(Health <= 0)
	{
		GotoState('ShotDown');
	}
	//return;	
}

function Initialize(Vector Target, StrikeInfoStruct SI)
{
	BombTargetCenter = Target;
	Speed = SI.BomberSpeed;
	BombRange = SI.BombRange;
	BombClass = SI.BombClass;
	BombInterval = SI.BombInterval;
	BombOffset = SI.BombOffset;
	SetRotation(Rotator(Target - Location));
	// End:0x94
	if(VSize(Target - Location) < (float(3) * Speed))
	{
		GotoState('Pending');		
	}
	else
	{
		bHidden = false;
		Velocity = Vector(Rotation) * Speed;
		SetTimer((VSize(BombTargetCenter - Location) - BombRange) / Speed, false);
	}
	//return;	
}

simulated event HitWall(Vector HitNormal, Actor HitWall)
{
	// End:0x39
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		Spawn(WarpEffectClass,,,, Rotation + rot(0, 16384, 0));
	}
	Destroy();
	//return;	
}

function Timer()
{
	GotoState('Attacking');
	//return;	
}

function Tick(float DeltaTime)
{
	// End:0x5B
	if(((int(Level.NetMode) != int(NM_DedicatedServer)) && !bHidden) && !bEntryEffect)
	{
		Spawn(WarpEffectClass,,,, Rotation + rot(0, 16384, 0));
		bEntryEffect = true;
	}
	//return;	
}

simulated function PostNetReceive()
{
	// End:0x10
	if(bShotDown)
	{
		GotoState('ShotDown');
	}
	//return;	
}

simulated function Destroyed()
{
	// End:0x1A
	if(DyingEffect != none)
	{
		DyingEffect.Kill();
	}
	//return;	
}

function bool IsStationary()
{
	return false;
	//return;	
}

simulated function GetViewAxes(out Vector XAxis, out Vector YAxis, out Vector ZAxis)
{
	GetAxes(Rotation, XAxis, YAxis, ZAxis);
	//return;	
}

state Pending
{
	simulated function Tick(float DeltaTime)
	{
		//return;		
	}
Begin:

	Velocity = Vector(Rotation) * float(10);
	Sleep(((3.0000000 * Speed) - VSize(BombTargetCenter - Location)) / Speed);
	bHidden = false;
	Velocity = Vector(Rotation) * Speed;
	SetTimer((VSize(BombTargetCenter - Location) - BombRange) / Speed, false);
	GotoState('None');
	stop;				
}

state Attacking
{
	function Bomb()
	{
		local Controller C;
		local Projectile myBomb;
		local Vector NewVelocity, X, Y, Z;

		GetViewAxes(X, Y, Z);
		NewVelocity = (FRand() * Y) * BombOffset.Y;
		// End:0x168
		if(FRand() < 0.5000000)
		{
			C = Level.ControllerList;
			J0x50:

			// End:0x168 [Loop If]
			if(C != none)
			{
				// End:0x151
				if(((((((AIController(C) != none) && C.Pawn != none) && C.GetTeamNum() != int(Team)) && AIController(C).Skill >= 5.0000000) && !C.Pawn.IsFiring()) && (C.Enemy == none) || !C.LineOfSightTo(C.Enemy)) && C.Pawn.CanAttack(self))
				{
					C.Focus = self;
					C.FireWeaponAt(self);
				}
				C = C.nextController;
				// [Loop Continue]
				goto J0x50;
			}
		}
		myBomb = Spawn(BombClass,,, Location - ((CollisionHeight + BombClass.default.CollisionHeight) * vect(0.0000000, 0.0000000, 2.0000000)), Rotator(vect(0.0000000, 0.0000000, -1.0000000)));
		//return;		
	}

	function BeginState()
	{
		Bomb();
		// End:0x1D
		if(BombInterval == float(0))
		{
			GotoState('None');			
		}
		else
		{
			SetTimer(BombInterval, true);
		}
		//return;		
	}

	function Timer()
	{
		Bomb();
		// End:0x4D
		if((VSize(Location - BombTargetCenter) > BombRange) && (Vector(Rotation) Dot (BombTargetCenter - Location)) < float(0))
		{
			SetTimer(0.0000000, false);
			GotoState('None');
		}
		//return;		
	}
	stop;	
}

state ShotDown
{
	simulated function BeginState()
	{
		bShotDown = true;
		bNetNotify = false;
		SetPhysics(2);
		// End:0x55
		if(int(Level.NetMode) != int(NM_DedicatedServer))
		{
			DyingEffect = Spawn(DyingEffectClass, self);
			// End:0x55
			if(DyingEffect != none)
			{
				DyingEffect.SetBase(self);
			}
		}
		//return;		
	}

	simulated function HitWall(Vector HitNormal, Actor HitWall)
	{
		Landed(HitNormal);
		//return;		
	}

	simulated function Landed(Vector HitNormal)
	{
		GotoState('BlowingUp');
		//return;		
	}

	simulated function Tick(float DeltaTime)
	{
		SetRotation(Rotator(Velocity));
		//return;		
	}

	function Timer()
	{
		//return;		
	}

	function TakeDamage(int Damage, Pawn EventInstigator, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType)
	{
		//return;		
	}
	stop;	
}

state BlowingUp extends ShotDown
{
	simulated function Landed(Vector HitNormal)
	{
		//return;		
	}

	simulated function BeginState()
	{
		local PlayerController PC;
		local float dist, Scale;

		InitialState = 'BlowingUp';
		// End:0x63
		if(int(Level.NetMode) != int(NM_DedicatedServer))
		{
			Spawn(Class'BWBPAirstrikesPro.MK77Projectile',,, Location - (float(100) * Normal(Velocity)), rot(0, 16384, 0));
			Spawn(Class'XEffects.IonCore',,, Location, Rotation);
		}
		MakeNoise(1.0000000);
		bHidden = true;
		SetPhysics(0);
		SetCollision(false, false, false);
		PC = Level.GetLocalPlayerController();
		// End:0x168
		if((PC != none) && PC.ViewTarget != none)
		{
			dist = VSize(Location - PC.ViewTarget.Location);
			// End:0x168
			if(dist < (DamageRadius * 2.0000000))
			{
				// End:0x10D
				if(dist < DamageRadius)
				{
					Scale = 1.0000000;					
				}
				else
				{
					Scale = ((DamageRadius * 2.0000000) - dist) / DamageRadius;
				}
				PC.ShakeView(ShakeRotMag * Scale, ShakeRotRate, ShakeRotTime, ShakeOffsetMag * Scale, ShakeOffsetRate, ShakeOffsetTime);
			}
		}
		//return;		
	}
Begin:

	PlaySound(Sound'WeaponSounds.Misc.redeemer_explosionsound');
	HurtRadius(Damage, DamageRadius * 0.1250000, MyDamageType, MomentumTransfer, Location);
	Sleep(0.5000000);
	HurtRadius(Damage, DamageRadius * 0.3000000, MyDamageType, MomentumTransfer, Location);
	Sleep(0.2000000);
	HurtRadius(Damage, DamageRadius * 0.4750000, MyDamageType, MomentumTransfer, Location);
	Sleep(0.2000000);
	HurtRadius(Damage, DamageRadius * 0.6500000, MyDamageType, MomentumTransfer, Location);
	Sleep(0.2000000);
	HurtRadius(Damage, DamageRadius * 0.8250000, MyDamageType, MomentumTransfer, Location);
	Sleep(0.2000000);
	HurtRadius(Damage, DamageRadius * 1.0000000, MyDamageType, MomentumTransfer, Location);
	Destroy();
	stop;					
}

defaultproperties
{
	BombInterval=0.0200000
	WarpEffectClass=Class'OnslaughtFull.ONSAutoBomberWarpEffect'
	Speed=1.0000000
	BombRange=160.0000000
	Health=5000
	Team=255
	Damage=250.0000000
	DamageRadius=2000.0000000
	MomentumTransfer=200000.0000000
	MyDamageType=Class'XWeapons.DamTypeRedeemer'
	ShakeRotMag=(X=0.0000000,Y=0.0000000,Z=250.0000000)
	ShakeRotRate=(X=0.0000000,Y=0.0000000,Z=2500.0000000)
	ShakeRotTime=6.0000000
	ShakeOffsetMag=(X=0.0000000,Y=0.0000000,Z=10.0000000)
	ShakeOffsetRate=(X=0.0000000,Y=0.0000000,Z=200.0000000)
	ShakeOffsetTime=10.0000000
	DyingEffectClass=Class'OnslaughtFull.ONSAutoBomberDeathFlames'
	DrawType=2
	bHidden=true
	bAlwaysRelevant=true
	bUpdateSimulatedPosition=true
	Physics=4
	RemoteRole=2
	Mesh=SkeletalMesh'ONSFullAnimations.Bomber'
	CollisionRadius=200.0000000
	CollisionHeight=75.0000000
	bCollideActors=true
	bCollideWorld=true
	bBlockActors=true
	bBlockKarma=true
	bNetNotify=true
}
