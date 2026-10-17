class ONSRVWebProjectile extends Projectile
	native
	nativereplication;

var Class<Emitter> ProjectileEffectClass;
var Emitter ProjectileEffect;
var ONSRVWebProjectileLeader Leader;
var int ProjNumber;
var float LastTickTime;
var bool bBeingSucked;
var Actor StuckActor;
var Vector StuckNormal;
var() int BeamSubEmitterIndex;
var() float ExplodeDelay;
var() Sound StuckSound;
var() Class<Actor> ExplodeEffect;
var() Sound ExplodeSound;
var() Class<Actor> ExtraDamageClass;
var() float ExtraDamageMultiplier;

replication
{
	// Pos:0x000
	reliable if(bNetInitial && int(Role) == int(ROLE_Authority))
		Leader, ProjNumber;
}

simulated function Destroyed()
{
	// End:0x17
	if(ProjectileEffect != none)
	{
		ProjectileEffect.Destroy();
	}
	// End:0x6C
	if((int(Level.NetMode) != int(NM_DedicatedServer)) && EffectIsRelevant(Location, false))
	{
		Spawn(ExplodeEffect,,, Location, Rotator(StuckNormal));
		PlaySound(ExplodeSound,, 2.5000000 * TransientSoundVolume);
	}
	super(Actor).Destroyed();
	//return;	
}

simulated function PostBeginPlay()
{
	super.PostBeginPlay();
	Velocity = Speed * Vector(Rotation);
	// End:0x5A
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		ProjectileEffect = Spawn(ProjectileEffectClass, self,, Location, Rotation);
		ProjectileEffect.SetBase(self);
	}
	// End:0xDB
	if(int(Role) < int(ROLE_Authority))
	{
		// End:0xD3
		if((Leader != none) && ProjNumber != -1)
		{
			// End:0xBA
			if(Leader.Projectiles.Length < (ProjNumber + 1))
			{
				Leader.Projectiles.Length = ProjNumber + 1;
			}
			Leader.Projectiles[ProjNumber] = self;			
		}
		else
		{
			bNetNotify = true;
		}
	}
	//return;	
}

simulated event PostNetReceive()
{
	// End:0x6E
	if((Leader != none) && ProjNumber != -1)
	{
		// End:0x50
		if(Leader.Projectiles.Length < (ProjNumber + 1))
		{
			Leader.Projectiles.Length = ProjNumber + 1;
		}
		Leader.Projectiles[ProjNumber] = self;
		bNetNotify = false;
	}
	//return;	
}

simulated function ProcessTouch(Actor Other, Vector HitLocation)
{
	// End:0x42
	if((Other == Instigator) || (Vehicle(Instigator) != none) && Other == Vehicle(Instigator).Driver)
	{
		return;
	}
	// End:0x99
	if(Other.IsA('Projectile') || Other.bBlockProjectiles)
	{
		// End:0x96
		if((int(Role) == int(ROLE_Authority)) && Leader != none)
		{
			Leader.DetonateWeb();
		}		
	}
	else
	{
		StuckActor = Other;
		// End:0x16E
		if(((((int(Level.NetMode) != int(NM_Client)) && StuckActor != none) && ClassIsChildOf(StuckActor.Class, ExtraDamageClass)) && Bot(Pawn(StuckActor).Controller) != none) && Level.Game.GameDifficulty > (float(4) + (float(2) * FRand())))
		{
			Vehicle(StuckActor).VehicleLostTime = Level.TimeSeconds + float(10);
			Vehicle(StuckActor).KDriverLeave(false);
		}
		StuckNormal = Normal(HitLocation - Other.Location);
		GotoState('Stuck');
	}
	//return;	
}

simulated function HitWall(Vector HitNormal, Actor Wall)
{
	// End:0x40
	if(Wall.bBlockProjectiles)
	{
		// End:0x3E
		if((int(Role) == int(ROLE_Authority)) && Leader != none)
		{
			Leader.DetonateWeb();
		}
		return;
	}
	StuckActor = Wall;
	StuckNormal = HitNormal;
	GotoState('Stuck');
	//return;	
}

function Explode(Vector HitLocation, Vector HitNormal)
{
	BlowUp(HitLocation);
	Destroy();
	//return;	
}

function BlowUp(Vector HitLocation)
{
	NetUpdateTime = Level.TimeSeconds - float(1);
	// End:0x4B
	if((StuckActor != none) && ClassIsChildOf(StuckActor.Class, ExtraDamageClass))
	{
		Damage *= ExtraDamageMultiplier;
	}
	HurtRadius(Damage, DamageRadius, MyDamageType, MomentumTransfer, HitLocation);
	MakeNoise(1.0000000);
	//return;	
}

state Stuck
{
	simulated function BeginState()
	{
		// End:0x1A
		if(Leader != none)
		{
			Leader.NotifyStuck();
		}
		NetPriority = 1.5000000;
		NetUpdateTime = Level.TimeSeconds - float(1);
		SetPhysics(0);
		PlaySound(StuckSound,, 2.5000000 * TransientSoundVolume);
		// End:0x76
		if(StuckActor != none)
		{
			LastTouched = StuckActor;
			SetBase(StuckActor);
		}
		SetCollision(false, false);
		bCollideWorld = false;
		// End:0x9C
		if(int(Role) == int(ROLE_Authority))
		{
			SetTimer(ExplodeDelay, false);
		}
		//return;		
	}

	function Timer()
	{
		// End:0x1D
		if(Leader != none)
		{
			Leader.DetonateWeb();			
		}
		else
		{
			Explode(Location, StuckNormal);
		}
		NetUpdateTime = Level.TimeSeconds - float(1);
		//return;		
	}
	stop;	
}

defaultproperties
{
	ProjectileEffectClass=Class'Onslaught.ONSRVWebProjectileEffect'
	ProjNumber=-1
	BeamSubEmitterIndex=2
	ExplodeDelay=3.0000000
	StuckSound=Sound'ONSVehicleSounds-S.WebLauncher.WebStick'
	ExplodeEffect=Class'XEffects.GoopSparks'
	ExplodeSound=SoundGroup'WeaponSounds.BioRifle.BioRifleGoo1'
	ExtraDamageClass=Class'Onslaught.ONSHoverBike'
	ExtraDamageMultiplier=1.5000000
	Speed=1750.0000000
	Damage=65.0000000
	DamageRadius=150.0000000
	MomentumTransfer=10000.0000000
	MyDamageType=Class'Onslaught.DamTypeONSWeb'
	DrawType=0
	bNetTemporary=false
	bUpdateSimulatedPosition=true
	NetUpdateFrequency=10.0000000
}
