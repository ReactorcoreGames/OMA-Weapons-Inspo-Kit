class FP9Bomb extends BallisticKGrenade;

var bool bLaserMode;
var bool bNetLaserOn;
var bool bDeployed;
var bool bDetonate;
var bool bDetonated;
var() Class<Actor> RedLaserClass;
var() Class<Actor> BlueLaserClass;
var Actor Laser;
var() Class<DamageType> LaserDamageType;
var() Class<DamageType> ShotDamageType;
var FP9Trigger MyUseTrigger;
var float ThrowTime;
var() bool bDamaged;
var() int Health;
var bool bLaserDetonated;
var() Sound LaserOnSound;
var() Sound LaserOffSound;
var() float OldLaserRange;
var() Material LaserSkin;
var Vector NetLocation;
var Rotator NetRotation;
var bool bStopMoving;
var Rotator laserDir;
var() float BombDetonateDelay;
var float DetonateTime;
var int Team;
var bool bAntiLameMode;
var Pawn TriggeringPawn;
var Pawn OriginalPlacer;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		Team, ThrowTime, 
		bDeployed, bNetLaserOn, 
		laserDir;

	// Pos:0x00D
	reliable if(int(Role) == int(ROLE_Authority))
		NetLocation, NetRotation, 
		bStopMoving;
}

function InitBomb(bool bThrown, bool bLaserOn, float HoldTime)
{
	local Actor TA;
	local Teleporter TB;

	bDeployed = !bThrown;
	// End:0x2C
	if(bDeployed)
	{
		bCollideWorld = false;
		KSetBlockKarma(false);
		SetPhysics(0);
	}
	bLaserMode = bLaserOn;
	// End:0x76
	if(int(Role) == int(ROLE_Authority))
	{
		MyUseTrigger = Spawn(Class'BallisticProV55.FP9Trigger', self,, Location);
		MyUseTrigger.SetBase(self);
		OriginalPlacer = Instigator;
	}
	ThrowTime = HoldTime;
	// End:0xBF
	foreach TouchingActors(Class'Engine.Actor', TA)
	{
		// End:0xBE
		if((xPickUpBase(TA) != none) || Pickup(TA) != none)
		{
			bAntiLameMode = true;			
			return;
		}		
	}	
	// End:0xE1
	foreach RadiusActors(Class'Engine.Teleporter', TB, DamageRadius)
	{
		bAntiLameMode = true;		
		return;		
	}	
	//return;	
}

function BlowUp(Vector HitLocation)
{
	// End:0x12
	if(int(Role) < int(ROLE_Authority))
	{
		return;
	}
	// End:0xB1
	if(bAntiLameMode && OriginalPlacer != none)
	{
		// End:0x72
		if(TriggeringPawn != none)
		{
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(OriginalPlacer, 666.0000000, TriggeringPawn, HitLocation, MomentumTransfer * vect(0.0000000, 0.0000000, 1.0000000), Class'BallisticProV55.DT_TeleportLamer');			
		}
		else
		{
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(OriginalPlacer, 666.0000000, Instigator, HitLocation, MomentumTransfer * vect(0.0000000, 0.0000000, 1.0000000), Class'BallisticProV55.DT_TeleportLamer');
		}		
	}
	else
	{
		// End:0xE2
		if(DamageRadius > float(0))
		{
			TargetedHurtRadius(Damage, DamageRadius, MyRadiusDamageType, MomentumTransfer, HitLocation, HitActor);
		}
	}
	MakeNoise(1.0000000);
	//return;	
}

simulated function PostBeginPlay()
{
	super(BallisticGrenade).PostBeginPlay();
	bCollideWorld = false;
	KSetBlockKarma(false);
	DetonateTime = Level.TimeSeconds + BombDetonateDelay;
	// End:0x8B
	if((int(Level.NetMode) != int(NM_Client)) && Instigator != none)
	{
		// End:0x76
		if(Instigator.GetTeamNum() == 255)
		{
			Team = 1;			
		}
		else
		{
			Team = Instigator.GetTeamNum();
		}
	}
	//return;	
}

simulated function PostNetBeginPlay()
{
	super(BallisticProjectile).PostNetBeginPlay();
	laserDir = Rotation;
	default.laserDir = Rotation;
	//return;	
}

simulated function InitProjectile()
{
	InitEffects();
	Speed *= (FClamp(ThrowTime - 0.3000000, 0.0000000, 1.0000000) / float(1));
	// End:0x4A
	if(bDeployed && bLaserMode)
	{
		SetTimer(2.0000000, false);		
	}
	else
	{
		// End:0x5B
		if(!bDeployed)
		{
			super.InitProjectile();
		}
	}
	//return;	
}

simulated event Timer()
{
	local Rotator R;

	// End:0xB8
	if(StartDelay > float(0))
	{
		StartDelay = 0.0000000;
		bHidden = false;
		// End:0x98
		if(!bDeployed)
		{
			R = Rotation;
			R.Yaw += 32768;
			R.Pitch += 8192;
			SetRotation(R);
			// End:0x81
			if(int(Level.NetMode) == int(NM_Client))
			{
				SetPhysics(NM_ListenServer);				
			}
			else
			{
				SetPhysics(default.Physics);
			}
			bCollideWorld = true;
			KSetBlockKarma(true);
		}
		SetCollision(default.bCollideActors, default.bBlockActors, default.bBlockPlayers);
		InitProjectile();
		return;		
	}
	else
	{
		// End:0x152
		if((bDeployed && bLaserMode) && Laser == none)
		{
			bNetLaserOn = true;
			Skins[2] = LaserSkin;
			PlaySound(LaserOnSound,, 1.0000000,, 64.0000000);
			// End:0x12B
			if(Team == 1)
			{
				Laser = Spawn(BlueLaserClass, self,, Location, laserDir);				
			}
			else
			{
				Laser = Spawn(RedLaserClass, self,, Location, laserDir);
			}
			Laser.SetBase(self);
		}
	}
	//return;	
}

simulated function Tick(float dt)
{
	local Actor t;
	local Vector HitLoc, HitNorm, V;

	super.Tick(dt);
	// End:0x92
	if((!bDeployed && int(Role) == int(ROLE_Authority)) && StartDelay == float(0))
	{
		// End:0x54
		if(Location != NetLocation)
		{
			NetLocation = Location;			
		}
		else
		{
			bStopMoving = true;
			bDeployed = true;
			SetTimer(2.0000000, false);
			laserDir = Rotation;
		}
		// End:0x92
		if(Rotation != NetRotation)
		{
			NetRotation = Rotation;
		}
	}
	// End:0xC8
	if((bNetLaserOn && Laser == none) || !bNetLaserOn && Laser != none)
	{
		AdjustLaser();
	}
	// End:0xE2
	if(!bNetLaserOn || Laser == none)
	{
		return;
	}
	t = Trace(HitLoc, HitNorm, Location + (Vector(laserDir) * float(5000)), Location, true);
	V = Laser.DrawScale3D;
	// End:0x24A
	if(t != none)
	{
		// End:0x21D
		if(((Pawn(t) != none) && Pawn(t).Controller != none) && ((InstigatorController == none) || !Pawn(t).Controller.SameTeamAs(InstigatorController)) || Pawn(t).Controller == InstigatorController)
		{
			// End:0x21D
			if(((int(Role) == int(ROLE_Authority)) && OldLaserRange != float(-1)) && Abs(VSize(HitLoc - Location) - OldLaserRange) > (float(64) * dt))
			{
				TriggeringPawn = Pawn(t);
				bLaserDetonated = true;
				Detonate();
				return;
			}
		}
		OldLaserRange = VSize(HitLoc - Location);
		V.X = OldLaserRange / float(128);		
	}
	else
	{
		V.X = 5000.0000000 / float(128);
	}
	Laser.SetDrawScale3D(V);
	//return;	
}

simulated function bool CanTouch(Actor Other)
{
	// End:0x0B
	if(bDeployed)
	{
		return false;
	}
	return super(BallisticGrenade).CanTouch(Other);
	//return;	
}

function Detonate()
{
	bLaserMode = false;
	bNetLaserOn = false;
	// End:0x2E
	if(bDeployed)
	{
		Explode(Location, Vector(Rotation));		
	}
	else
	{
		Explode(Location, vect(0.0000000, 0.0000000, 1.0000000));
	}
	//return;	
}

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
	local int Surf;

	// End:0x0B
	if(bExploded)
	{
		return;
	}
	// End:0x32
	if((ShakeRadius > float(0)) || MotionBlurRadius > float(0))
	{
		ShakeView(HitLocation);
	}
	// End:0xD4
	if((ImpactManager != none) && int(Level.NetMode) != int(NM_DedicatedServer))
	{
		// End:0x76
		if(bCheckHitSurface)
		{
			CheckSurface(HitLocation, HitNormal, Surf);
		}
		// End:0xB1
		if(Instigator == none)
		{
			ImpactManager.static.StartSpawn(HitLocation, HitNormal, Surf, Level.GetLocalPlayerController());			
		}
		else
		{
			ImpactManager.static.StartSpawn(HitLocation, HitNormal, Surf, Instigator);
		}
	}
	BlowUp(HitLocation);
	bExploded = true;
	// End:0x151
	if((int(Level.NetMode) == int(NM_DedicatedServer)) || int(Level.NetMode) == int(NM_ListenServer))
	{
		Velocity = vect(0.0000000, 0.0000000, 0.0000000);
		SetCollision(false, false, false);
		TearOffHitNormal = HitNormal;
		bTearOff = true;
		GotoState('NetTrapped');		
	}
	else
	{
		Destroy();
	}
	//return;	
}

simulated event TornOff()
{
	Explode(Location, TearOffHitNormal);
	//return;	
}

simulated event PostNetReceive()
{
	super(Actor).PostNetReceive();
	// End:0x9C
	if(!bDeployed)
	{
		// End:0x4B
		if(bStopMoving)
		{
			SetPhysics(0);
			SetLocation(NetLocation);
			SetRotation(NetRotation);
			bDeployed = true;
			SetTimer(2.0000000, false);
			laserDir = Rotation;
		}
		// End:0x77
		if(NetLocation != default.NetLocation)
		{
			default.NetLocation = NetLocation;
			SetPhysics(0);
			SetLocation(NetLocation);
			SetPhysics(13);
		}
		// End:0x99
		if(NetRotation != default.NetRotation)
		{
			default.NetRotation = NetRotation;
			SetRotation(NetRotation);
		}		
	}
	else
	{
		// End:0xC9
		if((laserDir != default.laserDir) && Laser != none)
		{
			Laser.SetRotation(laserDir);
		}
	}
	//return;	
}

function SetLaserDir(Rotator NewDir)
{
	laserDir = NewDir;
	// End:0x27
	if(Laser != none)
	{
		Laser.SetRotation(laserDir);
	}
	//return;	
}

function ToggleLaserMode()
{
	bLaserMode = !bLaserMode;
	bNetLaserOn = bLaserMode;
	AdjustLaser();
	//return;	
}

simulated function AdjustLaser()
{
	// End:0x95
	if((bDeployed && bNetLaserOn) && Laser == none)
	{
		Skins[2] = LaserSkin;
		PlaySound(LaserOnSound,, 1.0000000,, 64.0000000);
		// End:0x6B
		if(Team == 1)
		{
			Laser = Spawn(BlueLaserClass, self,, Location, laserDir);			
		}
		else
		{
			Laser = Spawn(RedLaserClass, self,, Location, laserDir);
		}
		Laser.SetBase(self);		
	}
	else
	{
		// End:0xE9
		if(!bNetLaserOn && Laser != none)
		{
			OldLaserRange = -1.0000000;
			Skins[2] = default.Skins[2];
			PlaySound(LaserOffSound,, 1.0000000,, 64.0000000);
			Laser.Destroy();
		}
	}
	//return;	
}

simulated function Destroyed()
{
	// End:0x17
	if(MyUseTrigger != none)
	{
		MyUseTrigger.Destroy();
	}
	// End:0x2E
	if(Laser != none)
	{
		Laser.Destroy();
	}
	super(BallisticProjectile).Destroyed();
	//return;	
}

simulated function TargetedHurtRadius(float DamageAmount, float DamageRadius, Class<DamageType> DamageType, float Momentum, Vector HitLocation, optional Actor Victim)
{
	// End:0x30
	if(bLaserDetonated)
	{
		super(BallisticProjectile).TargetedHurtRadius(DamageAmount, DamageRadius, LaserDamageType, Momentum, HitLocation, Victim);		
	}
	else
	{
		super(BallisticProjectile).TargetedHurtRadius(DamageAmount, DamageRadius, DamageType, Momentum, HitLocation, Victim);
	}
	//return;	
}

event TakeDamage(int Damage, Pawn EventInstigator, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType)
{
	// End:0x49
	if((bDamaged || DamageType == ImpactDamageType) || (Class<BallisticDamageType>(DamageType) != none) && !Class<BallisticDamageType>(DamageType).default.bDetonatesBombs)
	{
		return;
	}
	Health -= Damage;
	// End:0x62
	if(Health > 0)
	{
		return;
	}
	bDamaged = true;
	// End:0x9F
	if(EventInstigator != none)
	{
		Instigator = EventInstigator;
		InstigatorController = EventInstigator.Controller;
		MyRadiusDamageType = ShotDamageType;
	}
	Detonate();
	//return;	
}

function TryUse(Pawn User)
{
	local Ammunition Ammo;
	local FP9Explosive Weap;
	local int AmmoAmount;

	Ammo = Ammunition(User.FindInventoryType(Class'BallisticProV55.Ammo_FP9Ammo'));
	// End:0x4C
	if(Ammo == none)
	{
		Ammo = Spawn(Class'BallisticProV55.Ammo_FP9Ammo');
		User.AddInventory(Ammo);
	}
	AmmoAmount = Ammo.AmmoAmount;
	Ammo.UseAmmo(9999, true);
	Weap = FP9Explosive(User.FindInventoryType(Class'BallisticProV55.FP9Explosive'));
	// End:0x108
	if(Weap == none)
	{
		Weap = Spawn(Class'BallisticProV55.FP9Explosive', User,, User.Location);
		// End:0x108
		if(Weap != none)
		{
			Weap.GiveTo(User, none);
			Weap.bHasDetonator = false;
			Weap.ConsumeAmmo(0, 9999.0000000, true);
		}
	}
	Ammo.AddAmmo(AmmoAmount + 1);
	Ammo.GotoState('None');
	Destroy();
	//return;	
}

defaultproperties
{
	RedLaserClass=Class'BallisticProV55.LaserActor_TripMineRed'
	BlueLaserClass=Class'BallisticProV55.LaserActor_TripMine'
	LaserDamageType=Class'BallisticProV55.DTFP9BombLaser'
	ShotDamageType=Class'BallisticProV55.DTFP9BombShot'
	Health=15
	LaserOnSound=Sound'BW_Core_WeaponSound.FP9A5.FP9-LaserOn'
	LaserOffSound=Sound'BW_Core_WeaponSound.FP9A5.FP9-LaserOff'
	OldLaserRange=-1.0000000
	LaserSkin=Shader'BW_Core_WeaponTex.FP9A5.FP9LCDActiveSD'
	BombDetonateDelay=1.5000000
	ArmedDetonateOn=5
	DampenFactor=0.5000000
	DampenFactorParallel=0.7000000
	bNoInitialSpin=true
	ImpactDamage=15
	ImpactDamageType=Class'BallisticProV55.DTFP9Bomb'
	WeaponClass=Class'BallisticProV55.FP9Explosive'
	ImpactManager=Class'BallisticProV55.IM_RPG'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	bRandomStartRotation=false
	StartDelay=0.3000000
	MyRadiusDamageType=Class'BallisticProV55.DTFP9BombRadius'
	WallPenetrationForce=64.0000000
	ShakeRadius=512.0000000
	MotionBlurRadius=512.0000000
	Speed=350.0000000
	Damage=150.0000000
	DamageRadius=1024.0000000
	MomentumTransfer=50000.0000000
	MyDamageType=Class'BallisticProV55.DTNRP57Grenade'
	ImpactSound=SoundGroup'BW_Core_WeaponSound.FP9A5.FP9-Bounce'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.FP9.FP9Proj'
	bNetTemporary=false
	bAlwaysRelevant=true
	LifeSpan=0.0000000
	DrawScale=0.2500000
	Skins[0]=Texture'BW_Core_WeaponTex.FP9A5.FP9Bomb'
	Skins[1]=Texture'BW_Core_WeaponTex.FP9A5.FP9Chain'
	Skins[2]=Shader'BW_Core_WeaponTex.FP9A5.FP9LCDArmedSD'
	bUnlit=false
	CollisionRadius=6.0000000
	CollisionHeight=8.0000000
	bCollideWorld=false
	bProjTarget=true
	bNetNotify=true
	RotationRate=(Pitch=0,Yaw=8192,Roll=10000)
}
