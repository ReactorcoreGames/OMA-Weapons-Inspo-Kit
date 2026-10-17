class RedeemerProjectile extends Projectile;

var NewRedeemerTrail SmokeTrail;
var() Vector ShakeRotMag;
var() Vector ShakeRotRate;
var() float ShakeRotTime;
var() Vector ShakeOffsetMag;
var() Vector ShakeOffsetRate;
var() float ShakeOffsetTime;
var Class<Emitter> ExplosionEffectClass;
var byte Team;

simulated function Destroyed()
{
	// End:0x17
	if(SmokeTrail != none)
	{
		SmokeTrail.Destroy();
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
		SmokeTrail = Spawn(Class'XEffects.NewRedeemerTrail', self,, Location - (float(40) * Dir), Rotation);
		SmokeTrail.SetBase(self);
	}
	super.PostBeginPlay();
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

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
	BlowUp(HitLocation);
	//return;	
}

simulated function PhysicsVolumeChange(PhysicsVolume Volume)
{
	//return;	
}

simulated function Landed(Vector HitNormal)
{
	BlowUp(Location);
	//return;	
}

simulated function HitWall(Vector HitNormal, Actor Wall)
{
	BlowUp(Location);
	//return;	
}

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType)
{
	// End:0xF5
	if((Damage > 0) && ((((instigatedBy == none) || instigatedBy.Controller == none) || Instigator == none) || Instigator.Controller == none) || !instigatedBy.Controller.SameTeamAs(Instigator.Controller))
	{
		// End:0xBC
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

function BlowUp(Vector HitLocation)
{
	local Emitter E;

	E = Spawn(ExplosionEffectClass,,, HitLocation - (float(100) * Normal(Velocity)), rot(0, 16384, 0));
	// End:0x5E
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		E.LifeSpan = 0.7000000;
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
		// End:0x4F
		if(SmokeTrail != none)
		{
			SmokeTrail.Destroy();
		}
		SetTimer(0.0000000, false);
		//return;		
	}

	function ShakeView()
	{
		local Controller C;
		local PlayerController PC;
		local float Dist, Scale;

		C = Level.ControllerList;
		J0x14:

		// End:0x11B [Loop If]
		if(C != none)
		{
			PC = PlayerController(C);
			// End:0x104
			if((PC != none) && PC.ViewTarget != none)
			{
				Dist = VSize(Location - PC.ViewTarget.Location);
				// End:0x104
				if(Dist < (DamageRadius * 2.0000000))
				{
					// End:0xA9
					if(Dist < DamageRadius)
					{
						Scale = 1.0000000;						
					}
					else
					{
						Scale = ((DamageRadius * 2.0000000) - Dist) / DamageRadius;
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
	ShakeRotMag=(X=0.0000000,Y=0.0000000,Z=250.0000000)
	ShakeRotRate=(X=0.0000000,Y=0.0000000,Z=2500.0000000)
	ShakeRotTime=6.0000000
	ShakeOffsetMag=(X=0.0000000,Y=0.0000000,Z=10.0000000)
	ShakeOffsetRate=(X=0.0000000,Y=0.0000000,Z=200.0000000)
	ShakeOffsetTime=10.0000000
	ExplosionEffectClass=Class'XEffects.RedeemerExplosion'
	Team=255
	Speed=1000.0000000
	MaxSpeed=1000.0000000
	Damage=250.0000000
	DamageRadius=2000.0000000
	MomentumTransfer=200000.0000000
	MyDamageType=Class'XWeapons.DamTypeRedeemer'
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
	LifeSpan=20.0000000
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
