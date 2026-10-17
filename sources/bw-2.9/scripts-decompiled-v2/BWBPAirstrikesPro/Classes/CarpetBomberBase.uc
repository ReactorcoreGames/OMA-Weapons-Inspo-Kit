class CarpetBomberBase extends Actor
	notplaceable;

var() Vector BombOffset;
var Vector BombTargetCenter;
var float Speed;
var float MinSpeed;
var float BombRange;
var Class<Projectile> BombClass;
var int Health;
var byte Team;
var Controller DelayedDamageInstigatorController;
var bool bShotDown;
var float Damage;
var float DamageRadius;
var float MomentumTransfer;
var Class<DamageType> MyDamageType;
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
		BombTargetCenter;

	// Pos:0x018
	reliable if(bNetDirty && int(Role) == int(ROLE_Authority))
		bShotDown;
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
		Spawn(Class'OnslaughtFull.ONSAutoBomberWarpEffect',,,, Rotation + rot(0, 16384, 0));
		Level.GetLocalPlayerController().PlayStatusAnnouncement('Incoming_air', 0, true);
	}
	//return;	
}

function Bomb(Vector Target)
{
	BombTargetCenter = Target;
	SetRotation(Rotator(Target - Location));
	Velocity = Vector(Rotation) * ((((VSize(Location - BombTargetCenter) - BombRange) / float(100000)) * Speed) + MinSpeed);
	SetTimer(0.2500000, true);
	//return;	
}

simulated event HitWall(Vector HitNormal, Actor HitWall)
{
	// End:0x39
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		Spawn(Class'OnslaughtFull.ONSAutoBomberWarpEffect',,,, Rotation + rot(0, 16384, 0));
	}
	Destroy();
	//return;	
}

function Timer()
{
	local Controller C;
	local Projectile myBomb;
	local Vector NewVelocity, X, Y, Z;

	GetViewAxes(X, Y, Z);
	NewVelocity = (0.5000000 * Velocity) + ((FRand() * Y) * BombOffset.Y);
	// End:0x176
	if(FRand() < 0.5000000)
	{
		C = Level.ControllerList;
		J0x5E:

		// End:0x176 [Loop If]
		if(C != none)
		{
			// End:0x15F
			if(((((((AIController(C) != none) && C.Pawn != none) && C.GetTeamNum() != int(Team)) && AIController(C).Skill >= 5.0000000) && !C.Pawn.IsFiring()) && (C.Enemy == none) || !C.LineOfSightTo(C.Enemy)) && C.Pawn.CanAttack(self))
			{
				C.Focus = self;
				C.FireWeaponAt(self);
			}
			C = C.nextController;
			// [Loop Continue]
			goto J0x5E;
		}
	}
	// End:0x219
	if(VSize(Location - BombTargetCenter) < BombRange)
	{
		myBomb = Spawn(BombClass,,, Location - ((CollisionHeight + BombClass.default.CollisionHeight) * vect(0.0000000, 0.0000000, 2.0000000)), Rotator(vect(0.0000000, 0.0000000, -1.0000000)));
		CarpetBomberBomb(myBomb).Velocity += NewVelocity;
		Velocity = Normal(Velocity) * MinSpeed;
		Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
	}
	//return;	
}

simulated function Tick(float DeltaTime)
{
	local float TargetDist;

	TargetDist = VSize(Location - BombTargetCenter);
	// End:0x55
	if(TargetDist > BombRange)
	{
		Velocity = Vector(Rotation) * ((((TargetDist - BombRange) / float(100000)) * Speed) + MinSpeed);
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
	BombOffset=(X=0.0000000,Y=250.0000000,Z=0.0000000)
	Speed=10000.0000000
	MinSpeed=2000.0000000
	BombRange=7500.0000000
	BombClass=Class'BWBPAirstrikesPro.CarpetBomberBomb'
	Health=1500
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
	bAlwaysRelevant=true
	bUpdateSimulatedPosition=true
	Physics=4
	RemoteRole=2
	Mesh=SkeletalMesh'ONSFullAnimations.Bomber'
	CollisionRadius=200.0000000
	CollisionHeight=200.0000000
	bCollideActors=true
	bCollideWorld=true
	bBlockActors=true
	bBlockKarma=true
	bNetNotify=true
}
