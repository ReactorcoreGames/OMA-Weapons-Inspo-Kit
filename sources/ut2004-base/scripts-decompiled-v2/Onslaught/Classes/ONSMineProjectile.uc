class ONSMineProjectile extends Projectile;

var() float DetectionTimer;
var() Sound ExplodeSound;
var() float ScurrySpeed;
var() float ScurryAnimRate;
var() float HeightOffset;
var Pawn TargetPawn;
var int TeamNum;
var bool bClosedDown;
var bool bGoToTargetLoc;
var Vector TargetLoc;
var int TargetLocFuzz;

replication
{
	// Pos:0x000
	reliable if(bNetDirty && int(Role) == int(ROLE_Authority))
		bGoToTargetLoc;

	// Pos:0x018
	reliable if((bNetDirty && int(Role) == int(ROLE_Authority)) && bGoToTargetLoc)
		TargetLoc;

	// Pos:0x03B
	reliable if((bNetDirty && int(Role) == int(ROLE_Authority)) && !bGoToTargetLoc)
		TargetPawn;
}

simulated function PostBeginPlay()
{
	super.PostBeginPlay();
	// End:0x63
	if(int(Role) == int(ROLE_Authority))
	{
		Velocity = Instigator.Velocity + (Vector(Rotation) * Speed);
		Velocity.Z += TossZ;
		SetRotation(Rotation + rot(16384, 0, 0));
	}
	PlayAnim('StartUp', 0.5000000);
	//return;	
}

simulated function PostNetBeginPlay()
{
	// End:0x31
	if((int(Role) < int(ROLE_Authority)) && int(Physics) == int(0))
	{
		bProjTarget = true;
		GotoState('OnGround');
	}
	//return;	
}

simulated function Destroyed()
{
	// End:0x24
	if(!bNoFX && EffectIsRelevant(Location, false))
	{
		Spawn(Class'Onslaught.ONSGrenadeExplosionEffect');
	}
	// End:0x66
	if(((int(Role) == int(ROLE_Authority)) && bScriptInitialized) && ONSMineLayer(Owner) != none)
	{
		ONSMineLayer(Owner).CurrentMines--;
	}
	super(Actor).Destroyed();
	//return;	
}

simulated function ProcessTouch(Actor Other, Vector HitLocation)
{
	// End:0x7C
	if(ONSMineProjectile(Other) != none)
	{
		// End:0x4C
		if((Other.Owner == none) || Other.Owner != Owner)
		{
			BlowUp(Location);			
		}
		else
		{
			// End:0x79
			if(int(Physics) == int(2))
			{
				Velocity = vect(0.0000000, 0.0000000, 250.0000000) + (float(100) * VRand());
			}
		}		
	}
	else
	{
		// End:0xC9
		if(Pawn(Other) != none)
		{
			// End:0xC6
			if((Other != Instigator) && Pawn(Other).GetTeamNum() != TeamNum)
			{
				BlowUp(Location);
			}			
		}
		else
		{
			// End:0xFC
			if(Other.bCanBeDamaged && Other.Base != self)
			{
				BlowUp(Location);
			}
		}
	}
	//return;	
}

simulated function AdjustSpeed()
{
	ScurrySpeed = default.ScurrySpeed / float(Attached.Length + 1);
	ScurryAnimRate = default.ScurryAnimRate / float(Attached.Length + 1);
	//return;	
}

simulated function Attach(Actor Other)
{
	AdjustSpeed();
	//return;	
}

simulated function Detach(Actor Other)
{
	AdjustSpeed();
	//return;	
}

function AcquireTarget()
{
	local Pawn A;
	local float Dist, BestDist;

	TargetPawn = none;
	// End:0x11D
	foreach VisibleCollidingActors(Class'Engine.Pawn', A, 750.0000000)
	{
		// End:0x11C
		if(((((A != Instigator) && A.Health > 0) && A.GetTeamNum() != TeamNum) && ((Vehicle(A) == none) || Vehicle(A).Driver != none) || Vehicle(A).bTeamLocked) && (ONSStationaryWeaponPawn(A) == none) || ONSStationaryWeaponPawn(A).bPowered)
		{
			Dist = VSize(A.Location - Location);
			// End:0x11C
			if((TargetPawn == none) || Dist < BestDist)
			{
				TargetPawn = A;
				BestDist = Dist;
			}
		}		
	}	
	//return;	
}

function WarnTarget()
{
	// End:0xC3
	if((TargetPawn != none) && TargetPawn.Controller != none)
	{
		TargetPawn.Controller.ReceiveProjectileWarning(self);
		// End:0xC3
		if(((AIController(TargetPawn.Controller) != none) && AIController(TargetPawn.Controller).Skill >= 5.0000000) && !TargetPawn.IsFiring())
		{
			TargetPawn.Controller.Focus = self;
			TargetPawn.Controller.FireWeaponAt(self);
		}
	}
	//return;	
}

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType)
{
	// End:0x88
	if((((Damage > 0) && instigatedBy != none) && (Instigator != instigatedBy) || DamageType != MyDamageType) && ((Instigator == none) || Instigator == instigatedBy) || instigatedBy.GetTeamNum() != Instigator.GetTeamNum())
	{
		BlowUp(Location);
	}
	//return;	
}

function PhysicsVolumeChange(PhysicsVolume NewVolume)
{
	// End:0x1D
	if(NewVolume.bPainCausing)
	{
		BlowUp(Location);
	}
	//return;	
}

simulated function BlowUp(Vector HitLocation)
{
	local int i;

	// End:0x2F
	if(int(Role) == int(ROLE_Authority))
	{
		HurtRadius(Damage, DamageRadius, MyDamageType, MomentumTransfer, HitLocation);
	}
	i = 0;
	J0x36:

	// End:0x97 [Loop If]
	if(i < Attached.Length)
	{
		Attached[i].TakeDamage(int(Damage), Instigator, Attached[i].Location, vect(0.0000000, 0.0000000, 0.0000000), MyDamageType);
		i++;
		// [Loop Continue]
		goto J0x36;
	}
	PlaySound(ExplodeSound, 1);
	Destroy();
	//return;	
}

function SetScurryTarget(Vector NewTargetLoc)
{
	// End:0x34
	if(TargetPawn == none)
	{
		TargetLoc = NewTargetLoc + (VRand() * float(Rand(TargetLocFuzz)));
		bGoToTargetLoc = true;
		GotoState('ScurryToTargetLoc');
	}
	//return;	
}

auto state Flying
{
	simulated function Landed(Vector HitNormal)
	{
		local Rotator newRot;

		// End:0x23
		if(int(Level.NetMode) != int(NM_DedicatedServer))
		{
			PlaySound(ImpactSound, 1);
		}
		bProjTarget = true;
		newRot = Rotator(HitNormal);
		newRot.Pitch -= 16384;
		SetRotation(newRot);
		GotoState('OnGround');
		//return;		
	}

	simulated function HitWall(Vector HitNormal, Actor Wall)
	{
		// End:0x7C
		if(bBounce)
		{
			// End:0x71
			if(((Wall != none) && Instigator != none) && Pawn(Wall) != none)
			{
				// End:0x66
				if(Pawn(Wall).GetTeamNum() == Instigator.GetTeamNum())
				{
					bUseCollisionStaticMesh = true;					
				}
				else
				{
					BlowUp(Location);
				}
			}
			bBounce = false;			
		}
		else
		{
			BlowUp(Location);
		}
		//return;		
	}

	simulated function BeginState()
	{
		SetPhysics(2);
		//return;		
	}
	stop;	
}

simulated state OnGround
{
	simulated function Timer()
	{
		// End:0x37
		if(int(Role) < int(ROLE_Authority))
		{
			// End:0x25
			if(TargetPawn != none)
			{
				GotoState('Scurrying');				
			}
			else
			{
				// End:0x35
				if(bGoToTargetLoc)
				{
					GotoState('ScurryToTargetLoc');
				}
			}
			return;
		}
		// End:0x4D
		if(Instigator == none)
		{
			BlowUp(Location);
		}
		AcquireTarget();
		// End:0x65
		if(TargetPawn != none)
		{
			GotoState('Scurrying');
		}
		//return;		
	}

	simulated function BeginState()
	{
		SetPhysics(0);
		Velocity = vect(0.0000000, 0.0000000, 0.0000000);
		SetTimer(DetectionTimer, true);
		Timer();
		//return;		
	}

	simulated function EndState()
	{
		SetTimer(0.0000000, false);
		//return;		
	}
Begin:

	bRotateToDesired = false;
	Sleep(0.4000000);
	PlayAnim('CloseDown');
	bClosedDown = true;
	stop;				
}

simulated state Scurrying
{
	simulated function Timer()
	{
		local Vector NewLoc;
		local Rotator TargetDirection;
		local float TargetDist;

		// End:0x12
		if(TargetPawn == none)
		{
			GotoState('Flying');
		}
		// End:0x24
		if(int(Physics) != int(1))
		{
			return;
		}
		NewLoc = TargetPawn.Location - Location;
		TargetDist = VSize(NewLoc);
		// End:0xFC
		if(TargetDist < 1000.0000000)
		{
			NewLoc.Z = 0.0000000;
			Velocity = Normal(NewLoc) * ScurrySpeed;
			// End:0xBA
			if(TargetDist < 225.0000000)
			{
				GotoState('Flying');
				Velocity *= 1.2000000;
				Velocity.Z = 350.0000000;
				WarnTarget();				
			}
			else
			{
				TargetDirection = Rotator(NewLoc);
				TargetDirection.Yaw -= 16384;
				TargetDirection.Roll = 0;
				SetRotation(TargetDirection);
				LoopAnim('Scurry', ScurryAnimRate);
			}			
		}
		else
		{
			GotoState('Flying');
		}
		//return;		
	}

	simulated event BaseChange()
	{
		super(Actor).BaseChange();
		// End:0x2B
		if((Base != none) && Vehicle(Base) == none)
		{
			bUseCollisionStaticMesh = false;
		}
		//return;		
	}

	simulated function Landed(Vector HitNormal)
	{
		SetPhysics(1);
		//return;		
	}

	function BeginState()
	{
		WarnTarget();
		//return;		
	}

	simulated function EndState()
	{
		StopAnimating();
		SetTimer(0.0000000, false);
		//return;		
	}
Begin:

	SetPhysics(1);
	// End:0x26
	if(bClosedDown)
	{
		PlayAnim('StartUp');
		bClosedDown = false;
		Sleep(0.2500000);
	}
	SetTimer(DetectionTimer / float(2), true);
	stop;			
}

simulated state ScurryToTargetLoc extends Scurrying
{
	function SetScurryTarget(Vector NewTargetLoc)
	{
		TargetLoc = NewTargetLoc + (VRand() * float(Rand(TargetLocFuzz)));
		//return;		
	}

	simulated function Landed(Vector HitNormal)
	{
		SetPhysics(1);
		//return;		
	}

	simulated function Timer()
	{
		local Vector NewLoc;
		local Rotator TargetDirection;

		// End:0x12
		if(int(Physics) != int(1))
		{
			return;
		}
		NewLoc = TargetLoc - Location;
		NewLoc.Z = 0.0000000;
		// End:0x68
		if(VSize(NewLoc) < float(250))
		{
			AcquireTarget();
			// End:0x5F
			if(TargetPawn != none)
			{
				GotoState('Scurrying');				
			}
			else
			{
				GotoState('Flying');
			}
			return;
		}
		Velocity = Normal(NewLoc) * ScurrySpeed;
		TargetDirection = Rotator(NewLoc);
		TargetDirection.Yaw -= 16384;
		TargetDirection.Roll = 0;
		SetRotation(TargetDirection);
		LoopAnim('Scurry', ScurryAnimRate);
		//return;		
	}

	simulated function EndState()
	{
		SetTimer(0.0000000, false);
		bGoToTargetLoc = false;
		//return;		
	}
	stop;	
}

defaultproperties
{
	DetectionTimer=0.5000000
	ExplodeSound=SoundGroup'WeaponSounds.RocketLauncher.RocketLauncherFire'
	ScurrySpeed=525.0000000
	ScurryAnimRate=4.1000000
	TargetLocFuzz=250
	Speed=800.0000000
	MaxSpeed=800.0000000
	TossZ=0.0000000
	Damage=95.0000000
	DamageRadius=250.0000000
	MomentumTransfer=50000.0000000
	MyDamageType=Class'Onslaught.DamTypeONSMine'
	ImpactSound=Sound'WeaponSounds.BaseGunTech.BGrenfloor1'
	CullDistance=6000.0000000
	bNetTemporary=false
	bUpdateSimulatedPosition=true
	Physics=2
	LifeSpan=0.0000000
	Mesh=SkeletalMesh'ONSWeapons-A.ParasiteMine'
	DrawScale=0.2000000
	PrePivot=(X=0.0000000,Y=0.0000000,Z=-2.9000000)
	AmbientGlow=80
	bClientAnim=true
	bHardAttach=true
	SoundVolume=255
	SoundRadius=100.0000000
	CollisionRadius=10.0000000
	CollisionHeight=10.0000000
	bBlockKarma=true
	bBounce=true
	bRotateToDesired=true
	RotationRate=(Pitch=20000,Yaw=0,Roll=0)
}
