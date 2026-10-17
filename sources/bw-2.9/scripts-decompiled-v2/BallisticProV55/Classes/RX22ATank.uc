class RX22ATank extends Actor
	notplaceable;

var int Health;
var Vector LeakDir;
var Vector LeakLoc;
var Vector ThrustDir;
var Emitter Flame;
var BallisticWeapon Weapon;
var byte DeathStage;
var bool bNetGoRocket;
var Vector HurtLoc;

replication
{
	// Pos:0x000
	reliable if((int(Role) == int(ROLE_Authority)) && bNetDirty)
		HurtLoc, LeakLoc, 
		bNetGoRocket;
}

simulated event PreBeginPlay()
{
	// End:0x2D
	if((Owner != none) && Pawn(Owner) != none)
	{
		Instigator = Pawn(Owner);
	}
	super.PreBeginPlay();
	//return;	
}

simulated event PostNetBeginPlay()
{
	super.PostNetBeginPlay();
	// End:0x41
	if((int(Level.NetMode) != int(NM_DedicatedServer)) && Instigator != none)
	{
		Instigator.AttachToBone(self, 'spine');
	}
	//return;	
}

simulated event PostNetReceive()
{
	// End:0x6C
	if(HurtLoc != vect(0.0000000, 0.0000000, 0.0000000))
	{
		// End:0x59
		if(int(Level.NetMode) != int(NM_DedicatedServer))
		{
			Class'BallisticProV55.IM_Bullet'.static.StartSpawn(HurtLoc, Normal(HurtLoc - Location), 3, Instigator);
		}
		HurtLoc = vect(0.0000000, 0.0000000, 0.0000000);
	}
	// End:0xF9
	if((LeakLoc != vect(0.0000000, 0.0000000, 0.0000000)) && !GoneOff())
	{
		// End:0xC3
		if(Owner != none)
		{
			LeakDir = Normal(Location - LeakLoc) << Owner.Rotation;			
		}
		else
		{
			LeakDir = Normal(Location - LeakLoc) << Rotation;
		}
		// End:0xF2
		if(bNetGoRocket)
		{
			GotoState('RocketPack');			
		}
		else
		{
			GotoState('JetPack');
		}
	}
	// End:0x116
	if(bNetGoRocket && IsInState('JetPack'))
	{
		GotoState('RocketPack');
	}
	//return;	
}

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType)
{
	local bool bFire;

	// End:0x16
	if(!Class'BCoreProV55.BallisticReplicationInfo'.static.IsClassicOrRealism())
	{
		return;
	}
	// End:0x28
	if(int(Role) < int(ROLE_Authority))
	{
		return;
	}
	// End:0xCB
	if((Instigator != none) && (Instigator.InGodMode() || (((Instigator.Controller != none) && instigatedBy != none) && instigatedBy != Instigator) && Instigator.Controller.SameTeamAs(instigatedBy.Controller)) || (Normal(HitLocation - Location) Dot Vector(Rotation)) > 0.4000000)
	{
		return;
	}
	// End:0x16A
	if(Class<BallisticDamageType>(DamageType) != none)
	{
		// End:0x100
		if(Class<BallisticDamageType>(DamageType).static.IsDamage(",GearSafe,"))
		{
			return;
		}
		// End:0x132
		if(Class'BCoreProV55.BallisticReplicationInfo'.static.IsRealism() && !Class<BallisticDamageType>(DamageType).default.bIgniteFires)
		{
			return;			
		}
		else
		{
			// End:0x16A
			if(Class<BallisticDamageType>(DamageType).default.bIgniteFires)
			{
				Damage = Max(1, int(float(Damage) * 0.2000000));
				bFire = true;
			}
		}
	}
	Health -= Damage;
	// End:0x1F7
	if(Health > 0)
	{
		// End:0x1EA
		if(int(Level.NetMode) != int(NM_DedicatedServer))
		{
			Class'BallisticProV55.IM_Bullet'.static.StartSpawn(HitLocation, Normal(HitLocation - Location), 3, Instigator);
			// End:0x1E7
			if(int(Level.NetMode) == int(NM_ListenServer))
			{
				HurtLoc = HitLocation;
			}			
		}
		else
		{
			HurtLoc = HitLocation;
		}
		return;
	}
	// End:0x26A
	if(!GoneOff())
	{
		Instigator = instigatedBy;
		LeakLoc = HitLocation;
		LeakDir = Normal(Location - LeakLoc) << Owner.Rotation;
		bAlwaysRelevant = true;
		// End:0x260
		if(bFire)
		{
			GotoState('RocketPack');
			bNetGoRocket = true;			
		}
		else
		{
			GotoState('JetPack');
		}		
	}
	else
	{
		// End:0x28F
		if(IsInState('JetPack') && bFire)
		{
			GotoState('RocketPack');
			bNetGoRocket = true;
		}
	}
	//return;	
}

function AttachmentDestroyed()
{
	// End:0x0E
	if(!GoneOff())
	{
		Destroy();
	}
	//return;	
}

function GoRogue()
{
	local RX22ARogueTank Tank;

	// End:0x23
	if(int(DeathStage) < 12)
	{
		Tank = Spawn(Class'BallisticProV55.RX22ARogueTank',,, Location);
	}
	// End:0x56
	if(Tank != none)
	{
		Tank.Instigator = Instigator;
		Tank.InitRogue(DeathStage);
	}
	GotoState('None');
	Destroy();
	//return;	
}

simulated function bool GoneOff()
{
	return IsInState('JetPack') || IsInState('RocketPack');
	//return;	
}

simulated function AddVelocity(Vector V)
{
	// End:0x5F
	if((Owner != none) && Pawn(Owner) != none)
	{
		Pawn(Owner).AddVelocity(vect(0.0000000, 0.0000000, 400.0000000) + ((LeakDir >> Owner.Rotation) * float(300)));
	}
	//return;	
}

event Tick(float dt)
{
	super.Tick(dt);
	// End:0x22
	if(Owner == none)
	{
		GotoState('None');
		Destroy();
		return;
	}
	// End:0x63
	if(Pawn(Owner).IsFirstPerson() && !Owner.bForceSkelUpdate)
	{
		Owner.bForceSkelUpdate = true;		
	}
	else
	{
		// End:0x86
		if(Owner.bForceSkelUpdate)
		{
			Owner.bForceSkelUpdate = false;
		}
	}
	//return;	
}

simulated event Destroyed()
{
	// End:0x1A
	if(Flame != none)
	{
		Flame.Kill();
	}
	// End:0x4A
	if((Owner != none) && Owner.bForceSkelUpdate)
	{
		Owner.bForceSkelUpdate = false;
	}
	super.Destroyed();
	//return;	
}

simulated state JetPack
{
	simulated event Tick(float dt)
	{
		global.Tick(dt);
		// End:0x79
		if(((Flame != none) && int(Level.NetMode) == int(NM_Client)) && Owner == none)
		{
			Flame.SetLocation(Location - vect(0.0000000, 0.0000000, 16.0000000));
			Flame.SetRotation(Rotator(LeakDir >> Rotation));
		}
		//return;		
	}

	event Timer()
	{
		Weapon.ConsumeAmmo(0, 10.0000000);
		// End:0x69
		if(!Weapon.HasAmmo())
		{
			Weapon.PickupClass = none;
			Weapon.DropFrom(Weapon.Location);
			SetTimer(0.0000000, false);
			GotoState('None');
			Destroy();
		}
		//return;		
	}
Begin:

	AmbientSound = Sound'BW_Core_WeaponSound.RX22A.RX22A-FuelLoop';
	// End:0x7C
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		Class'BallisticProV55.IM_Bullet'.static.StartSpawn(LeakLoc, LeakDir, 3, Instigator);
		Flame = Spawn(Class'BallisticProV55.RX22A_TankLeak', self,, LeakLoc, Rotator(LeakDir));
		// End:0x7C
		if(Owner != none)
		{
			Flame.SetBase(Owner);
		}
	}
	SetTimer(0.1000000, true);
	DeathStage = 1;
	// End:0xCC
	if(Owner != none)
	{
		AddVelocity(vect(0.0000000, 0.0000000, 400.0000000) + ((LeakDir >> Owner.Rotation) * float(300)));
	}
	Sleep(0.5000000);
	DeathStage = 2;
	// End:0x119
	if(Owner != none)
	{
		AddVelocity(((LeakDir >> Owner.Rotation) * float(400)) + (VRand() * float(400)));
	}
	Sleep(0.5000000);
	DeathStage = 3;
	// End:0x175
	if(Owner != none)
	{
		AddVelocity((vect(0.0000000, 0.0000000, 400.0000000) + ((LeakDir >> Owner.Rotation) * float(400))) + (VRand() * float(400)));
	}
	Sleep(0.5000000);
	DeathStage = 4;
	// End:0x1C2
	if(Owner != none)
	{
		AddVelocity(((LeakDir >> Owner.Rotation) * float(400)) + (VRand() * float(400)));
	}
	Sleep(0.5000000);
	DeathStage = 5;
	// End:0x1E9
	if(Flame != none)
	{
		Flame.Destroy();
	}
	GotoState('RocketPack');
	stop;				
}

simulated state RocketPack
{
	simulated event Tick(float dt)
	{
		global.Tick(dt);
		// End:0x50
		if((Owner != none) && Pawn(Owner) != none)
		{
			Pawn(Owner).AddVelocity(vect(0.0000000, 0.0000000, 1400.0000000) * dt);
		}
		// End:0x13A
		if(Flame != none)
		{
			// End:0xC5
			if((int(Level.NetMode) == int(NM_Client)) && Owner != none)
			{
				Flame.SetLocation((Owner.Location - vect(0.0000000, 0.0000000, 16.0000000)) - (Vector(Owner.Rotation) * float(20)));				
			}
			else
			{
				Flame.SetLocation(Location - vect(0.0000000, 0.0000000, 16.0000000));
			}
			Flame.SetRotation(Flame.Rotation + (((Rotator(-ThrustDir + vect(0.0000000, 0.0000000, 1400.0000000)) - Flame.Rotation) * dt) * float(2)));
		}
		//return;		
	}

	event Timer()
	{
		// End:0x74
		if(Weapon != none)
		{
			Weapon.ConsumeAmmo(0, 12.0000000);
			// End:0x74
			if(!Weapon.HasAmmo())
			{
				Weapon.PickupClass = none;
				Weapon.DropFrom(Weapon.Location);
				SetTimer(0.0000000, false);
				GotoState('None');
				Destroy();
			}
		}
		//return;		
	}
Begin:

	// End:0x2C
	if(Owner != none)
	{
		Owner.PlaySound(Sound'BW_Core_WeaponSound.RX22A.RX22A-PackIgnite', 3, 0.8000000,, 128.0000000);		
	}
	else
	{
		PlaySound(Sound'BW_Core_WeaponSound.RX22A.RX22A-PackIgnite', 3, 0.8000000,, 128.0000000);
	}
	AmbientSound = Sound'BW_Core_WeaponSound.RX22A.RX22A-PackBurn';
	SoundVolume = byte(255);
	SoundRadius = 64.0000000;
	// End:0x78
	if(Flame != none)
	{
		Flame.Destroy();
	}
	// End:0xDB
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		Flame = Spawn(Class'BallisticProV55.RX22APackTrail', none,, Location - vect(0.0000000, 0.0000000, 26.0000000), rot(-16384, 0, 0));
		Class'BCoreProV55.BallisticEmitter'.static.ScaleEmitter(Flame, 0.5000000);
	}
	SetTimer(0.1000000, true);
	DeathStage = 6;
	ThrustDir = vect(0.0000000, 0.0000000, 1200.0000000);
	AddVelocity(ThrustDir);
	Sleep(0.5000000);
	DeathStage = 7;
	ThrustDir = VRand() * float(400);
	AddVelocity(ThrustDir);
	Sleep(0.5000000);
	DeathStage = 8;
	ThrustDir = VRand() * float(400);
	AddVelocity(ThrustDir);
	Sleep(0.5000000);
	DeathStage = 9;
	ThrustDir = VRand() * float(400);
	AddVelocity(ThrustDir);
	Sleep(0.5000000);
	DeathStage = 10;
	ThrustDir = VRand() * float(400);
	AddVelocity(ThrustDir);
	Sleep(0.5000000);
	DeathStage = 11;
	ThrustDir = VRand() * float(400);
	AddVelocity(ThrustDir);
	Sleep(0.5000000);
	DeathStage = 12;
	// End:0x2A0
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		// End:0x26F
		if(Owner != none)
		{
			Class'BallisticProV55.IM_GasTankExplode'.static.StartSpawn(Owner.Location - (Vector(Owner.Rotation) * float(20)), vect(0.0000000, 0.0000000, 1.0000000), 0, Level.GetLocalPlayerController());			
		}
		else
		{
			Class'BallisticProV55.IM_GasTankExplode'.static.StartSpawn(Location, vect(0.0000000, 0.0000000, 1.0000000), 0, Level.GetLocalPlayerController());
		}
	}
	// End:0x2BA
	if(Flame != none)
	{
		Flame.Kill();
	}
	Sleep(0.1000000);
	// End:0x35F
	if(int(Role) == int(ROLE_Authority))
	{
		// End:0x308
		if(Owner != none)
		{
			HurtRadius(300.0000000, 512.0000000, Class'BallisticProV55.DTRX22ATankExplode', 5000.0000000, Owner.Location);			
		}
		else
		{
			HurtRadius(300.0000000, 512.0000000, Class'BallisticProV55.DTRX22ATankExplode', 5000.0000000, Location);
		}
		// End:0x35F
		if(Weapon != none)
		{
			Weapon.PickupClass = none;
			Weapon.DropFrom(Weapon.Location);
		}
	}
	bHidden = true;
	Sleep(0.3000000);
	Destroy();
	GotoState('None');
	stop;			
}

defaultproperties
{
	Health=35
	DrawType=8
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.RX22A.FlamerTank'
	bActorShadows=true
	bReplicateInstigator=true
	bReplicateMovement=false
	RemoteRole=2
	RelativeLocation=(X=28.0000000,Y=28.0000000,Z=0.0000000)
	RelativeRotation=(Pitch=0,Yaw=-16384,Roll=16384)
	DrawScale=0.2500000
	CollisionHeight=24.0000000
	bCollideActors=true
	bProjTarget=true
	bBlockNonZeroExtentTraces=false
	bUseCylinderCollision=true
	bNetNotify=true
}
