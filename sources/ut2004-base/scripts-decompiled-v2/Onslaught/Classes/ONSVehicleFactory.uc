class ONSVehicleFactory extends SVehicleFactory
	abstract;

var() float RespawnTime;
var float PreSpawnEffectTime;
var() bool bReverseBlueTeamDirection;
var bool bActive;
var bool bNeverActivate;
var bool bPreSpawn;
var Class<Emitter> RedBuildEffectClass;
var Class<Emitter> BlueBuildEffectClass;
var Emitter BuildEffect;
var int TeamNum;
var Vehicle LastSpawned;

simulated event PostBeginPlay()
{
	super(Actor).PostBeginPlay();
	// End:0x33
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		VehicleClass.static.StaticPrecache(Level);
	}
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'VMparticleTextures.buildEffects.PC_buildBorderNew');
	Level.AddPrecacheMaterial(Texture'VMparticleTextures.buildEffects.PC_buildStreaks');
	VehicleClass.static.StaticPrecache(Level);
	//return;	
}

function PostNetBeginPlay()
{
	local GameObjective O, Best;
	local float BestDist, newdist;

	super(Actor).PostNetBeginPlay();
	// End:0xB2
	if(!bDeleteMe && !Level.Game.IsA('ONSOnslaughtGame'))
	{
		// End:0x92
		foreach AllActors(Class'UnrealGame.GameObjective', O)
		{
			newdist = VSize(Location - O.Location);
			// End:0x91
			if((Best == none) || newdist < BestDist)
			{
				Best = O;
				BestDist = newdist;
			}			
		}		
		// End:0xB2
		if(Best != none)
		{
			Activate(Best.DefenderTeamIndex);
		}
	}
	//return;	
}

function Activate(byte t)
{
	// End:0x4E
	if(!bNeverActivate && !bActive || TeamNum != int(t))
	{
		TeamNum = int(t);
		bActive = true;
		bPreSpawn = true;
		Timer();
	}
	//return;	
}

function Deactivate()
{
	bActive = false;
	//return;	
}

event VehicleDestroyed(Vehicle V)
{
	super.VehicleDestroyed(V);
	bPreSpawn = true;
	SetTimer(RespawnTime - PreSpawnEffectTime, false);
	//return;	
}

function SpawnVehicle()
{
	local Pawn P;
	local bool bBlocked;

	// End:0x6B
	foreach CollidingActors(Class'Engine.Pawn', P, VehicleClass.default.CollisionRadius * 1.2500000)
	{
		bBlocked = true;
		// End:0x6A
		if(PlayerController(P.Controller) != none)
		{
			PlayerController(P.Controller).ReceiveLocalizedMessage(Class'Onslaught.ONSOnslaughtMessage', 11);
		}		
	}	
	// End:0x81
	if(bBlocked)
	{
		SetTimer(1.0000000, false);		
	}
	else
	{
		// End:0x132
		if((bReverseBlueTeamDirection && ONSOnslaughtGame(Level.Game) != none) && ((TeamNum == 1) && !ONSOnslaughtGame(Level.Game).bSidesAreSwitched) || (TeamNum == 0) && ONSOnslaughtGame(Level.Game).bSidesAreSwitched)
		{
			LastSpawned = Spawn(VehicleClass,,, Location, Rotation + rot(0, 32768, 0));			
		}
		else
		{
			LastSpawned = Spawn(VehicleClass,,, Location, Rotation);
		}
		// End:0x1A9
		if(LastSpawned != none)
		{
			VehicleCount++;
			LastSpawned.SetTeamNum(byte(TeamNum));
			LastSpawned.Event = Tag;
			LastSpawned.ParentFactory = self;
			TriggerEvent(Event, self, LastSpawned);
		}
	}
	//return;	
}

function bool ValidateSpawnLocation(float Radius)
{
	local Pawn P;

	// End:0x19
	foreach CollidingActors(Class'Engine.Pawn', P, Radius)
	{		
		return false;		
	}	
	return true;
	//return;	
}

function SpawnBuildEffect()
{
	local Rotator YawRot;

	YawRot = Rotation;
	YawRot.Roll = 0;
	YawRot.Pitch = 0;
	// End:0x4B
	if(TeamNum == 0)
	{
		BuildEffect = Spawn(RedBuildEffectClass,,, Location, YawRot);		
	}
	else
	{
		BuildEffect = Spawn(BlueBuildEffectClass,,, Location, YawRot);
	}
	//return;	
}

function Timer()
{
	// End:0x60
	if((bActive && Level.Game.bAllowVehicles) && VehicleCount < MaxVehicleCount)
	{
		// End:0x5A
		if(bPreSpawn)
		{
			bPreSpawn = false;
			SpawnBuildEffect();
			SetTimer(PreSpawnEffectTime, false);			
		}
		else
		{
			SpawnVehicle();
		}
	}
	//return;	
}

event Trigger(Actor Other, Pawn EventInstigator)
{
	//return;	
}

defaultproperties
{
	RespawnTime=15.0000000
	PreSpawnEffectTime=2.0000000
	RedBuildEffectClass=Class'Onslaught.ONSVehicleBuildEffect'
	BlueBuildEffectClass=Class'Onslaught.ONSVehicleBuildEffect'
	DrawType=2
}
