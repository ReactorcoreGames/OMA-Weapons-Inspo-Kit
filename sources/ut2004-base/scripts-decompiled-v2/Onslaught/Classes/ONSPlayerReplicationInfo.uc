class ONSPlayerReplicationInfo extends xPlayerReplicationInfo
	config(User)
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

enum EMapPreference
{
	MAP_Never,                      // 0
	MAP_WhenBodyStill,              // 1
	MAP_Immediately                 // 2
};

var ONSPowerCore StartCore;
var ONSPowerCore TemporaryStartCore;
var globalconfig ONSPlayerReplicationInfo.EMapPreference ShowMapOnDeath;
var bool bPendingMapDisplay;
var globalconfig string LinkDesignerClass;
var Material TransMaterials[2];
var float PendingHealBonus;
//var delegate<OnReceiveLink> __OnReceiveLink__Delegate;
//var delegate<OnRemoveLink> __OnRemoveLink__Delegate;
//var delegate<ResetLinks> __ResetLinks__Delegate;
//var delegate<ProcessSetupName> __ProcessSetupName__Delegate;
//var delegate<RemoveSetupName> __RemoveSetupName__Delegate;
//var delegate<SetCurrentSetup> __SetCurrentSetup__Delegate;
//var delegate<UpdateGUIMapLists> __UpdateGUIMapLists__Delegate;

replication
{
	// Pos:0x000
	reliable if(bNetDirty && int(Role) == int(ROLE_Authority))
		StartCore;

	// Pos:0x018
	reliable if(int(Role) < int(ROLE_Authority))
		RequestLinkDesigner, ServerClearPowerLinks, 
		ServerDeletePowerLinkSetup, ServerReceivePowerLink, 
		ServerRemovePowerLink, ServerSavePowerLinkSetup, 
		ServerSendPowerLinks, ServerSendSetupNames, 
		ServerSetPowerLinkSetup, SetStartCore, 
		TeleportTo;

	// Pos:0x025
	reliable if(int(Role) == int(ROLE_Authority))
		ClientPrepareToReceivePowerLinks, ClientReceiveCurrentSetup, 
		ClientReceivePowerLink, ClientReceiveSetupName, 
		ClientRemovePowerLink, ClientShowMap;
}

delegate OnReceiveLink(ONSPowerCore A, ONSPowerCore B)
{
	//return;	
}

delegate OnRemoveLink(ONSPowerCore A, ONSPowerCore B)
{
	//return;	
}

delegate ResetLinks()
{
	//return;	
}

delegate ProcessSetupName(string SetupName)
{
	//return;	
}

delegate RemoveSetupName(string SetupName)
{
	//return;	
}

delegate SetCurrentSetup(string SetupName)
{
	//return;	
}

delegate UpdateGUIMapLists()
{
	//return;	
}

function SetStartCore(ONSPowerCore Core, bool bTemporary)
{
	// End:0x62
	if((Core == none) || ONSOnslaughtGame(Level.Game).ValidSpawnPoint(Core, Team.TeamIndex))
	{
		// End:0x57
		if(bTemporary)
		{
			TemporaryStartCore = Core;			
		}
		else
		{
			StartCore = Core;
		}
	}
	//return;	
}

simulated function ONSPowerCore GetCurrentNode()
{
	local ONSPowerCore Core;
	local ONSPCTeleportTrigger t;

	// End:0xF8
	if(Controller(Owner).Pawn != none)
	{
		// End:0x9D
		if(Controller(Owner).Pawn.Base != none)
		{
			Core = ONSPowerCore(Controller(Owner).Pawn.Base);
			// End:0x9D
			if(Core == none)
			{
				Core = ONSPowerCore(Controller(Owner).Pawn.Base.Owner);
			}
		}
		// End:0xF8
		if(Core == none)
		{
			// End:0xF7
			foreach Controller(Owner).Pawn.TouchingActors(Class'Onslaught.ONSPCTeleportTrigger', t)
			{
				Core = ONSPowerCore(t.Owner);
				// End:0xF6
				if(Core != none)
				{
					// End:0xF7
					break;
				}				
			}			
		}
	}
	// End:0x146
	if(((Core != none) && int(Core.CoreStage) == 0) && int(Core.DefenderTeamIndex) == Team.TeamIndex)
	{
		return Core;
	}
	return none;
	//return;	
}

function TeleportTo(ONSPowerCore Core)
{
	local ONSPowerCore OldStartCore, OwnerBase;

	OwnerBase = GetCurrentNode();
	// End:0x85
	if((OwnerBase != none) && ONSOnslaughtGame(Level.Game).ValidSpawnPoint(Core, Team.TeamIndex))
	{
		OldStartCore = StartCore;
		StartCore = Core;
		// End:0x7A
		if(!DoTeleport() && !DoTeleport())
		{
		}
		StartCore = OldStartCore;
	}
	//return;	
}

function bool DoTeleport()
{
	local NavigationPoint NewStart;
	local Vector PrevLocation;

	PrevLocation = Controller(Owner).Pawn.Location;
	NewStart = Level.Game.FindPlayerStart(Controller(Owner));
	// End:0x141
	if((NewStart != none) && Controller(Owner).Pawn.SetLocation(NewStart.Location))
	{
		Controller(Owner).ClientSetRotation(NewStart.Rotation);
		// End:0xE9
		if(xPawn(Controller(Owner).Pawn) != none)
		{
			xPawn(Controller(Owner).Pawn).DoTranslocateOut(PrevLocation);
		}
		Controller(Owner).Pawn.SetOverlayMaterial(TransMaterials[Team.TeamIndex], 1.0000000, false);
		Controller(Owner).Pawn.PlayTeleportEffect(false, false);
		return true;
	}
	return false;
	//return;	
}

function OwnerDied()
{
	// End:0x16
	if(PlayerController(Owner) != none)
	{
		ClientShowMap();
	}
	//return;	
}

simulated function ClientShowMap()
{
	// End:0x21
	if(int(ShowMapOnDeath) > int(0))
	{
		bPendingMapDisplay = true;
		SetTimer(0.7500000, true);
	}
	//return;	
}

simulated event Timer()
{
	local PlayerController PC;

	// End:0x1AB
	if(bPendingMapDisplay)
	{
		PC = Level.GetLocalPlayerController();
		// End:0x19A
		if(((((PC != none) && !PC.bDemoOwner) && PC.Player != none) && GUIController(PC.Player.GUIController) != none) && !GUIController(PC.Player.GUIController).bActive)
		{
			// End:0xED
			if((PC.Pawn != none) && PC.Pawn.Health > 0)
			{
				bPendingMapDisplay = false;
				SetTimer(0.0000000, false);				
			}
			else
			{
				// End:0x186
				if((((int(ShowMapOnDeath) == int(2)) || PC.ViewTarget == none) || PC.ViewTarget == PC) || VSize(PC.ViewTarget.Velocity) < float(100))
				{
					PC.bMenuBeforeRespawn = false;
					bPendingMapDisplay = false;
					SetTimer(0.0000000, false);
					PC.ShowMidGameMenu(false);					
				}
				else
				{
					PC.bMenuBeforeRespawn = true;
				}
			}			
		}
		else
		{
			bPendingMapDisplay = false;
			SetTimer(0.0000000, false);
		}
	}
	super(PlayerReplicationInfo).Timer();
	//return;	
}

simulated function ClientPrepareToReceivePowerLinks()
{
	ResetLinks();
	//return;	
}

function ServerSendPowerLinks()
{
	local int i;
	local ONSOnslaughtGame Game;

	Game = ONSOnslaughtGame(Level.Game);
	i = 0;
	J0x20:

	// End:0x91 [Loop If]
	if(i < Game.PowerLinks.Length)
	{
		ClientReceivePowerLink(Game.PowerLinks[i].Nodes[0].Node, Game.PowerLinks[i].Nodes[1].Node);
		i++;
		// [Loop Continue]
		goto J0x20;
	}
	//return;	
}

simulated function ClientReceivePowerLink(ONSPowerCore From, ONSPowerCore To)
{
	OnReceiveLink(From, To);
	//return;	
}

simulated function ClientRemovePowerLink(ONSPowerCore From, ONSPowerCore To)
{
	OnRemoveLink(From, To);
	//return;	
}

function ServerReceivePowerLink(ONSPowerCore From, ONSPowerCore To)
{
	local int i;
	local GameReplicationInfo GRI;

	// End:0x4B
	if(((PlayerController(Owner) == none) || (Owner != Level.GetLocalPlayerController()) && !bAdmin) || From == To)
	{
		return;
	}
	// End:0x152
	if(ONSOnslaughtGame(Level.Game).AddLink(From, To))
	{
		ONSOnslaughtGame(Level.Game).UpdateLinks();
		GRI = Level.Game.GameReplicationInfo;
		i = 0;
		J0xB6:

		// End:0x152 [Loop If]
		if(i < GRI.PRIArray.Length)
		{
			// End:0x11B
			if((PlayerController(GRI.PRIArray[i].Owner) == none) || ONSPlayerReplicationInfo(GRI.PRIArray[i]) == none)
			{
				// [Explicit Continue]
				goto J0x148;
			}
			ONSPlayerReplicationInfo(GRI.PRIArray[i]).ClientReceivePowerLink(From, To);
			J0x148:

			i++;
			// [Loop Continue]
			goto J0xB6;
		}
	}
	//return;	
}

function ServerRemovePowerLink(ONSPowerCore From, ONSPowerCore To)
{
	local int i;
	local GameReplicationInfo GRI;

	// End:0x4B
	if(((PlayerController(Owner) == none) || (Owner != Level.GetLocalPlayerController()) && !bAdmin) || From == To)
	{
		return;
	}
	// End:0x152
	if(ONSOnslaughtGame(Level.Game).RemoveLink(From, To))
	{
		ONSOnslaughtGame(Level.Game).UpdateLinks();
		GRI = Level.Game.GameReplicationInfo;
		i = 0;
		J0xB6:

		// End:0x152 [Loop If]
		if(i < GRI.PRIArray.Length)
		{
			// End:0x11B
			if((PlayerController(GRI.PRIArray[i].Owner) == none) || ONSPlayerReplicationInfo(GRI.PRIArray[i]) == none)
			{
				// [Explicit Continue]
				goto J0x148;
			}
			ONSPlayerReplicationInfo(GRI.PRIArray[i]).ClientRemovePowerLink(From, To);
			J0x148:

			i++;
			// [Loop Continue]
			goto J0xB6;
		}
	}
	//return;	
}

function ServerClearPowerLinks()
{
	local int i;
	local ONSOnslaughtGame Game;

	// End:0x3A
	if((PlayerController(Owner) == none) || (Owner != Level.GetLocalPlayerController()) && !bAdmin)
	{
		return;
	}
	Game = ONSOnslaughtGame(Level.Game);
	J0x53:

	// End:0xB9 [Loop If]
	if(Game.PowerLinks.Length > 0)
	{
		ServerRemovePowerLink(Game.PowerLinks[i].Nodes[0].Node, Game.PowerLinks[i].Nodes[1].Node);
		// [Loop Continue]
		goto J0x53;
	}
	//return;	
}

function ServerSendSetupNames()
{
	local int X;

	// End:0x3A
	if((PlayerController(Owner) == none) || (Owner != Level.GetLocalPlayerController()) && !bAdmin)
	{
		return;
	}
	X = 0;
	J0x41:

	// End:0xB4 [Loop If]
	if((X < ONSOnslaughtGame(Level.Game).OfficialPowerLinkSetups.Length) && X < 1000)
	{
		ClientReceiveSetupName(ONSOnslaughtGame(Level.Game).OfficialPowerLinkSetups[X].SetupName);
		X++;
		// [Loop Continue]
		goto J0x41;
	}
	X = 0;
	J0xBB:

	// End:0x130 [Loop If]
	if((X < ONSOnslaughtGame(Level.Game).CustomPowerLinkSetups.Length) && X < 1000)
	{
		ClientReceiveSetupName(string(ONSOnslaughtGame(Level.Game).CustomPowerLinkSetups[X].Name));
		X++;
		// [Loop Continue]
		goto J0xBB;
	}
	ClientReceiveSetupName("");
	ClientReceiveCurrentSetup(ONSOnslaughtGame(Level.Game).CurrentSetupName);
	//return;	
}

simulated function ClientReceiveSetupName(string SetupName)
{
	ProcessSetupName(SetupName);
	//return;	
}

simulated function ClientReceiveCurrentSetup(string SetupName)
{
	SetCurrentSetup(SetupName);
	//return;	
}

function ServerSetPowerLinkSetup(string SetupName)
{
	// End:0x3A
	if((PlayerController(Owner) == none) || (Owner != Level.GetLocalPlayerController()) && !bAdmin)
	{
		return;
	}
	ONSOnslaughtGame(Level.Game).SetPowerLinkSetup(SetupName, PlayerController(Owner));
	//return;	
}

function ServerSavePowerLinkSetup(string SetupName)
{
	local array<ONSPowerCore> Traveled;

	// End:0x3A
	if((PlayerController(Owner) == none) || (Owner != Level.GetLocalPlayerController()) && !bAdmin)
	{
		return;
	}
	// End:0xF4
	if(!ONSOnslaughtGame(Level.Game).ExistsLinkPathTo(ONSOnslaughtGame(Level.Game).PowerCores[ONSOnslaughtGame(Level.Game).FinalCore[0]], ONSOnslaughtGame(Level.Game).PowerCores[ONSOnslaughtGame(Level.Game).FinalCore[1]], Traveled))
	{
		PlayerController(Owner).ReceiveLocalizedMessage(Class'Onslaught.ONSLinkDesignMessage', 7);
		return;
	}
	// End:0x138
	if(ONSOnslaughtGame(Level.Game).SavePowerLinkSetup(SetupName, PlayerController(Owner)))
	{
		ClientReceiveSetupName(SetupName);
		UpdateGUIMapLists();
	}
	//return;	
}

function ServerDeletePowerLinkSetup(string SetupName)
{
	// End:0x3A
	if((PlayerController(Owner) == none) || (Owner != Level.GetLocalPlayerController()) && !bAdmin)
	{
		return;
	}
	// End:0x7E
	if(ONSOnslaughtGame(Level.Game).DeletePowerLinkSetup(SetupName, PlayerController(Owner)))
	{
		ClientRemoveSetupName(SetupName);
		UpdateGUIMapLists();
	}
	//return;	
}

simulated function ClientRemoveSetupName(string SetupName)
{
	RemoveSetupName(SetupName);
	//return;	
}

function RequestLinkDesigner()
{
	// End:0x4F
	if((PlayerController(Owner) != none) && (Owner == Level.GetLocalPlayerController()) || bAdmin)
	{
		PlayerController(Owner).ClientOpenMenu(LinkDesignerClass);
	}
	//return;	
}

function AddHealBonus(float Bonus)
{
	PendingHealBonus += Bonus;
	// End:0x72
	if(PendingHealBonus >= 1.0000000)
	{
		Level.Game.ScoreObjective(self, PendingHealBonus);
		Level.Game.ScoreEvent(self, PendingHealBonus, "heal_powernode");
		PendingHealBonus = 0.0000000;
	}
	//return;	
}

function Reset()
{
	HasFlag = none;
	NumLives = 0;
	bOutOfLives = false;
	//return;	
}

defaultproperties
{
	ShowMapOnDeath=1
	LinkDesignerClass="GUI2K4.UT2K4OnslaughtPowerLinkDesigner"
	TransMaterials[0]=Shader'XGameShaders.PlayerShaders.PlayerTransRed'
	TransMaterials[1]=Shader'XGameShaders.PlayerShaders.PlayerTrans'
}
