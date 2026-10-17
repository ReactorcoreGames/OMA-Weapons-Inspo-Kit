class xPlayer extends UnrealPlayer
	config(User);

const MinComboKeyTime = 0.05;
const MaxComboKeyTime = 0.35;

var AttractCamera camlist[20];
var int numcams;
var int curcam;
var Pawn attracttarget;
var Pawn attracttarget2;
var float camtime;
var float targettime;
var float gibwatchtime;
var Vector focuspoint;
var transient int InputHistory[4];
var transient float LastKeyTime;
var transient int OldKey;
var float MinAdrenalineCost;
var string ComboNameList[16];
var Class<Combo> ComboList[16];
var PlayerRecord PawnSetupRecord;
var float LastRulesRequestTime;
var float LastMapListRequestTime;
var bool autozoom;
var globalconfig bool bClassicTrans;
var bool bHighBeaconTrajectory;
var bool bWaitingForPRI;
var bool bWaitingForVRI;
var config bool bDebuggingVoiceChat;
var config bool bAutoDemoRec;
//var delegate<ProcessRule> __ProcessRule__Delegate;
//var delegate<ProcessMapName> __ProcessMapName__Delegate;

replication
{
	// Pos:0x00D
	unreliable if(int(Role) < int(ROLE_Authority))
		L33TPhrase;

	// Pos:0x000
	reliable if(int(Role) < int(ROLE_Authority))
		AdminMenu, ServerDoCombo, 
		ServerRequestMapList, ServerRequestPlayerInfo, 
		ServerRequestRules, ServerSetClassicTrans, 
		ServerSpecViewGoal;

	// Pos:0x01A
	reliable if(int(Role) == int(ROLE_Authority))
		ClientReceiveBan, ClientReceiveCombo, 
		ClientReceiveMapName, ClientReceiveRule;
}

delegate ProcessRule(string NewRule)
{
	//return;	
}

delegate ProcessMapName(string NewMap)
{
	//return;	
}

exec function CheckPriority()
{
	local Inventory Inv;
	local int Count;

	// End:0x2D
	if(Pawn == none)
	{
		DebugMessage("Pawn is none - returning");
		return;
	}
	Inv = Pawn.Inventory;
	J0x41:

	// End:0xD5 [Loop If]
	if((Inv != none) && Count < 1000)
	{
		// End:0xB7
		if(Weapon(Inv) != none)
		{
			DebugMessage((("Weapon:" $ string(Inv.Name)) @ "Priority:") $ string(Weapon(Inv).Priority), 'PriorityDebug');
		}
		Count++;
		Inv = Inv.Inventory;
		// [Loop Continue]
		goto J0x41;
	}
	//return;	
}

simulated function DebugMessage(string DebugString, optional name Type)
{
	ClientMessage(DebugString);
	Log(DebugString, Type);
	//return;	
}

simulated function string GetRoleString()
{
	local string t;

	t = "Role: ";
	switch(Role)
	{
		// End:0x30
		case ROLE_None:
			t = t $ "None";
			// End:0xBE
			break;
		// End:0x50
		case 1:
			t = t $ "DumbProxy";
			// End:0xBE
			break;
		// End:0x75
		case 2:
			t = t $ "SimulatedProxy";
			// End:0xBE
			break;
		// End:0x9B
		case 3:
			t = t $ "AutonomousProxy";
			// End:0xBE
			break;
		// End:0xBB
		case 4:
			t = t $ "Authority";
			// End:0xBE
			break;
		// End:0xFFFF
		default:
			break;
	}
	return t;
	//return;	
}

simulated function string GetPhysicsString()
{
	local string t;

	t = "Physics: ";
	switch(Pawn.Physics)
	{
		// End:0x3C
		case 0:
			t = t $ "None";
			// End:0x1B1
			break;
		// End:0x5A
		case 1:
			t = t $ "Walking";
			// End:0x1B1
			break;
		// End:0x78
		case 2:
			t = t $ "Falling";
			// End:0x1B1
			break;
		// End:0x97
		case 3:
			t = t $ "Swimming";
			// End:0x1B1
			break;
		// End:0xB4
		case 4:
			t = t $ "Flying";
			// End:0x1B1
			break;
		// End:0xD3
		case 5:
			t = t $ "Rotating";
			// End:0x1B1
			break;
		// End:0xF4
		case 6:
			t = t $ "Projectile";
			// End:0x1B1
			break;
		// End:0x118
		case 7:
			t = t $ "Interpolating";
			// End:0x1B1
			break;
		// End:0x13A
		case 8:
			t = t $ "MovingBrush";
			// End:0x1B1
			break;
		// End:0x157
		case 9:
			t = t $ "Spider";
			// End:0x1B1
			break;
		// End:0x175
		case 10:
			t = t $ "Trailer";
			// End:0x1B1
			break;
		// End:0x192
		case 11:
			t = t $ "Ladder";
			// End:0x1B1
			break;
		// End:0x1AE
		case 13:
			t = t $ "Karma";
			// End:0x1B1
			break;
		// End:0xFFFF
		default:
			break;
	}
	return t;
	//return;	
}

function ServerRequestRules()
{
	local ServerResponseLine Response;
	local int i;

	// End:0x37
	if((Level.Pauser == none) && (Level.TimeSeconds - LastRulesRequestTime) < 3.0000000)
	{
		return;
	}
	LastRulesRequestTime = Level.TimeSeconds;
	Level.Game.GetServerDetails(Response);
	ClientReceiveRule("");
	i = 0;
	J0x77:

	// End:0xCD [Loop If]
	if(i < Response.ServerInfo.Length)
	{
		ClientReceiveRule((Response.ServerInfo[i].Key $ "=") $ Response.ServerInfo[i].Value);
		i++;
		// [Loop Continue]
		goto J0x77;
	}
	//return;	
}

function ClientReceiveRule(string NewRule)
{
	ProcessRule(NewRule);
	//return;	
}

function ServerRequestMapList()
{
	local int X;
	local array<string> MapList;

	// End:0x57
	if((Level.Pauser == none) && ((Level.TimeSeconds - LastMapListRequestTime) < 3.0000000) || Level.Game.MapListType == "")
	{
		return;
	}
	LastMapListRequestTime = Level.TimeSeconds;
	MapList = Level.Game.GetMapRotation();
	ClientReceiveMapName("");
	X = 0;
	J0x98:

	// End:0xC3 [Loop If]
	if(X < MapList.Length)
	{
		ClientReceiveMapName(MapList[X]);
		X++;
		// [Loop Continue]
		goto J0x98;
	}
	//return;	
}

function ClientReceiveMapName(string NewMap)
{
	ProcessMapName(NewMap);
	//return;	
}

function StopFiring()
{
	//return;	
}

simulated function PlayBeepSound()
{
	// End:0x23
	if(ViewTarget != none)
	{
		ViewTarget.PlaySound(Sound'MenuSounds.selectJ', 0,,,,, false);
	}
	//return;	
}

simulated function float RateWeapon(Weapon W)
{
	return float(W.default.Priority);
	//return;	
}

exec function L33TPhrase(int PhraseNum)
{
	SendMessage(none, 'Hidden', byte(PhraseNum), 5.0000000, 'Global');
	//return;	
}

simulated event PostBeginPlay()
{
	local int C;

	super.PostBeginPlay();
	C = 0;
	J0x0D:

	// End:0x91 [Loop If]
	if(C < 16)
	{
		// End:0x87
		if(ComboNameList[C] != "")
		{
			ComboList[C] = Class<Combo>(DynamicLoadObject(ComboNameList[C], Class'Core.Class'));
			// End:0x66
			if(ComboList[C] == none)
			{
				// [Explicit Break]
				goto J0x91;
			}
			MinAdrenalineCost = FMin(MinAdrenalineCost, ComboList[C].default.AdrenalineCost);
		}
		C++;
		// [Loop Continue]
		goto J0x0D;
	}
	J0x91:

	FillCameraList();
	LastKillTime = -5.0000000;
	//return;	
}

simulated event PostNetBeginPlay()
{
	super.PostNetBeginPlay();
	// End:0x2B
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		ServerSetClassicTrans(bClassicTrans);
	}
	//return;	
}

function ServerSetClassicTrans(bool B)
{
	bHighBeaconTrajectory = B;
	//return;	
}

simulated function ClientReceiveCombo(string NewCombo)
{
	local int i;

	i = 0;
	J0x07:

	// End:0xB7 [Loop If]
	if(i < 16)
	{
		// End:0x2D
		if(ComboNameList[i] ~= NewCombo)
		{
			return;
			// [Explicit Continue]
			goto J0xAD;
		}
		// End:0xAD
		if(ComboNameList[i] == "")
		{
			ComboNameList[i] = NewCombo;
			ComboList[i] = Class<Combo>(DynamicLoadObject(ComboNameList[i], Class'Core.Class'));
			// End:0x8A
			if(ComboList[i] == none)
			{
				return;
			}
			MinAdrenalineCost = FMin(MinAdrenalineCost, ComboList[i].default.AdrenalineCost);
			return;
		}
		J0xAD:

		i++;
		// [Loop Continue]
		goto J0x07;
	}
	//return;	
}

event PlayerTick(float DeltaTime)
{
	local int CurrentKey, DiffKey, C, i;
	local bool bFullBuffer, bMatch;

	super(PlayerController).PlayerTick(DeltaTime);
	// End:0x1D
	if(Viewport(Player) == none)
	{
		return;
	}
	// End:0x51
	if(((Pawn == none) || !bAdrenalineEnabled) || Adrenaline < MinAdrenalineCost)
	{
		InputHistory[0] = 0;
		return;
	}
	CurrentKey = 0;
	// End:0x76
	if(aForward > float(0))
	{
		CurrentKey = CurrentKey | 1;		
	}
	else
	{
		// End:0x92
		if(aForward < float(0))
		{
			CurrentKey = CurrentKey | 2;
		}
	}
	// End:0xB1
	if(aStrafe > float(0))
	{
		CurrentKey = CurrentKey | 4;		
	}
	else
	{
		// End:0xCD
		if(aStrafe < float(0))
		{
			CurrentKey = CurrentKey | 8;
		}
	}
	// End:0x305
	if(CurrentKey != OldKey)
	{
		DiffKey = CurrentKey & ~OldKey;
		// End:0x2FA
		if(DiffKey != 0)
		{
			// End:0x133
			if((Level.TimeSeconds - LastKeyTime) < 0.0500000)
			{
				InputHistory[0] = InputHistory[0] | DiffKey;				
			}
			else
			{
				// End:0x17F
				if((Level.TimeSeconds - LastKeyTime) > 0.3500000)
				{
					InputHistory[0] = DiffKey;
					InputHistory[1] = 0;
					LastKeyTime = Level.TimeSeconds;					
				}
				else
				{
					bFullBuffer = true;
					i = 3;
					J0x18F:

					// End:0x1D7 [Loop If]
					if(i > 0)
					{
						InputHistory[i] = InputHistory[i - 1];
						// End:0x1CD
						if(InputHistory[i] == 0)
						{
							bFullBuffer = false;
						}
						i--;
						// [Loop Continue]
						goto J0x18F;
					}
					InputHistory[0] = DiffKey;
					LastKeyTime = Level.TimeSeconds;
				}
			}
			// End:0x2FA
			if(bFullBuffer)
			{
				C = 0;
				J0x208:

				// End:0x2FA [Loop If]
				if(C < 16)
				{
					// End:0x22B
					if(ComboList[C] == none)
					{
						// [Explicit Break]
						goto J0x2FA;
						// [Explicit Continue]
						goto J0x2F0;
					}
					// End:0x2F0
					if((ComboList[C].default.Species == none) || ComboList[C].default.Species == xPawn(Pawn).Species)
					{
						bMatch = true;
						i = 0;
						J0x282:

						// End:0x2CD [Loop If]
						if(i < 4)
						{
							// End:0x2C3
							if(InputHistory[i] != ComboList[C].default.keys[i])
							{
								bMatch = false;
								// [Explicit Break]
								goto J0x2CD;
							}
							i++;
							// [Loop Continue]
							goto J0x282;
						}
						J0x2CD:

						// End:0x2F0
						if(bMatch)
						{
							DoCombo(ComboList[C]);
							InputHistory[0] = 0;
						}
					}
					J0x2F0:

					C++;
					// [Loop Continue]
					goto J0x208;
				}
			}
		}
		J0x2FA:

		OldKey = CurrentKey;
	}
	//return;	
}

function DoCombo(Class<Combo> ComboClass)
{
	// End:0x39
	if((Adrenaline >= ComboClass.default.AdrenalineCost) && !Pawn.InCurrentCombo())
	{
		ServerDoCombo(ComboClass);
	}
	//return;	
}

function ServerDoCombo(Class<Combo> ComboClass)
{
	local int i;
	local bool bFound;

	// End:0x1F
	if((ComboClass == none) || xPawn(Pawn) == none)
	{
		return;
	}
	i = 0;
	J0x26:

	// End:0x5C [Loop If]
	if(i < 16)
	{
		// End:0x52
		if(ComboList[i] == ComboClass)
		{
			bFound = true;
			// [Explicit Break]
			goto J0x5C;
		}
		++i;
		// [Loop Continue]
		goto J0x26;
	}
	J0x5C:

	// End:0xD6
	if((bFound && Adrenaline >= ComboClass.default.AdrenalineCost) && !Pawn.InCurrentCombo())
	{
		// End:0xBD
		if(ComboClass.default.ExecMessage != "")
		{
			ReceiveLocalizedMessage(Class'XGame.ComboMessage',,,, ComboClass);
		}
		xPawn(Pawn).DoCombo(ComboClass);
	}
	//return;	
}

function FillCameraList()
{
	local AttractCamera cam;

	numcams = 0;
	// End:0x3A
	foreach AllActors(Class'XGame.AttractCamera', cam)
	{
		camlist[numcams++] = cam;
		// End:0x39
		if(numcams == 20)
		{
			// End:0x3A
			break;
		}		
	}	
	//return;	
}

function bool FindFixedCam(Pawn Target, out int newcam)
{
	local int C, bestc;
	local float Dist, BestDist;

	bestc = -1;
	C = 0;
	J0x12:

	// End:0xA2 [Loop If]
	if(C < numcams)
	{
		Dist = VSize(Target.Location - camlist[C].Location);
		// End:0x98
		if(((bestc == -1) || Dist < BestDist) && LineOfSight(C, Target))
		{
			bestc = C;
			BestDist = Dist;
		}
		C++;
		// [Loop Continue]
		goto J0x12;
	}
	// End:0xB3
	if(bestc == -1)
	{
		return false;
	}
	newcam = bestc;
	return true;
	//return;	
}

function Vector FindFloatingCam(Pawn Target)
{
	local Vector v1, v2, D;
	local Rotator R;
	local Vector HitLoc, HitNormal;
	local Actor HitActor;
	local int tries;

	J0x00:
	// End:0x137 [Loop If]
	if(tries++ < 10)
	{
		v1 = Target.Location;
		R = Target.Rotation;
		R.Pitch = int((FRand() * float(12000)) - float(2000));
		// End:0x8C
		if(VSize(Target.Velocity) < float(100))
		{
			R.Yaw += int(FRand() * float(24000));			
		}
		else
		{
			R.Yaw += int(FRand() * float(12000));
		}
		D = Vector(R);
		v2 = v1 + (D * float(2000));
		v1 += (D * float(50));
		HitActor = Trace(HitLoc, HitNormal, v2, v1, false);
		// End:0x134
		if((HitActor != none) && VSize(HitLoc - v1) > float(250))
		{
			return HitLoc - (D * float(50));
		}
		// [Loop Continue]
		goto J0x00;
	}
	// End:0x158
	if(HitActor != none)
	{
		return HitLoc - (D * float(50));		
	}
	else
	{
		return v2;
	}
	//return;	
}

function Pawn PickNextBot(Pawn Current)
{
	local Controller con;
	local int B;

	// End:0x1F
	if(Current != none)
	{
		con = Current.Controller;
	}
	B = 0;
	J0x26:

	// End:0xE0 [Loop If]
	if(B < Level.Game.NumBots)
	{
		// End:0x66
		if(con != none)
		{
			con = con.nextController;
		}
		// End:0x85
		if(con == none)
		{
			con = Level.ControllerList;
		}
		// End:0xD6
		if((con.IsA('Bot') && con.Pawn != none) && !con.IsInState('PlayerWaiting'))
		{
			return con.Pawn;
		}
		B++;
		// [Loop Continue]
		goto J0x26;
	}
	return none;
	//return;	
}

function bool LineOfSight(int C, Pawn Target)
{
	local Vector v1, v2;
	local AttractCamera cam;
	local Vector HitLoc, HitNormal;

	// End:0x33
	if(C >= 0)
	{
		cam = camlist[C];
		v1 = cam.Location;		
	}
	else
	{
		v1 = self.Location;
	}
	v2 = Target.Location;
	v2.Z += Target.EyeHeight;
	v2 += (Normal(v1 - v2) * float(100));
	return Trace(HitLoc, HitNormal, v1, v2, false) == none;
	//return;	
}

function Rotator CameraTrack(Pawn Target, float DeltaTime)
{
	local float Dist;
	local Vector lead;
	local float MinZoomDist, MaxZoomDist, ViewAngle, viewwidth;

	lead = Target.Location + (vect(0.0000000, 0.0000000, 2.0000000) * Target.CollisionHeight);
	Dist = VSize(lead - focuspoint);
	// End:0x7F
	if(Dist > float(20))
	{
		focuspoint += (((Normal(lead - focuspoint) * Dist) * DeltaTime) * 2.0000000);
	}
	// End:0x1A5
	if(autozoom)
	{
		Dist = VSize(Location - Target.Location);
		// End:0x101
		if(curcam >= 0)
		{
			MinZoomDist = camlist[curcam].MinZoomDist;
			MaxZoomDist = camlist[curcam].MaxZoomDist;
			ViewAngle = camlist[curcam].ViewAngle;			
		}
		else
		{
			MinZoomDist = 600.0000000;
			MaxZoomDist = 1200.0000000;
			ViewAngle = default.FovAngle;
		}
		// End:0x13F
		if(Dist < MinZoomDist)
		{
			FovAngle = ViewAngle;			
		}
		else
		{
			// End:0x19A
			if(Dist < MaxZoomDist)
			{
				viewwidth = MinZoomDist * Tan(((ViewAngle * 3.1415930) / float(180)) / float(2));
				FovAngle = ((Atan(viewwidth, Dist) * float(180)) / 3.1415930) * float(2);
			}
		}
		DesiredFOV = FovAngle;
	}
	return Rotator(focuspoint - Location);
	//return;	
}

function PawnDied(Pawn P)
{
	// End:0x11
	if(Pawn != P)
	{
		return;
	}
	bBehindView = true;
	LastKillTime = -5.0000000;
	// End:0x5B
	if(Pawn != none)
	{
		curcam = -1;
		SetLocation(FindFloatingCam(Pawn));
		SetRotation(CameraTrack(Pawn, 0.0000000));
	}
	super(PlayerController).PawnDied(P);
	//return;	
}

function SetPawnClass(string inClass, string InCharacter)
{
	local Class<xPawn> pClass;

	// End:0x1A
	if(SPCTimeStamp > Level.TimeSeconds)
	{
		return;
	}
	SPCTimeStamp = Level.TimeSeconds + 10.0000000;
	// End:0x87
	if(inClass != "")
	{
		pClass = Class<xPawn>(DynamicLoadObject(inClass, Class'Core.Class', true));
		// End:0x87
		if((pClass != none) && pClass.default.bCanPickupInventory)
		{
			PawnClass = pClass;
		}
	}
	PawnSetupRecord = Class'XGame.xUtil'.static.FindPlayerRecord(InCharacter);
	PlayerReplicationInfo.SetCharacterName(InCharacter);
	//return;	
}

function SetPawnFemale()
{
	// End:0x21
	if(PawnSetupRecord.Species == none)
	{
		PlayerReplicationInfo.bIsFemale = true;
	}
	//return;	
}

function Possess(Pawn aPawn)
{
	local xPawn xp;

	super.Possess(aPawn);
	xp = xPawn(aPawn);
	// End:0x3B
	if(xp != none)
	{
		xp.Setup(PawnSetupRecord, true);
	}
	// End:0x60
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		ServerSetClassicTrans(bClassicTrans);
	}
	//return;	
}

exec function ChangeCharacter(string newCharacter)
{
	SetPawnClass(string(PawnClass), newCharacter);
	UpdateURL("Character", newCharacter, true);
	SaveConfig();
	//return;	
}

simulated function bool NeedNetNotify()
{
	return (super.NeedNetNotify() || bWaitingForPRI) || bVoiceChatEnabled && bWaitingForVRI;
	//return;	
}

simulated event PostNetReceive()
{
	local PlayerRecord Rec;

	super.PostNetReceive();
	// End:0x11F
	if((PlayerReplicationInfo != none) && bWaitingForPRI)
	{
		bWaitingForPRI = false;
		Rec = Class'XGame.xUtil'.static.FindPlayerRecord(PlayerReplicationInfo.CharacterName);
		// End:0xCD
		if(Rec.Species != none)
		{
			// End:0x93
			if(PlayerReplicationInfo.Team == none)
			{
				Rec.Species.static.LoadResources(Rec, Level, PlayerReplicationInfo, 255);				
			}
			else
			{
				Rec.Species.static.LoadResources(Rec, Level, PlayerReplicationInfo, PlayerReplicationInfo.Team.TeamIndex);
			}
		}
		// End:0x11F
		if((bAutoDemoRec && int(Level.NetMode) == int(NM_Client)) && !bDemoOwner)
		{
			Player.Console.DelayedConsoleCommand("demorec");
		}
	}
	// End:0x14F
	if((VoiceReplicationInfo != none) && bWaitingForVRI)
	{
		bWaitingForVRI = VoiceReplicationInfo.GetPublicChannelCount(true) == 0;
	}
	bNetNotify = NeedNetNotify();
	// End:0x190
	if((!bNetNotify && PlayerReplicationInfo != none) && !PlayerReplicationInfo.NeedNetNotify())
	{
		RegisterVoiceChat();
	}
	//return;	
}

function RegisterVoiceChat()
{
	VoiceReplicationInfo.SetOwner(self);
	// End:0x1F
	if(bVoiceChatEnabled)
	{
		InitializeVoiceChat();		
	}
	else
	{
		DisableVoiceChat();
	}
	//return;	
}

exec function AdminMenu(string CommandLine)
{
	//return;	
}

function ServerRequestPlayerInfo()
{
	local Controller C;
	local PlayerController xPC;

	// End:0xE6
	if(PlayerReplicationInfo.bAdmin)
	{
		// End:0xE5
		foreach __NFUN_325__(Class'Engine.Controller', C)
		{
			// End:0x3A
			if(C.PlayerReplicationInfo == none)
			{
				continue;				
			}
			xPC = PlayerController(C);
			// End:0xA3
			if(xPC != none)
			{
				ClientReceiveRule((((C.PlayerReplicationInfo.PlayerName $ Chr(27)) $ xPC.GetPlayerIDHash()) $ Chr(27)) $ xPC.GetPlayerNetworkAddress());
				// End:0xE4
				continue;
			}
			ClientReceiveRule((((C.PlayerReplicationInfo.PlayerName $ Chr(27)) $ "AI Controlled") $ Chr(27)) $ "BOT");			
		}		
	}
	ClientReceiveRule("Done");
	//return;	
}

exec function SpecViewGoal()
{
	ServerSpecViewGoal();
	//return;	
}

function ServerSpecViewGoal()
{
	local Actor NewGoal;

	// End:0xBF
	if(PlayerReplicationInfo.bOnlySpectator && IsInState('Spectating'))
	{
		NewGoal = Level.Game.FindSpecGoalFor(PlayerReplicationInfo, 0);
		// End:0xBF
		if(NewGoal != none)
		{
			// End:0x7F
			if(Pawn(NewGoal) != none)
			{
				SetViewTarget(NewGoal);
				ClientSetViewTarget(NewGoal);
				bBehindView = true;				
			}
			else
			{
				SetViewTarget(none);
				ClientSetViewTarget(none);
				bBehindView = false;
				SetLocation(NewGoal.Location);
				ClientSetLocation(NewGoal.Location, Rotation);
			}
		}
	}
	//return;	
}

function ServerRequestBanInfo(int PlayerID)
{
	local PlayerController C;

	// End:0x168
	foreach __NFUN_325__(Class'Engine.PlayerController', C)
	{
		// End:0x35
		if((C == self) || C.PlayerReplicationInfo == none)
		{
			continue;			
		}
		// End:0x167
		if((PlayerID == -1) || C.PlayerReplicationInfo.PlayerID == PlayerID)
		{
			Log((((((string(Name) @ "Sending BanInfo To Client PlayerID:") $ string(C.PlayerReplicationInfo.PlayerID)) @ "Hash:") $ C.GetPlayerIDHash()) @ "Address:") $ C.GetPlayerNetworkAddress(), 'ChatManager');
			ChatManager.TrackNewPlayer(C.PlayerReplicationInfo.PlayerID, C.GetPlayerIDHash(), "0");
			ClientReceiveBan((((string(C.PlayerReplicationInfo.PlayerID) $ Chr(27)) $ C.GetPlayerIDHash()) $ Chr(27)) $ "0");
		}		
	}	
	//return;	
}

function ClientReceiveBan(string BanInfo)
{
	// End:0x29
	if(UnrealPlayerChatManager(ChatManager) != none)
	{
		UnrealPlayerChatManager(ChatManager).ReceiveBanInfo(BanInfo);
	}
	//return;	
}

simulated function InitializeVoiceChat()
{
	super(PlayerController).InitializeVoiceChat();
	ServerRequestBanInfo(-1);
	//return;	
}

simulated exec function ShowAliases()
{
	local array<string> output;
	local Security S;
	local int i;

	S = Spawn(Class'Engine.Security');
	// End:0xA3
	if(S != none)
	{
		S.LocalPerform(100, "", "", output);
		Log("No of Aliases:" @ string(output.Length));
		i = 0;
		J0x56:

		// End:0x97 [Loop If]
		if(i < output.Length)
		{
			Log((("   Alias" @ string(i)) $ ":") @ output[i]);
			i++;
			// [Loop Continue]
			goto J0x56;
		}
		S.Destroy();
	}
	//return;	
}

simulated exec function ShowBindings()
{
	local array<string> output;
	local Security S;
	local int i;

	S = Spawn(Class'Engine.Security');
	// End:0xA6
	if(S != none)
	{
		S.LocalPerform(101, "", "", output);
		Log("No of Bindings:" @ string(output.Length));
		i = 0;
		J0x57:

		// End:0x9A [Loop If]
		if(i < output.Length)
		{
			Log((("   Binding" @ string(i)) $ ":") @ output[i]);
			i++;
			// [Loop Continue]
			goto J0x57;
		}
		S.Destroy();
	}
	//return;	
}

exec function check()
{
	local Decoration D;

	// End:0x49
	foreach AllActors(Class'Engine.Decoration', D)
	{
		Log(("#### D:" @ string(D)) @ string(VSize(Pawn.Location - D.Location)));		
	}	
	//return;	
}

state AttractMode
{
	ignores TeamSay, Say, ThrowWeapon, Suicide, ClientReStart, RestartLevel, 
		SwitchWeapon;

	function bool IsSpectating()
	{
		return true;
		//return;		
	}

	function ProcessMove(float DeltaTime, Vector NewAccel, Actor.EDoubleClickDir DoubleClickMove, Rotator DeltaRot)
	{
		//return;		
	}

	function PlayerMove(float DeltaTime)
	{
		local float deltayaw, destyaw;
		local Rotator newRot;

		// End:0x0D
		if(attracttarget == none)
		{
			return;
		}
		// End:0x131
		if(bBehindView)
		{
			// End:0x4B
			if((attracttarget.Controller == none) || attracttarget.Controller.Enemy == none)
			{
				return;
			}
			newRot = Rotator(attracttarget.Controller.Enemy.Location - attracttarget.Location);
			destyaw = float(newRot.Yaw);
			deltayaw = float(int(destyaw) & 65535) - float(Rotation.Yaw & 65535);
			// End:0xE2
			if(deltayaw < float(-32768))
			{
				deltayaw += float(65536);				
			}
			else
			{
				// End:0x101
				if(deltayaw > float(32768))
				{
					deltayaw -= float(65536);
				}
			}
			newRot = Rotation;
			newRot.Yaw += int(deltayaw * DeltaTime);
			SetRotation(newRot);			
		}
		else
		{
			newRot = CameraTrack(attracttarget, DeltaTime);
			SetRotation(newRot);
		}
		//return;		
	}

	exec function NextWeapon()
	{
		//return;		
	}

	exec function PrevWeapon()
	{
		//return;		
	}

	exec function Fire(optional float F)
	{
		//return;		
	}

	exec function AltFire(optional float F)
	{
		Fire(F);
		//return;		
	}

	function BeginState()
	{
		// End:0x1C
		if(Pawn != none)
		{
			SetLocation(Pawn.Location);
		}
		bCollideWorld = true;
		// End:0x62
		if(curcam == -1)
		{
			FillCameraList();
			camtime = 0.0000000;
			targettime = 0.0000000;
			autozoom = true;
			curcam = -1;
		}
		Timer();
		SetTimer(0.5000000, true);
		//return;		
	}

	function EndState()
	{
		PlayerReplicationInfo.bIsSpectator = false;
		bCollideWorld = false;
		curcam = -1;
		//return;		
	}

	function Timer()
	{
		local bool switchedbots;
		local Vector NewLoc;
		local int newcam;

		camtime += 0.5000000;
		targettime += 0.5000000;
		bFrozen = false;
		// End:0x55
		if(gibwatchtime > float(0))
		{
			gibwatchtime -= 0.5000000;
			// End:0x50
			if(gibwatchtime <= float(0))
			{
				attracttarget = none;				
			}
			else
			{
				return;
			}			
		}
		else
		{
			// End:0x81
			if((attracttarget != none) && attracttarget.Health <= 0)
			{
				gibwatchtime = 4.0000000;
			}
		}
		// End:0xC0
		if((attracttarget == none) || targettime > float(30))
		{
			attracttarget = PickNextBot(attracttarget);
			switchedbots = true;
			targettime = 0.0000000;
		}
		// End:0xCD
		if(attracttarget == none)
		{
			return;
		}
		// End:0x263
		if((switchedbots || camtime > float(10)) || (bBehindView == false) && (Rotation.Pitch < -10000) || !LineOfSight(curcam, attracttarget))
		{
			camtime = 0.0000000;
			FovAngle = default.FovAngle;
			SetViewTarget(self);
			bBehindView = false;
			// End:0x1BF
			if(FindFixedCam(attracttarget, newcam))
			{
				focuspoint = attracttarget.Location;
				curcam = newcam;
				SetLocation(camlist[curcam].Location);
				FovAngle = camlist[curcam].ViewAngle;
				SetRotation(CameraTrack(attracttarget, 0.0000000));				
			}
			else
			{
				// End:0x219
				if(FRand() < 0.5000000)
				{
					NewLoc = FindFloatingCam(attracttarget);
					focuspoint = attracttarget.Location;
					curcam = -1;
					SetLocation(NewLoc);
					SetRotation(CameraTrack(attracttarget, 0.0000000));					
				}
				else
				{
					curcam = -1;
					SetViewTarget(attracttarget);
					bBehindView = true;
					SetRotation(attracttarget.Rotation);
					CameraDeltaRotation.Pitch = -3000;
					CameraDist = 6.0000000;
				}
			}
		}
		//return;		
	}
	stop;	
}

state ViewPlayer extends PlayerWalking
{
	function PlayerMove(float DeltaTime)
	{
		super.PlayerMove(DeltaTime);
		CameraSwivel = CameraTrack(Pawn, DeltaTime);
		//return;		
	}

	function PlayerCalcView(out Actor ViewActor, out Vector CameraLocation, out Rotator CameraRotation)
	{
		CameraRotation = CameraSwivel;
		CameraLocation = Location;
		ViewActor = self;
		//return;		
	}

	function BeginState()
	{
		FillCameraList();
		bBehindView = true;
		SetViewTarget(self);
		curcam = -2;
		autozoom = true;
		Timer();
		SetTimer(0.5000000, true);
		//return;		
	}

	function EndState()
	{
		CameraSwivel = rot(0, 0, 0);
		bBehindView = false;
		FovAngle = default.FovAngle;
		DesiredFOV = FovAngle;
		SetViewTarget(Pawn);
		//return;		
	}

	function Timer()
	{
		local Vector NewLoc;
		local int newcam;

		// End:0x102
		if((curcam == -2) || !LineOfSight(curcam, Pawn))
		{
			camtime = 0.0000000;
			// End:0xA9
			if(FindFixedCam(Pawn, newcam))
			{
				// End:0xA6
				if(curcam != newcam)
				{
					focuspoint = Pawn.Location;
					curcam = newcam;
					SetLocation(camlist[curcam].Location);
					FovAngle = camlist[curcam].ViewAngle;					
				}				
			}
			else
			{
				NewLoc = FindFloatingCam(Pawn);
				SetLocation(NewLoc);
				curcam = -1;
				FovAngle = default.FovAngle;
				focuspoint = Pawn.Location;
			}
			CameraSwivel = CameraTrack(Pawn, 0.0000000);
		}
		//return;		
	}

	exec function TogglePlayerAttract()
	{
		GotoState('PlayerWalking');
		//return;		
	}
	stop;	
}

defaultproperties
{
	curcam=-1
	MinAdrenalineCost=100.0000000
	ComboNameList[0]="XGame.ComboSpeed"
	ComboNameList[1]="XGame.ComboBerserk"
	ComboNameList[2]="XGame.ComboDefensive"
	ComboNameList[3]="XGame.ComboInvis"
	bWaitingForPRI=true
	bWaitingForVRI=true
	TeamBeaconTexture=Texture'TeamSymbols.TeamBeaconT'
	LinkBeaconTexture=Texture'TeamSymbols.LinkBeaconT'
	SpeakingBeaconTexture=Texture'TeamSymbols.soundBeacon_a00'
	PlayerReplicationInfoClass=Class'XGame.xPlayerReplicationInfo'
	PawnClass=Class'XGame.xPawn'
	bNetNotify=true
}
