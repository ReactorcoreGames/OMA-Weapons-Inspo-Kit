class ZoomSuperShockRifle extends SuperShockRifle
	config(User)
	hidedropdown
	cacheexempt;

var(Gfx) float testX;
var(Gfx) float testY;
var(Gfx) float borderX;
var(Gfx) float borderY;
var(Gfx) float focusX;
var(Gfx) float focusY;
var(Gfx) float innerArrowsX;
var(Gfx) float innerArrowsY;
var(Gfx) Color ArrowColor;
var(Gfx) Color TargetColor;
var(Gfx) Color NoTargetColor;
var(Gfx) Color FocusColor;
var(Gfx) Color ChargeColor;
var(Gfx) Vector RechargeOrigin;
var(Gfx) Vector RechargeOffset;
var(Gfx) Vector RechargeSize;
var transient float LastFOV;
var() bool zoomed;
var() xEmitter chargeEmitter;

simulated function PostBeginPlay()
{
	super(ShockRifle).PostBeginPlay();
	//return;	
}

simulated function bool WeaponCentered()
{
	return (zoomed || bSpectated) || hand > float(1);
	//return;	
}

simulated function Destroyed()
{
	// End:0x17
	if(chargeEmitter != none)
	{
		chargeEmitter.Destroy();
	}
	super(Weapon).Destroyed();
	//return;	
}

simulated function ClientWeaponThrown()
{
	// End:0x47
	if((Instigator != none) && Instigator.Controller.IsA('PlayerController'))
	{
		PlayerController(Instigator.Controller).EndZoom();
	}
	super(Weapon).ClientWeaponThrown();
	//return;	
}

simulated function SetZoomBlendColor(Canvas C)
{
	local byte Val;
	local Color clr, fog;

	clr.R = byte(255);
	clr.G = byte(255);
	clr.B = byte(255);
	clr.A = byte(255);
	// End:0x129
	if(Instigator.Region.Zone.bDistanceFog)
	{
		fog = Instigator.Region.Zone.DistanceFogColor;
		Val = 0;
		Val = byte(Max(int(Val), int(fog.R)));
		Val = byte(Max(int(Val), int(fog.G)));
		Val = byte(Max(int(Val), int(fog.B)));
		// End:0x129
		if(int(Val) > 128)
		{
			Val -= byte(128);
			clr.R -= Val;
			clr.G -= Val;
			clr.B -= Val;
		}
	}
	C.DrawColor = clr;
	//return;	
}

simulated event RenderOverlays(Canvas Canvas)
{
	local float tileScaleX, tileScaleY, bX, bY, fX, fY,
		ChargeBar, tX, tY, barOrgX, barOrgY,
		barSizeX, barSizeY, PaddingSize, ChunkSize, ChunkSizeRel;

	// End:0x38
	if(LastFOV > PlayerController(Instigator.Controller).DesiredFOV)
	{
		PlaySound(SoundGroup'WeaponSounds.LightningGun.LightningZoomIn', 1,,,,, false);		
	}
	else
	{
		// End:0x6D
		if(LastFOV < PlayerController(Instigator.Controller).DesiredFOV)
		{
			PlaySound(SoundGroup'WeaponSounds.LightningGun.LightningZoomOut', 1,,,,, false);
		}
	}
	LastFOV = PlayerController(Instigator.Controller).DesiredFOV;
	// End:0xE2
	if(PlayerController(Instigator.Controller).DesiredFOV == PlayerController(Instigator.Controller).DefaultFOV)
	{
		super.RenderOverlays(Canvas);
		zoomed = false;		
	}
	else
	{
		// End:0x113
		if(FireMode[0].NextFireTime <= Level.TimeSeconds)
		{
			ChargeBar = 1.0000000;			
		}
		else
		{
			ChargeBar = 1.0000000 - ((FireMode[0].NextFireTime - Level.TimeSeconds) / FireMode[0].FireRate);
		}
		tileScaleX = FMin(float(Canvas.SizeX) / 640.0000000, float(Canvas.SizeY) / 480.0000000);
		tileScaleY = tileScaleX;
		bX = borderX * tileScaleX;
		bY = borderY * tileScaleY;
		fX = focusX * tileScaleX;
		fY = focusY * tileScaleX;
		tX = testX * tileScaleX;
		tY = testY * tileScaleX;
		barOrgX = (float(Canvas.SizeX) * 0.5000000) + (RechargeOffset.X * tileScaleX);
		barOrgY = (float(Canvas.SizeY) * 0.5000000) + (RechargeOffset.Y * tileScaleY);
		barSizeX = RechargeSize.X * tileScaleX;
		barSizeY = RechargeSize.Y * tileScaleY;
		SetZoomBlendColor(Canvas);
		Canvas.Style = byte(255);
		Canvas.SetPos((float(Canvas.SizeX) - (640.0000000 * tileScaleX)) * 0.5000000, (float(Canvas.SizeY) - (480.0000000 * tileScaleY)) * 0.5000000);
		Canvas.DrawTile(FinalBlend'XGameShaders.ZoomFX.ZoomFB', 640.0000000 * tileScaleX, 480.0000000 * tileScaleY, 0.0000000, 0.0000000, 512.0000000, 512.0000000);
		PaddingSize = (float(Canvas.SizeX) - (640.0000000 * tileScaleX)) * 0.5000000;
		J0x36C:

		// End:0x48F [Loop If]
		if(PaddingSize > 0.0000000)
		{
			ChunkSize = FMin(PaddingSize, 160.0000000 * tileScaleX);
			ChunkSizeRel = ChunkSize / (160.0000000 * tileScaleX);
			PaddingSize -= ChunkSize;
			Canvas.SetPos(PaddingSize, 0.0000000);
			Canvas.DrawTile(FinalBlend'XGameShaders.ZoomFX.ZoomFB', ChunkSize, 480.0000000 * tileScaleY, 128.0000000 * (1.0000000 - ChunkSizeRel), 0.0000000, 128.0000000 * ChunkSizeRel, 512.0000000);
			Canvas.SetPos((float(Canvas.SizeX) - PaddingSize) - ChunkSize, 0.0000000);
			Canvas.DrawTile(FinalBlend'XGameShaders.ZoomFX.ZoomFB', ChunkSize, 480.0000000 * tileScaleY, 384.0000000, 0.0000000, 128.0000000 * ChunkSizeRel, 512.0000000);
			// [Loop Continue]
			goto J0x36C;
		}
		PaddingSize = (float(Canvas.SizeY) - (480.0000000 * tileScaleY)) * 0.5000000;
		J0x4BA:

		// End:0x5DD [Loop If]
		if(PaddingSize > 0.0000000)
		{
			ChunkSize = FMin(PaddingSize, 120.0000000 * tileScaleY);
			ChunkSizeRel = ChunkSize / (120.0000000 * tileScaleY);
			PaddingSize -= ChunkSize;
			Canvas.SetPos(0.0000000, PaddingSize);
			Canvas.DrawTile(FinalBlend'XGameShaders.ZoomFX.ZoomFB', 640.0000000 * tileScaleX, ChunkSize, 0.0000000, 128.0000000 * (1.0000000 - ChunkSizeRel), 512.0000000, 128.0000000 * ChunkSizeRel);
			Canvas.SetPos(0.0000000, (float(Canvas.SizeX) - PaddingSize) - ChunkSize);
			Canvas.DrawTile(FinalBlend'XGameShaders.ZoomFX.ZoomFB', 640.0000000 * tileScaleX, ChunkSize, 0.0000000, 384.0000000, 512.0000000, 128.0000000 * ChunkSizeRel);
			// [Loop Continue]
			goto J0x4BA;
		}
		Canvas.DrawColor = FocusColor;
		Canvas.DrawColor.A = byte(255);
		Canvas.Style = 5;
		Canvas.SetPos((float(Canvas.SizeX) * 0.5000000) - fX, (float(Canvas.SizeY) * 0.5000000) - fY);
		Canvas.DrawTile(Texture'XWeapons_rc.Icons.SniperFocus', fX * 2.0000000, fY * 2.0000000, 0.0000000, 0.0000000, float(Texture'XWeapons_rc.Icons.SniperFocus'.USize), float(Texture'XWeapons_rc.Icons.SniperFocus'.VSize));
		fX = innerArrowsX * tileScaleX;
		fY = innerArrowsY * tileScaleY;
		Canvas.DrawColor = ArrowColor;
		Canvas.SetPos((float(Canvas.SizeX) * 0.5000000) - fX, (float(Canvas.SizeY) * 0.5000000) - fY);
		Canvas.DrawTile(Texture'XWeapons_rc.Icons.SniperArrows', fX * 2.0000000, fY * 2.0000000, 0.0000000, 0.0000000, float(Texture'XWeapons_rc.Icons.SniperArrows'.USize), float(Texture'XWeapons_rc.Icons.SniperArrows'.VSize));
		Canvas.DrawColor = ChargeColor;
		Canvas.DrawColor.A = byte(255);
		// End:0x7EB
		if(ChargeBar < float(1))
		{
			Canvas.DrawColor.R = byte(float(255) * ChargeBar);			
		}
		else
		{
			Canvas.DrawColor.R = 0;
			Canvas.DrawColor.B = 0;
		}
		// End:0x83F
		if(ChargeBar == float(1))
		{
			Canvas.DrawColor.G = byte(255);			
		}
		else
		{
			Canvas.DrawColor.G = 0;
		}
		Canvas.Style = 5;
		Canvas.SetPos(barOrgX, barOrgY);
		Canvas.DrawTile(Texture'Engine.WhiteTexture', barSizeX, barSizeY * ChargeBar, 0.0000000, 0.0000000, float(Texture'Engine.WhiteTexture'.USize), float(Texture'Engine.WhiteTexture'.VSize) * ChargeBar);
		zoomed = true;
	}
	//return;	
}

simulated function ClientStartFire(int Mode)
{
	// End:0x5F
	if(Mode == 1)
	{
		FireMode[Mode].bIsFiring = true;
		// End:0x5C
		if(Instigator.Controller.IsA('PlayerController'))
		{
			PlayerController(Instigator.Controller).ToggleZoom();
		}		
	}
	else
	{
		super(Weapon).ClientStartFire(Mode);
	}
	//return;	
}

simulated function ClientStopFire(int Mode)
{
	// End:0x5F
	if(Mode == 1)
	{
		FireMode[Mode].bIsFiring = false;
		// End:0x5C
		if(Instigator.Controller.IsA('PlayerController'))
		{
			PlayerController(Instigator.Controller).StopZoom();
		}		
	}
	else
	{
		super(Weapon).ClientStopFire(Mode);
	}
	//return;	
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	// End:0x3B
	if(PlayerController(Instigator.Controller) != none)
	{
		LastFOV = PlayerController(Instigator.Controller).DesiredFOV;
	}
	super(Weapon).BringUp();
	//return;	
}

simulated function bool PutDown()
{
	// End:0x3A
	if(Instigator.Controller.IsA('PlayerController'))
	{
		PlayerController(Instigator.Controller).EndZoom();
	}
	// End:0x4C
	if(super(Weapon).PutDown())
	{
		GotoState('None');
		return true;
	}
	return false;
	//return;	
}

simulated function IncrementFlashCount(int Mode)
{
	// End:0x0D
	if(Mode == 1)
	{
		return;
	}
	super(Weapon).IncrementFlashCount(Mode);
	//return;	
}

defaultproperties
{
	testX=100.0000000
	testY=100.0000000
	borderX=60.0000000
	borderY=60.0000000
	focusX=135.0000000
	focusY=105.0000000
	innerArrowsX=42.0000000
	innerArrowsY=42.0000000
	ArrowColor=(R=255,G=0,B=0,A=255)
	TargetColor=(R=255,G=255,B=255,A=255)
	NoTargetColor=(R=200,G=200,B=200,A=255)
	FocusColor=(R=71,G=90,B=126,A=215)
	ChargeColor=(R=255,G=255,B=255,A=255)
	RechargeOrigin=(X=600.0000000,Y=330.0000000,Z=0.0000000)
	RechargeOffset=(X=280.0000000,Y=90.0000000,Z=0.0000000)
	RechargeSize=(X=10.0000000,Y=-180.0000000,Z=0.0000000)
	FireModeClass[0]=Class'XWeapons.ZoomSuperShockBeamFire'
	FireModeClass[1]=Class'XWeapons.SniperZoom'
	bSniping=true
}
