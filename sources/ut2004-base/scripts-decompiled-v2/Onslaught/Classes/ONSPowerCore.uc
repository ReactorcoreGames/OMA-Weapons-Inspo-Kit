class ONSPowerCore extends DestroyableObjective
	abstract
	config
	hidecategories(Lighting,LightColor,Karma,Force,DestroyableObjective);

var(Events) name RedActivationEventName;
var(Events) name BlueActivationEventName;
var(Events) name DestroyedEventName;
var() float ConstructionTime;
var() StaticMesh DeadStaticMesh;
var() Sound DestroyedSound;
var() Sound ConstructedSound;
var() Sound StartConstructionSound;
var() Sound ActiveSound;
var() Sound NeutralSound;
var() Sound HealingSound;
var() Sound HealedSound;
var() bool bStartNeutral;
var() bool bPowered;
var() bool bFinalCore;
var bool bPoweredByRed;
var bool bPoweredByBlue;
var bool bSevered;
var bool bUnderAttack;
var bool bOldUnderAttack;
var globalconfig bool bShowNodeBeams;
var array<name> LinkedNodes;
var array<ONSPowerCore> PowerLinks;
var array<Material> RedConstructingSkins;
var array<Material> BlueConstructingSkins;
var array<Material> RedActiveSkins;
var array<Material> BlueActiveSkins;
var byte CoreStage;
var byte LastCoreStage;
var byte FinalCoreDistance[2];
var float ConstructionTimeElapsed;
var float LastAttackTime;
var float LastAttackExpirationTime;
var float LastAttackAnnouncementTime;
var float LastAttackMessageTime;
var float SeveredDamagePerSecond;
var float HealingTime;
var array<Actor> CloseActors;
var array<ONSTeleportPad> TeleportPads;
var Triggers TeleportTrigger;
var int DestructionMessageIndex;
var string DestroyedEvent[4];
var string ConstructedEvent[2];
var Controller Constructor;
var Controller LastHealedBy;
var ONSNodeHealEffect NodeHealEffect;
var Emitter NodeBeamEffect;
var Emitter ExplosionEffect;
var ONSFreeRoamingEnergyEffect RoamingEnergy;
var ONSPowerCoreShield Shield;
var Class<ONSPowerCoreShield> ShieldClass;
var Vector ShieldOffset;
var PlayerReplicationInfo LastDamagedBy;
var Pawn LastAttacker;
var ONSPowerCore NextCore;
var byte LastDefenderTeamIndex;
var(HUD) Vector HUDLocation;
var int NodeNum;
//var delegate<UpdateLinkState> __UpdateLinkState__Delegate;
//var delegate<NotifyUpdateLinks> __NotifyUpdateLinks__Delegate;
//var delegate<OnCoreDestroyed> __OnCoreDestroyed__Delegate;

replication
{
	// Pos:0x000
	reliable if(bNetDirty && int(Role) == int(ROLE_Authority))
		CoreStage, bPoweredByBlue, 
		bPoweredByRed, bSevered, 
		bUnderAttack;
}

delegate UpdateLinkState(ONSPowerCore Node)
{
	//return;	
}

delegate NotifyUpdateLinks()
{
	//return;	
}

delegate OnCoreDestroyed(byte DestroyedCoreIndex)
{
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	local int i;

	i = 0;
	J0x07:

	// End:0x3B [Loop If]
	if(i < RedConstructingSkins.Length)
	{
		Level.AddPrecacheMaterial(RedConstructingSkins[i]);
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	i = 0;
	J0x42:

	// End:0x76 [Loop If]
	if(i < BlueConstructingSkins.Length)
	{
		Level.AddPrecacheMaterial(BlueConstructingSkins[i]);
		i++;
		// [Loop Continue]
		goto J0x42;
	}
	i = 0;
	J0x7D:

	// End:0xB1 [Loop If]
	if(i < RedActiveSkins.Length)
	{
		Level.AddPrecacheMaterial(RedActiveSkins[i]);
		i++;
		// [Loop Continue]
		goto J0x7D;
	}
	i = 0;
	J0xB8:

	// End:0xEC [Loop If]
	if(i < BlueActiveSkins.Length)
	{
		Level.AddPrecacheMaterial(BlueActiveSkins[i]);
		i++;
		// [Loop Continue]
		goto J0xB8;
	}
	Level.AddPrecacheMaterial(Texture'AW-2004Particles.Energy.AirBlast');
	Level.AddPrecacheMaterial(Texture'AW-2004Particles.Energy.PowerBeam');
	Level.AddPrecacheMaterial(Texture'ONSstructureTextures.CoreBreachGroup.exp7_framesBLUE');
	Level.AddPrecacheMaterial(Texture'ONSstructureTextures.CoreBreachGroup.coreBreachACCRETIONblue');
	Level.AddPrecacheMaterial(Texture'ONSstructureTextures.CoreBreachGroup.CoreBreachShockRingTRANS');
	Level.AddPrecacheMaterial(Texture'ONSstructureTextures.CoreBreachGroup.CoreBreachShockRINGedge');
	Level.AddPrecacheMaterial(Texture'VMparticleTextures.PowerNodeEXP.powerNodeEXPblueTEX');
	Level.AddPrecacheMaterial(Texture'ONSstructureTextures.CoreBreachGroup.coreBreachACCRETIONred');
	Level.AddPrecacheMaterial(Texture'VMparticleTextures.PowerNodeEXP.powerNodeEXPredTEX');
	super(GameObjective).UpdatePrecacheMaterials();
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	// End:0x1F
	if(DeadStaticMesh != none)
	{
		Level.AddPrecacheStaticMesh(DeadStaticMesh);
	}
	super(Actor).UpdatePrecacheStaticMeshes();
	//return;	
}

event SetInitialState()
{
	Disable('Tick');
	InitialState = 'None';
	// End:0x3C
	if(PowerLinks.Length == 0)
	{
		CoreStage = byte(255);
		PowerCoreDisabled();
		InitialState = 'DisabledCore';		
	}
	else
	{
		// End:0x61
		if(bStartNeutral)
		{
			CoreStage = 4;
			PowerCoreNeutral();
			InitialState = 'NeutralCore';			
		}
		else
		{
			CoreStage = 0;
			PowerCoreActive();
		}
	}
	super(Actor).SetInitialState();
	//return;	
}

simulated event BeginPlay()
{
	PowerLinks.Length = 0;
	//return;	
}

simulated event PostBeginPlay()
{
	local bool bWasDisabled;

	bWasDisabled = bDisabled;
	super.PostBeginPlay();
	bDisabled = bWasDisabled;
	Shield = Spawn(ShieldClass, self,, Location + ShieldOffset);
	SetupPowerLinks();
	// End:0x58
	if(int(Role) == int(ROLE_Authority))
	{
		SpawnNodeTeleportTrigger();
	}
	//return;	
}

function SpawnNodeTeleportTrigger()
{
	TeleportTrigger = Spawn(Class'Onslaught.ONSPCTeleportTrigger', self);
	//return;	
}

simulated event PostNetBeginPlay()
{
	FindCloseActors();
	CheckShield();
	//return;	
}

simulated function ONSPowerCore ClosestTo(Actor A)
{
	local float Distance, BestDistance;
	local ONSPowerCore C, Best;

	BestDistance = VSize(A.Location - Location);
	Best = self;
	C = NextCore;
	J0x2F:

	// End:0xA9 [Loop If]
	if((C != self) && C != none)
	{
		Distance = VSize(A.Location - C.Location);
		// End:0x92
		if(Distance < BestDistance)
		{
			BestDistance = Distance;
			Best = C;
		}
		C = C.NextCore;
		// [Loop Continue]
		goto J0x2F;
	}
	return Best;
	//return;	
}

simulated function FindCloseActors()
{
	local Actor A;

	CloseActors.Length = 0;
	// End:0xF9
	if(int(Role) == int(ROLE_Authority))
	{
		// End:0xF5
		foreach AllActors(Class'Engine.Actor', A)
		{
			// End:0xF4
			if(((((A.IsA('PlayerStart') || A.IsA('ONSVehicleFactory')) || A.IsA('ONSStationaryWeaponPawn')) || A.IsA('xTeamBanner')) || A.IsA('ONSTeleportPad')) && (ClosestTo(A)) == self)
			{
				// End:0xE2
				if(A.IsA('ONSTeleportPad'))
				{
					A.SetOwner(self);
					TeleportPads[TeleportPads.Length] = ONSTeleportPad(A);
					// End:0xF4
					continue;
				}
				CloseActors[CloseActors.Length] = A;
			}			
		}				
	}
	else
	{
		// End:0x194
		foreach AllActors(Class'Engine.Actor', A)
		{
			// End:0x193
			if((A.IsA('xTeamBanner') || A.IsA('ONSTeleportPad')) && (ClosestTo(A)) == self)
			{
				// End:0x181
				if(A.IsA('ONSTeleportPad'))
				{
					A.SetOwner(self);
					TeleportPads[TeleportPads.Length] = ONSTeleportPad(A);
					// End:0x193
					continue;
				}
				CloseActors[CloseActors.Length] = A;
			}			
		}		
	}
	//return;	
}

simulated function SetupPowerLinks()
{
	local ONSPowerCore PC;
	local NavigationPoint N;

	N = Level.NavigationPointList;
	J0x14:

	// End:0xBB [Loop If]
	if(N != none)
	{
		PC = ONSPowerCore(N);
		// End:0xA4
		if(PC != none)
		{
			// End:0x8B
			if(NextCore == none)
			{
				// End:0x67
				if(PC.NextCore == none)
				{
					NextCore = PC;					
				}
				else
				{
					NextCore = PC.NextCore;
				}
				PC.NextCore = self;
			}
			// End:0xA4
			if(ShouldLinkTo(PC))
			{
				AddPowerLink(PC);
			}
		}
		N = N.nextNavigationPoint;
		// [Loop Continue]
		goto J0x14;
	}
	//return;	
}

simulated function ResetLinks()
{
	local ONSPowerCore Core;

	PowerLinks.Remove(0, PowerLinks.Length);
	Core = NextCore;
	J0x18:

	// End:0x31 [Loop If]
	if(ShouldLinkTo(Core))
	{
		AddPowerLink(Core);
	}
	Core = Core.NextCore;
	// End:0x18
	if(!((Core == none) || Core == self))
		goto J0x18;
	SetInitialState();
	//return;	
}

function Sever()
{
	// End:0x7C
	if((Level.Game.ResetCountDown <= 0) && !Level.Game.bGameEnded)
	{
		SetTimer(1.0000000, true);
		// End:0x62
		if(int(DefenderTeamIndex) == 0)
		{
			BroadcastLocalizedMessage(Class'Onslaught.ONSOnslaughtMessage', 27);			
		}
		else
		{
			// End:0x7C
			if(int(DefenderTeamIndex) == 1)
			{
				BroadcastLocalizedMessage(Class'Onslaught.ONSOnslaughtMessage', 28);
			}
		}
	}
	//return;	
}

function UnSever()
{
	SetTimer(0.0000000, false);
	//return;	
}

simulated function AddPowerLink(ONSPowerCore PC)
{
	// End:0x1D
	if((PC == self) || LinkedTo(PC))
	{
		return;
	}
	PowerLinks[PowerLinks.Length] = PC;
	// End:0x54
	if(PC.bFinalCore)
	{
		DefensePriority = byte(Max(int(DefensePriority), 5));
	}
	PC.AddPowerLink(self);
	//return;	
}

simulated function RemovePowerLink(ONSPowerCore PC)
{
	local int i;

	i = FindNodeLinkIndex(PC);
	// End:0x44
	if(i != -1)
	{
		PowerLinks.Remove(i, 1);
		// End:0x44
		if(bFinalCore)
		{
			PC.RemovedCoreLink();
		}
	}
	//return;	
}

simulated function RemovedCoreLink()
{
	local int i;

	i = 0;
	J0x07:

	// End:0x3B [Loop If]
	if(i < PowerLinks.Length)
	{
		// End:0x31
		if(PowerLinks[i].bFinalCore)
		{
			return;
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	DefensePriority = default.DefensePriority;
	//return;	
}

protected simulated function bool ShouldLinkTo(ONSPowerCore Node)
{
	local int i;

	// End:0x0D
	if(Node == none)
	{
		return false;
	}
	i = 0;
	J0x14:

	// End:0x4E [Loop If]
	if(i < LinkedNodes.Length)
	{
		// End:0x44
		if(Node.Name == LinkedNodes[i])
		{
			return true;
		}
		i++;
		// [Loop Continue]
		goto J0x14;
	}
	return false;
	//return;	
}

simulated function bool LinkedTo(ONSPowerCore PC)
{
	return (FindNodeLinkIndex(PC)) != -1;
	//return;	
}

simulated function int FindNodeLinkIndex(ONSPowerCore Node)
{
	local int i;

	// End:0x11
	if(Node == none)
	{
		return -1;
	}
	i = 0;
	J0x18:

	// End:0x4D [Loop If]
	if(i < PowerLinks.Length)
	{
		// End:0x43
		if(PowerLinks[i] == Node)
		{
			return i;
		}
		i++;
		// [Loop Continue]
		goto J0x18;
	}
	return -1;
	//return;	
}

function DisableObjective(Pawn Instigator)
{
	local PlayerReplicationInfo PRI;

	// End:0xDF
	if(int(CoreStage) != 5)
	{
		// End:0x30
		if(Instigator != none)
		{
			PRI = Instigator.PlayerReplicationInfo;			
		}
		else
		{
			// End:0x4F
			if(DelayedDamageInstigatorController != none)
			{
				PRI = DelayedDamageInstigatorController.PlayerReplicationInfo;
			}
		}
		BroadcastLocalizedMessage(Class'Onslaught.ONSOnslaughtMessage', DestructionMessageIndex + int(DefenderTeamIndex), PRI);
		// End:0x9B
		if(bAccruePoints)
		{
			Level.Game.ScoreObjective(PRI, 0.0000000);			
		}
		else
		{
			// End:0xC3
			if(int(CoreStage) == 0)
			{
				ShareScore(Score, DestroyedEvent[int(DefenderTeamIndex)]);				
			}
			else
			{
				ShareScore(Score, DestroyedEvent[2 + int(DefenderTeamIndex)]);
			}
		}
	}
	CoreStage = 1;
	TriggerEvent(DestroyedEventName, self, none);
	PowerCoreDestroyed();
	UnrealMPGameInfo(Level.Game).ObjectiveDisabled(self);
	UnrealMPGameInfo(Level.Game).FindNewObjectives(self);
	TriggerEvent(Event, self, Instigator);
	//return;	
}

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType)
{
	local Controller InstigatorController;

	// End:0x68
	if(((((int(CoreStage) == 4) || int(CoreStage) == 1) || Damage <= 0) || Level.Game.ResetCountDown > 0) || Level.Game.bGameEnded)
	{
		return;
	}
	// End:0x90
	if((DamageType == none) || !DamageType.default.bDelayedDamage)
	{
		DelayedDamageInstigatorController = none;
	}
	// End:0xC8
	if((instigatedBy != none) && instigatedBy.Controller != none)
	{
		InstigatorController = instigatedBy.Controller;		
	}
	else
	{
		InstigatorController = DelayedDamageInstigatorController;
	}
	// End:0xED
	if((InstigatorController == none) && DamageType != none)
	{
		return;
	}
	// End:0x10D
	if(DamageType != none)
	{
		Damage *= DamageType.default.VehicleDamageScaling;
	}
	// End:0x14A
	if(instigatedBy != none)
	{
		// End:0x135
		if(instigatedBy.HasUDamage())
		{
			Damage *= float(2);
		}
		Damage *= instigatedBy.DamageScaling;
	}
	// End:0x3B6
	if((InstigatorController == none) || (InstigatorController.GetTeamNum() != int(DefenderTeamIndex)) && PoweredBy(byte(InstigatorController.GetTeamNum())))
	{
		NetUpdateTime = Level.TimeSeconds - float(1);
		AccumulatedDamage += Damage;
		// End:0x1E7
		if((DamageEventThreshold > 0) && AccumulatedDamage >= DamageEventThreshold)
		{
			TriggerEvent(TakeDamageEvent, self, instigatedBy);
			AccumulatedDamage = 0;
		}
		// End:0x235
		if(InstigatorController != none)
		{
			LastDamagedBy = InstigatorController.PlayerReplicationInfo;
			LastAttacker = instigatedBy;
			AddScorer(InstigatorController, FMin(float(Health), float(Damage)) / float(DamageCapacity));
		}
		// End:0x257
		if(bFinalCore)
		{
			NetUpdateTime = Level.TimeSeconds - float(1);
		}
		Health -= Damage;
		// End:0x27C
		if(Health < 0)
		{
			DisableObjective(instigatedBy);			
		}
		else
		{
			// End:0x3B3
			if(DamageType != none)
			{
				// End:0x39F
				if((LastAttackMessageTime + float(1)) < Level.TimeSeconds)
				{
					// End:0x335
					if(bFinalCore)
					{
						// End:0x2E3
						if((float(Health) / float(DamageCapacity)) > 0.5500000)
						{
							BroadcastLocalizedMessage(Class'Onslaught.ONSOnslaughtMessage', 7 + int(DefenderTeamIndex),,, self);							
						}
						else
						{
							// End:0x319
							if((float(Health) / float(DamageCapacity)) > 0.4500000)
							{
								BroadcastLocalizedMessage(Class'Onslaught.ONSOnslaughtMessage', 25 + int(DefenderTeamIndex),,, self);								
							}
							else
							{
								BroadcastLocalizedMessage(Class'Onslaught.ONSOnslaughtMessage', 18 + int(DefenderTeamIndex),,, self);
							}
						}						
					}
					else
					{
						BroadcastLocalizedMessage(Class'Onslaught.ONSOnslaughtMessage', 9 + int(DefenderTeamIndex),,, self);
					}
					UnrealTeamInfo(Level.GRI.Teams[int(DefenderTeamIndex)]).AI.CriticalObjectiveWarning(self, instigatedBy);
					LastAttackMessageTime = Level.TimeSeconds;
				}
				LastAttackTime = Level.TimeSeconds;
			}
		}		
	}
	else
	{
		// End:0x434
		if(PlayerController(InstigatorController) != none)
		{
			// End:0x3FF
			if(InstigatorController.GetTeamNum() != int(DefenderTeamIndex))
			{
				PlayerController(InstigatorController).ReceiveLocalizedMessage(Class'Onslaught.ONSOnslaughtMessage', 5);				
			}
			else
			{
				// End:0x434
				if(bFinalCore && DamageType == Class'XWeapons.DamTypeLinkShaft')
				{
					PlayerController(InstigatorController).ReceiveLocalizedMessage(Class'Onslaught.ONSOnslaughtMessage', 30);
				}
			}
		}
	}
	//return;	
}

function bool HealDamage(int Amount, Controller Healer, Class<DamageType> DamageType)
{
	// End:0x62
	if((((((int(CoreStage) == 4) || int(CoreStage) == 1) || Health <= 0) || Amount <= 0) || Healer == none) || !TeamLink(Healer.GetTeamNum()))
	{
		return false;
	}
	// End:0xA1
	if(Health >= DamageCapacity)
	{
		// End:0x9F
		if((Level.TimeSeconds - HealingTime) < 0.5000000)
		{
			PlaySound(HealedSound, 1, 5.0000000);
		}
		return false;
	}
	Amount = Min(int(float(Amount) * LinkHealMult), DamageCapacity - Health);
	Health += Amount;
	// End:0x120
	if(ONSPlayerReplicationInfo(Healer.PlayerReplicationInfo) != none)
	{
		ONSPlayerReplicationInfo(Healer.PlayerReplicationInfo).AddHealBonus((float(Amount) / float(DamageCapacity)) * float(Score));
	}
	NetUpdateTime = Level.TimeSeconds - float(1);
	HealingTime = Level.TimeSeconds;
	LastHealedBy = Healer;
	// End:0x1C8
	if(NodeHealEffect == none)
	{
		NodeHealEffect = Spawn(Class'Onslaught.ONSNodeHealEffect', self,, Location + vect(0.0000000, 0.0000000, 363.0000000));
		NodeHealEffect.AmbientSound = HealingSound;
		// End:0x1C8
		if(int(Level.NetMode) == int(NM_DedicatedServer))
		{
			NodeHealEffect.LifeSpan = 5000.0000000;
		}
	}
	Enable('Tick');
	return true;
	//return;	
}

simulated event Tick(float dt)
{
	// End:0x3D
	if((Level.TimeSeconds - HealingTime) > 0.5000000)
	{
		// End:0x36
		if(NodeHealEffect != none)
		{
			NodeHealEffect.Destroy();
		}
		Disable('Tick');
	}
	//return;	
}

simulated function bool PoweredBy(byte Team)
{
	// End:0x1A
	if((int(Team) == 0) && bPoweredByRed)
	{
		return true;
	}
	// End:0x34
	if((int(Team) == 1) && bPoweredByBlue)
	{
		return true;
	}
	return false;
	//return;	
}

function bool LinkedToCoreConstructingFor(byte Team)
{
	local int i;

	i = 0;
	J0x07:

	// End:0x83 [Loop If]
	if(i < PowerLinks.Length)
	{
		// End:0x79
		if((int(PowerLinks[i].DefenderTeamIndex) == int(Team)) && (int(PowerLinks[i].CoreStage) == 2) || int(PowerLinks[i].CoreStage) == 5)
		{
			return true;
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	return false;
	//return;	
}

simulated event PostNetReceive()
{
	// End:0x8C
	if(int(CoreStage) != int(LastCoreStage))
	{
		LastCoreStage = CoreStage;
		switch(CoreStage)
		{
			// End:0x33
			case 0:
				PowerCoreActive();
				// End:0x8C
				break;
			// End:0x41
			case 1:
				PowerCoreDestroyed();
				// End:0x8C
				break;
			// End:0x4F
			case 2:
				PowerCoreConstructing();
				// End:0x8C
				break;
			// End:0x5D
			case 3:
				PowerCoreReset();
				// End:0x8C
				break;
			// End:0x6B
			case 4:
				PowerCoreNeutral();
				// End:0x8C
				break;
			// End:0x79
			case 5:
				PowerCoreReconstitution();
				// End:0x8C
				break;
			// End:0x89
			case byte(255):
				PowerCoreDisabled();
				// End:0x8C
				break;
			// End:0xFFFF
			default:
				break;
		}
	}
	else
	{
		// End:0xB0
		if(bUnderAttack != bOldUnderAttack)
		{
			UnderAttackChange();
			bOldUnderAttack = bUnderAttack;
		}
		// End:0xD9
		if(int(DefenderTeamIndex) != int(LastDefenderTeamIndex))
		{
			LastDefenderTeamIndex = DefenderTeamIndex;
			UpdateLinkState(self);
		}
		CheckShield();
		//return;		
	}
}

simulated function NotifyLocalPlayerTeamReceived()
{
	CheckShield();
	//return;	
}

simulated function UnderAttackChange()
{
	// End:0x48
	if((NodeBeamEffect != none) && NodeBeamEffect.Emitters[2] != none)
	{
		NodeBeamEffect.Emitters[2].Disabled = !bUnderAttack;
	}
	//return;	
}

simulated function CheckShield()
{
	local PlayerController PC;

	UpdateLocationName();
	// End:0x8C
	if(NodeBeamEffect != none)
	{
		NodeBeamEffect.bHidden = !bShowNodeBeams;
		// End:0x8C
		if(((int(CoreStage) != 0) || NodeBeamEffect.IsA('ONSNodeBeamRedEffect') && int(DefenderTeamIndex) == 1) || NodeBeamEffect.IsA('ONSNodeBeamBlueEffect') && int(DefenderTeamIndex) == 0)
		{
			NodeBeamEffect.Destroy();
		}
	}
	// End:0x131
	if(PoweredBy(byte(int(1) - int(DefenderTeamIndex))))
	{
		Shield.bHidden = true;
		Shield.SetCollision(false);
		// End:0x12E
		if((((int(Level.NetMode) != int(NM_DedicatedServer)) && bShowNodeBeams) && int(CoreStage) == 0) && NodeBeamEffect == none)
		{
			// End:0x120
			if(int(DefenderTeamIndex) == 0)
			{
				NodeBeamEffect = Spawn(Class'Onslaught.ONSNodeBeamRedEffect');				
			}
			else
			{
				NodeBeamEffect = Spawn(Class'Onslaught.ONSNodeBeamBlueEffect');
			}
		}		
	}
	else
	{
		// End:0x186
		if((int(CoreStage) != 0) && int(CoreStage) != 2)
		{
			Shield.bHidden = true;
			Shield.SetCollision(false);
			// End:0x183
			if(NodeBeamEffect != none)
			{
				NodeBeamEffect.Destroy();
			}			
		}
		else
		{
			Shield.bHidden = false;
			Shield.SetCollision(true);
			Shield.SetTeam(DefenderTeamIndex);
			// End:0x1CF
			if(NodeBeamEffect != none)
			{
				NodeBeamEffect.Destroy();
			}
		}
	}
	// End:0x1FA
	if((int(Level.NetMode) == int(NM_DedicatedServer)) || int(CoreStage) != 4)
	{
		return;
	}
	PC = Level.GetLocalPlayerController();
	// End:0x270
	if(((PC == none) || PC.PlayerReplicationInfo == none) || !PC.PlayerReplicationInfo.bOnlySpectator && PC.PlayerReplicationInfo.Team == none)
	{
		return;
	}
	// End:0x2FF
	if((PoweredBy(byte(PC.GetTeamNum()))) || PC.PlayerReplicationInfo.bOnlySpectator && bPoweredByRed || bPoweredByBlue)
	{
		// End:0x2FC
		if(RoamingEnergy == none)
		{
			RoamingEnergy = Spawn(Class'Onslaught.ONSFreeRoamingEnergyEffect', self,, (Location + vect(0.0000000, 0.0000000, 30.0000000)) + (PrePivot * float(-2)));
		}		
	}
	else
	{
		// End:0x320
		if(RoamingEnergy != none)
		{
			RoamingEnergy.Kill();
			RoamingEnergy = none;
		}
	}
	//return;	
}

simulated function PowerCoreDisabled()
{
	bHidden = true;
	bPowered = false;
	// End:0x27
	if(RoamingEnergy != none)
	{
		RoamingEnergy.Destroy();
	}
	CheckShield();
	UpdateLinkState(self);
	//return;	
}

simulated function PowerCoreNeutral()
{
	AmbientSound = NeutralSound;
	Health = 0;
	bPowered = false;
	DefenderTeamIndex = 2;
	NetUpdateTime = Level.TimeSeconds - float(1);
	// End:0x5A
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		UpdateTeamBanners();
	}
	// End:0x8D
	if(int(Role) == int(ROLE_Authority))
	{
		NetUpdateTime = Level.TimeSeconds - float(1);
		NotifyUpdateLinks();
	}
	UpdateLinkState(self);
	//return;	
}

simulated function PowerCoreReconstitution()
{
	// End:0x7C
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		// End:0x30
		if(RoamingEnergy != none)
		{
			RoamingEnergy.Destroy();
		}
		// End:0x5E
		if(int(DefenderTeamIndex) == 0)
		{
			Spawn(Class'Onslaught.ONSRedEnergyEffect', self,, Location + vect(0.0000000, 0.0000000, -20.0000000));			
		}
		else
		{
			Spawn(Class'Onslaught.ONSBlueEnergyEffect', self,, Location + vect(0.0000000, 0.0000000, -20.0000000));
		}
	}
	//return;	
}

function bool LegitimateTargetOf(Bot B)
{
	// End:0x4D
	if(((int(DefenderTeamIndex) == B.Squad.Team.TeamIndex) || int(CoreStage) == 4) || int(CoreStage) == 1)
	{
		return false;
	}
	return super.LegitimateTargetOf(B);
	//return;	
}

simulated function PowerCoreDestroyed()
{
	local PlayerController PC;

	AmbientSound = none;
	Health = 0;
	// End:0x8A
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		PC = Level.GetLocalPlayerController();
		// End:0x64
		if(PC != none)
		{
			PC.ClientPlaySound(DestroyedSound, false, 2.0000000);			
		}
		else
		{
			PlaySound(DestroyedSound, 1, 5.0000000);
		}
		ExplosionEffect = Spawn(Class'Onslaught.ONSPowerCoreBreachEffect', self);
		Skins.Length = 0;
	}
	// End:0xE9
	if(int(Role) == int(ROLE_Authority))
	{
		NetUpdateTime = Level.TimeSeconds - float(1);
		Scorers.Length = 0;
		UpdateCloseActors();
		OnCoreDestroyed(DefenderTeamIndex);
		NotifyUpdateLinks();
		DefenderTeamIndex = 2;
		GotoState('DestroyedCore');
	}
	UpdateLinkState(self);
	//return;	
}

function UpdateCloseActors()
{
	local int i;
	local Actor A;
	local ONSVehicle V;

	i = 0;
	J0x07:

	// End:0xE8 [Loop If]
	if(i < CloseActors.Length)
	{
		A = CloseActors[i];
		// End:0x52
		if(A.IsA('PlayerStart'))
		{
			PlayerStart(A).bEnabled = false;
		}
		// End:0x7A
		if(A.IsA('ONSVehicleFactory'))
		{
			ONSVehicleFactory(A).Deactivate();
		}
		// End:0xDE
		if(A.IsA('ONSStationaryWeaponPawn') && !bFinalCore)
		{
			ONSStationaryWeaponPawn(A).bPowered = false;
			ONSStationaryWeaponPawn(A).KDriverLeave(true);
			ONSStationaryWeaponPawn(A).Team = byte(255);
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	// End:0x140
	foreach DynamicActors(Class'Onslaught.ONSVehicle', V)
	{
		// End:0x13F
		if((V.bTeamLocked && V.Health > 0) && (ClosestTo(V)) == self)
		{
			V.Destroy();
		}		
	}	
	//return;	
}

function float RateCore()
{
	local int i;
	local float Result;

	i = 0;
	J0x07:

	// End:0xBC [Loop If]
	if(i < CloseActors.Length)
	{
		// End:0xB2
		if(ONSVehicleFactory(CloseActors[i]) != none)
		{
			Result += (ONSVehicleFactory(CloseActors[i]).VehicleClass.default.MaxDesireability * ONSVehicleFactory(CloseActors[i]).VehicleClass.default.MaxDesireability);
			// End:0xB2
			if(ONSVehicleFactory(CloseActors[i]).VehicleClass.default.MaxDesireability > 0.6000000)
			{
				Result += 0.5000000;
			}
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	return Result;
	//return;	
}

simulated function PowerCoreConstructing()
{
	AmbientSound = HealingSound;
	// End:0x64
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		// End:0x3F
		if(int(DefenderTeamIndex) == 0)
		{
			Skins = RedConstructingSkins;			
		}
		else
		{
			Skins = BlueConstructingSkins;
		}
		Shield.SetTeam(DefenderTeamIndex);
		UpdateTeamBanners();
	}
	bHidden = false;
	NotifyUpdateLinks();
	UpdateLinkState(self);
	//return;	
}

simulated function PowerCoreActive()
{
	local Actor A;
	local int i;

	bHidden = false;
	AmbientSound = ActiveSound;
	// End:0xB4
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		// End:0x43
		if(RoamingEnergy != none)
		{
			RoamingEnergy.Destroy();
		}
		// End:0x5A
		if(ExplosionEffect != none)
		{
			ExplosionEffect.Destroy();
		}
		// End:0x75
		if(int(DefenderTeamIndex) == 0)
		{
			Skins = RedActiveSkins;			
		}
		else
		{
			Skins = BlueActiveSkins;
		}
		// End:0x9F
		if(Shield != none)
		{
			Shield.SetTeam(DefenderTeamIndex);
		}
		UpdateTeamBanners();
		PlaySound(ConstructedSound, 1, 5.0000000);
	}
	// End:0x1D4
	if(int(Role) == int(ROLE_Authority))
	{
		NotifyUpdateLinks();
		Scorers.Length = 0;
		i = 0;
		J0xDD:

		// End:0x1D4 [Loop If]
		if(i < CloseActors.Length)
		{
			A = CloseActors[i];
			// End:0x12B
			if(A.IsA('ONSVehicleFactory'))
			{
				ONSVehicleFactory(A).Activate(DefenderTeamIndex);
			}
			// End:0x16E
			if(A.IsA('PlayerStart'))
			{
				PlayerStart(A).TeamNumber = DefenderTeamIndex;
				PlayerStart(A).bEnabled = true;
			}
			// End:0x1CA
			if(A.IsA('ONSStationaryWeaponPawn'))
			{
				ONSStationaryWeaponPawn(A).bPowered = true;
				ONSStationaryWeaponPawn(A).SetTeamNum(DefenderTeamIndex);
				ONSStationaryWeaponPawn(A).PrevTeam = DefenderTeamIndex;
			}
			i++;
			// [Loop Continue]
			goto J0xDD;
		}
	}
	UpdateLinkState(self);
	//return;	
}

function Reset()
{
	Health = DamageCapacity;
	PowerCoreReset();
	//return;	
}

simulated function PowerCoreReset()
{
	// End:0x22
	if((RoamingEnergy != none) && bScriptInitialized)
	{
		RoamingEnergy.Destroy();
	}
	// End:0x81
	if(int(Role) == int(ROLE_Authority))
	{
		SetStaticMesh(default.StaticMesh);
		UpdateCloseActors();
		NetUpdateTime = Level.TimeSeconds - float(1);
		// End:0x72
		if(!bFinalCore)
		{
			DefenderTeamIndex = default.DefenderTeamIndex;
		}
		// End:0x81
		if(bScriptInitialized)
		{
			SetInitialState();
		}
	}
	UpdateLinkState(self);
	//return;	
}

simulated function UpdateTeamBanners()
{
	local int i;

	i = 0;
	J0x07:

	// End:0x9E [Loop If]
	if(i < CloseActors.Length)
	{
		// End:0x94
		if(xTeamBanner(CloseActors[i]) != none)
		{
			// End:0x5C
			if(int(CoreStage) == 0)
			{
				xTeamBanner(CloseActors[i]).Team = DefenderTeamIndex;				
			}
			else
			{
				xTeamBanner(CloseActors[i]).Team = byte(255);
			}
			xTeamBanner(CloseActors[i]).UpdateForTeam();
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	i = 0;
	J0xA5:

	// End:0x102 [Loop If]
	if(i < TeleportPads.Length)
	{
		// End:0xDF
		if(int(CoreStage) == 0)
		{
			TeleportPads[i].SetTeam(DefenderTeamIndex);
			// [Explicit Continue]
			goto J0xF8;
		}
		TeleportPads[i].SetTeam(byte(255));
		J0xF8:

		i++;
		// [Loop Continue]
		goto J0xA5;
	}
	//return;	
}

function float TeleportRating(Controller Asker, byte AskerTeam, byte SourceDist)
{
	local int i;
	local ONSVehicleFactory F;
	local Bot B;
	local float rating;

	B = Bot(Asker);
	i = 0;
	J0x17:

	// End:0x113 [Loop If]
	if(i < CloseActors.Length)
	{
		F = ONSVehicleFactory(CloseActors[i]);
		// End:0x109
		if((((F != none) && F.LastSpawned != none) && F.LastSpawned.bTeamLocked) && !F.LastSpawned.SpokenFor(Asker))
		{
			// End:0xD1
			if(B == none)
			{
				rating = FMax(rating, F.LastSpawned.MaxDesireability);
				// [Explicit Continue]
				goto J0x109;
			}
			rating = FMax(rating, B.Squad.VehicleDesireability(F.LastSpawned, B));
		}
		J0x109:

		i++;
		// [Loop Continue]
		goto J0x17;
	}
	return rating - (float(int(FinalCoreDistance[int(Abs(1.0000000 - float(AskerTeam)))]) - int(SourceDist)) * 0.1000000);
	//return;	
}

function bool HasUsefulVehicles(Controller Asker)
{
	local int i;
	local ONSVehicleFactory F;
	local Bot B;

	B = Bot(Asker);
	i = 0;
	J0x17:

	// End:0xC9 [Loop If]
	if(i < CloseActors.Length)
	{
		F = ONSVehicleFactory(CloseActors[i]);
		// End:0xBF
		if((((F != none) && F.LastSpawned != none) && F.LastSpawned.bTeamLocked) && (B == none) || B.Squad.VehicleDesireability(F.LastSpawned, B) > float(0))
		{
			return true;
		}
		i++;
		// [Loop Continue]
		goto J0x17;
	}
	return false;
	//return;	
}

simulated function string GetHumanReadableName()
{
	// End:0x35
	if(int(DefenderTeamIndex) > 1)
	{
		return (ObjectiveStringPrefix $ Class'Engine.TeamInfo'.default.ColorNames[int(default.DefenderTeamIndex)]) $ ObjectiveStringSuffix;		
	}
	else
	{
		return (ObjectiveStringPrefix $ Class'Engine.TeamInfo'.default.ColorNames[int(DefenderTeamIndex)]) $ ObjectiveStringSuffix;
	}
	//return;	
}

function UsedBy(Pawn User)
{
	// End:0x81
	if(((Vehicle(User) == none) && PlayerController(User.Controller) != none) && User.GetTeamNum() == int(DefenderTeamIndex))
	{
		PlayerController(User.Controller).ClientOpenMenu(Level.Game.GameUMenuType,, "TL");
	}
	//return;	
}

function bool StandGuard(Bot B)
{
	local Bot SquadMate;
	local float Dist;
	local int i;

	// End:0x3E
	if((int(DefenderTeamIndex) != B.PlayerReplicationInfo.Team.TeamIndex) && int(DefenderTeamIndex) < 2)
	{
		return false;
	}
	// End:0x3A6
	if((ONSVehicle(B.Pawn) != none) && Vehicle(B.Pawn).ImportantVehicle())
	{
		Dist = VSize(B.Pawn.Location - Location);
		// End:0x3A6
		if((Dist < Vehicle(B.Pawn).ObjectiveGetOutDist) && B.LineOfSightTo(self))
		{
			// End:0x14F
			if(((ONSVehicle(B.Pawn) != none) && ONSVehicle(B.Pawn).bKeyVehicle) && B.Pawn.CanAttack(self))
			{
				ONSVehicle(B.Pawn).Deploy();
				return true;
			}
			// End:0x1BC
			if((int(DefenderTeamIndex) == B.PlayerReplicationInfo.Team.TeamIndex) || (B.Enemy != none) && (Level.TimeSeconds - B.LastSeenTime) < float(2))
			{
				return true;
			}
			// End:0x2C7
			if(ONSVehicle(B.Pawn).WeaponPawns.Length > 0)
			{
				i = 0;
				J0x1E6:

				// End:0x2C7 [Loop If]
				if(i < ONSVehicle(B.Pawn).WeaponPawns.Length)
				{
					SquadMate = Bot(ONSVehicle(B.Pawn).WeaponPawns[i].Controller);
					// End:0x2BD
					if(SquadMate != none)
					{
						ONSVehicle(B.Pawn).WeaponPawns[i].TeamUseTime = Level.TimeSeconds + float(8);
						ONSVehicle(B.Pawn).WeaponPawns[i].KDriverLeave(false);
						return true;
					}
					i++;
					// [Loop Continue]
					goto J0x1E6;
				}
			}
			SquadMate = B.Squad.SquadMembers;
			J0x2E4:

			// End:0x3A6 [Loop If]
			if(SquadMate != none)
			{
				// End:0x38F
				if((((SquadMate.Pawn != none) && (Vehicle(SquadMate.Pawn) == none) || !Vehicle(SquadMate.Pawn).ImportantVehicle()) && VSize(SquadMate.Pawn.Location - Location) < (Dist + float(2000))) && SquadMate.RouteGoal == self)
				{
					return true;
				}
				SquadMate = SquadMate.NextSquadMember;
				// [Loop Continue]
				goto J0x2E4;
			}
		}
	}
	return false;
	//return;	
}

function bool TooClose(Bot B)
{
	local Bot SquadMate;
	local int R;

	// End:0x17D
	if((VSize(Location - B.Pawn.Location) < (float(2) * B.Pawn.CollisionRadius)) && PathList.Length > 1)
	{
		B.GoalString = "Move away from " $ string(self);
		R = Rand(PathList.Length - 1);
		B.MoveTarget = PathList[R].End;
		SquadMate = B.Squad.SquadMembers;
		J0xC6:

		// End:0x16C [Loop If]
		if(SquadMate != none)
		{
			// End:0x155
			if((SquadMate.Pawn != none) && VSize(SquadMate.Pawn.Location - B.MoveTarget.Location) < B.CollisionRadius)
			{
				B.MoveTarget = PathList[R + 1].End;
				// [Explicit Break]
				goto J0x16C;
			}
			SquadMate = SquadMate.NextSquadMember;
			// [Loop Continue]
			goto J0xC6;
		}
		J0x16C:

		B.SetAttractionState();
		return true;
	}
	return false;
	//return;	
}

function bool TellBotHowToDisable(Bot B)
{
	// End:0x56
	if((int(CoreStage) == 4) || int(CoreStage) == 1)
	{
		// End:0x37
		if(StandGuard(B))
		{
			return TooClose(B);
		}
		return B.Squad.FindPathToObjective(B, self);
	}
	// End:0x84
	if(int(DefenderTeamIndex) == B.Squad.Team.TeamIndex)
	{
		return false;
	}
	// End:0xE8
	if(!PoweredBy(byte(B.Squad.Team.TeamIndex)))
	{
		// End:0xC9
		if(B.CanAttack(self))
		{
			return false;			
		}
		else
		{
			return B.Squad.FindPathToObjective(B, self);
		}
	}
	// End:0x16C
	if(((((B.Enemy != none) && B.Enemy.bStationary) && B.EnemyVisible()) && Vehicle(B.Enemy) != none) && Vehicle(B.Enemy).bDefensive)
	{
		return false;
	}
	// End:0x186
	if(StandGuard(B))
	{
		return TooClose(B);
	}
	return super.TellBotHowToDisable(B);
	//return;	
}

function bool KillEnemyFirst(Bot B)
{
	// End:0x93
	if(((bFinalCore || !bUnderAttack) || float(Health) < (float(DamageCapacity) * 0.2500000)) || ((Vehicle(B.Pawn) != none) && Vehicle(B.Pawn).IndependentVehicle()) && Vehicle(B.Pawn).HasOccupiedTurret())
	{
		return false;
	}
	// End:0x1A9
	if(((B.Enemy != none) && B.Enemy.Controller != none) && B.Enemy.CanAttack(B.Pawn))
	{
		// End:0x185
		if((B.Aggressiveness > 0.4000000) || (B.Pawn.IsA('ONSHoverBike') && Vehicle(B.Enemy) == none) && VSize(B.Enemy.Location - B.Pawn.Location) < float(1500))
		{
			return true;
		}
		return B.LastUnderFire > (Level.TimeSeconds - float(1));
	}
	// End:0x25B
	if(((((Level.TimeSeconds - HealingTime) < float(1)) && LastHealedBy != none) && LastHealedBy.Pawn != none) && LastHealedBy.Pawn.Health > 0)
	{
		// End:0x25B
		if(B.Squad.SetEnemy(B, LastHealedBy.Pawn) && B.Enemy == LastHealedBy.Pawn)
		{
			return true;
		}
	}
	return false;
	//return;	
}

function bool NearObjective(Pawn P)
{
	// End:0x1A
	if(P.CanAttack(GetShootTarget()))
	{
		return true;
	}
	return (VSize(Location - P.Location) < BaseRadius) && P.LineOfSightTo(self);
	//return;	
}

function CheckTouching()
{
	local Pawn P;

	// End:0x1F
	foreach BasedActors(Class'Engine.Pawn', P)
	{
		Bump(P);		
		return;		
	}	
	//return;	
}

event Timer()
{
	// End:0x23
	if(!bSevered || int(CoreStage) == 4)
	{
		UnSever();
		return;
	}
	TakeDamage(int(SeveredDamagePerSecond), none, vect(0.0000000, 0.0000000, 0.0000000), vect(0.0000000, 0.0000000, 0.0000000), none);
	//return;	
}

simulated function bool HasHealthBar()
{
	return ((int(CoreStage) == 0) || int(CoreStage) == 2) || int(CoreStage) == 5;
	//return;	
}

singular simulated function UpdateHUDLocation(float ScreenX, float ScreenY, float RadarWidth, float Range, Vector Center)
{
	local Vector ScreenLocation;
	local float Dist;

	ScreenLocation = Location - Center;
	ScreenLocation.Z = 0.0000000;
	Dist = VSize(ScreenLocation);
	HUDLocation.X = ScreenX + (ScreenLocation.X * (RadarWidth / Range));
	HUDLocation.Y = ScreenY + (ScreenLocation.Y * (RadarWidth / Range));
	// End:0xB6
	if(NextCore != none)
	{
		NextCore.UpdateHUDLocation(ScreenX, ScreenY, RadarWidth, Range, Center);
	}
	//return;	
}

function SetTeam(byte TeamIndex)
{
	super(GameObjective).SetTeam(TeamIndex);
	// End:0x1E
	if(int(CoreStage) == 0)
	{
		PowerCoreActive();
	}
	//return;	
}

state NeutralCore
{
	function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType)
	{
		//return;		
	}

	function Bump(Actor Other)
	{
		// End:0x3F
		if(((Pawn(Other) == none) || !Pawn(Other).IsPlayerPawn()) || Vehicle(Other) != none)
		{
			return;
		}
		// End:0xC0
		if(PoweredBy(byte(Pawn(Other).GetTeamNum())))
		{
			NetUpdateTime = Level.TimeSeconds - float(1);
			DefenderTeamIndex = byte(Pawn(Other).GetTeamNum());
			Constructor = Pawn(Other).Controller;
			GotoState('Reconstruction');
			NotifyUpdateLinks();			
		}
		else
		{
			Pawn(Other).ReceiveLocalizedMessage(Class'Onslaught.ONSOnslaughtMessage', 6);
		}
		//return;		
	}

	function UsedBy(Pawn User)
	{
		//return;		
	}

	event BeginState()
	{
		CheckTouching();
		//return;		
	}
Begin:

	UpdateLinkState(self);
	stop;					
}

state DestroyedCore
{
	function ResetAllNodesTaken()
	{
		local int i;
		local TeamGame TeamGame;

		TeamGame = TeamGame(Level.Game);
		i = 0;
		J0x20:

		// End:0x64 [Loop If]
		if(i < 2)
		{
			ONSTeamAI(TeamGame.Teams[i].AI).bAllNodesTaken = false;
			i++;
			// [Loop Continue]
			goto J0x20;
		}
		//return;		
	}
Begin:

	Sleep(2.0000000);
	// End:0x1F
	if(bFinalCore)
	{
		SetStaticMesh(DeadStaticMesh);		
	}
	else
	{
		CoreStage = 4;
		PowerCoreNeutral();
		ResetAllNodesTaken();
		GotoState('NeutralCore');
	}
	UpdateLinkState(self);
	stop;			
}

state Reconstruction
{
	event Timer()
	{
		// End:0x11
		if(bSevered)
		{
			global.Timer();
			return;
		}
		// End:0x32
		if(Level.TimeSeconds < (LastAttackTime + 1.0000000))
		{
			return;
		}
		NetUpdateTime = Level.TimeSeconds - float(1);
		ConstructionTimeElapsed += 1.0000000;
		Health += int((1.0000000 / ConstructionTime) * float(DamageCapacity));
		// End:0x1CB
		if(Health > DamageCapacity)
		{
			SetTimer(0.0000000, false);
			Health = DamageCapacity;
			CoreStage = 0;
			// End:0xBD
			if(int(DefenderTeamIndex) == 1)
			{
				TriggerEvent(BlueActivationEventName, self, none);				
			}
			else
			{
				TriggerEvent(RedActivationEventName, self, none);
			}
			PowerCoreActive();
			// End:0xED
			if(int(DefenderTeamIndex) == 0)
			{
				BroadcastLocalizedMessage(Class'Onslaught.ONSOnslaughtMessage', 2);				
			}
			else
			{
				BroadcastLocalizedMessage(Class'Onslaught.ONSOnslaughtMessage', 3);
			}
			// End:0x1A6
			if((Constructor != none) && Constructor.PlayerReplicationInfo != none)
			{
				Constructor.AwardAdrenaline(float(Score));
				Level.Game.ScoreObjective(Constructor.PlayerReplicationInfo, float(Score) / 2.0000000);
				Level.Game.ScoreEvent(Constructor.PlayerReplicationInfo, float(Score) / 2.0000000, ConstructedEvent[int(DefenderTeamIndex)]);
			}
			UnrealMPGameInfo(Level.Game).FindNewObjectives(self);
			GotoState('None');
		}
		//return;		
	}

	function BeginState()
	{
		Scorers.Length = 0;
		PlaySound(StartConstructionSound, 1, 5.0000000);
		CoreStage = 5;
		PowerCoreReconstitution();
		//return;		
	}

	function Bump(Actor Other)
	{
		//return;		
	}

	function UsedBy(Pawn User)
	{
		//return;		
	}

	function UnSever()
	{
		//return;		
	}
Begin:

	Sleep(2.0000000);
	CoreStage = 2;
	PowerCoreConstructing();
	ConstructionTimeElapsed = 0.0000000;
	SetTimer(1.0000000, true);
	stop;		
}

state DisabledCore
{
	event BeginState()
	{
		NetUpdateTime = Level.TimeSeconds - float(1);
		SetCollision(false, false);
		bDisabled = true;
		SetTimer(0.0000000, false);
		NetUpdateFrequency = 0.1000000;
		//return;		
	}

	event EndState()
	{
		NetUpdateTime = Level.TimeSeconds - float(1);
		SetCollision(default.bCollideActors, default.bBlockActors);
		bDisabled = false;
		NetUpdateFrequency = default.NetUpdateFrequency;
		UnrealMPGameInfo(Level.Game).FindNewObjectives(self);
		//return;		
	}
Begin:

	UpdateLinkState(self);
	stop;					
}

defaultproperties
{
	ConstructionTime=30.0000000
	DeadStaticMesh=StaticMesh'VMStructures.CoreGroup.coreDead'
	DestroyedSound=Sound'ONSVehicleSounds-S.PowerCore.PowerCoreExplosion01'
	ConstructedSound=Sound'ONSVehicleSounds-S.PowerNode.whooshthunk'
	StartConstructionSound=Sound'ONSVehicleSounds-S.PowerNode.PwrNodeBuild02'
	ActiveSound=Sound'ONSVehicleSounds-S.PowerNode.PwrNodeActive01'
	NeutralSound=Sound'ONSVehicleSounds-S.PowerNode.PwrNodeNOTActive01'
	HealingSound=Sound'ONSVehicleSounds-S.PowerNode.PwrNodeStartBuild03'
	HealedSound=Sound'ONSVehicleSounds-S.PowerNode.PwrNodeBuilt01'
	bPowered=true
	bFinalCore=true
	bShowNodeBeams=true
	RedConstructingSkins[0]=FinalBlend'ONSstructureTextures.CoreConstructionRed'
	RedConstructingSkins[1]=FinalBlend'ONSstructureTextures.CoreGroup.InvisibleFinal'
	BlueConstructingSkins[0]=FinalBlend'ONSstructureTextures.CoreConstructionBlue'
	BlueConstructingSkins[1]=FinalBlend'ONSstructureTextures.CoreGroup.InvisibleFinal'
	RedActiveSkins[0]=Texture'ONSstructureTextures.CoreGroup.CoreDiffTEX'
	RedActiveSkins[1]=Shader'ONSstructureTextures.CoreGroup.CoreLightShader'
	BlueActiveSkins[0]=Texture'ONSstructureTextures.CoreGroup.CoreDiffTEX'
	BlueActiveSkins[1]=Shader'ONSstructureTextures.CoreGroup.CoreLightShader'
	LastCoreStage=250
	FinalCoreDistance[0]=255
	FinalCoreDistance[1]=255
	LastAttackExpirationTime=5.0000000
	SeveredDamagePerSecond=30.0000000
	DestructionMessageIndex=14
	DestroyedEvent[0]="red_powercore_destroyed"
	DestroyedEvent[1]="blue_powercore_destroyed"
	DestroyedEvent[2]="red_constructing_powercore_destroyed"
	DestroyedEvent[3]="blue_constructing_powercore_destroyed"
	ConstructedEvent[0]="red_powercore_constructed"
	ConstructedEvent[1]="blue_powercore_constructed"
	ShieldClass=Class'Onslaught.ONSPowerCoreShield'
	LastDefenderTeamIndex=2
	DamageCapacity=4500
	bMonitorUnderAttack=false
	bPlayCriticalAssaultAlarm=false
	DefensePriority=10
	Score=10
	DestructionMessage=""
	ObjectiveStringSuffix=" PowerCore"
	DrawType=8
	StaticMesh=StaticMesh'VMStructures.CoreGroup.CoreDivided'
	bHidden=false
	bIgnoreEncroachers=true
	bNotifyLocalPlayerTeamReceived=true
	SoundVolume=128
	SoundRadius=255.0000000
	CollisionRadius=120.0000000
	CollisionHeight=150.0000000
	bCollideWorld=true
	bBlockActors=true
	bBlockKarma=true
	bBlocksTeleport=true
	bNetNotify=true
	bPathColliding=true
}
