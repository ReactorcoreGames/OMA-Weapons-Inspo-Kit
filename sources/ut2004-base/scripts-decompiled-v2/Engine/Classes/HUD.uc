class HUD extends Actor
	transient
	native
	config(User)
	exportstructs
	notplaceable;

struct ConsoleMessage
{
	var string Text;
	var Color TextColor;
	var float MessageLife;
	var PlayerReplicationInfo PRI;
};

var() PlayerController PlayerOwner;
var() Pawn PawnOwner;
var() PlayerReplicationInfo PawnOwnerPRI;
var() Console PlayerConsole;
var() ScoreBoard ScoreBoard;
var() ScoreBoard LocalStatsScreen;
var() Actor VoteMenu;
var Color WhiteColor;
var Color RedColor;
var Color GreenColor;
var Color CyanColor;
var Color BlueColor;
var Color GoldColor;
var Color PurpleColor;
var Color TurqColor;
var Color GrayColor;
var Color BlackColor;
var() bool bShowVoteMenu;
var() globalconfig bool bHideHUD;
var() bool bShowScoreBoard;
var() bool bShowDebugInfo;
var() bool bShowBadConnectionAlert;
var() globalconfig bool bMessageBeep;
var() globalconfig bool bShowWeaponInfo;
var() globalconfig bool bShowPersonalInfo;
var() globalconfig bool bShowPoints;
var() globalconfig bool bShowWeaponBar;
var() globalconfig bool bCrosshairShow;
var() globalconfig bool bShowPortrait;
var() globalconfig bool bShowPortraitVC;
var globalconfig bool bNoEnemyNames;
var globalconfig bool bSmallWeaponBar;
var bool bBuiltMOTD;
var bool bShowLocalStats;
var() Color ConsoleColor;
var PlayerReplicationInfo PortraitPRI;
var() localized string ProgressFontName;
var() Font ProgressFontFont;
var() localized string OverrideConsoleFontName;
var() Font OverrideConsoleFont;
var() float ProgressFadeTime;
var() Color MOTDColor;
var() globalconfig float HudScale;
var() globalconfig float HudOpacity;
var() globalconfig float HudCanvasScale;
var() globalconfig int CrosshairStyle;
var() globalconfig float CrosshairScale;
var() globalconfig float CrosshairOpacity;
var() globalconfig Color CrossHairColor;
var transient float ResScaleX;
var transient float ResScaleY;
var globalconfig int ConsoleMessageCount;
var globalconfig int ConsoleFontSize;
var globalconfig int MessageFontOffset;
var ConsoleMessage TextMessages[8];
var() float ConsoleMessagePosX;
var() float ConsoleMessagePosY;
var localized string FontArrayNames[9];
var Font FontArrayFonts[9];
var int FontScreenWidthMedium[9];
var int FontScreenWidthSmall[9];
var string MOTD[4];
var int MOTDState;
var float LastPickupTime;
var float LastAmmoPickupTime;
var float LastWeaponPickupTime;
var float LastHealthPickupTime;
var float LastArmorPickupTime;
var const float LastVoiceGain;
var const float LastVoiceGainTime;
var int LastPlayerIDTalking;
var const float LastPlayerIDTalkingTime;
var SceneSubtitles SubTitles;
var array<HudOverlay> Overlays;
//var delegate<OnPostRender> __OnPostRender__Delegate;
//var delegate<OnBuildMOTD> __OnBuildMOTD__Delegate;

// Export UHUD::execDraw3DLine(FFrame&, void* const)
native final function Draw3DLine(Vector Start, Vector End, Color LineColor);

// Export UHUD::execDrawCanvasLine(FFrame&, void* const)
native final function DrawCanvasLine(float X1, float Y1, float X2, float Y2, Color LineColor);

// Export UHUD::execStaticDrawCanvasLine(FFrame&, void* const)
native static final function StaticDrawCanvasLine(Canvas C, float X1, float Y1, float X2, float Y2, Color LineColor);

delegate OnPostRender(HUD Sender, Canvas C)
{
	//return;	
}

delegate OnBuildMOTD(HUD Sender)
{
	//return;	
}

function DrawCustomBeacon(Canvas C, Pawn P, float ScreenLocX, float ScreenLocY)
{
	local Texture BeaconTex;
	local float XL, YL;

	BeaconTex = PlayerOwner.TeamBeaconTexture;
	// End:0x37
	if((BeaconTex == none) || P.PlayerReplicationInfo == none)
	{
		return;
	}
	// End:0x95
	if(P.PlayerReplicationInfo.Team != none)
	{
		C.DrawColor = Class'Engine.PlayerController'.default.TeamBeaconTeamColors[P.PlayerReplicationInfo.Team.TeamIndex];		
	}
	else
	{
		C.DrawColor = Class'Engine.PlayerController'.default.TeamBeaconTeamColors[0];
	}
	C.StrLen(P.PlayerReplicationInfo.PlayerName, XL, YL);
	C.SetPos(ScreenLocX - (0.5000000 * XL), (ScreenLocY - (0.1250000 * float(BeaconTex.VSize))) - YL);
	C.DrawText(P.PlayerReplicationInfo.PlayerName, true);
	C.SetPos(ScreenLocX - (0.1250000 * float(BeaconTex.USize)), ScreenLocY - (0.1250000 * float(BeaconTex.VSize)));
	C.DrawTile(BeaconTex, 0.2500000 * float(BeaconTex.USize), 0.2500000 * float(BeaconTex.VSize), 0.0000000, 0.0000000, float(BeaconTex.USize), float(BeaconTex.VSize));
	//return;	
}

simulated function BuildMOTD()
{
	local int i;
	local array<string> InMOTD;

	// End:0x16
	if(!bBuiltMOTD)
	{
		OnBuildMOTD(self);
	}
	// End:0x44
	if((bBuiltMOTD || PlayerOwner == none) || PlayerOwner.GameReplicationInfo == none)
	{
		return;
	}
	bBuiltMOTD = true;
	PlayerOwner.SetProgressTime(6.0000000);
	Split(PlayerOwner.GameReplicationInfo.MessageOfTheDay, "|", InMOTD);
	i = 0;
	J0x88:

	// End:0xC7 [Loop If]
	if((i < InMOTD.Length) && i < 4)
	{
		MOTD[i] = InMOTD[i];
		i++;
		// [Loop Continue]
		goto J0x88;
	}
	//return;	
}

simulated event PostBeginPlay()
{
	super.PostBeginPlay();
	LinkActors();
	CreateKeyMenus();
	// End:0x26
	foreach AllActors(Class'Engine.SceneSubtitles', SubTitles)
	{
		// End:0x26
		break;		
	}	
	//return;	
}

function Reset()
{
	bShowVoteMenu = false;
	bShowScoreBoard = false;
	super.Reset();
	//return;	
}

simulated function CreateKeyMenus()
{
	//return;	
}

simulated event Destroyed()
{
	// End:0x1E
	if(ScoreBoard != none)
	{
		ScoreBoard.Destroy();
		ScoreBoard = none;
	}
	// End:0x3C
	if(VoteMenu != none)
	{
		VoteMenu.Destroy();
		VoteMenu = none;
	}
	super.Destroyed();
	//return;	
}

exec function ShowScores()
{
	bShowScoreBoard = !bShowScoreBoard;
	//return;	
}

exec function ShowStats()
{
	bShowLocalStats = !bShowLocalStats;
	//return;	
}

exec function NextStats()
{
	// End:0x1A
	if(LocalStatsScreen != none)
	{
		LocalStatsScreen.NextStats();
	}
	//return;	
}

exec function ShowDebug()
{
	bShowDebugInfo = !bShowDebugInfo;
	//return;	
}

simulated event WorldSpaceOverlays()
{
	// End:0x2A
	if(bShowDebugInfo && Pawn(PlayerOwner.ViewTarget) != none)
	{
		DrawRoute();
	}
	//return;	
}

function CheckCountdown(GameReplicationInfo GRI)
{
	//return;	
}

event ConnectFailure(string FailCode, string URL)
{
	PlayerOwner.ReceiveLocalizedMessage(Class'Engine.FailedConnect', Class'Engine.FailedConnect'.static.GetFailSwitch(FailCode));
	//return;	
}

function GetLocalStatsScreen()
{
	//return;	
}

simulated event PostRender(Canvas Canvas)
{
	local float XPos, YPos;
	local Plane OldModulate, OM;
	local Color OldColor;
	local int i;

	BuildMOTD();
	OldModulate = Canvas.ColorModulate;
	OldColor = Canvas.DrawColor;
	Canvas.ColorModulate.X = 1.0000000;
	Canvas.ColorModulate.Y = 1.0000000;
	Canvas.ColorModulate.Z = 1.0000000;
	Canvas.ColorModulate.W = HudOpacity / float(255);
	LinkActors();
	ResScaleX = FMin(float(Canvas.SizeX) / 640.0000000, float(Canvas.SizeY) / 480.0000000);
	ResScaleY = ResScaleX;
	CheckCountdown(PlayerOwner.GameReplicationInfo);
	// End:0x186
	if(PawnOwner != none)
	{
		// End:0x17A
		if(!PlayerOwner.bBehindView)
		{
			// End:0x16B
			if(PlayerOwner.bDemoOwner || (int(Level.NetMode) == int(NM_Client)) && PlayerOwner.Pawn != PawnOwner)
			{
				PawnOwner.GetDemoRecordingWeapon();				
			}
			else
			{
				CanvasDrawActors(Canvas, false);
			}			
		}
		else
		{
			CanvasDrawActors(Canvas, false);
		}
	}
	// End:0x1B9
	if((PawnOwner != none) && PawnOwner.bSpecialHUD)
	{
		PawnOwner.DrawHUD(Canvas);
	}
	// End:0x315
	if(bShowDebugInfo)
	{
		Canvas.Font = GetConsoleFont(Canvas);
		Canvas.Style = 5;
		Canvas.DrawColor = ConsoleColor;
		PlayerOwner.ViewTarget.DisplayDebug(Canvas, XPos, YPos);
		// End:0x312
		if((PlayerOwner.ViewTarget != PlayerOwner) && (Pawn(PlayerOwner.ViewTarget) == none) || Pawn(PlayerOwner.ViewTarget).Controller == none)
		{
			YPos += (XPos * float(2));
			Canvas.SetPos(4.0000000, YPos);
			Canvas.DrawText("----- VIEWER INFO -----");
			YPos += XPos;
			Canvas.SetPos(4.0000000, YPos);
			PlayerOwner.DisplayDebug(Canvas, XPos, YPos);
		}		
	}
	else
	{
		// End:0x585
		if(!bHideHUD)
		{
			// End:0x3A3
			if(bShowLocalStats)
			{
				// End:0x33A
				if(LocalStatsScreen == none)
				{
					GetLocalStatsScreen();
				}
				// End:0x3A0
				if(LocalStatsScreen != none)
				{
					OM = Canvas.ColorModulate;
					Canvas.ColorModulate = OldModulate;
					LocalStatsScreen.DrawScoreboard(Canvas);
					DisplayMessages(Canvas);
					Canvas.ColorModulate = OM;
				}				
			}
			else
			{
				// End:0x427
				if(bShowScoreBoard)
				{
					// End:0x424
					if(ScoreBoard != none)
					{
						OM = Canvas.ColorModulate;
						Canvas.ColorModulate = OldModulate;
						ScoreBoard.DrawScoreboard(Canvas);
						// End:0x410
						if(ScoreBoard.bDisplayMessages)
						{
							DisplayMessages(Canvas);
						}
						Canvas.ColorModulate = OM;
					}					
				}
				else
				{
					// End:0x482
					if((((PlayerOwner == none) || PawnOwner == none) || PawnOwnerPRI == none) || PlayerOwner.IsSpectating() && PlayerOwner.bBehindView)
					{
						DrawSpectatingHud(Canvas);						
					}
					else
					{
						// End:0x4A1
						if(!PawnOwner.bHideRegularHUD)
						{
							DrawHUD(Canvas);
						}
					}
					i = 0;
					J0x4A8:

					// End:0x4DC [Loop If]
					if(i < Overlays.Length)
					{
						Overlays[i].Render(Canvas);
						i++;
						// [Loop Continue]
						goto J0x4A8;
					}
					// End:0x539
					if(!DrawLevelAction(Canvas))
					{
						// End:0x539
						if(PlayerOwner != none)
						{
							// End:0x526
							if(PlayerOwner.ProgressTimeOut > Level.TimeSeconds)
							{
								DisplayProgressMessages(Canvas);								
							}
							else
							{
								// End:0x539
								if(MOTDState == 1)
								{
									MOTDState = 2;
								}
							}
						}
					}
					// End:0x54D
					if(bShowBadConnectionAlert)
					{
						DisplayBadConnectionAlert(Canvas);
					}
					DisplayMessages(Canvas);
				}
			}
			// End:0x582
			if(bShowVoteMenu && VoteMenu != none)
			{
				VoteMenu.RenderOverlays(Canvas);
			}			
		}
		else
		{
			// End:0x59B
			if(PawnOwner != none)
			{
				DrawInstructionGfx(Canvas);
			}
		}
	}
	PlayerOwner.RenderOverlays(Canvas);
	// End:0x5CC
	if(PlayerOwner.bViewingMatineeCinematic)
	{
		DrawCinematicHUD(Canvas);
	}
	// End:0x612
	if((PlayerConsole != none) && PlayerConsole.bTyping)
	{
		DrawTypingPrompt(Canvas, PlayerConsole.TypedStr, PlayerConsole.TypedStrPos);
	}
	Canvas.ColorModulate = OldModulate;
	Canvas.DrawColor = OldColor;
	OnPostRender(self, Canvas);
	//return;	
}

simulated function DrawCinematicHUD(Canvas C)
{
	local int i;

	// End:0x27
	if((!bHideHUD && !bShowLocalStats) && !bShowScoreBoard)
	{
		return;
	}
	i = 0;
	J0x2E:

	// End:0x62 [Loop If]
	if(i < Overlays.Length)
	{
		Overlays[i].Render(C);
		i++;
		// [Loop Continue]
		goto J0x2E;
	}
	//return;	
}

simulated function DrawInstructionGfx(Canvas C)
{
	//return;	
}

simulated function SetInstructionText(string Text)
{
	//return;	
}

simulated function SetInstructionKeyText(string Text)
{
	//return;	
}

function CanvasDrawActors(Canvas C, bool bClearedZBuffer)
{
	// End:0x7D
	if(!PlayerOwner.bBehindView && PawnOwner.Weapon != none)
	{
		// End:0x45
		if(!bClearedZBuffer)
		{
			C.Clear(false);
		}
		PawnOwner.Weapon.RenderOverlays(C);
		// End:0x7D
		if(!bClearedZBuffer)
		{
			C.Clear(false);
		}
	}
	//return;	
}

simulated function DrawRoute()
{
	local int i;
	local Controller C;
	local Vector Start, End, RealStart;
	local bool bPath;

	C = Pawn(PlayerOwner.ViewTarget).Controller;
	// End:0x2F
	if(C == none)
	{
		return;
	}
	// End:0x6C
	if(C.CurrentPath != none)
	{
		Start = C.CurrentPath.Start.Location;		
	}
	else
	{
		Start = PlayerOwner.ViewTarget.Location;
	}
	RealStart = Start;
	// End:0xFE
	if(C.bAdjusting)
	{
		Draw3DLine(C.Pawn.Location, C.AdjustLoc, Class'Engine.Canvas'.static.MakeColor(byte(255), 0, byte(255)));
		Start = C.AdjustLoc;
	}
	// End:0x2DC
	if((C == PlayerOwner) || (C.MoveTarget == C.RouteCache[0]) && C.MoveTarget != none)
	{
		// End:0x1F8
		if((C == PlayerOwner) && C.Destination != vect(0.0000000, 0.0000000, 0.0000000))
		{
			// End:0x1DE
			if(C.pointReachable(C.Destination))
			{
				Draw3DLine(C.Pawn.Location, C.Destination, Class'Engine.Canvas'.static.MakeColor(byte(255), byte(255), byte(255)));
				return;
			}
			C.FindPathTo(C.Destination);
		}
		i = 0;
		J0x1FF:

		// End:0x29C [Loop If]
		if(i < 16)
		{
			// End:0x228
			if(C.RouteCache[i] == none)
			{
				// [Explicit Break]
				goto J0x29C;
			}
			bPath = true;
			Draw3DLine(Start, C.RouteCache[i].Location, Class'Engine.Canvas'.static.MakeColor(0, byte(255), 0));
			Start = C.RouteCache[i].Location;
			i++;
			// [Loop Continue]
			goto J0x1FF;
		}
		J0x29C:

		// End:0x2D9
		if(bPath)
		{
			Draw3DLine(RealStart, C.Destination, Class'Engine.Canvas'.static.MakeColor(byte(255), byte(255), byte(255)));
		}		
	}
	else
	{
		// End:0x339
		if(PlayerOwner.ViewTarget.Velocity != vect(0.0000000, 0.0000000, 0.0000000))
		{
			Draw3DLine(RealStart, C.Destination, Class'Engine.Canvas'.static.MakeColor(byte(255), byte(255), byte(255)));
		}
	}
	// End:0x34A
	if(C == PlayerOwner)
	{
		return;
	}
	// End:0x37E
	if(C.Focus != none)
	{
		End = C.Focus.Location;		
	}
	else
	{
		End = C.FocalPoint;
	}
	Draw3DLine(PlayerOwner.ViewTarget.Location + (Pawn(PlayerOwner.ViewTarget).BaseEyeHeight * vect(0.0000000, 0.0000000, 1.0000000)), End, Class'Engine.Canvas'.static.MakeColor(byte(255), 0, 0));
	//return;	
}

simulated function DisplayProgressMessages(Canvas C)
{
	local int i, LineCount;
	local GameReplicationInfo GRI;
	local float FontDX, FontDY, X, Y;
	local int Alpha;
	local float TimeLeft;

	TimeLeft = PlayerOwner.ProgressTimeOut - Level.TimeSeconds;
	// End:0x3E
	if(TimeLeft >= ProgressFadeTime)
	{
		Alpha = 255;		
	}
	else
	{
		Alpha = int(float(int(float(255) * TimeLeft)) / ProgressFadeTime);
	}
	GRI = PlayerOwner.GameReplicationInfo;
	LineCount = 0;
	i = 0;
	J0x7E:

	// End:0xB9 [Loop If]
	if(i < 4)
	{
		// End:0xA8
		if(PlayerOwner.ProgressMessage[i] == "")
		{
			// [Explicit Continue]
			goto J0xAF;
		}
		LineCount++;
		J0xAF:

		i++;
		// [Loop Continue]
		goto J0x7E;
	}
	// End:0x126
	if(bBuiltMOTD && MOTDState < 2)
	{
		// End:0xE5
		if(MOTD[0] != "")
		{
			LineCount++;
		}
		// End:0xFA
		if(MOTD[1] != "")
		{
			LineCount++;
		}
		// End:0x110
		if(MOTD[2] != "")
		{
			LineCount++;
		}
		// End:0x126
		if(MOTD[3] != "")
		{
			LineCount++;
		}
	}
	C.Font = LoadProgressFont();
	C.Style = 5;
	C.TextSize("A", FontDX, FontDY);
	X = ((0.5000000 * HudCanvasScale) * float(C.SizeX)) + (((1.0000000 - HudCanvasScale) / 2.0000000) * float(C.SizeX));
	Y = ((0.5000000 * HudCanvasScale) * float(C.SizeY)) + (((1.0000000 - HudCanvasScale) / 2.0000000) * float(C.SizeY));
	Y -= (FontDY * (float(LineCount) / 2.0000000));
	i = 0;
	J0x21E:

	// End:0x30D [Loop If]
	if(i < 4)
	{
		// End:0x248
		if(PlayerOwner.ProgressMessage[i] == "")
		{
			// [Explicit Continue]
			goto J0x303;
		}
		C.DrawColor = PlayerOwner.ProgressColor[i];
		C.DrawColor.A = byte(Alpha);
		C.TextSize(PlayerOwner.ProgressMessage[i], FontDX, FontDY);
		C.SetPos(X - (FontDX / 2.0000000), Y);
		C.DrawText(PlayerOwner.ProgressMessage[i]);
		Y += FontDY;
		J0x303:

		i++;
		// [Loop Continue]
		goto J0x21E;
	}
	// End:0x3FF
	if(((GRI != none) && int(Level.NetMode) != int(NM_Standalone)) && MOTDState < 2)
	{
		MOTDState = 1;
		C.DrawColor = MOTDColor;
		C.DrawColor.A = byte(Alpha);
		i = 0;
		J0x37E:

		// End:0x3FF [Loop If]
		if(i < 4)
		{
			C.TextSize(MOTD[i], FontDX, FontDY);
			C.SetPos(X - (FontDX / 2.0000000), Y);
			C.DrawText(MOTD[i]);
			Y += FontDY;
			i++;
			// [Loop Continue]
			goto J0x37E;
		}
	}
	//return;	
}

function DrawHUD(Canvas C)
{
	//return;	
}

function DrawSpectatingHud(Canvas C)
{
	//return;	
}

function bool DrawLevelAction(Canvas C)
{
	//return;	
}

function DisplayBadConnectionAlert(Canvas C)
{
	//return;	
}

function bool IsInCinematic()
{
	//return;	
}

simulated function LocalizedMessage(Class<LocalMessage> Message, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject, optional string CriticalString)
{
	//return;	
}

simulated function DrawTypingPrompt(Canvas C, string Text, optional int pos)
{
	local float XPos, YPos, XL, YL;

	C.Font = GetConsoleFont(C);
	C.Style = 5;
	C.DrawColor = ConsoleColor;
	C.TextSize("A", XL, YL);
	XPos = ((ConsoleMessagePosX * HudCanvasScale) * float(C.SizeX)) + (((1.0000000 - HudCanvasScale) * 0.5000000) * float(C.SizeX));
	YPos = (((ConsoleMessagePosY * HudCanvasScale) * float(C.SizeY)) + (((1.0000000 - HudCanvasScale) * 0.5000000) * float(C.SizeY))) - YL;
	C.SetPos(XPos, YPos);
	C.DrawTextClipped((("(>" @ Left(Text, pos)) $ Chr(4)) $ Eval(pos < Len(Text), Mid(Text, pos), "_"), true);
	//return;	
}

simulated function SetScoreBoardClass(Class<ScoreBoard> ScoreboardClass)
{
	// End:0x17
	if(ScoreBoard != none)
	{
		ScoreBoard.Destroy();
	}
	// End:0x2C
	if(ScoreboardClass == none)
	{
		ScoreBoard = none;		
	}
	else
	{
		ScoreBoard = Spawn(ScoreboardClass, Owner);
		// End:0x98
		if(ScoreBoard == none)
		{
			Log("Hud::SetScoreBoard(): Could not spawn a scoreboard of class " $ string(ScoreboardClass), 'Error');
		}
	}
	//return;	
}

exec function ShowHud()
{
	bHideHUD = !bHideHUD;
	SaveConfig();
	//return;	
}

simulated function LinkActors()
{
	PlayerOwner = PlayerController(Owner);
	// End:0x32
	if(PlayerOwner == none)
	{
		PlayerConsole = none;
		PawnOwner = none;
		PawnOwnerPRI = none;
		return;
	}
	// End:0x66
	if(PlayerOwner.Player != none)
	{
		PlayerConsole = PlayerOwner.Player.Console;		
	}
	else
	{
		PlayerConsole = none;
	}
	// End:0xC6
	if((Pawn(PlayerOwner.ViewTarget) != none) && Pawn(PlayerOwner.ViewTarget).Health > 0)
	{
		PawnOwner = Pawn(PlayerOwner.ViewTarget);		
	}
	else
	{
		// End:0xF1
		if(PlayerOwner.Pawn != none)
		{
			PawnOwner = PlayerOwner.Pawn;			
		}
		else
		{
			PawnOwner = none;
		}
	}
	// End:0x130
	if((PawnOwner != none) && PawnOwner.PlayerReplicationInfo != none)
	{
		PawnOwnerPRI = PawnOwner.PlayerReplicationInfo;		
	}
	else
	{
		PawnOwnerPRI = PlayerOwner.PlayerReplicationInfo;
	}
	//return;	
}

simulated function Message(PlayerReplicationInfo PRI, coerce string Msg, name MsgType)
{
	// End:0x18
	if(bMessageBeep)
	{
		PlayerOwner.PlayBeepSound();
	}
	// End:0x59
	if((MsgType == 'Say') || MsgType == 'TeamSay')
	{
		Msg = (PRI.PlayerName $ ": ") $ Msg;
	}
	AddTextMessage(Msg, Class'Engine.LocalMessage', PRI);
	//return;	
}

function DisplayPortrait(PlayerReplicationInfo PRI)
{
	//return;	
}

function DisplayMessages(Canvas C)
{
	local int i, j, XPos, YPos, MessageCount;

	local float XL, YL;

	i = 0;
	J0x07:

	// End:0xE6 [Loop If]
	if(i < ConsoleMessageCount)
	{
		// End:0x33
		if(TextMessages[i].Text == "")
		{
			// [Explicit Break]
			goto J0xE6;
			// [Explicit Continue]
			goto J0xDC;
		}
		// End:0xD5
		if(TextMessages[i].MessageLife < Level.TimeSeconds)
		{
			TextMessages[i].Text = "";
			// End:0xBC
			if(i < (ConsoleMessageCount - 1))
			{
				j = i;
				J0x86:

				// End:0xBC [Loop If]
				if(j < (ConsoleMessageCount - 1))
				{
					TextMessages[j] = TextMessages[j + 1];
					j++;
					// [Loop Continue]
					goto J0x86;
				}
			}
			TextMessages[j].Text = "";
			// [Explicit Break]
			goto J0xE6;
			// [Explicit Continue]
			goto J0xDC;
		}
		MessageCount++;
		J0xDC:

		i++;
		// [Loop Continue]
		goto J0x07;
	}
	J0xE6:

	XPos = int(float(int((ConsoleMessagePosX * HudCanvasScale) * float(C.SizeX))) + (((1.0000000 - HudCanvasScale) / 2.0000000) * float(C.SizeX)));
	YPos = int(float(int((ConsoleMessagePosY * HudCanvasScale) * float(C.SizeY))) + (((1.0000000 - HudCanvasScale) / 2.0000000) * float(C.SizeY)));
	C.Font = GetConsoleFont(C);
	C.DrawColor = ConsoleColor;
	C.TextSize("A", XL, YL);
	YPos -= int((YL * float(MessageCount)) + float(1));
	YPos -= int(YL);
	i = 0;
	J0x200:

	// End:0x2C0 [Loop If]
	if(i < MessageCount)
	{
		// End:0x229
		if(TextMessages[i].Text == "")
		{
			// [Explicit Break]
			goto J0x2C0;
		}
		C.StrLen(TextMessages[i].Text, XL, YL);
		C.SetPos(float(XPos), float(YPos));
		C.DrawColor = TextMessages[i].TextColor;
		C.DrawText(TextMessages[i].Text, false);
		YPos += int(YL);
		i++;
		// [Loop Continue]
		goto J0x200;
	}
	J0x2C0:

	//return;	
}

function AddTextMessage(string M, Class<LocalMessage> MessageClass, PlayerReplicationInfo PRI)
{
	local int i;

	// End:0x2C
	if(bMessageBeep && MessageClass.default.bBeep)
	{
		PlayerOwner.PlayBeepSound();
	}
	i = 0;
	J0x33:

	// End:0x66 [Loop If]
	if(i < ConsoleMessageCount)
	{
		// End:0x5C
		if(TextMessages[i].Text == "")
		{
			// [Explicit Break]
			goto J0x66;
		}
		i++;
		// [Loop Continue]
		goto J0x33;
	}
	J0x66:

	// End:0xB2
	if(i == ConsoleMessageCount)
	{
		i = 0;
		J0x7C:

		// End:0xB2 [Loop If]
		if(i < (ConsoleMessageCount - 1))
		{
			TextMessages[i] = TextMessages[i + 1];
			i++;
			// [Loop Continue]
			goto J0x7C;
		}
	}
	TextMessages[i].Text = M;
	TextMessages[i].MessageLife = Level.TimeSeconds + float(MessageClass.default.Lifetime);
	TextMessages[i].TextColor = MessageClass.static.GetConsoleColor(PRI);
	TextMessages[i].PRI = PRI;
	//return;	
}

exec function GrowHUD()
{
	// End:0x16
	if(!bShowWeaponInfo)
	{
		bShowWeaponInfo = true;		
	}
	else
	{
		// End:0x2C
		if(!bShowPersonalInfo)
		{
			bShowPersonalInfo = true;			
		}
		else
		{
			// End:0x42
			if(!bShowPoints)
			{
				bShowPoints = true;				
			}
			else
			{
				// End:0x58
				if(!bShowWeaponBar)
				{
					bShowWeaponBar = true;					
				}
				else
				{
					// End:0x69
					if(bSmallWeaponBar)
					{
						bSmallWeaponBar = false;
					}
				}
			}
		}
	}
	SaveConfig();
	//return;	
}

exec function ShrinkHUD()
{
	// End:0x16
	if(!bSmallWeaponBar)
	{
		bSmallWeaponBar = true;		
	}
	else
	{
		// End:0x2A
		if(bShowWeaponBar)
		{
			bShowWeaponBar = false;			
		}
		else
		{
			// End:0x3E
			if(bShowPoints)
			{
				bShowPoints = false;				
			}
			else
			{
				// End:0x52
				if(bShowPersonalInfo)
				{
					bShowPersonalInfo = false;					
				}
				else
				{
					// End:0x63
					if(bShowWeaponInfo)
					{
						bShowWeaponInfo = false;
					}
				}
			}
		}
	}
	SaveConfig();
	//return;	
}

function FadeZoom()
{
	//return;	
}

simulated function SetTargeting(bool bShow, optional Vector TargetLocation, optional float Size)
{
	//return;	
}

simulated function DrawCrosshair(Canvas C)
{
	//return;	
}

simulated function SetCropping(bool Active)
{
	//return;	
}

static function Font LoadFontStatic(int i)
{
	// End:0x90
	if(default.FontArrayFonts[i] == none)
	{
		default.FontArrayFonts[i] = Font(DynamicLoadObject(default.FontArrayNames[i], Class'Engine.Font'));
		// End:0x90
		if(default.FontArrayFonts[i] == none)
		{
			Log((("Warning: " $ string(default.Class)) $ " Couldn't dynamically load font ") $ default.FontArrayNames[i]);
		}
	}
	return default.FontArrayFonts[i];
	//return;	
}

simulated function Font LoadFont(int i)
{
	// End:0x8C
	if(FontArrayFonts[i] == none)
	{
		FontArrayFonts[i] = Font(DynamicLoadObject(FontArrayNames[i], Class'Engine.Font'));
		// End:0x8C
		if(FontArrayFonts[i] == none)
		{
			Log((("Warning: " $ string(self)) $ " Couldn't dynamically load font ") $ FontArrayNames[i]);
		}
	}
	return FontArrayFonts[i];
	//return;	
}

static function Font GetConsoleFont(Canvas C)
{
	local int FontSize;

	// End:0x88
	if(default.OverrideConsoleFontName != "")
	{
		// End:0x1D
		if(default.OverrideConsoleFont != none)
		{
			return default.OverrideConsoleFont;
		}
		default.OverrideConsoleFont = Font(DynamicLoadObject(default.OverrideConsoleFontName, Class'Engine.Font'));
		// End:0x49
		if(default.OverrideConsoleFont != none)
		{
			return default.OverrideConsoleFont;
		}
		Log("Warning: HUD couldn't dynamically load font " $ default.OverrideConsoleFontName);
		default.OverrideConsoleFontName = "";
	}
	FontSize = default.ConsoleFontSize;
	// End:0xB4
	if(C.ClipX < float(640))
	{
		FontSize++;
	}
	// End:0xD5
	if(C.ClipX < float(800))
	{
		FontSize++;
	}
	// End:0xF6
	if(C.ClipX < float(1024))
	{
		FontSize++;
	}
	// End:0x117
	if(C.ClipX < float(1280))
	{
		FontSize++;
	}
	// End:0x138
	if(C.ClipX < float(1600))
	{
		FontSize++;
	}
	return LoadFontStatic(Min(8, FontSize));
	//return;	
}

function Font GetFontSizeIndex(Canvas C, int FontSize)
{
	// End:0x21
	if(C.ClipX >= float(512))
	{
		FontSize++;
	}
	// End:0x42
	if(C.ClipX >= float(640))
	{
		FontSize++;
	}
	// End:0x63
	if(C.ClipX >= float(800))
	{
		FontSize++;
	}
	// End:0x84
	if(C.ClipX >= float(1024))
	{
		FontSize++;
	}
	// End:0xA5
	if(C.ClipX >= float(1280))
	{
		FontSize++;
	}
	// End:0xC6
	if(C.ClipX >= float(1600))
	{
		FontSize++;
	}
	return LoadFont(Clamp(8 - FontSize, 0, 8));
	//return;	
}

static function Font GetMediumFontFor(Canvas Canvas)
{
	local int i;

	i = 0;
	J0x07:

	// End:0x49 [Loop If]
	if(i < 8)
	{
		// End:0x3F
		if(float(default.FontScreenWidthMedium[i]) <= Canvas.ClipX)
		{
			return LoadFontStatic(i);
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	return LoadFontStatic(8);
	//return;	
}

function Font GetMediumFont(float Size)
{
	local int i;

	i = 0;
	J0x07:

	// End:0x40 [Loop If]
	if(i < 8)
	{
		// End:0x36
		if(float(default.FontScreenWidthMedium[i]) <= Size)
		{
			return LoadFontStatic(i);
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	return LoadFontStatic(8);
	//return;	
}

static function Font LargerFontThan(Font aFont)
{
	local int i;

	i = 0;
	J0x07:

	// End:0x45 [Loop If]
	if(i < 7)
	{
		// End:0x3B
		if((LoadFontStatic(i)) == aFont)
		{
			return LoadFontStatic(Max(0, i - 4));
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	return LoadFontStatic(5);
	//return;	
}

simulated function Font LoadProgressFont()
{
	// End:0x79
	if(ProgressFontFont == none)
	{
		ProgressFontFont = Font(DynamicLoadObject(ProgressFontName, Class'Engine.Font'));
		// End:0x79
		if(ProgressFontFont == none)
		{
			Log((("Warning: " $ string(self)) $ " Couldn't dynamically load font ") $ ProgressFontName);
			ProgressFontFont = Font'Engine.DefaultFont';
		}
	}
	return ProgressFontFont;
	//return;	
}

event AnnouncementPlayed(name AnnouncerSound, byte Switch)
{
	//return;	
}

simulated function DrawTargeting(Canvas C)
{
	//return;	
}

function DisplayHit(Vector HitDir, int Damage, Class<DamageType> DamageType)
{
	// End:0x47
	if((PawnOwner != none) && PawnOwner.ShieldStrength > float(0))
	{
		PlayerOwner.ClientFlash(0.5000000, vect(700.0000000, 700.0000000, 0.0000000));		
	}
	else
	{
		// End:0x7D
		if(Damage > 1)
		{
			PlayerOwner.ClientFlash(DamageType.default.FlashScale, DamageType.default.FlashFog);
		}
	}
	//return;	
}

simulated function AddHudOverlay(HudOverlay Overlay)
{
	local int i;

	i = 0;
	J0x07:

	// End:0x38 [Loop If]
	if(i < Overlays.Length)
	{
		// End:0x2E
		if(Overlays[i] == Overlay)
		{
			return;
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	Overlays[Overlays.Length] = Overlay;
	Overlay.SetOwner(self);
	//return;	
}

simulated function RemoveHudOverlay(HudOverlay Overlay)
{
	local int i;

	i = 0;
	J0x07:

	// End:0x51 [Loop If]
	if(i < Overlays.Length)
	{
		// End:0x47
		if(Overlays[i] == Overlay)
		{
			Overlays.Remove(i, 1);
			Overlay.SetOwner(none);
			return;
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	//return;	
}

defaultproperties
{
	WhiteColor=(R=255,G=255,B=255,A=255)
	RedColor=(R=255,G=0,B=0,A=255)
	GreenColor=(R=0,G=255,B=0,A=255)
	CyanColor=(R=0,G=255,B=255,A=255)
	BlueColor=(R=0,G=0,B=255,A=255)
	GoldColor=(R=255,G=255,B=0,A=255)
	PurpleColor=(R=255,G=0,B=255,A=255)
	TurqColor=(R=0,G=128,B=255,A=255)
	GrayColor=(R=200,G=200,B=200,A=255)
	BlackColor=(R=0,G=0,B=0,A=255)
	bMessageBeep=true
	bShowWeaponInfo=true
	bShowPersonalInfo=true
	bShowPoints=true
	bShowWeaponBar=true
	bCrosshairShow=true
	bShowPortrait=true
	bShowPortraitVC=true
	ConsoleColor=(R=153,G=216,B=253,A=255)
	ProgressFontName="UT2003Fonts.FontEurostile12"
	ProgressFadeTime=1.0000000
	MOTDColor=(R=255,G=255,B=255,A=255)
	HudScale=1.0000000
	HudOpacity=255.0000000
	HudCanvasScale=1.0000000
	CrosshairScale=1.0000000
	CrosshairOpacity=1.0000000
	CrossHairColor=(R=255,G=255,B=255,A=255)
	ConsoleMessageCount=4
	ConsoleFontSize=5
	ConsoleMessagePosY=1.0000000
	FontArrayNames[0]="Engine.DefaultFont"
	FontArrayNames[1]="Engine.DefaultFont"
	FontArrayNames[2]="Engine.DefaultFont"
	FontArrayNames[3]="Engine.DefaultFont"
	FontArrayNames[4]="Engine.DefaultFont"
	FontArrayNames[5]="Engine.DefaultFont"
	FontArrayNames[6]="Engine.DefaultFont"
	FontArrayNames[7]="Engine.DefaultFont"
	FontArrayNames[8]="Engine.DefaultFont"
	bHidden=true
	RemoteRole=0
}
