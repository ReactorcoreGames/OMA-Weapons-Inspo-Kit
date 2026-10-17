class ONSStationaryWeaponPawn extends ONSWeaponPawn
	abstract
	config(User);

var bool bPowered;
var float RespawnTime;
var Class<Emitter> DestructionEffectClass;

simulated function PostBeginPlay()
{
	super(Vehicle).PostBeginPlay();
	SetDrawType(8);
	// End:0x2A
	if(Gun != none)
	{
		Gun.bCallInstigatorPostRender = true;
	}
	//return;	
}

function CheckSuperBerserk()
{
	// End:0x6A
	if(((Level.GRI != none) && Level.GRI.WeaponBerserk > 1.0000000) && Gun != none)
	{
		Gun.SetFireRateModifier(Level.GRI.WeaponBerserk);
	}
	//return;	
}

simulated function bool IndependentVehicle()
{
	return true;
	//return;	
}

function bool TryToDrive(Pawn P)
{
	// End:0x18
	if(bPowered)
	{
		return super.TryToDrive(P);		
	}
	else
	{
		P.ReceiveLocalizedMessage(Class'Onslaught.ONSOnslaughtMessage', 13);
		return false;
	}
	//return;	
}

function SetTeamNum(byte t)
{
	local byte Temp;

	Temp = Team;
	PrevTeam = t;
	Team = t;
	// End:0x3A
	if(int(Temp) != int(t))
	{
		TeamChanged();
	}
	//return;	
}

simulated event TeamChanged()
{
	super.TeamChanged();
	Health = int(HealthMax);
	//return;	
}

event VehicleLocked(Pawn P)
{
	super(Vehicle).VehicleLocked(P);
	P.ReceiveLocalizedMessage(Class'Onslaught.ONSOnslaughtMessage', 4);
	//return;	
}

function AltFire(optional float F)
{
	local PlayerController PC;

	PC = PlayerController(Controller);
	// End:0x1D
	if(PC == none)
	{
		return;
	}
	bWeaponisAltFiring = true;
	PC.ToggleZoom();
	//return;	
}

function ClientVehicleCeaseFire(bool bWasAltFire)
{
	local PlayerController PC;

	// End:0x19
	if(!bWasAltFire)
	{
		super.ClientVehicleCeaseFire(bWasAltFire);
		return;
	}
	PC = PlayerController(Controller);
	// End:0x36
	if(PC == none)
	{
		return;
	}
	bWeaponisAltFiring = false;
	PC.StopZoom();
	//return;	
}

simulated function ClientKDriverLeave(PlayerController PC)
{
	super.ClientKDriverLeave(PC);
	bWeaponisAltFiring = false;
	PC.EndZoom();
	//return;	
}

function Reset()
{
	//return;	
}

function Died(Controller Killer, Class<DamageType> DamageType, Vector HitLocation)
{
	local PlayerController PC;
	local Controller C;

	// End:0x1F
	if(bDeleteMe || Level.bLevelChange)
	{
		return;
	}
	// End:0x5A
	if(Level.Game.PreventDeath(self, Killer, DamageType, HitLocation))
	{
		Health = Max(Health, 1);
		return;
	}
	Health = Min(0, Health);
	// End:0x20E
	if(Controller != none)
	{
		C = Controller;
		C.WasKilledBy(Killer);
		Level.Game.Killed(Killer, C, self, DamageType);
		// End:0x167
		if(C.bIsPlayer)
		{
			PC = PlayerController(C);
			// End:0xF5
			if(PC != none)
			{
				ClientKDriverLeave(PC);				
			}
			else
			{
				ClientClearController();
			}
			// End:0x154
			if((bRemoteControlled && Driver != none) && Driver.Health > 0)
			{
				C.UnPossess();
				C.Possess(Driver);
				Driver = none;				
			}
			else
			{
				C.PawnDied(self);
			}			
		}
		else
		{
			C.Destroy();
		}
		// End:0x20B
		if(Driver != none)
		{
			// End:0x204
			if(!bRemoteControlled)
			{
				// End:0x1BF
				if(!bDrawDriverInTP && PlaceExitingDriver())
				{
					Driver.StopDriving(self);
					Driver.DrivenVehicle = self;
				}
				Driver.TearOffMomentum = Velocity * 0.2500000;
				Driver.Died(Controller, Class'Engine.DamRanOver', Driver.Location);				
			}
			else
			{
				KDriverLeave(false);
			}
		}		
	}
	else
	{
		Level.Game.Killed(Killer, Controller(Owner), self, DamageType);
	}
	// End:0x263
	if(Killer != none)
	{
		TriggerEvent(Event, self, Killer.Pawn);		
	}
	else
	{
		TriggerEvent(Event, self, none);
	}
	// End:0x28D
	if(IsHumanControlled())
	{
		PlayerController(Controller).ForceDeathUpdate();
	}
	GotoState('Dead');
	//return;	
}

simulated event ClientTrigger()
{
	bNoTeamBeacon = bClientTrigger;
	// End:0x42
	if(bClientTrigger && int(Level.NetMode) != int(NM_DedicatedServer))
	{
		Spawn(DestructionEffectClass, self).SetBase(self);
	}
	//return;	
}

simulated function PostNetReceive()
{
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'AW-2004Particles.Energy.SparkHead');
	Level.AddPrecacheMaterial(Texture'ExplosionTex.Framed.exp2_frames');
	Level.AddPrecacheMaterial(Texture'ExplosionTex.Framed.exp1_frames');
	Level.AddPrecacheMaterial(Texture'ExplosionTex.Framed.we1_frames');
	super(Actor).UpdatePrecacheMaterials();
	//return;	
}

state Dead
{
	function BeginState()
	{
		// End:0x2A
		if(int(Level.NetMode) != int(NM_DedicatedServer))
		{
			Spawn(DestructionEffectClass, self).SetBase(self);
		}
		bClientTrigger = true;
		bNoTeamBeacon = true;
		bHidden = false;
		Gun.bHidden = true;
		SetCollision(false, false);
		bBlockZeroExtentTraces = false;
		bBlockNonZeroExtentTraces = false;
		SetTimer(RespawnTime, false);
		//return;		
	}

	function SetTeamNum(byte t)
	{
		GotoState('None');
		global.SetTeamNum(t);
		//return;		
	}

	function Timer()
	{
		GotoState('None');
		//return;		
	}

	function EndState()
	{
		local Controller NewController;

		bClientTrigger = false;
		bNoTeamBeacon = false;
		bHidden = default.bHidden;
		Gun.bHidden = Gun.default.bHidden;
		SetCollision(default.bCollideActors, default.bBlockActors);
		bBlockZeroExtentTraces = default.bBlockZeroExtentTraces;
		bBlockNonZeroExtentTraces = default.bBlockNonZeroExtentTraces;
		Health = int(HealthMax);
		SetTimer(0.0000000, false);
		// End:0xC7
		if((bAutoTurret && Controller == none) && AutoTurretControllerClass != none)
		{
			NewController = Spawn(AutoTurretControllerClass);
			// End:0xC7
			if(NewController != none)
			{
				NewController.Possess(self);
			}
		}
		//return;		
	}
	stop;	
}

defaultproperties
{
	RespawnTime=30.0000000
	DestructionEffectClass=Class'Onslaught.ONSVehicleExplosionEffect'
	bHasOwnHealth=true
	bHasAltFire=false
	bDefensive=true
	bTeamLocked=true
	bDesiredBehindView=false
	AutoTurretControllerClass=Class'Onslaught.ONSTurretController'
	ExitPositions[0]=()
	ExitPositions[1]=()
	ExitPositions[2]=(AutomaticInitialSpawning=false)
	ExitPositions[3]=()
	ExitPositions[4]=()
	VehiclePositionString="manning a turret"
	VehicleNameString="Energy Turret"
	TeamBeaconTexture=Texture'ONSInterface-TX.HealthBar'
	NoEntryTexture=Texture'HudContent.Generic.NoEntry'
	TeamBeaconBorderMaterial=Texture'InterfaceContent.Menu.BorderBoxD'
	DrawType=2
	bHidden=true
	bStasis=false
	bCollideActors=true
	bBlockActors=true
	bProjTarget=true
	bBlockZeroExtentTraces=true
	bBlockNonZeroExtentTraces=true
	bBlockKarma=true
	bNetNotify=false
}
