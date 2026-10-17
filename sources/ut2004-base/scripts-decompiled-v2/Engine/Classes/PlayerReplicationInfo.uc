class PlayerReplicationInfo extends ReplicationInfo
	native
	nativereplication
	notplaceable
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var float Score;
var float Deaths;
var Decoration HasFlag;
var byte Ping;
var Volume PlayerVolume;
var ZoneInfo PlayerZone;
var int NumLives;
var string PlayerName;
var string CharacterName;
var string OldCharacterName;
var string OldName;
var string PreviousName;
var int PlayerID;
var TeamInfo Team;
var int TeamID;
var Class<VoicePack> VoiceType;
var string VoiceTypeName;
var bool bAdmin;
var bool bIsFemale;
var bool bIsSpectator;
var bool bOnlySpectator;
var bool bWaitingPlayer;
var bool bReadyToPlay;
var bool bOutOfLives;
var bool bBot;
var bool bWelcomed;
var bool bReceivedPing;
var bool bNoTeam;
var bool bTeamNotified;
var byte PacketLoss;
var int StartTime;
var localized string StringDead;
var localized string StringSpectating;
var localized string StringUnknown;
var int GoalsScored;
var int Kills;
var Vehicle CurrentVehicle;
var LinkedReplicationInfo CustomReplicationInfo;
var VoiceChatReplicationInfo VoiceInfo;
var bool bRegisteredChatRoom;
var VoiceChatRoom PrivateChatRoom;
var int ActiveChannel;
var int VoiceMemberMask;
var byte VoiceID;

replication
{
	// Pos:0x000
	reliable if(bNetDirty && int(Role) == int(ROLE_Authority))
		ActiveChannel, CharacterName, 
		Deaths, PlayerName, 
		PlayerVolume, PlayerZone, 
		Score, StartTime, 
		Team, TeamID, 
		VoiceID, VoiceMemberMask, 
		bAdmin, bIsFemale, 
		bIsSpectator, bOnlySpectator, 
		bOutOfLives, bReadyToPlay, 
		bWaitingPlayer;

	// Pos:0x018
	reliable if(((bNetDirty && int(Role) == int(ROLE_Authority)) && bNetOwner) && HasFlag == none)
		HasFlag;

	// Pos:0x048
	reliable if((bNetDirty && int(Role) == int(ROLE_Authority)) && !bNetOwner || bDemoRecording)
		PacketLoss, Ping;

	// Pos:0x078
	reliable if((bNetDirty && int(Role) == int(ROLE_Authority)) && bNetInitial)
		CustomReplicationInfo, PlayerID, 
		VoiceTypeName, bBot, 
		bNoTeam;
}

event PostBeginPlay()
{
	// End:0x12
	if(int(Role) < int(ROLE_Authority))
	{
		return;
	}
	// End:0x2A
	if(AIController(Owner) != none)
	{
		bBot = true;
	}
	StartTime = Level.Game.GameReplicationInfo.ElapsedTime;
	Timer();
	SetTimer(1.5000000 + FRand(), true);
	//return;	
}

simulated event PostNetBeginPlay()
{
	local GameReplicationInfo GRI;
	local VoiceChatReplicationInfo VRI;

	// End:0x30
	if(Level.GRI != none)
	{
		Level.GRI.AddPRI(self);		
	}
	else
	{
		// End:0x54
		foreach DynamicActors(Class'Engine.GameReplicationInfo', GRI)
		{
			GRI.AddPRI(self);
			// End:0x54
			break;			
		}		
	}
	// End:0x74
	foreach DynamicActors(Class'Engine.VoiceChatReplicationInfo', VRI)
	{
		VoiceInfo = VRI;
		// End:0x74
		break;		
	}	
	// End:0x88
	if(Team != none)
	{
		bTeamNotified = true;
	}
	//return;	
}

simulated function bool NeedNetNotify()
{
	return !bRegisteredChatRoom || !bNoTeam && Team == none;
	//return;	
}

simulated event PostNetReceive()
{
	local Actor A;
	local PlayerController PC;

	PC = Level.GetLocalPlayerController();
	// End:0xD7
	if(!bTeamNotified && Team != none)
	{
		bTeamNotified = true;
		// End:0xD6
		foreach DynamicActors(Class'Engine.Actor', A)
		{
			// End:0x9E
			if((Pawn(A) != none) && Pawn(A).PlayerReplicationInfo == self)
			{
				Pawn(A).NotifyTeamChanged();
				// End:0x9B
				if(PC.PlayerReplicationInfo != self)
				{
					// End:0xD6
					break;
				}
				// End:0xD5
				continue;
			}
			// End:0xD5
			if(A.bNotifyLocalPlayerTeamReceived && PC.PlayerReplicationInfo == self)
			{
				A.NotifyLocalPlayerTeamReceived();
			}			
		}		
	}
	// End:0x12D
	if(((!bRegisteredChatRoom && VoiceInfo != none) && PlayerID != default.PlayerID) && int(VoiceID) != int(default.VoiceID))
	{
		bRegisteredChatRoom = true;
		VoiceInfo.AddVoiceChatter(self);
	}
	bNetNotify = NeedNetNotify();
	// End:0x16A
	if(!bNetNotify && !PC.NeedNetNotify())
	{
		PC.RegisterVoiceChat();
	}
	//return;	
}

simulated event ClientNotifyTeamChange()
{
	local Actor A;

	// End:0x5C
	if(bTeamNotified && Level.GetLocalPlayerController().PlayerReplicationInfo == self)
	{
		// End:0x5B
		foreach DynamicActors(Class'Engine.Actor', A)
		{
			// End:0x5A
			if(A.bNotifyLocalPlayerTeamReceived)
			{
				A.NotifyLocalPlayerTeamReceived();
			}			
		}		
	}
	//return;	
}

simulated function Destroyed()
{
	local GameReplicationInfo GRI;

	// End:0x30
	if(Level.GRI != none)
	{
		Level.GRI.RemovePRI(self);		
	}
	else
	{
		// End:0x54
		foreach DynamicActors(Class'Engine.GameReplicationInfo', GRI)
		{
			GRI.RemovePRI(self);
			// End:0x54
			break;			
		}		
	}
	// End:0x75
	if(VoiceInfo == none)
	{
		// End:0x74
		foreach DynamicActors(Class'Engine.VoiceChatReplicationInfo', VoiceInfo)
		{
			// End:0x74
			break;			
		}		
	}
	// End:0x90
	if(VoiceInfo != none)
	{
		VoiceInfo.RemoveVoiceChatter(self);
	}
	super(Actor).Destroyed();
	//return;	
}

function SetCharacterVoice(string S)
{
	local Class<VoicePack> NewVoiceType;

	// End:0x3B
	if(((Left(S, 1) == ".") || Right(S, 1) == ".") || Left(S, 5) ~= "none.")
	{
		return;
	}
	// End:0x6E
	if((int(Level.NetMode) == int(NM_DedicatedServer)) && VoiceType != none)
	{
		VoiceTypeName = S;
		return;
	}
	// End:0x84
	if(S == "")
	{
		VoiceTypeName = "";
		return;
	}
	NewVoiceType = Class<VoicePack>(DynamicLoadObject(S, Class'Core.Class', true));
	// End:0xC1
	if(NewVoiceType != none)
	{
		VoiceType = NewVoiceType;
		VoiceTypeName = S;
	}
	//return;	
}

function SetCharacterName(string S)
{
	CharacterName = S;
	//return;	
}

function Reset()
{
	super(Actor).Reset();
	Score = 0.0000000;
	Deaths = 0.0000000;
	HasFlag = none;
	bReadyToPlay = false;
	NumLives = 0;
	bOutOfLives = false;
	//return;	
}

simulated function string GetHumanReadableName()
{
	return PlayerName;
	//return;	
}

simulated function string GetLocationName()
{
	local string VehicleString;
	local Vehicle V;

	// End:0x4D
	if((PlayerVolume == none) && PlayerZone == none)
	{
		// End:0x47
		if((Owner != none) && Controller(Owner).IsInState('Dead'))
		{
			return StringDead;			
		}
		else
		{
			return StringSpectating;
		}
	}
	// End:0xA1
	if(Owner != none)
	{
		// End:0x9E
		if(Vehicle(Controller(Owner).Pawn) != none)
		{
			VehicleString = Vehicle(Controller(Owner).Pawn).GetVehiclePositionString();
		}		
	}
	else
	{
		// End:0x18A
		if(int(Level.NetMode) == int(NM_Client))
		{
			// End:0xF3
			if((CurrentVehicle != none) && CurrentVehicle.PlayerReplicationInfo == self)
			{
				VehicleString = CurrentVehicle.GetVehiclePositionString();				
			}
			else
			{
				// End:0x18A
				if((Level.TimeSeconds - Level.LastVehicleCheck) > float(1))
				{
					// End:0x161
					foreach DynamicActors(Class'Engine.Vehicle', V)
					{
						// End:0x160
						if(V.PlayerReplicationInfo == self)
						{
							VehicleString = V.GetVehiclePositionString();
							CurrentVehicle = V;
							// End:0x161
							break;
						}						
					}					
					// End:0x18A
					if(V == none)
					{
						Level.LastVehicleCheck = Level.TimeSeconds;
					}
				}
			}
		}
	}
	// End:0x21C
	if((PlayerVolume != none) && PlayerVolume.LocationName != Class'Engine.Volume'.default.LocationName)
	{
		// End:0x1E5
		if(Len(PlayerVolume.LocationName @ VehicleString) > 32)
		{
			return PlayerVolume.LocationName;
		}
		// End:0x203
		if(VehicleString == "")
		{
			return PlayerVolume.LocationName;			
		}
		else
		{
			return PlayerVolume.LocationName @ VehicleString;
		}		
	}
	else
	{
		// End:0x2A2
		if((PlayerZone != none) && PlayerZone.LocationName != "")
		{
			// End:0x26B
			if(Len(PlayerZone.LocationName @ VehicleString) > 32)
			{
				return PlayerZone.LocationName;
			}
			// End:0x289
			if(VehicleString == "")
			{
				return PlayerZone.LocationName;				
			}
			else
			{
				return PlayerZone.LocationName @ VehicleString;
			}			
		}
		else
		{
			// End:0x2B7
			if(VehicleString != "")
			{
				return VehicleString;				
			}
			else
			{
				// End:0x2EA
				if(Level.Title != Level.default.Title)
				{
					return Level.Title;					
				}
				else
				{
					return StringUnknown;
				}
			}
		}
	}
	//return;	
}

simulated function Material GetPortrait()
{
	//return;	
}

event UpdateCharacter()
{
	//return;	
}

function UpdatePlayerLocation()
{
	local Volume V, Best;
	local Pawn P;
	local Controller C;

	C = Controller(Owner);
	// End:0x2F
	if(C != none)
	{
		P = C.Pawn;
	}
	// End:0x4A
	if(P == none)
	{
		PlayerVolume = none;
		PlayerZone = none;
		return;
	}
	// End:0x80
	if(PlayerZone != P.Region.Zone)
	{
		PlayerZone = P.Region.Zone;
	}
	// End:0x107
	foreach P.TouchingActors(Class'Engine.Volume', V)
	{
		// End:0xB2
		if(V.LocationName == "")
		{
			continue;			
		}
		// End:0xE4
		if((Best != none) && V.LocationPriority <= Best.LocationPriority)
		{
			continue;			
		}
		// End:0x106
		if(V.Encompasses(P))
		{
			Best = V;
		}		
	}	
	// End:0x122
	if(PlayerVolume != Best)
	{
		PlayerVolume = Best;
	}
	//return;	
}

simulated function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
{
	// End:0x7D
	if(Team != none)
	{
		Canvas.DrawText((((((("     PlayerName " $ PlayerName) $ " Team ") $ Team.GetHumanReadableName()) $ "(") $ string(Team.TeamIndex)) $ ") has flag ") $ string(HasFlag));		
	}
	else
	{
		Canvas.DrawText(("     PlayerName " $ PlayerName) $ " NO Team");
	}
	// End:0x176
	if(!bBot)
	{
		YPos += YL;
		Canvas.SetPos(4.0000000, YL);
		Canvas.DrawText((((((((("                              bIsSpec:" $ string(bIsSpectator)) @ "OnlySpec:") $ string(bOnlySpectator)) @ "Waiting:") $ string(bWaitingPlayer)) @ "Ready:") $ string(bReadyToPlay)) @ "OutOfLives:") $ string(bOutOfLives));
	}
	//return;	
}

event ClientNameChange()
{
	local PlayerController PC;

	// End:0x28
	foreach DynamicActors(Class'Engine.PlayerController', PC)
	{
		PC.ReceiveLocalizedMessage(Class'Engine.GameMessage', 2, self);		
	}	
	//return;	
}

function Timer()
{
	local Controller C;

	UpdatePlayerLocation();
	SetTimer(1.5000000 + FRand(), true);
	// End:0x21
	if(FRand() < 0.6500000)
	{
		return;
	}
	// End:0x76
	if(!bBot)
	{
		C = Controller(Owner);
		// End:0x76
		if(!bReceivedPing)
		{
			Ping = byte(Min(int(0.2500000 * float(C.ConsoleCommand("GETPING"))), 255));
		}
	}
	//return;	
}

function SetPlayerName(string S)
{
	OldName = PlayerName;
	PlayerName = S;
	// End:0x3F
	if(PlayerController(Owner) != none)
	{
		PlayerController(Owner).PlayerOwnerName = S;
	}
	//return;	
}

function SetWaitingPlayer(bool B)
{
	bIsSpectator = B;
	bWaitingPlayer = B;
	//return;	
}

function SetChatPassword(string InPassword)
{
	// End:0x1F
	if(PrivateChatRoom != none)
	{
		PrivateChatRoom.SetChannelPassword(InPassword);
	}
	//return;	
}

function SetVoiceMemberMask(int NewMask)
{
	VoiceMemberMask = NewMask;
	//return;	
}

simulated function string GetCallSign()
{
	// End:0x0F
	if(TeamID > 14)
	{
		return "";
	}
	return Class'Engine.GameInfo'.default.CallSigns[TeamID];
	//return;	
}

simulated event string GetNameCallSign()
{
	// End:0x12
	if(TeamID > 14)
	{
		return PlayerName;
	}
	return ((PlayerName $ " [") $ Class'Engine.GameInfo'.default.CallSigns[TeamID]) $ "]";
	//return;	
}

defaultproperties
{
	StringDead="Dead"
	StringSpectating="Spectating"
	StringUnknown="Unknown"
	VoiceID=255
	NetUpdateFrequency=1.0000000
	bNetNotify=true
}
