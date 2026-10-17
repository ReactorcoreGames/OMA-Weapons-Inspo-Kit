class BX5VehicleMine extends BallisticProjectile;

var bool bDetonated;
var() Class<DamageType> VehicleDamageType;
var() float HRadius;
var() int Health;
var BX5VehicleTrigger MyUseTrigger;
var BX5TeamLight TeamLight;
var float TriggerStartTime;
var Pawn Stepper;
var Pawn OriginalPlacer;
var byte TeamLightColor;
var bool bAntiLameMode;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		TeamLightColor;
}

simulated function PostBeginPlay()
{
	super.PostBeginPlay();
	// End:0x113
	if(int(Role) == int(ROLE_Authority))
	{
		// End:0x44
		if(Instigator != none)
		{
			TeamLightColor = byte(Instigator.Controller.GetTeamNum());			
		}
		else
		{
			TeamLightColor = byte(255);
		}
		// End:0x113
		if(int(Level.NetMode) != int(NM_DedicatedServer))
		{
			// End:0x113
			if((int(TeamLightColor) == Level.GetLocalPlayerController().GetTeamNum()) || Class'BCoreProV55.BallisticReplicationInfo'.default.bUniversalMineLights)
			{
				TeamLight = Spawn(Class'BallisticProV55.BX5TeamLight', self,, Location, Rotation);
				// End:0xF0
				if(Instigator.Controller == Level.GetLocalPlayerController())
				{
					TeamLight.SetTeamColor(2);					
				}
				else
				{
					TeamLight.SetTeamColor(int(TeamLightColor));
				}
				TeamLight.SetBase(self);
			}
		}
	}
	//return;	
}

simulated event PostNetReceive()
{
	// End:0x21
	if(bDetonated)
	{
		Explode(Location, vect(0.0000000, 0.0000000, 1.0000000));
	}
	// End:0x136
	if(int(TeamLightColor) != int(default.TeamLightColor))
	{
		// End:0x136
		if(((int(TeamLightColor) == Level.GetLocalPlayerController().GetTeamNum()) || Level.GetLocalPlayerController().GetTeamNum() == 255) || Class'BCoreProV55.BallisticReplicationInfo'.default.bUniversalMineLights)
		{
			TeamLight = Spawn(Class'BallisticProV55.BX5TeamLight', self,, Location, Rotation);
			// End:0xDF
			if(Instigator.Controller == Level.GetLocalPlayerController())
			{
				TeamLight.SetTeamColor(2);				
			}
			else
			{
				// End:0x129
				if((Level.GetLocalPlayerController().GetTeamNum() != 255) || Class'BCoreProV55.BallisticReplicationInfo'.default.bUniversalMineLights)
				{
					TeamLight.SetTeamColor(int(TeamLightColor));
				}
			}
			TeamLight.SetBase(self);
		}
	}
	//return;	
}

simulated event TornOff()
{
	Explode(Location, Vector(Rotation));
	//return;	
}

simulated function InitProjectile()
{
	local Actor TA;
	local Teleporter TB;

	super.InitProjectile();
	// End:0xC6
	if(int(Role) == int(ROLE_Authority))
	{
		MyUseTrigger = Spawn(Class'BallisticProV55.BX5VehicleTrigger', self,, Location);
		TriggerStartTime = Level.TimeSeconds + 3.0000000;
		InstigatorController = Instigator.Controller;
		OriginalPlacer = Instigator;
		// End:0xA3
		foreach TouchingActors(Class'Engine.Actor', TA)
		{
			// End:0xA2
			if((xPickUpBase(TA) != none) || Pickup(TA) != none)
			{
				bAntiLameMode = true;				
				return;
			}			
		}		
		// End:0xC5
		foreach RadiusActors(Class'Engine.Teleporter', TB, 256.0000000)
		{
			bAntiLameMode = true;			
			return;			
		}		
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
	// End:0x72
	if(bAntiLameMode)
	{
		// End:0x6F
		if((Stepper != none) && OriginalPlacer != none)
		{
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(OriginalPlacer, 666.0000000, Stepper, HitLocation, MomentumTransfer * vect(0.0000000, 0.0000000, 1.0000000), Class'BallisticProV55.DT_TeleportLamer');
		}		
	}
	else
	{
		// End:0xA3
		if(DamageRadius > float(0))
		{
			TargetedHurtRadius(Damage, DamageRadius, MyRadiusDamageType, MomentumTransfer, HitLocation, HitActor);
		}
	}
	MakeNoise(1.0000000);
	//return;	
}

function SteppedOn(Actor Other)
{
	// End:0xE2
	if((((((Pawn(Other) == none) || StartDelay > float(0)) || bDetonated) || ((InstigatorController != none) && Pawn(Other).Controller != InstigatorController) && InstigatorController.SameTeamAs(Pawn(Other).Controller)) || (Vehicle(Other) != none) && VSize(Other.Velocity) < float(50)) || (Pawn(Other).Health < 1) && VSize(Other.Velocity) < float(50))
	{
		return;
	}
	// End:0x10B
	if((Level.TimeSeconds < TriggerStartTime) || TriggerStartTime == float(0))
	{
		return;
	}
	// End:0x125
	if(VSize(Other.Velocity) == float(0))
	{
		return;
	}
	// End:0x19A
	if((VSize(Other.Velocity) <= float(170)) && (Pawn(Other).Controller == InstigatorController) || (Vector(Pawn(Other).GetViewRotation()) Dot Normal(Location - Other.Location)) > 0.2000000)
	{
		return;
	}
	Stepper = Pawn(Other);
	bTearOff = true;
	SetTimer(0.1000000, false);
	//return;	
}

simulated event Timer()
{
	// End:0x16
	if(StartDelay > float(0))
	{
		super.Timer();		
	}
	else
	{
		Explode(Location, Vector(Rotation));
	}
	//return;	
}

simulated function ProcessTouch(Actor Other, Vector HitLocation)
{
	//return;	
}

singular simulated function HitWall(Vector HitNormal, Actor Wall)
{
	//return;	
}

event TakeDamage(int Damage, Pawn EventInstigator, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType)
{
	// End:0x2D
	if((Class<BallisticDamageType>(DamageType) != none) && !Class<BallisticDamageType>(DamageType).default.bDetonatesBombs)
	{
		return;
	}
	// End:0x38
	if(bDetonated)
	{
		return;
	}
	Health -= Damage;
	// End:0x51
	if(Health > 0)
	{
		return;
	}
	bDetonated = true;
	bTearOff = true;
	// End:0x8B
	if(EventInstigator != none)
	{
		Instigator = EventInstigator;
		InstigatorController = EventInstigator.Controller;
	}
	SetTimer(0.1000000, false);
	//return;	
}

function TryUse(Pawn User)
{
	local Ammunition Ammo;
	local Weapon newWeapon;
	local int AmmoAmount;

	Ammo = Ammunition(User.FindInventoryType(Class'BallisticProV55.Ammo_BX5Mines'));
	// End:0x4C
	if(Ammo == none)
	{
		Ammo = Spawn(Class'BallisticProV55.Ammo_BX5Mines');
		User.AddInventory(Ammo);
	}
	AmmoAmount = Ammo.AmmoAmount;
	Ammo.UseAmmo(9999, true);
	// End:0xE2
	if(User.FindInventoryType(Class'BallisticProV55.BX5Mine') == none)
	{
		newWeapon = Spawn(Class'BallisticProV55.BX5Mine',,, User.Location);
		// End:0xE2
		if(newWeapon != none)
		{
			newWeapon.GiveTo(User);
			newWeapon.ConsumeAmmo(0, 9999.0000000, true);
		}
	}
	Ammo.AddAmmo(AmmoAmount + 1);
	Ammo.GotoState('None');
	Destroy();
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
	if(TeamLight != none)
	{
		TeamLight.Destroy();
	}
	super.Destroyed();
	//return;	
}

simulated function TargetedHurtRadius(float DamageAmount, float DamageRadius, Class<DamageType> DamageType, float Momentum, Vector HitLocation, optional Actor Victim)
{
	local Actor Victims;
	local float damageScale, dist;
	local Vector Dir;

	// End:0x0B
	if(bHurtEntry)
	{
		return;
	}
	// End:0x1A7
	if((Stepper != none) && Vehicle(Stepper) != none)
	{
		Victim = Stepper;
		DamageType = VehicleDamageType;
		Dir = Stepper.Location - HitLocation;
		dist = FMax(1.0000000, VSize(Dir));
		Dir = Dir / dist;
		// End:0xC0
		if((Normal(Stepper.Velocity) Dot Normal(Location - Stepper.Location)) > 0.6000000)
		{
			damageScale = 1.0000000;			
		}
		else
		{
			damageScale = FMax(1.0000000 - FMax(0.0000000, (dist - Stepper.CollisionRadius) / DamageRadius), 0.2500000);
		}
		// End:0x12C
		if((Instigator == none) || Instigator.Controller == none)
		{
			Stepper.SetDelayedDamageInstigatorController(InstigatorController);
		}
		Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Stepper, Square(damageScale) * DamageAmount, Instigator, Stepper.Location - ((0.5000000 * (Stepper.CollisionHeight + Stepper.CollisionRadius)) * Dir), (damageScale * Momentum) * Dir, DamageType);
	}
	bHurtEntry = true;
	// End:0x3B3
	foreach VisibleCollidingActors(Class'Engine.Actor', Victims, DamageRadius, HitLocation)
	{
		// End:0x3B2
		if(((((Victims != self) && int(Victims.Role) == int(ROLE_Authority)) && !Victims.IsA('FluidSurfaceInfo')) && Victims != Victim) && (Vehicle(Victims) != none) || VSize((Victims.Location * vect(1.0000000, 1.0000000, 0.0000000)) - (HitLocation * vect(1.0000000, 1.0000000, 0.0000000))) < HRadius)
		{
			// End:0x288
			if(Vehicle(Victims) != none)
			{
				DamageType = VehicleDamageType;
			}
			Dir = Victims.Location - HitLocation;
			dist = FMax(1.0000000, VSize(Dir));
			Dir = Dir / dist;
			damageScale = 1.0000000 - FMax(0.0000000, (dist - Victims.CollisionRadius) / DamageRadius);
			// End:0x32E
			if((Instigator == none) || Instigator.Controller == none)
			{
				Victims.SetDelayedDamageInstigatorController(InstigatorController);
			}
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Victims, damageScale * DamageAmount, Instigator, Victims.Location - ((0.5000000 * (Victims.CollisionHeight + Victims.CollisionRadius)) * Dir), (damageScale * Momentum) * Dir, DamageType);
			DamageType = MyRadiusDamageType;
		}		
	}	
	bHurtEntry = false;
	//return;	
}

defaultproperties
{
	VehicleDamageType=Class'BallisticProV55.DTBX5VehicleRadius'
	HRadius=250.0000000
	Health=30
	TeamLightColor=128
	WeaponClass=Class'BallisticProV55.BX5Mine'
	ImpactManager=Class'BallisticProV55.IM_LandMine'
	StartDelay=0.3000000
	bTearOnExplode=false
	MyRadiusDamageType=Class'BallisticProV55.DTBX5Radius'
	ShakeRadius=1200.0000000
	Damage=100.0000000
	DamageRadius=128.0000000
	MomentumTransfer=90000.0000000
	MyDamageType=Class'BallisticProV55.DTBX5Radius'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.BX5.MineV2'
	CullDistance=3000.0000000
	bNetTemporary=false
	Physics=0
	LifeSpan=0.0000000
	DrawScale=0.2000000
	bUnlit=false
	CollisionRadius=26.0000000
	CollisionHeight=16.0000000
	bCollideWorld=false
	bProjTarget=true
	bNetNotify=true
}
