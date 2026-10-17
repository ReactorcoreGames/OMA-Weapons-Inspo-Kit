class ONSHUDOnslaught extends HudCTeamDeathMatch
	transient
	config(User);

var config float RadarScale;
var config float RadarTrans;
var config float IconScale;
var config float RadarPosX;
var config float RadarPosY;
var float RadarMaxRange;
var float RadarRange;
var ONSPowerCore FinalCore[2];
var ONSPowerCore Node;
var ONSPlayerReplicationInfo OwnerPRI;
var protected array<PowerLink> PowerLinks;
var bool bMapDisabled;
var bool bReceivedLinks;
var Vector MapCenter;
var float ColorPercent;
var() Material HealthBarBackMat;
var() Material HealthBarMat;
var() float HealthBarWidth;
var() float HealthBarHeight;
var() float HealthBarPosition;
var() float HealthBarViewDist;
var() Material BorderMat;
var() Color NeutralColor;
var() Color AttackColorA;
var() Color AttackColorB;
var() Color SeveredColorA;
var() Color SeveredColorB;
var() Color LinkColor[3];
var() SpriteWidget SymbolGB[2];
var() SpriteWidget CoreWidgets[2];
var() NumericWidget CoreHealthWidgets[2];
var() NumericWidget NodeLabelWidget;

simulated event PostBeginPlay()
{
	local ONSPowerCore Core;
	local TerrainInfo t, PrimaryTerrain;
	local int i;

	super(HudCDeathmatch).PostBeginPlay();
	// End:0x45
	foreach AllActors(Class'Onslaught.ONSPowerCore', Core)
	{
		// End:0x44
		if(Core.bFinalCore)
		{
			FinalCore[int(Core.DefenderTeamIndex)] = Core;
		}		
	}	
	Node = FinalCore[0];
	// End:0x72
	if(int(Level.NetMode) == int(NM_Client))
	{
		SetupLinks();
	}
	Core = Node;
	J0x7D:

	// End:0xB2 [Loop If]
	if(ONSPowerNode(Core) != none)
	{
		Core.NodeNum = ++i;
		Core.UpdateLocationName();
	}
	Core = Core.NextCore;
	// End:0x7D
	if(!((Core == none) || Core == Node))
		goto J0x7D;
	// End:0x119
	foreach AllActors(Class'Engine.TerrainInfo', t)
	{
		PrimaryTerrain = t;
		// End:0x118
		if(t.Tag == 'PrimaryTerrain')
		{
			// End:0x119
			break;
		}		
	}	
	// End:0x179
	if(Level.bUseTerrainForRadarRange && PrimaryTerrain != none)
	{
		RadarRange = Abs(PrimaryTerrain.TerrainScale.X * float(PrimaryTerrain.TerrainMap.USize)) / 2.0000000;		
	}
	else
	{
		// End:0x1B5
		if(Level.CustomRadarRange > float(0))
		{
			RadarRange = float(Clamp(int(Level.CustomRadarRange), 500, int(default.RadarMaxRange)));
		}
	}
	SetTimer(1.0000000, true);
	Timer();
	//return;	
}

simulated function SetupLinks()
{
	local ONSPowerCore Core;
	local int i;

	// End:0x0D
	if(Node == none)
	{
		return;
	}
	Core = Node;
	J0x18:

	i = 0;
	J0x1F:

	// End:0x61 [Loop If]
	if(i < Core.PowerLinks.Length)
	{
		AddLink(Core, Core.PowerLinks[i]);
		i++;
		// [Loop Continue]
		goto J0x1F;
	}
	Core = Core.NextCore;
	// End:0x18
	if(!((Core == none) || Core == Node))
		goto J0x18;
	//return;	
}

simulated function ReceiveLink(ONSPowerCore A, ONSPowerCore B)
{
	bReceivedLinks = true;
	AddLink(A, B);
	//return;	
}

simulated function AddLink(ONSPowerCore A, ONSPowerCore B)
{
	local PowerLink Link;

	// End:0x15
	if(HasLink(A, B))
	{
		return;
	}
	Link = Spawn(Class'Onslaught.PowerLink');
	Link.SetNodes(A, B);
	PowerLinks[PowerLinks.Length] = Link;
	//return;	
}

simulated function RemoveLink(ONSPowerCore A, ONSPowerCore B)
{
	local int i;

	i = PowerLinks.Length - 1;
	J0x0F:

	// End:0x84 [Loop If]
	if(i >= 0)
	{
		// End:0x3A
		if(PowerLinks[i] == none)
		{
			PowerLinks.Remove(i, 1);
			// [Explicit Continue]
			goto J0x7A;
		}
		// End:0x7A
		if(PowerLinks[i].HasNodes(A, B))
		{
			PowerLinks[i].Destroy();
			PowerLinks.Remove(i, 1);
		}
		J0x7A:

		i--;
		// [Loop Continue]
		goto J0x0F;
	}
	//return;	
}

simulated function ResetLinks()
{
	ClearLinks();
	RequestPowerLinks();
	//return;	
}

simulated function bool HasLink(ONSPowerCore A, ONSPowerCore B)
{
	local int i;

	i = PowerLinks.Length - 1;
	J0x0F:

	// End:0x68 [Loop If]
	if(i >= 0)
	{
		// End:0x3A
		if(PowerLinks[i] == none)
		{
			PowerLinks.Remove(i, 1);
			// [Explicit Continue]
			goto J0x5E;
		}
		// End:0x5E
		if(PowerLinks[i].HasNodes(A, B))
		{
			return true;
		}
		J0x5E:

		i--;
		// [Loop Continue]
		goto J0x0F;
	}
	return false;
	//return;	
}

simulated function ClearLinks()
{
	local int i;

	bReceivedLinks = false;
	i = 0;
	J0x0F:

	// End:0x4C [Loop If]
	if(i < PowerLinks.Length)
	{
		// End:0x42
		if(PowerLinks[i] != none)
		{
			PowerLinks[i].Destroy();
		}
		i++;
		// [Loop Continue]
		goto J0x0F;
	}
	PowerLinks.Remove(0, PowerLinks.Length);
	//return;	
}

simulated function ONSPowerCore LocatePowerCore(float PosX, float PosY, float RadarWidth)
{
	local float WorldToMapScaleFactor, Distance, LowestDistance;
	local Vector WorldLocation, DistanceVector;
	local ONSPowerCore BestCore, Core;

	// End:0x0D
	if(Node == none)
	{
		return none;
	}
	WorldToMapScaleFactor = RadarRange / RadarWidth;
	WorldLocation.X = PosX * WorldToMapScaleFactor;
	WorldLocation.Y = PosY * WorldToMapScaleFactor;
	LowestDistance = 2500.0000000;
	Core = Node;
	J0x63:

	DistanceVector = Core.Location - WorldLocation;
	DistanceVector.Z = 0.0000000;
	Distance = VSize(DistanceVector);
	// End:0xC0
	if(Distance < LowestDistance)
	{
		BestCore = Core;
		LowestDistance = Distance;
	}
	Core = Core.NextCore;
	// End:0x63
	if(!((Core == none) || Core == Node))
		goto J0x63;
	return BestCore;
	//return;	
}

simulated function DrawRadarMap(Canvas C, float CenterPosX, float CenterPosY, float RadarWidth, bool bShowDisabledNodes)
{
	local float PawnIconSize, PlayerIconSize, CoreIconSize, MapScale, MapRadarWidth;

	local Vector HUDLocation;
	local FinalBlend PlayerIcon;
	local Actor A;
	local ONSPowerCore CurCore;
	local int i;
	local Plane SavedModulation;

	SavedModulation = C.ColorModulate;
	C.ColorModulate.X = 1.0000000;
	C.ColorModulate.Y = 1.0000000;
	C.ColorModulate.Z = 1.0000000;
	C.ColorModulate.W = 1.0000000;
	C.Style = 5;
	MapRadarWidth = RadarWidth;
	// End:0xC2
	if(PawnOwner != none)
	{
		MapCenter.X = 0.0000000;
		MapCenter.Y = 0.0000000;		
	}
	else
	{
		MapCenter = vect(0.0000000, 0.0000000, 0.0000000);
	}
	HUDLocation.X = RadarWidth;
	HUDLocation.Y = RadarRange;
	HUDLocation.Z = RadarTrans;
	DrawMapImage(C, Level.RadarMapImage, CenterPosX, CenterPosY, MapCenter.X, MapCenter.Y, HUDLocation);
	// End:0x14E
	if(Node == none)
	{
		return;
	}
	CurCore = Node;
	J0x159:

	// End:0x19C [Loop If]
	if(CurCore.HasHealthBar())
	{
		DrawHealthBar(C, CurCore, CurCore.Health, CurCore.DamageCapacity, HealthBarPosition);
	}
	CurCore = CurCore.NextCore;
	// End:0x159
	if(!((CurCore == none) || CurCore == Node))
		goto J0x159;
	CoreIconSize = ((IconScale * float(16)) * HudScale) * FMin(C.ClipX / 1600.0000000, C.ClipY / 1200.0000000);
	PawnIconSize = CoreIconSize * 0.5000000;
	PlayerIconSize = CoreIconSize * 1.5000000;
	MapScale = MapRadarWidth / RadarRange;
	C.Font = GetConsoleFont(C);
	Node.UpdateHUDLocation(CenterPosX, CenterPosY, RadarWidth, RadarRange, MapCenter);
	i = 0;
	J0x291:

	// End:0x2D0 [Loop If]
	if(i < PowerLinks.Length)
	{
		PowerLinks[i].Render(C, ColorPercent, bShowDisabledNodes);
		i++;
		// [Loop Continue]
		goto J0x291;
	}
	CurCore = Node;
	J0x2DB:

	// End:0x34E [Loop If]
	if(!bShowDisabledNodes && (int(CurCore.CoreStage) == 255) || CurCore.PowerLinks.Length == 0)
	{
		// End:0x34E
		if((PlayerOwner == none) || !PlayerOwner.bDemoOwner)
		{
			CurCore = CurCore.NextCore;
			// [Explicit Continue]
			goto J0x4BA;
		}
	}
	C.DrawColor = LinkColor[int(CurCore.DefenderTeamIndex)];
	// End:0x3DE
	if(CurCore.bUnderAttack || (int(CurCore.CoreStage) == 0) && CurCore.bSevered)
	{
		DrawAttackIcon(C, CurCore, CurCore.HUDLocation, IconScale, HudScale, ColorPercent);
	}
	// End:0x426
	if(CurCore.bFinalCore)
	{
		DrawCoreIcon(C, CurCore.HUDLocation, PowerCoreAttackable(CurCore), IconScale, HudScale, ColorPercent);		
	}
	else
	{
		DrawNodeIcon(C, CurCore.HUDLocation, PowerCoreAttackable(CurCore), CurCore.CoreStage, IconScale, HudScale, ColorPercent);
		DrawNodeLabel(C, CurCore.HUDLocation, IconScale, HudScale, C.DrawColor, CurCore.NodeNum);
	}
	CurCore = CurCore.NextCore;
	J0x4BA:

	// End:0x2DB
	if(!((CurCore == none) || CurCore == Node))
		goto J0x2DB;
	// End:0x4EF
	if(PawnOwner != none)
	{
		A = PawnOwner;		
	}
	else
	{
		// End:0x511
		if(PlayerOwner.IsInState('Spectating'))
		{
			A = PlayerOwner;			
		}
		else
		{
			// End:0x539
			if(PlayerOwner.Pawn != none)
			{
				A = PlayerOwner.Pawn;
			}
		}
	}
	// End:0x6A0
	if(A != none)
	{
		PlayerIcon = FinalBlend'ONSInterface-TX.CurrentPlayerIconFinal';
		TexRotator(PlayerIcon.Material).Rotation.Yaw = -A.Rotation.Yaw - 16384;
		HUDLocation = A.Location - MapCenter;
		HUDLocation.Z = 0.0000000;
		// End:0x6A0
		if((HUDLocation.X < (RadarRange * 0.9500000)) && HUDLocation.Y < (RadarRange * 0.9500000))
		{
			C.SetPos((CenterPosX + (HUDLocation.X * MapScale)) - (PlayerIconSize * 0.5000000), (CenterPosY + (HUDLocation.Y * MapScale)) - (PlayerIconSize * 0.5000000));
			C.DrawColor = C.MakeColor(40, byte(255), 40);
			C.DrawTile(PlayerIcon, PlayerIconSize, PlayerIconSize, 0.0000000, 0.0000000, 64.0000000, 64.0000000);
		}
	}
	C.DrawColor = C.MakeColor(200, 200, 200);
	C.SetPos(CenterPosX - RadarWidth, CenterPosY - RadarWidth);
	C.DrawTile(BorderMat, RadarWidth * 2.0000000, RadarWidth * 2.0000000, 0.0000000, 0.0000000, 256.0000000, 256.0000000);
	C.ColorModulate = SavedModulation;
	//return;	
}

function bool PowerCoreAttackable(ONSPowerCore PC)
{
	// End:0xBD
	if((PawnOwnerPRI != none) && PawnOwnerPRI.Team != none)
	{
		// End:0x79
		if(int(PC.DefenderTeamIndex) != PawnOwnerPRI.Team.TeamIndex)
		{
			return PC.PoweredBy(byte(PawnOwnerPRI.Team.TeamIndex));			
		}
		else
		{
			// End:0xAB
			if(PawnOwnerPRI.Team.TeamIndex == 0)
			{
				return PC.PoweredBy(1);				
			}
			else
			{
				return PC.PoweredBy(0);
			}
		}
	}
	return false;
	//return;	
}

simulated function ShowTeamScorePassA(Canvas C)
{
	local int X;

	super.ShowTeamScorePassA(C);
	// End:0x17A
	if(bShowPoints)
	{
		X = 0;
		J0x1B:

		// End:0x17A [Loop If]
		if(X < 2)
		{
			DrawSpriteWidget(C, SymbolGB[X]);
			// End:0x170
			if((FinalCore[X] != none) && int(FinalCore[X].CoreStage) == 0)
			{
				DrawSpriteWidget(C, CoreWidgets[X]);
				// End:0xEF
				if(FinalCore[X].bUnderAttack)
				{
					CoreHealthWidgets[X].Tints[TeamIndex].G = byte(float(255) * ColorPercent);
					CoreHealthWidgets[X].Tints[TeamIndex].B = byte(float(255) * ColorPercent);					
				}
				else
				{
					CoreHealthWidgets[X].Tints[TeamIndex] = WhiteColor;
				}
				CoreHealthWidgets[X].Value = int(Round((float(FinalCore[X].Health) / float(FinalCore[X].DamageCapacity)) * float(100)));
				DrawNumericWidget(C, CoreHealthWidgets[X], DigitsBig);
			}
			X++;
			// [Loop Continue]
			goto J0x1B;
		}
	}
	//return;	
}

simulated function ShowTeamScorePassC(Canvas C)
{
	local float RadarWidth, CenterRadarPosX, CenterRadarPosY;

	// End:0xBE
	if(Level.bShowRadarMap && !bMapDisabled)
	{
		RadarWidth = ((0.5000000 * RadarScale) * HudScale) * FMin(C.ClipX, C.ClipY * 1.3333330);
		CenterRadarPosX = (RadarPosX * C.ClipX) - RadarWidth;
		CenterRadarPosY = (RadarPosY * C.ClipY) + RadarWidth;
		DrawRadarMap(C, CenterRadarPosX, CenterRadarPosY, RadarWidth, false);
	}
	//return;	
}

simulated function DrawNodeLabel(Canvas C, Vector HUDLocation, float IconScaling, float HUDScaling, Color LabelColor, int Num)
{
	local float LabelIconSize;
	local int TensPlace, row, col;
	local float X, Y;

	// End:0x1B
	if((C == none) || Num >= 100)
	{
		return;
	}
	LabelIconSize = ((IconScaling * float(16)) * HUDScaling) * FMin(C.ClipX / 1600.0000000, C.ClipY / 1200.0000000);
	C.DrawColor = WhiteColor;
	// End:0x28D
	if(Num > 9)
	{
		TensPlace = Num / 10;
		Num = Num - (TensPlace * 10);
		X = HUDLocation.X - ((1.5000000 * LabelIconSize) * 1.5000000);
		Y = HUDLocation.Y - (LabelIconSize * 1.5000000);
		C.SetDrawColor(0, 0, 0, byte(255));
		row = -1;
		J0x10D:

		// End:0x1E3 [Loop If]
		if(row < 2)
		{
			col = -1;
			J0x124:

			// End:0x1D9 [Loop If]
			if(col < 2)
			{
				C.SetPos(X + float(col), Y + float(row));
				C.DrawTile(DigitsBig.DigitTexture, LabelIconSize, LabelIconSize, float(DigitsBig.TextureCoords[TensPlace].X1), float(DigitsBig.TextureCoords[TensPlace].Y1), float(DigitsBig.TextureCoords[0].X2), float(DigitsBig.TextureCoords[0].Y2));
				col++;
				// [Loop Continue]
				goto J0x124;
			}
			row++;
			// [Loop Continue]
			goto J0x10D;
		}
		C.SetDrawColor(byte(255), byte(255), 0, byte(255));
		C.SetPos(X, Y);
		C.DrawTile(DigitsBig.DigitTexture, LabelIconSize, LabelIconSize, float(DigitsBig.TextureCoords[TensPlace].X1), float(DigitsBig.TextureCoords[TensPlace].Y1), float(DigitsBig.TextureCoords[0].X2), float(DigitsBig.TextureCoords[0].Y2));
	}
	X = HUDLocation.X - (LabelIconSize * 1.5000000);
	Y = HUDLocation.Y - (LabelIconSize * 1.5000000);
	C.SetDrawColor(0, 0, 0, byte(255));
	row = -1;
	J0x2ED:

	// End:0x3C3 [Loop If]
	if(row < 2)
	{
		col = -1;
		J0x304:

		// End:0x3B9 [Loop If]
		if(col < 2)
		{
			C.SetPos(X + float(col), Y + float(row));
			C.DrawTile(DigitsBig.DigitTexture, LabelIconSize, LabelIconSize, float(DigitsBig.TextureCoords[Num].X1), float(DigitsBig.TextureCoords[Num].Y1), float(DigitsBig.TextureCoords[0].X2), float(DigitsBig.TextureCoords[0].Y2));
			col++;
			// [Loop Continue]
			goto J0x304;
		}
		row++;
		// [Loop Continue]
		goto J0x2ED;
	}
	C.SetDrawColor(byte(255), byte(255), 0, byte(255));
	C.SetPos(X, Y);
	C.DrawTile(DigitsBig.DigitTexture, LabelIconSize, LabelIconSize, float(DigitsBig.TextureCoords[Num].X1), float(DigitsBig.TextureCoords[Num].Y1), float(DigitsBig.TextureCoords[0].X2), float(DigitsBig.TextureCoords[0].Y2));
	//return;	
}

simulated function DrawHealthBar(Canvas C, Actor A, int Health, int MaxHealth, float Height)
{
	local Vector CameraLocation, CamDir, TargetLocation, HBScreenPos;
	local Rotator CameraRotation;
	local float Dist, HealthPct;
	local Color OldDrawColor;

	// End:0x26
	if(PlayerOwner.Player.GUIController.bActive)
	{
		return;
	}
	OldDrawColor = C.DrawColor;
	C.GetCameraLocation(CameraLocation, CameraRotation);
	TargetLocation = A.Location + (vect(0.0000000, 0.0000000, 1.0000000) * Height);
	Dist = VSize(TargetLocation - CameraLocation);
	// End:0xA2
	if(Dist > HealthBarViewDist)
	{
		return;
	}
	CamDir = Vector(CameraRotation);
	HBScreenPos = C.WorldToScreen(TargetLocation);
	// End:0x21E
	if(((((((TargetLocation - CameraLocation) Dot CamDir) < float(0)) || HBScreenPos.X <= float(0)) || HBScreenPos.X >= float(C.SizeX)) || HBScreenPos.Y <= float(0)) || HBScreenPos.Y >= float(C.SizeY))
	{
		TargetLocation = A.Location + (vect(0.0000000, 0.0000000, 1.0000000) * A.CollisionHeight);
		// End:0x19E
		if(((TargetLocation - CameraLocation) Dot CamDir) < float(0))
		{
			return;
		}
		HBScreenPos = C.WorldToScreen(TargetLocation);
		// End:0x21E
		if((((HBScreenPos.X <= float(0)) || HBScreenPos.X >= C.ClipX) || HBScreenPos.Y <= float(0)) || HBScreenPos.Y >= C.ClipY)
		{
			return;
		}
	}
	// End:0x364
	if(FastTrace(TargetLocation, CameraLocation))
	{
		C.DrawColor = WhiteColor;
		C.SetPos(HBScreenPos.X - (HealthBarWidth * 0.5000000), HBScreenPos.Y);
		C.DrawTileStretched(HealthBarBackMat, HealthBarWidth, HealthBarHeight);
		HealthPct = (1.0000000 * float(Health)) / float(MaxHealth);
		// End:0x2D4
		if(HealthPct < 0.3500000)
		{
			C.DrawColor = RedColor;			
		}
		else
		{
			// End:0x2FA
			if(HealthPct < 0.7000000)
			{
				C.DrawColor = GoldColor;				
			}
			else
			{
				C.DrawColor = GreenColor;
			}
		}
		C.SetPos(HBScreenPos.X - (HealthBarWidth * 0.5000000), HBScreenPos.Y);
		C.DrawTileStretched(HealthBarMat, HealthBarWidth * HealthPct, HealthBarHeight);
	}
	C.DrawColor = OldDrawColor;
	//return;	
}

simulated function Timer()
{
	local ONSPowerCore C;

	// End:0x6D
	if(((PlayerOwner.Pawn != none) && OwnerPRI != none) && OwnerPRI.Team != none)
	{
		C = OwnerPRI.GetCurrentNode();
		// End:0x6D
		if(C != none)
		{
			PlayerOwner.ReceiveLocalizedMessage(Class'Onslaught.ONSOnslaughtMessage', 22);
		}
	}
	//return;	
}

simulated function Tick(float DeltaTime)
{
	local ONSPowerCore Core;

	super.Tick(DeltaTime);
	// End:0x33
	if((OwnerPRI == none) && PawnOwnerPRI != none)
	{
		OwnerPRI = ONSPlayerReplicationInfo(PawnOwnerPRI);
	}
	// End:0xA4
	if(int(FinalCore[0].DefenderTeamIndex) != 0)
	{
		// End:0xA3
		foreach AllActors(Class'Onslaught.ONSPowerCore', Core)
		{
			// End:0xA2
			if(Core.bFinalCore && int(Core.DefenderTeamIndex) < 2)
			{
				FinalCore[int(Core.DefenderTeamIndex)] = Core;
			}			
		}		
	}
	// End:0xC8
	if(!bReceivedLinks && OwnerPRI != none)
	{
		ClearLinks();
		RequestPowerLinks();
	}
	ColorPercent = 0.5000000 + (Cos(((Level.TimeSeconds * 4.0000000) * 3.1415900) * 0.5000000) * 0.5000000);
	//return;	
}

simulated function RequestPowerLinks()
{
	// End:0x5E
	if(OwnerPRI != none)
	{
		OwnerPRI.__OnReceiveLink__Delegate = ReceiveLink;
		OwnerPRI.__OnRemoveLink__Delegate = RemoveLink;
		OwnerPRI.__ResetLinks__Delegate = ResetLinks;
		OwnerPRI.ServerSendPowerLinks();
		bReceivedLinks = true;
	}
	//return;	
}

exec function ToggleRadarMap()
{
	bMapDisabled = !bMapDisabled;
	//return;	
}

exec function LinkDesigner()
{
	// End:0x1A
	if(OwnerPRI != none)
	{
		OwnerPRI.RequestLinkDesigner();
	}
	//return;	
}

exec function CopyLinkSetup()
{
	local ONSPowerLinkOfficialSetup S;
	local PowerLinkSetup BlankSetup;
	local ONSPowerCore O;
	local int X, Y;

	S = Spawn(Class'Onslaught.ONSPowerLinkOfficialSetup');
	// End:0xCF
	foreach DynamicActors(Class'Onslaught.ONSPowerCore', O)
	{
		S.LinkSetups[X] = BlankSetup;
		S.LinkSetups[X].BaseNode = O.Name;
		Y = 0;
		J0x67:

		// End:0xC7 [Loop If]
		if(Y < O.PowerLinks.Length)
		{
			S.LinkSetups[X].LinkedNodes[Y] = O.PowerLinks[Y].Name;
			Y++;
			// [Loop Continue]
			goto J0x67;
		}
		X++;		
	}	
	CopyObjectToClipboard(S);
	S.Destroy();
	PlayerOwner.ClientMessage("Link setup copied to clipboard");
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'HudContent.Generic.NoEntry');
	Level.AddPrecacheMaterial(Texture'HudContent.Generic.HUD');
	Level.AddPrecacheMaterial(Texture'InterfaceContent.Menu.BorderBoxD');
	Level.AddPrecacheMaterial(Texture'ONSInterface-TX.HealthBar');
	Level.AddPrecacheMaterial(Texture'ONSInterface-TX.MapBorderTEX');
	Level.AddPrecacheMaterial(Texture'ONSInterface-TX.NewHUDicons');
	Level.AddPrecacheMaterial(Texture'ONSInterface-TX.CurrentPlayerIcon');
	super(HudCDeathmatch).UpdatePrecacheMaterials();
	//return;	
}

static simulated function bool CoreWorldToScreen(ONSPowerCore Core, out Vector ScreenPos, float ScreenX, float ScreenY, float RadarWidth, float Range, Vector Center, optional bool bIgnoreRange)
{
	local Vector ScreenLocation;
	local float Dist;

	// End:0x0D
	if(Core == none)
	{
		return false;
	}
	ScreenLocation = Core.Location - Center;
	ScreenLocation.Z = 0.0000000;
	Dist = VSize(ScreenLocation);
	// End:0xCC
	if(bIgnoreRange || Dist < (Range * 0.9500000))
	{
		ScreenPos.X = ScreenX + (ScreenLocation.X * (RadarWidth / Range));
		ScreenPos.Y = ScreenY + (ScreenLocation.Y * (RadarWidth / Range));
		ScreenPos.Z = 0.0000000;
		return true;
	}
	return false;
	//return;	
}

static simulated function DrawMapImage(Canvas C, Material Image, float MapX, float MapY, float PlayerX, float PlayerY, Vector Dimensions)
{
	local float MapScale, MapSize;
	local byte SavedAlpha;

	// End:0x1A
	if((Image == none) || C == none)
	{
		return;
	}
	MapSize = float(Image.MaterialUSize());
	MapScale = MapSize / (Dimensions.Y * float(2));
	SavedAlpha = C.DrawColor.A;
	C.DrawColor = default.WhiteColor;
	C.DrawColor.A = byte(Dimensions.Z);
	C.SetPos(MapX - Dimensions.X, MapY - Dimensions.X);
	C.DrawTile(Image, Dimensions.X * 2.0000000, Dimensions.X * 2.0000000, ((PlayerX - Dimensions.Y) * MapScale) + (MapSize / 2.0000000), ((PlayerY - Dimensions.Y) * MapScale) + (MapSize / 2.0000000), (Dimensions.Y * float(2)) * MapScale, (Dimensions.Y * float(2)) * MapScale);
	C.DrawColor.A = SavedAlpha;
	//return;	
}

static simulated function DrawAttackIcon(Canvas C, ONSPowerCore CurCore, Vector HUDLocation, float IconScaling, float HUDScaling, float ColorPercentage)
{
	local float AttackIconSize, CoreIconSize;
	local Color HoldColor;

	// End:0x0D
	if(C == none)
	{
		return;
	}
	// End:0x6F
	if(CurCore.bFinalCore)
	{
		CoreIconSize = (((2.0000000 * IconScaling) * float(16)) * HUDScaling) * FMin(C.ClipX / 1600.0000000, C.ClipY / 1200.0000000);		
	}
	else
	{
		CoreIconSize = ((IconScaling * float(16)) * HUDScaling) * FMin(C.ClipX / 1600.0000000, C.ClipY / 1200.0000000);
	}
	AttackIconSize = CoreIconSize * (2.5000000 + (1.5000000 * ColorPercentage));
	HoldColor = C.DrawColor;
	// End:0x149
	if(CurCore.bSevered && int(CurCore.CoreStage) == 0)
	{
		C.DrawColor = (default.SeveredColorA * ColorPercentage) + (default.SeveredColorB * (1.0000000 - ColorPercentage));		
	}
	else
	{
		C.DrawColor = (default.AttackColorA * ColorPercentage) + (default.AttackColorB * (1.0000000 - ColorPercentage));
	}
	C.SetPos(HUDLocation.X - (AttackIconSize * 0.5000000), HUDLocation.Y - (AttackIconSize * 0.5000000));
	C.DrawTile(Texture'ONSInterface-TX.NewHUDicons', AttackIconSize, AttackIconSize, 0.0000000, 64.0000000, 64.0000000, 64.0000000);
	C.DrawColor = HoldColor;
	//return;	
}

static simulated function DrawCoreIcon(Canvas C, Vector HUDLocation, bool bAttackable, float IconScaling, float HUDScaling, float ColorPercentage)
{
	local float CoreIconSize;

	// End:0x0D
	if(C == none)
	{
		return;
	}
	CoreIconSize = ((IconScaling * float(16)) * HUDScaling) * FMin(C.ClipX / 1600.0000000, C.ClipY / 1200.0000000);
	C.SetPos(HUDLocation.X - ((CoreIconSize * 3.0000000) * 0.5000000), HUDLocation.Y - ((CoreIconSize * 3.0000000) * 0.5000000));
	// End:0xF6
	if(bAttackable)
	{
		C.DrawColor = (C.DrawColor * ColorPercentage) + ((C.DrawColor * 0.5000000) * (1.0000000 - ColorPercentage));
	}
	C.DrawTile(Texture'ONSInterface-TX.NewHUDicons', CoreIconSize * 3.0000000, CoreIconSize * 3.0000000, 64.0000000, 0.0000000, 64.0000000, 64.0000000);
	//return;	
}

static simulated function DrawNodeIcon(Canvas C, Vector HUDLocation, bool bAttackable, byte Stage, float IconScaling, float HUDScaling, float ColorPercentage)
{
	local float CoreIconSize;

	// End:0x0D
	if(C == none)
	{
		return;
	}
	CoreIconSize = ((IconScaling * float(16)) * HUDScaling) * FMin(C.ClipX / 1600.0000000, C.ClipY / 1200.0000000);
	// End:0x193
	if((int(Stage) == 4) || int(Stage) == 1)
	{
		// End:0x106
		if(bAttackable)
		{
			C.SetPos(HUDLocation.X - ((CoreIconSize * 0.7500000) * 0.5000000), HUDLocation.Y - ((CoreIconSize * 0.7500000) * 0.5000000));
			C.DrawTile(Texture'ONSInterface-TX.NewHUDicons', CoreIconSize * 0.7500000, CoreIconSize * 0.7500000, 0.0000000, 0.0000000, 32.0000000, 32.0000000);			
		}
		else
		{
			C.SetPos(HUDLocation.X - ((CoreIconSize * 1.7500000) * 0.5000000), HUDLocation.Y - ((CoreIconSize * 1.7500000) * 0.5000000));
			C.DrawTile(Texture'ONSInterface-TX.NewHUDicons', CoreIconSize * 1.7500000, CoreIconSize * 1.7500000, 0.0000000, 32.0000000, 32.0000000, 32.0000000);
		}		
	}
	else
	{
		// End:0x1DF
		if(int(Stage) != 0)
		{
			C.DrawColor = (C.DrawColor * ColorPercentage) + (default.LinkColor[2] * (1.0000000 - ColorPercentage));
		}
		// End:0x275
		if(bAttackable)
		{
			C.SetPos(HUDLocation.X - ((CoreIconSize * 2.0000000) * 0.5000000), HUDLocation.Y - ((CoreIconSize * 2.0000000) * 0.5000000));
			C.DrawTile(Texture'ONSInterface-TX.NewHUDicons', CoreIconSize * 2.0000000, CoreIconSize * 2.0000000, 32.0000000, 0.0000000, 32.0000000, 32.0000000);			
		}
		else
		{
			C.SetPos(HUDLocation.X - ((CoreIconSize * 1.7500000) * 0.5000000), HUDLocation.Y - ((CoreIconSize * 1.7500000) * 0.5000000));
			C.DrawTile(Texture'ONSInterface-TX.NewHUDicons', CoreIconSize * 1.7500000, CoreIconSize * 1.7500000, 0.0000000, 32.0000000, 32.0000000, 32.0000000);
		}
	}
	//return;	
}

static simulated function DrawSpawnIcon(Canvas C, Vector HUDLocation, bool bFinalCore, float IconScaling, float HUDScaling)
{
	local float CoreIconSize;

	// End:0x0D
	if(C == none)
	{
		return;
	}
	CoreIconSize = ((IconScaling * float(16)) * HUDScaling) * FMin(C.ClipX / 1600.0000000, C.ClipY / 1200.0000000);
	C.DrawColor.B = 0;
	C.DrawColor.G = 200;
	C.DrawColor.R = 0;
	C.DrawColor.A = byte(255);
	// End:0x143
	if(bFinalCore)
	{
		C.SetPos(HUDLocation.X - ((CoreIconSize * 5.5000000) * 0.5000000), HUDLocation.Y - ((CoreIconSize * 5.5000000) * 0.5000000));
		C.DrawTile(Texture'ONSInterface-TX.NewHUDicons', CoreIconSize * 5.5000000, CoreIconSize * 5.5000000, 64.0000000, 64.0000000, 64.0000000, 64.0000000);		
	}
	else
	{
		C.SetPos(HUDLocation.X - ((CoreIconSize * 4.5000000) * 0.5000000), HUDLocation.Y - ((CoreIconSize * 4.5000000) * 0.5000000));
		C.DrawTile(Texture'ONSInterface-TX.NewHUDicons', CoreIconSize * 4.5000000, CoreIconSize * 4.5000000, 64.0000000, 64.0000000, 64.0000000, 64.0000000);
	}
	//return;	
}

static simulated function DrawSelectionIcon(Canvas C, Vector HUDLocation, Color IconColor, float IconScaling, float HUDScaling)
{
	local float CoreIconSize;

	// End:0x0D
	if(C == none)
	{
		return;
	}
	CoreIconSize = ((IconScaling * float(16)) * HUDScaling) * FMin(C.ClipX / 1600.0000000, C.ClipY / 1200.0000000);
	C.DrawColor = IconColor;
	C.SetPos(HUDLocation.X - (CoreIconSize * 1.5000000), HUDLocation.Y - (CoreIconSize * 1.5000000));
	C.DrawTile(Texture'ONSInterface-TX.NewHUDicons', CoreIconSize * float(3), CoreIconSize * float(3), 32.0000000, 32.0000000, 32.0000000, 32.0000000);
	//return;	
}

defaultproperties
{
	RadarScale=0.2000000
	RadarTrans=255.0000000
	IconScale=1.0000000
	RadarPosX=1.0000000
	RadarPosY=0.1000000
	RadarMaxRange=500000.0000000
	HealthBarBackMat=Texture'InterfaceContent.Menu.BorderBoxD'
	HealthBarMat=Texture'ONSInterface-TX.HealthBar'
	HealthBarWidth=75.0000000
	HealthBarHeight=8.0000000
	HealthBarPosition=485.0000000
	HealthBarViewDist=4000.0000000
	BorderMat=Texture'ONSInterface-TX.MapBorderTEX'
	AttackColorA=(R=244,G=189,B=0,A=255)
	AttackColorB=(R=234,G=162,B=11,A=255)
	SeveredColorA=(R=192,G=192,B=192,A=255)
	SeveredColorB=(R=128,G=128,B=128,A=255)
	LinkColor[0]=(R=255,G=0,B=0,A=255)
	LinkColor[1]=(R=0,G=0,B=255,A=255)
	LinkColor[2]=(R=255,G=255,B=255,A=255)
	SymbolGB[0]=(WidgetTexture=Texture'HudContent.Generic.HUD',RenderStyle=5,TextureCoords=(X1=119,Y1=258,X2=173,Y2=313),TextureScale=0.6000000,DrawPivot=2,PosX=0.5000000,PosY=0.0000000,OffsetX=-32,OffsetY=7,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
	SymbolGB[1]=(WidgetTexture=Texture'HudContent.Generic.HUD',RenderStyle=5,TextureCoords=(X1=119,Y1=258,X2=173,Y2=313),TextureScale=0.6000000,DrawPivot=0,PosX=0.5000000,PosY=0.0000000,OffsetX=32,OffsetY=7,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
	CoreWidgets[0]=(WidgetTexture=Texture'HudContent.Generic.HUD',RenderStyle=5,TextureCoords=(X1=365,Y1=233,X2=432,Y2=313),TextureScale=0.2500000,DrawPivot=2,PosX=0.5000000,PosY=0.0000000,OffsetX=-110,OffsetY=45,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=100,B=100,A=200),Tints[1]=(R=255,G=32,B=32,A=200))
	CoreWidgets[1]=(WidgetTexture=Texture'HudContent.Generic.HUD',RenderStyle=5,TextureCoords=(X1=365,Y1=233,X2=432,Y2=313),TextureScale=0.2500000,DrawPivot=0,PosX=0.5000000,PosY=0.0000000,OffsetX=110,OffsetY=45,ScaleMode=4,Scale=1.0000000,Tints=(R=0,G=128,B=255,A=200),Tints[1]=(R=32,G=210,B=255,A=200))
	CoreHealthWidgets[0]=(RenderStyle=5,MinDigitCount=1,TextureScale=0.2400000,DrawPivot=8,PosX=0.5000000,PosY=0.0000000,OffsetX=-149,OffsetY=88,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes[1]=0)
	CoreHealthWidgets[1]=(RenderStyle=5,MinDigitCount=1,TextureScale=0.2400000,DrawPivot=8,PosX=0.5000000,PosY=0.0000000,OffsetX=149,OffsetY=88,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes[1]=0)
	NodeLabelWidget=(RenderStyle=5,MinDigitCount=1,TextureScale=0.2400000,DrawPivot=8,PosX=0.5000000,PosY=0.0000000,OffsetX=0,OffsetY=0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes[1]=0)
	ScoreTeam[0]=(RenderStyle=5,MinDigitCount=2,TextureScale=0.5400000,DrawPivot=3,PosX=0.4420000,PosY=0.0000000,OffsetX=-90,OffsetY=32,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes[1]=0)
	ScoreTeam[1]=(RenderStyle=5,MinDigitCount=2,TextureScale=0.5400000,DrawPivot=7,PosX=0.5580000,PosY=0.0000000,OffsetX=90,OffsetY=32,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes[1]=0)
	TeamScoreBackGround[0]=(WidgetTexture=Texture'HudContent.Generic.HUD',RenderStyle=5,TextureCoords=(X1=168,Y1=211,X2=334,Y2=255),TextureScale=0.5300000,DrawPivot=2,PosX=0.4420000,PosY=0.0000000,OffsetX=-50,OffsetY=10,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
	TeamScoreBackGround[1]=(WidgetTexture=Texture'HudContent.Generic.HUD',RenderStyle=5,TextureCoords=(X1=168,Y1=211,X2=334,Y2=255),TextureScale=0.5300000,DrawPivot=0,PosX=0.5580000,PosY=0.0000000,OffsetX=50,OffsetY=10,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
	TeamScoreBackGroundDisc[0]=(WidgetTexture=Texture'HudContent.Generic.HUD',RenderStyle=5,TextureCoords=(X1=119,Y1=258,X2=173,Y2=313),TextureScale=0.5300000,DrawPivot=2,PosX=0.4420000,PosY=0.0000000,OffsetX=-35,OffsetY=5,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
	TeamScoreBackGroundDisc[1]=(WidgetTexture=Texture'HudContent.Generic.HUD',RenderStyle=5,TextureCoords=(X1=119,Y1=258,X2=173,Y2=313),TextureScale=0.5300000,DrawPivot=0,PosX=0.5580000,PosY=0.0000000,OffsetX=35,OffsetY=5,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
	TeamSymbols[0]=(WidgetTexture=none,RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=256,Y2=256),TextureScale=0.1000000,DrawPivot=2,PosX=0.4420000,PosY=0.0000000,OffsetX=-200,OffsetY=45,ScaleMode=0,Scale=0.0000000,Tints=(R=255,G=100,B=100,A=200),Tints[1]=(R=255,G=32,B=32,A=200))
	TeamSymbols[1]=(WidgetTexture=none,RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=256,Y2=256),TextureScale=0.1000000,DrawPivot=0,PosX=0.5580000,PosY=0.0000000,OffsetX=200,OffsetY=45,ScaleMode=0,Scale=0.0000000,Tints=(R=0,G=128,B=255,A=200),Tints[1]=(R=32,G=210,B=255,A=200))
}
