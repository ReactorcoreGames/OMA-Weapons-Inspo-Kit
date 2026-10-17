class M46ProximityMine extends M46Mine;

var bool bDetonated;
var M46GrenadeTrigger MyUseTrigger;
var int Health;
var BX5TeamLight TeamLight;
var byte TeamLightColor;
var float mDamage;
var float MDamageRadius;
var Pawn Stepper;
var Pawn OriginalPlacer;
var bool bAntiLameMode;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		TeamLightColor, bDetonated;
}

simulated function PostBeginPlay()
{
	super(BallisticProjectile).PostBeginPlay();
	// End:0x11B
	if(int(Role) == int(ROLE_Authority))
	{
		// End:0x35
		if(!Level.Game.bTeamGame)
		{
			return;
		}
		// End:0x58
		if((Instigator == none) || Instigator.Controller == none)
		{
			return;
		}
		TeamLightColor = byte(Instigator.Controller.GetTeamNum());
		// End:0x11B
		if(int(Level.NetMode) != int(NM_DedicatedServer))
		{
			// End:0x11B
			if(int(TeamLightColor) == Level.GetLocalPlayerController().GetTeamNum())
			{
				TeamLight = SpawnTeamLight();
				// End:0xF8
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

function SetManualMode(bool bManual)
{
	bManualMode = bManual;
	// End:0x3A
	if(bManual)
	{
		MyRadiusDamageType = Class'BallisticProV55.DTM46Manual';
		Damage = mDamage;
		DamageRadius = MDamageRadius;		
	}
	else
	{
		MyRadiusDamageType = default.MyRadiusDamageType;
		Damage = default.Damage;
		DamageRadius = default.DamageRadius;
	}
	//return;	
}

simulated function BX5TeamLight SpawnTeamLight()
{
	local Vector X, Y, Z;
	local BX5TeamLight TL;

	GetAxes(Rotation, X, Y, Z);
	TL = Spawn(Class'BallisticProV55.BX5TeamLight', self,, Location - (X * float(16)), Rotation);
	return TL;
	//return;	
}

simulated event PostNetReceive()
{
	// End:0xB1
	if(int(TeamLightColor) != int(default.TeamLightColor))
	{
		// End:0xB1
		if((int(TeamLightColor) == Level.GetLocalPlayerController().GetTeamNum()) || Class'BCoreProV55.BallisticReplicationInfo'.default.bUniversalMineLights)
		{
			TeamLight = SpawnTeamLight();
			// End:0x8E
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
	//return;	
}

function SteppedOn(Actor Other)
{
	// End:0x37
	if((((Pawn(Other) == none) || StartDelay > float(0)) || bManualMode) || bDetonated)
	{
		return;
	}
	// End:0x8A
	if(((InstigatorController != none) && Pawn(Other).Controller != InstigatorController) && InstigatorController.SameTeamAs(Pawn(Other).Controller))
	{
		return;
	}
	// End:0xB7
	if((Vehicle(Other) != none) && VSize(Other.Velocity) < float(50))
	{
		return;
	}
	// End:0xED
	if((Pawn(Other).Health < 1) && VSize(Other.Velocity) < float(190))
	{
		return;
	}
	// End:0x116
	if((Level.TimeSeconds < TriggerStartTime) || TriggerStartTime == float(0))
	{
		return;
	}
	// End:0x130
	if(VSize(Other.Velocity) == float(0))
	{
		return;
	}
	// End:0x1A5
	if((VSize(Other.Velocity) <= float(190)) && (Pawn(Other).Controller == InstigatorController) || (Vector(Pawn(Other).GetViewRotation()) Dot Normal(Location - Other.Location)) > 0.2000000)
	{
		return;
	}
	// End:0x1EB
	if(int(Role) == int(ROLE_Authority))
	{
		Stepper = Pawn(Other);
		PlaySound(DetonateSound,, 2.0000000,, 256.0000000);
		SetTimer(1.0000000, false);
		bDetonated = true;
	}
	//return;	
}

function OwnerDied()
{
	Destroy();
	//return;	
}

simulated function InitProjectile()
{
	local Actor TA;
	local Teleporter TB;

	super(BallisticProjectile).InitProjectile();
	// End:0xA7
	if(int(Role) == int(ROLE_Authority))
	{
		MyUseTrigger = Spawn(Class'BallisticProV55.M46GrenadeTrigger', self,, Location);
		TriggerStartTime = Level.TimeSeconds + 2.0000000;
		// End:0x84
		foreach TouchingActors(Class'Engine.Actor', TA)
		{
			// End:0x83
			if((xPickUpBase(TA) != none) || Pickup(TA) != none)
			{
				bAntiLameMode = true;				
				return;
			}			
		}		
		// End:0xA6
		foreach RadiusActors(Class'Engine.Teleporter', TB, 256.0000000)
		{
			bAntiLameMode = true;			
			return;			
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
	if(TeamLight != none)
	{
		TeamLight.Destroy();
	}
	super(BallisticProjectile).Destroyed();
	//return;	
}

simulated event Timer()
{
	// End:0x16
	if(StartDelay > float(0))
	{
		super(BallisticProjectile).Timer();		
	}
	else
	{
		// End:0x38
		if(int(Role) == int(ROLE_Authority))
		{
			Explode(Location, Vector(Rotation));
		}
	}
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
	// End:0x3C
	if(StartDelay > float(0))
	{
		return;
	}
	// End:0x47
	if(bDetonated)
	{
		return;
	}
	Health -= Damage;
	// End:0x60
	if(Health > 0)
	{
		return;
	}
	PlaySound(DetonateSound,, 2.0000000,, 256.0000000);
	SetTimer(1.0000000, false);
	bDetonated = true;
	//return;	
}

function TryUse(Pawn User)
{
	local Ammunition Ammo;
	local int AmmoAmount;

	// End:0x0B
	if(bDetonated)
	{
		return;
	}
	Ammo = Ammunition(User.FindInventoryType(Class'BallisticProV55.Ammo_M46Grenades'));
	// End:0x57
	if(Ammo == none)
	{
		Ammo = Spawn(Class'BallisticProV55.Ammo_M46Grenades');
		User.AddInventory(Ammo);
	}
	AmmoAmount = Ammo.AmmoAmount;
	Ammo.UseAmmo(9999, true);
	Ammo.AddAmmo(AmmoAmount + 1);
	Ammo.GotoState('None');
	Destroy();
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
		// End:0x9E
		if(DamageRadius > float(0))
		{
			TargetedHurtRadius(Damage, DamageRadius, MyRadiusDamageType, MomentumTransfer, HitLocation);
		}
	}
	MakeNoise(1.0000000);
	//return;	
}

defaultproperties
{
	Health=20
	TeamLightColor=128
	mDamage=190.0000000
	MDamageRadius=768.0000000
	StartDelay=0.3000000
	Damage=90.0000000
	DamageRadius=384.0000000
}
