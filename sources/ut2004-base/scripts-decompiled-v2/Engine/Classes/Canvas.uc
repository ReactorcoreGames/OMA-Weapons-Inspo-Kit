class Canvas extends Object
	native
	noexport;

var Font Font;
var float FontScaleX;
var float FontScaleY;
var float SpaceX;
var float SpaceY;
var float OrgX;
var float OrgY;
var float ClipX;
var float ClipY;
var float CurX;
var float CurY;
var float Z;
var byte Style;
var float CurYL;
var Color DrawColor;
var bool bCenter;
var bool bNoSmooth;
var const int SizeX;
var const int SizeY;
var Plane ColorModulate;
var bool bForceAlpha;
var float ForcedAlpha;
var bool bRenderLevel;
var Font TinyFont;
var Font SmallFont;
var Font MedFont;
var localized string TinyFontName;
var localized string SmallFontName;
var localized string MedFontName;
var const Viewport Viewport;
var private native transient pointer pCanvasUtil;

// Export UCanvas::execStrLen(FFrame&, void* const)
native(464) final function StrLen(coerce string String, out float XL, out float YL);

// Export UCanvas::execDrawText(FFrame&, void* const)
native(465) final function DrawText(coerce string Text, optional bool CR);

// Export UCanvas::execDrawTile(FFrame&, void* const)
native(466) final function DrawTile(Material mat, float XL, float YL, float U, float V, float UL, float VL);

// Export UCanvas::execDrawActor(FFrame&, void* const)
native(467) final function DrawActor(Actor A, bool Wireframe, optional bool ClearZ, optional float DisplayFOV);

// Export UCanvas::execDrawTileClipped(FFrame&, void* const)
native(468) final function DrawTileClipped(Material mat, float XL, float YL, float U, float V, float UL, float VL);

// Export UCanvas::execDrawTextClipped(FFrame&, void* const)
native(469) final function DrawTextClipped(coerce string Text, optional bool bCheckHotKey);

// Export UCanvas::execTextSize(FFrame&, void* const)
native(470) final function TextSize(coerce string String, out float XL, out float YL);

// Export UCanvas::execDrawPortal(FFrame&, void* const)
native(480) final function DrawPortal(int X, int Y, int Width, int Height, Actor CamActor, Vector CamLocation, Rotator CamRotation, optional int FOV, optional bool ClearZ);

// Export UCanvas::execWorldToScreen(FFrame&, void* const)
native final function Vector WorldToScreen(Vector WorldLoc);

// Export UCanvas::execGetCameraLocation(FFrame&, void* const)
native final function GetCameraLocation(out Vector CameraLocation, out Rotator CameraRotation);

// Export UCanvas::execSetScreenLight(FFrame&, void* const)
native final function SetScreenLight(int Index, Vector Position, Color LightColor, float Radius);

// Export UCanvas::execSetScreenProjector(FFrame&, void* const)
native final function SetScreenProjector(int Index, Vector Position, Color Color, float Radius, Texture Tex);

// Export UCanvas::execDrawScreenActor(FFrame&, void* const)
native final function DrawScreenActor(Actor A, optional float FOV, optional bool Wireframe, optional bool ClearZ);

// Export UCanvas::execClear(FFrame&, void* const)
native final function Clear(optional bool ClearRGB, optional bool ClearZ);

// Export UCanvas::execWrapStringToArray(FFrame&, void* const)
native final function WrapStringToArray(string Text, out array<string> OutArray, float dx, optional string EOL);

// Export UCanvas::execWrapText(FFrame&, void* const)
native static final function WrapText(out string Text, out string Line, float dx, Font F, float FontScaleX);

// Export UCanvas::execDrawTilePartialStretched(FFrame&, void* const)
native final function DrawTilePartialStretched(Material mat, float XL, float YL);

// Export UCanvas::execDrawTileStretched(FFrame&, void* const)
native final function DrawTileStretched(Material mat, float XL, float YL);

// Export UCanvas::execDrawTileJustified(FFrame&, void* const)
native final function DrawTileJustified(Material mat, byte Justification, float XL, float YL);

// Export UCanvas::execDrawTileScaled(FFrame&, void* const)
native final function DrawTileScaled(Material mat, float XScale, float YScale);

// Export UCanvas::execDrawTextJustified(FFrame&, void* const)
native final function DrawTextJustified(coerce string String, byte Justification, float X1, float Y1, float X2, float Y2);

// Export UCanvas::execDrawActorClipped(FFrame&, void* const)
native final function DrawActorClipped(Actor A, bool Wireframe, float Left, float Top, float Width, float Height, optional bool ClearZ, optional float DisplayFOV);

event Reset()
{
	Font = default.Font;
	FontScaleX = default.FontScaleX;
	FontScaleY = default.FontScaleY;
	SpaceX = default.SpaceX;
	SpaceY = default.SpaceY;
	OrgX = default.OrgX;
	OrgY = default.OrgY;
	CurX = default.CurX;
	CurY = default.CurY;
	Style = default.Style;
	DrawColor = default.DrawColor;
	CurYL = default.CurYL;
	bCenter = false;
	bNoSmooth = false;
	Z = 1.0000000;
	ColorModulate = default.ColorModulate;
	//return;	
}

final function SetPos(float X, float Y)
{
	CurX = X;
	CurY = Y;
	//return;	
}

final function SetOrigin(float X, float Y)
{
	OrgX = X;
	OrgY = Y;
	//return;	
}

final function SetClip(float X, float Y)
{
	ClipX = X;
	ClipY = Y;
	//return;	
}

final function DrawPattern(Material Tex, float XL, float YL, float Scale)
{
	DrawTile(Tex, XL, YL, (CurX - OrgX) * Scale, (CurY - OrgY) * Scale, XL * Scale, YL * Scale);
	//return;	
}

final function DrawIcon(Texture Tex, float Scale)
{
	// End:0x6B
	if(Tex != none)
	{
		DrawTile(Tex, float(Tex.USize) * Scale, float(Tex.VSize) * Scale, 0.0000000, 0.0000000, float(Tex.USize), float(Tex.VSize));
	}
	//return;	
}

final function DrawRect(Texture Tex, float RectX, float RectY)
{
	DrawTile(Tex, RectX, RectY, 0.0000000, 0.0000000, float(Tex.USize), float(Tex.VSize));
	//return;	
}

final function SetDrawColor(byte R, byte G, byte B, optional byte A)
{
	local Color C;

	C.R = R;
	C.G = G;
	C.B = B;
	// End:0x47
	if(int(A) == 0)
	{
		A = byte(255);
	}
	C.A = A;
	DrawColor = C;
	//return;	
}

static final function Color MakeColor(byte R, byte G, byte B, optional byte A)
{
	local Color C;

	C.R = R;
	C.G = G;
	C.B = B;
	// End:0x47
	if(int(A) == 0)
	{
		A = byte(255);
	}
	C.A = A;
	return C;
	//return;	
}

final function DrawVertical(float X, float Height)
{
	local float cX, cY;

	cX = CurX;
	cY = CurY;
	CurX = X;
	DrawTile(Texture'Engine.WhiteSquareTexture', 2.0000000, Height, 0.0000000, 0.0000000, 2.0000000, 2.0000000);
	CurX = cX;
	CurY = cY;
	//return;	
}

final function DrawHorizontal(float Y, float Width)
{
	local float cX, cY;

	cX = CurX;
	cY = CurY;
	CurY = Y;
	DrawTile(Texture'Engine.WhiteSquareTexture', Width, 2.0000000, 0.0000000, 0.0000000, 2.0000000, 2.0000000);
	CurX = cX;
	CurY = cY;
	//return;	
}

final function DrawLine(int direction, float Size)
{
	local float cX, cY;

	cX = CurX;
	cY = CurY;
	switch(direction)
	{
		// End:0x40
		case 0:
			CurY -= Size;
			DrawVertical(CurX, Size);
			// End:0x96
			break;
		// End:0x57
		case 1:
			DrawVertical(CurX, Size);
			// End:0x96
			break;
		// End:0x7B
		case 2:
			CurX -= Size;
			DrawHorizontal(CurY, Size);
			// End:0x96
			break;
		// End:0x93
		case 3:
			DrawHorizontal(CurY, Size);
			// End:0x96
			break;
		// End:0xFFFF
		default:
			break;
	}
	CurX = cX;
	CurY = cY;
	//return;	
}

final simulated function DrawBracket(float Width, float Height, float bracket_size)
{
	local float X, Y;

	Width = float(Max(int(Width), 5));
	Height = float(Max(int(Height), 5));
	X = CurX;
	Y = CurY;
	DrawHorizontal(CurY, bracket_size);
	DrawHorizontal(CurY + Height, bracket_size);
	DrawVertical(CurX, bracket_size);
	DrawVertical(CurX + Width, bracket_size);
	CurY = (Y + Height) - bracket_size;
	DrawVertical(CurX, bracket_size);
	DrawVertical(CurX + Width, bracket_size);
	CurX = (X + Width) - bracket_size;
	DrawHorizontal(Y, bracket_size);
	DrawHorizontal(Y + Height, bracket_size);
	//return;	
}

final simulated function DrawBox(Canvas Canvas, float Width, float Height)
{
	DrawHorizontal(CurY, Width);
	DrawHorizontal(CurY + Height, Width);
	DrawVertical(CurX, Height);
	DrawVertical(CurX + Width, Height);
	//return;	
}

simulated function DrawScreenText(string Text, float X, float Y, Object.EDrawPivot Pivot)
{
	local int TextScreenWidth, TextScreenHeight;
	local float UL, VL;

	X *= float(SizeX);
	Y *= float(SizeY);
	TextSize(Text, UL, VL);
	TextScreenWidth = int(UL);
	TextScreenHeight = int(VL);
	switch(Pivot)
	{
		// End:0x57
		case 0:
			// End:0x15A
			break;
		// End:0x71
		case 1:
			X -= float(TextScreenWidth / 2);
			// End:0x15A
			break;
		// End:0x87
		case 2:
			X -= float(TextScreenWidth);
			// End:0x15A
			break;
		// End:0xAF
		case 3:
			X -= float(TextScreenWidth);
			Y -= float(TextScreenHeight / 2);
			// End:0x15A
			break;
		// End:0xD3
		case 4:
			X -= float(TextScreenWidth);
			Y -= float(TextScreenHeight);
			// End:0x15A
			break;
		// End:0xFB
		case 5:
			X -= float(TextScreenWidth / 2);
			Y -= float(TextScreenHeight);
			// End:0x15A
			break;
		// End:0x111
		case 6:
			Y -= float(TextScreenHeight);
			// End:0x15A
			break;
		// End:0x12B
		case 7:
			Y -= float(TextScreenHeight / 2);
			// End:0x15A
			break;
		// End:0x157
		case 8:
			X -= float(TextScreenWidth / 2);
			Y -= float(TextScreenHeight / 2);
			// End:0x15A
			break;
		// End:0xFFFF
		default:
			break;
	}
	SetPos(X, Y);
	DrawTextClipped(Text);
	//return;	
}

defaultproperties
{
	Font=Font'Engine.DefaultFont'
	FontScaleX=1.0000000
	FontScaleY=1.0000000
	Z=1.0000000
	Style=1
	DrawColor=(R=127,G=127,B=127,A=255)
	ColorModulate=(W=1.0000000,X=1.0000000,Y=1.0000000,Z=1.0000000)
	bRenderLevel=true
	TinyFontName="UT2003Fonts.FontMono"
	SmallFontName="UT2003Fonts.FontMono"
	MedFontName="UT2003Fonts.FontMono800x600"
}
