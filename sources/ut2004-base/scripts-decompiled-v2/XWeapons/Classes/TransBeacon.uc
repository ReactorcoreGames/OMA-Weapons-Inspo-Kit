class TransBeacon extends TranslocatorBeacon;

var bool bCanHitOwner;
var bool bHitWater;
var bool bDamaged;
var bool bNoAI;
var xEmitter Trail;
var xEmitter Flare;
var Actor TranslocationTarget;
var int Disruption;
var int DisruptionThreshold;
var Pawn Disruptor;
var TransBeaconSparks Sparks;
var Class<TransTrail> TransTrailClass;
var Class<TransFlareBlue> TransFlareClass;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		Disruption;
}

simulated function Destroyed()
{
	// End:0x1C
	if(Trail != none)
	{
		Trail.mRegen = false;
	}
	// End:0x44
	if(Flare != none)
	{
		Flare.mRegen = false;
		Flare.Destroy();
	}
	// End:0x5B
	if(Sparks != none)
	{
		Sparks.Destroy();
	}
	super.Destroyed();
	//return;	
}

event EncroachedBy(Actor Other)
{
	// End:0x13
	if(Mover(Other) != none)
	{
		Destroy();
	}
	//return;	
}

simulated function bool Disrupted()
{
	return Disruption > DisruptionThreshold;
	//return;	
}

simulated function PostBeginPlay()
{
	local Rotator R;
	local int diff;

	super.PostBeginPlay();
	// End:0xFC
	if(int(Role) == int(ROLE_Authority))
	{
		R = Rotation;
		// End:0xAB
		if(AimUp())
		{
			R.Pitch = R.Pitch & 65535;
			// End:0x74
			if(R.Pitch > 32768)
			{
				diff = 65536 - R.Pitch;				
			}
			else
			{
				diff = R.Pitch;
			}
			R.Pitch = R.Pitch + ((32768 - diff) / 8);
		}
		Velocity = Speed * Vector(R);
		R.Yaw = Rotation.Yaw;
		R.Pitch = 0;
		R.Roll = 0;
		SetRotation(R);
		bCanHitOwner = false;
	}
	Trail = Spawn(TransTrailClass, self,, Location, Rotation);
	SetTimer(0.3000000, false);
	//return;	
}

function bool AimUp()
{
	// End:0x1B
	if(xPlayer(Instigator.Controller) == none)
	{
		return false;
	}
	return xPlayer(Instigator.Controller).bHighBeaconTrajectory;
	//return;	
}

simulated function PhysicsVolumeChange(PhysicsVolume Volume)
{
	//return;	
}

simulated function Landed(Vector HitNormal)
{
	HitWall(HitNormal, none);
	//return;	
}

simulated function ProcessTouch(Actor Other, Vector HitLocation)
{
	local Vector Vel2D;

	// End:0x27
	if((Other == Instigator) && int(Physics) == int(0))
	{
		Destroy();		
	}
	else
	{
		// End:0xA4
		if((Other != Instigator) || bCanHitOwner)
		{
			// End:0x90
			if((Pawn(Other) != none) && Vehicle(Other) == none)
			{
				Vel2D = Velocity;
				Vel2D.Z = 0.0000000;
				// End:0x90
				if(VSize(Vel2D) < float(200))
				{
					return;
				}
			}
			HitWall(-Normal(Velocity), Other);
		}
	}
	//return;	
}

simulated function Timer()
{
	// End:0x1B
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		return;
	}
	// End:0x31
	if(!Disrupted())
	{
		SetTimer(0.3000000, false);
		return;
	}
	// End:0x7C
	if(Sparks == none)
	{
		Sparks = Spawn(Class'XEffects.TransBeaconSparks',,, Location + vect(0.0000000, 0.0000000, 5.0000000), Rotator(vect(0.0000000, 0.0000000, 1.0000000)));
		Sparks.SetBase(self);
	}
	// End:0x93
	if(Flare != none)
	{
		Flare.Destroy();
	}
	//return;	
}

function TakeDamage(int Damage, Pawn EventInstigator, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType)
{
	// End:0x85
	if(((Level.Game.bTeamGame && EventInstigator != none) && EventInstigator.PlayerReplicationInfo != none) && (Instigator == none) || EventInstigator.PlayerReplicationInfo.Team == Instigator.PlayerReplicationInfo.Team)
	{
		return;		
	}
	else
	{
		Disruption += Damage;
		Disruptor = EventInstigator;
	}
	//return;	
}

function BotTranslocate()
{
	//return;	
}

simulated function HitWall(Vector HitNormal, Actor Wall)
{
	local CTFBase B;

	bCanHitOwner = true;
	Velocity = 0.3000000 * ((((Velocity Dot HitNormal) * HitNormal) * -2.0000000) + Velocity);
	Speed = VSize(Velocity);
	// End:0xC9
	if(Speed < float(100))
	{
		// End:0x65
		foreach TouchingActors(Class'UnrealGame.CTFBase', B)
		{
			// End:0x65
			break;			
		}		
		// End:0xC9
		if(B != none)
		{
			Speed = VSize(Velocity);
			// End:0xAA
			if(Speed < float(100))
			{
				Speed = 90.0000000;
				Velocity = float(90) * Normal(Velocity);
			}
			Disruption += 5;
			// End:0xC9
			if(Disruptor == none)
			{
				Disruptor = Instigator;
			}
		}
	}
	// End:0x1B1
	if(((Speed < float(20)) && Wall.bWorldGeometry) && HitNormal.Z >= 0.7000000)
	{
		// End:0x124
		if(int(Level.NetMode) != int(NM_DedicatedServer))
		{
			PlaySound(ImpactSound, 1);
		}
		bBounce = false;
		SetPhysics(0);
		// End:0x14D
		if(Trail != none)
		{
			Trail.mRegen = false;
		}
		// End:0x1B1
		if((int(Level.NetMode) != int(NM_DedicatedServer)) && Flare == none)
		{
			Flare = Spawn(TransFlareClass, self,, Location - vect(0.0000000, 0.0000000, 5.0000000), rot(16384, 0, 0));
			Flare.SetBase(self);
		}
	}
	//return;	
}

function SetTranslocationTarget(Actor t)
{
	TranslocationTarget = t;
	GotoState('MonitoringThrow');
	//return;	
}

function bool IsMonitoring(Actor A)
{
	return false;
	//return;	
}

function EndMonitoring()
{
	//return;	
}

state MonitoringThrow
{
	function bool IsMonitoring(Actor A)
	{
		return A == TranslocationTarget;
		//return;		
	}

	function Destroyed()
	{
		local Bot B;

		B = Bot(Instigator.Controller);
		// End:0x64
		if(B != none)
		{
			B.TranslocationTarget = none;
			B.RealTranslocationTarget = none;
			B.bPreparingMove = false;
			B.SwitchToBestWeapon();
		}
		global.Destroyed();
		//return;		
	}

	function EndMonitoring()
	{
		GotoState('None');
		//return;		
	}

	function EndState()
	{
		local Bot B;

		B = Bot(Instigator.Controller);
		// End:0x71
		if((B != none) && !bNoAI)
		{
			B.TranslocationTarget = none;
			B.RealTranslocationTarget = none;
			B.bPreparingMove = false;
			B.SwitchToBestWeapon();
		}
		//return;		
	}

	simulated function HitWall(Vector HitNormal, Actor Wall)
	{
		global.HitWall(HitNormal, Wall);
		// End:0xA0
		if(((GameObject(TranslocationTarget) != none) && HitNormal.Z > 0.7000000) && VSize(Location - TranslocationTarget.Location) < FMin(400.0000000, VSize(Instigator.Location - TranslocationTarget.Location)))
		{
			Instigator.Controller.MoveTarget = TranslocationTarget;
			BotTranslocate();
			return;
		}
		// End:0x160
		if(int(Physics) == int(0))
		{
			// End:0x15A
			if((Bot(Instigator.Controller) != none) && Bot(Instigator.Controller).bPreparingMove)
			{
				Bot(Instigator.Controller).MoveTimer = -1.0000000;
				// End:0x15A
				if((JumpSpot(TranslocationTarget) != none) && Instigator.Controller.MoveTarget == TranslocationTarget)
				{
					JumpSpot(TranslocationTarget).FearCost += 900;
				}
			}
			EndMonitoring();
		}
		//return;		
	}

	function BotTranslocate()
	{
		// End:0x3D
		if(Translauncher(Instigator.Weapon) != none)
		{
			Instigator.Weapon.GetFireMode(1).DoFireEffect();
		}
		EndMonitoring();
		//return;		
	}

	function Touch(Actor Other)
	{
		local Pawn P;

		P = Pawn(Other);
		// End:0x2E
		if((P == none) || P == Instigator)
		{
			return;
		}
		ProcessTouch(Other, Location);
		// End:0xAA
		if((Bot(P.Controller) == none) || Level.Game.IsOnTeam(P.Controller, Instigator.PlayerReplicationInfo.Team.TeamIndex))
		{
			EndMonitoring();
			return;
		}
		// End:0x101
		if(Bot(P.Controller).ProficientWithWeapon() && (float(2) + (FRand() * float(8))) < Bot(P.Controller).Skill)
		{
			BotTranslocate();
		}
		//return;		
	}

	function Tick(float DeltaTime)
	{
		local Vector Dist, Dir, HitLocation, HitNormal;
		local float ZDiff, Dist2D;
		local Actor HitActor;

		// End:0x18C
		if(((((TranslocationTarget == none) || Instigator.Controller == none) || !Bot(Instigator.Controller).Squad.AllowTranslocationBy(Bot(Instigator.Controller))) || (GameObject(Instigator.Controller.MoveTarget) != none) && Instigator.Controller.MoveTarget != TranslocationTarget) || (((((TranslocationTarget != Instigator.Controller.MoveTarget) && TranslocationTarget != Instigator.Controller.RouteGoal) && TranslocationTarget != Instigator.Controller.RouteCache[0]) && TranslocationTarget != Instigator.Controller.RouteCache[1]) && TranslocationTarget != Instigator.Controller.RouteCache[2]) && TranslocationTarget != Instigator.Controller.RouteCache[3])
		{
			EndMonitoring();
			return;
		}
		Dist = Location - TranslocationTarget.Location;
		ZDiff = Dist.Z;
		Dist.Z = 0.0000000;
		Dir = TranslocationTarget.Location - Instigator.Location;
		Dir.Z = 0.0000000;
		Dist2D = VSize(Dist);
		// End:0x264
		if(Dist2D < TranslocationTarget.CollisionRadius)
		{
			// End:0x262
			if(ZDiff > (-0.9000000 * TranslocationTarget.CollisionHeight))
			{
				Instigator.Controller.MoveTarget = TranslocationTarget;
				BotTranslocate();
			}
			return;
		}
		Dir = TranslocationTarget.Location - Instigator.Location;
		Dir.Z = 0.0000000;
		// End:0x42C
		if((Dist Dot Dir) > float(0))
		{
			// End:0x359
			if((Bot(Instigator.Controller) != none) && Bot(Instigator.Controller).bPreparingMove)
			{
				Bot(Instigator.Controller).MoveTimer = -1.0000000;
				// End:0x356
				if((JumpSpot(TranslocationTarget) != none) && Instigator.Controller.MoveTarget == TranslocationTarget)
				{
					JumpSpot(TranslocationTarget).FearCost += 400;
				}				
			}
			else
			{
				// End:0x424
				if(((GameObject(TranslocationTarget) != none) && ZDiff > float(0)) && Dist2D < FMin(400.0000000, VSize(Instigator.Location - TranslocationTarget.Location) - float(250)))
				{
					HitActor = Trace(HitLocation, HitNormal, Location - vect(0.0000000, 0.0000000, 100.0000000), Location, false);
					// End:0x424
					if((HitActor != none) && HitNormal.Z > 0.7000000)
					{
						Instigator.Controller.MoveTarget = TranslocationTarget;
						BotTranslocate();
						return;
					}
				}
			}
			EndMonitoring();
			return;
		}
		//return;		
	}
	stop;	
}

defaultproperties
{
	DisruptionThreshold=65
	TransTrailClass=Class'XEffects.TransTrail'
	TransFlareClass=Class'XEffects.TransFlareRed'
	Speed=1200.0000000
	DamageRadius=100.0000000
	MomentumTransfer=50000.0000000
	MyDamageType=Class'XWeapons.DamTypeTeleFrag'
	ImpactSound=ProceduralSound'WeaponSounds.PGrenFloor1.P1GrenFloor1'
	ExplosionDecal=Class'XEffects.RocketMark'
	DrawType=8
	StaticMesh=StaticMesh'WeaponStaticMesh.NEWTranslocatorPUCK'
	bNetTemporary=false
	bUpdateSimulatedPosition=true
	bOnlyDirtyReplication=true
	Physics=2
	NetUpdateFrequency=8.0000000
	AmbientSound=Sound'WeaponSounds.Misc.redeemer_flight'
	DrawScale=0.3500000
	PrePivot=(X=0.0000000,Y=0.0000000,Z=25.0000000)
	AmbientGlow=64
	bUnlit=false
	bOwnerNoSee=true
	SoundVolume=250
	SoundPitch=128
	SoundRadius=7.0000000
	CollisionRadius=10.0000000
	CollisionHeight=10.0000000
	bProjTarget=true
	bNetNotify=true
	bBounce=true
}
