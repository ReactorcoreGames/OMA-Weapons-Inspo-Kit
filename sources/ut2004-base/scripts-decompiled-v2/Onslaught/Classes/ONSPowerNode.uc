class ONSPowerNode extends ONSPowerCore
	abstract
	config
	hidecategories(Lighting,LightColor,Karma,Force,DestroyableObjective);

var ONSPowerNodeEnergySphere EnergySphere;
var localized string NeutralString;
var localized string ConstructingString;

simulated event PostBeginPlay()
{
	super.PostBeginPlay();
	EnergySphere = Spawn(Class'Onslaught.ONSPowerNodeEnergySphere', self,, Location + vect(0.0000000, 0.0000000, 370.0000000));
	Skins = default.Skins;
	//return;	
}

function SpawnNodeTeleportTrigger()
{
	//return;	
}

simulated function string GetHumanReadableName()
{
	// End:0x43
	if(int(CoreStage) == 0)
	{
		return (((ObjectiveStringPrefix $ Class'Engine.TeamInfo'.default.ColorNames[int(DefenderTeamIndex)]) $ ObjectiveStringSuffix) $ " ") $ string(NodeNum);		
	}
	else
	{
		// End:0x87
		if(int(CoreStage) == 2)
		{
			return (((ObjectiveStringPrefix $ Class'Engine.TeamInfo'.default.ColorNames[int(DefenderTeamIndex)]) $ ConstructingString) $ " ") $ string(NodeNum);			
		}
		else
		{
			return (NeutralString $ " ") $ string(NodeNum);
		}
	}
	//return;	
}

simulated function PowerCoreNeutral()
{
	super.PowerCoreNeutral();
	Skins = default.Skins;
	bHidden = false;
	// End:0x43
	if(EnergySphere != none)
	{
		EnergySphere.bHidden = true;
		EnergySphere.SetCollision(false, false);
	}
	//return;	
}

simulated function PowerCoreConstructing()
{
	super.PowerCoreConstructing();
	// End:0x69
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		// End:0x4C
		if(int(DefenderTeamIndex) == 0)
		{
			EnergySphere.Skins = EnergySphere.RedConstructingSkins;			
		}
		else
		{
			EnergySphere.Skins = EnergySphere.BlueConstructingSkins;
		}
	}
	EnergySphere.bHidden = false;
	EnergySphere.SetCollision(true, true);
	// End:0xCF
	if(int(Role) == int(ROLE_Authority))
	{
		// End:0xB5
		if(int(DefenderTeamIndex) == 0)
		{
			BroadcastLocalizedMessage(Class'Onslaught.ONSOnslaughtMessage', 23);			
		}
		else
		{
			// End:0xCF
			if(int(DefenderTeamIndex) == 1)
			{
				BroadcastLocalizedMessage(Class'Onslaught.ONSOnslaughtMessage', 24);
			}
		}
	}
	//return;	
}

simulated function PowerCoreActive()
{
	super.PowerCoreActive();
	// End:0x93
	if(EnergySphere != none)
	{
		EnergySphere.bHidden = false;
		EnergySphere.SetCollision(true, true);
		// End:0x93
		if(int(Level.NetMode) != int(NM_DedicatedServer))
		{
			// End:0x76
			if(int(DefenderTeamIndex) == 0)
			{
				EnergySphere.Skins = EnergySphere.RedActiveSkins;				
			}
			else
			{
				EnergySphere.Skins = EnergySphere.BlueActiveSkins;
			}
		}
	}
	//return;	
}

simulated function PowerCoreDestroyed()
{
	Health = 0;
	EnergySphere.bHidden = true;
	EnergySphere.SetCollision(false, false);
	// End:0x6C
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		PlaySound(DestroyedSound, 1, 5.0000000);
		Spawn(Class'Onslaught.ONSSmallVehicleExplosionEffect', self,, Location + vect(0.0000000, 0.0000000, 200.0000000));
	}
	// End:0xBC
	if(int(Role) == int(ROLE_Authority))
	{
		NetUpdateTime = Level.TimeSeconds - float(1);
		Scorers.Length = 0;
		UpdateCloseActors();
		NotifyUpdateLinks();
		DefenderTeamIndex = 2;
		GotoState('DestroyedCore');
	}
	UpdateLinkState(self);
	//return;	
}

simulated function PowerCoreDisabled()
{
	super.PowerCoreDisabled();
	// End:0x30
	if(EnergySphere != none)
	{
		EnergySphere.bHidden = true;
		EnergySphere.SetCollision(false, false);
	}
	//return;	
}

function bool TellBotHowToHeal(Bot B)
{
	local Vector AdjustedLoc;

	// End:0x47
	if((Vehicle(B.Pawn) != none) && Vehicle(B.Pawn).ImportantVehicle())
	{
		return TooClose(B);
	}
	AdjustedLoc = EnergySphere.Location;
	AdjustedLoc.Z = B.Pawn.Location.Z;
	// End:0x11E
	if(VSize(AdjustedLoc - B.Pawn.Location) < float(50))
	{
		B.GoalString = "Move away from " $ string(self);
		B.RouteGoal = B.FindRandomDest();
		B.MoveTarget = B.RouteCache[0];
		B.SetAttractionState();
		return true;		
	}
	else
	{
		// End:0x1B0
		if(VSize(EnergySphere.Location - B.Pawn.Location) > float(1050))
		{
			B.GoalString = "Move closer to " $ string(self);
			// End:0x1AE
			if(B.FindBestPathToward(B.RouteGoal, false, true))
			{
				B.SetAttractionState();
				return true;				
			}
			else
			{
				return false;
			}
		}
	}
	return super(DestroyableObjective).TellBotHowToHeal(B);
	//return;	
}

defaultproperties
{
	NeutralString="Neutral PowerNode"
	ConstructingString=" Constructing PowerNode"
	ActiveSound=Sound'ONSVehicleSounds-S.PowerNode.PwrNodeActive02'
	bFinalCore=false
	RedConstructingSkins[0]=Texture'ONSstructureTextures.CoreGroup.PowerNodeTEX'
	RedConstructingSkins[1]=FinalBlend'ONSstructureTextures.CoreGroup.powerNodeUpperFLAREredFinal'
	BlueConstructingSkins[0]=Texture'ONSstructureTextures.CoreGroup.PowerNodeTEX'
	BlueConstructingSkins[1]=FinalBlend'ONSstructureTextures.CoreGroup.powerNodeUpperFLAREblueFinal'
	RedActiveSkins[0]=Texture'ONSstructureTextures.CoreGroup.PowerNodeTEX'
	RedActiveSkins[1]=FinalBlend'ONSstructureTextures.CoreGroup.powerNodeUpperFLAREredFinal'
	BlueActiveSkins[0]=Texture'ONSstructureTextures.CoreGroup.PowerNodeTEX'
	BlueActiveSkins[1]=FinalBlend'ONSstructureTextures.CoreGroup.powerNodeUpperFLAREblueFinal'
	CoreStage=4
	DestructionMessageIndex=16
	DestroyedEvent[0]="red_powernode_destroyed"
	DestroyedEvent[1]="blue_powernode_destroyed"
	DestroyedEvent[2]="red_constructing_powernode_destroyed"
	DestroyedEvent[3]="blue_constructing_powernode_destroyed"
	ConstructedEvent[0]="red_powernode_constructed"
	ConstructedEvent[1]="blue_powernode_constructed"
	ShieldClass=Class'Onslaught.ONSPowerNodeShield'
	ShieldOffset=(X=0.0000000,Y=0.0000000,Z=220.0000000)
	DamageCapacity=2000
	LinkHealMult=1.0000000
	AIShootOffset=(X=0.0000000,Y=0.0000000,Z=370.0000000)
	DefensePriority=1
	Score=5
	ObjectiveStringSuffix=" PowerNode"
	bDestinationOnly=false
	StaticMesh=StaticMesh'VMStructures.CoreGroup.powerNodeBaseSM'
	DrawScale=2.0000000
	PrePivot=(X=0.0000000,Y=0.0000000,Z=25.0000000)
	CollisionRadius=160.0000000
	CollisionHeight=30.0000000
	bPathColliding=false
}
