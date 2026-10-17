class Painter extends Weapon
	config(User);

var(Gfx) float borderX;
var(Gfx) float borderY;
var(Gfx) float focusX;
var(Gfx) float focusY;
var(Gfx) float innerArrowsX;
var(Gfx) float innerArrowsY;
var(Gfx) Color ArrowColor;
var(Gfx) Color FocusColor;
var(Gfx) Color ChargeColor;
var(Gfx) Vector RechargeOrigin;
var(Gfx) Vector RechargeOffset;
var(Gfx) Vector RechargeSize;
var transient float LastFOV;
var bool zoomed;
var Vector EndEffect;
var Vector MarkLocation;
var IonCannon FirstCannon;

function bool ConsumeAmmo(int Mode, float load, optional bool bAmountNeededIsMax)
{
	return true;
	//return;	
}

function ReallyConsumeAmmo(int Mode, float load)
{
	ConsumeAmmo(Mode, load);
	//return;	
}

simulated function ClientWeaponThrown()
{
	// End:0x43
	if((Instigator != none) && PlayerController(Instigator.Controller) != none)
	{
		PlayerController(Instigator.Controller).EndZoom();
	}
	super.ClientWeaponThrown();
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
		ChargeBar, barOrgX, barOrgY, barSizeX, barSizeY;

	local PainterFire PainterFire;
	local float PaddingSize, ChunkSize, ChunkSizeRel;

	CheckOutOfAmmo();
	// End:0x3E
	if(LastFOV > PlayerController(Instigator.Controller).DesiredFOV)
	{
		PlaySound(SoundGroup'WeaponSounds.LightningGun.LightningZoomIn', 1,,,,, false);		
	}
	else
	{
		// End:0x73
		if(LastFOV < PlayerController(Instigator.Controller).DesiredFOV)
		{
			PlaySound(SoundGroup'WeaponSounds.LightningGun.LightningZoomOut', 1,,,,, false);
		}
	}
	LastFOV = PlayerController(Instigator.Controller).DesiredFOV;
	// End:0xE8
	if(PlayerController(Instigator.Controller).DesiredFOV == PlayerController(Instigator.Controller).DefaultFOV)
	{
		super.RenderOverlays(Canvas);
		zoomed = false;		
	}
	else
	{
		PainterFire = PainterFire(FireMode[0]);
		// End:0x1A2
		if((PainterFire.bIsFiring && PainterFire.bValidMark) && (Level.TimeSeconds - PainterFire.MarkTime) > 0.4000000)
		{
			ChargeBar = FMin(1.0000000, (Level.TimeSeconds - PainterFire.MarkTime) / PainterFire.PaintDuration);
			// End:0x19F
			if(ChargeBar >= 1.0000000)
			{
				ChargeBar = 0.0000000;
			}			
		}
		else
		{
			ChargeBar = 0.0000000;
		}
		tileScaleX = FMin(float(Canvas.SizeX) / 640.0000000, float(Canvas.SizeY) / 480.0000000);
		tileScaleY = tileScaleX;
		bX = borderX * tileScaleX;
		bY = borderY * tileScaleY;
		fX = focusX * tileScaleX;
		fY = focusY * tileScaleX;
		barOrgX = (float(Canvas.SizeX) * 0.5000000) + (RechargeOffset.X * tileScaleX);
		barOrgY = (float(Canvas.SizeY) * 0.5000000) + (RechargeOffset.Y * tileScaleY);
		barSizeX = RechargeSize.X * tileScaleX;
		barSizeY = RechargeSize.Y * tileScaleY;
		SetZoomBlendColor(Canvas);
		Canvas.Style = byte(255);
		Canvas.SetPos((float(Canvas.SizeX) - (640.0000000 * tileScaleX)) * 0.5000000, (float(Canvas.SizeY) - (480.0000000 * tileScaleY)) * 0.5000000);
		Canvas.DrawTile(FinalBlend'XGameShaders.ZoomFX.ZoomFB', 640.0000000 * tileScaleX, 480.0000000 * tileScaleY, 0.0000000, 0.0000000, 512.0000000, 512.0000000);
		PaddingSize = (float(Canvas.SizeX) - (640.0000000 * tileScaleX)) * 0.5000000;
		J0x3A3:

		// End:0x4C6 [Loop If]
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
			goto J0x3A3;
		}
		PaddingSize = (float(Canvas.SizeY) - (480.0000000 * tileScaleY)) * 0.5000000;
		J0x4F1:

		// End:0x614 [Loop If]
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
			goto J0x4F1;
		}
		Canvas.Style = 5;
		Canvas.SetPos(0.0000000, 0.0000000);
		Canvas.DrawTile(Texture'XWeapons_rc.Icons.SniperBorder', bX, bY, 0.0000000, 0.0000000, float(Texture'XWeapons_rc.Icons.SniperBorder'.USize), float(Texture'XWeapons_rc.Icons.SniperBorder'.VSize));
		Canvas.SetPos(float(Canvas.SizeX) - bX, 0.0000000);
		Canvas.DrawTile(Texture'XWeapons_rc.Icons.SniperBorder', bX, bY, 0.0000000, 0.0000000, float(-Texture'XWeapons_rc.Icons.SniperBorder'.USize), float(Texture'XWeapons_rc.Icons.SniperBorder'.VSize));
		Canvas.SetPos(float(Canvas.SizeX) - bX, float(Canvas.SizeY) - bY);
		Canvas.DrawTile(Texture'XWeapons_rc.Icons.SniperBorder', bX, bY, 0.0000000, 0.0000000, float(-Texture'XWeapons_rc.Icons.SniperBorder'.USize), float(-Texture'XWeapons_rc.Icons.SniperBorder'.VSize));
		Canvas.SetPos(0.0000000, float(Canvas.SizeY) - bY);
		Canvas.DrawTile(Texture'XWeapons_rc.Icons.SniperBorder', bX, bY, 0.0000000, 0.0000000, float(Texture'XWeapons_rc.Icons.SniperBorder'.USize), float(-Texture'XWeapons_rc.Icons.SniperBorder'.VSize));
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
		// End:0x9FB
		if(ChargeBar < float(1))
		{
			Canvas.DrawColor.R = byte(float(255) * ChargeBar);			
		}
		else
		{
			Canvas.DrawColor.R = 0;
			Canvas.DrawColor.B = 0;
		}
		// End:0xA4F
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
		super.ClientStartFire(Mode);
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
		super.ClientStopFire(Mode);
	}
	//return;	
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	// End:0x62
	if(((Instigator != none) && Instigator.Controller != none) && Instigator.Controller.IsA('PlayerController'))
	{
		LastFOV = PlayerController(Instigator.Controller).DesiredFOV;
	}
	super.BringUp(PrevWeapon);
	//return;	
}

simulated function bool PutDown()
{
	// End:0x3A
	if(Instigator.Controller.IsA('PlayerController'))
	{
		PlayerController(Instigator.Controller).EndZoom();
	}
	return super.PutDown();
	//return;	
}

simulated function bool HasAmmo()
{
	return (FireMode[0] != none) && (AmmoAmount(0)) >= 1;
	//return;	
}

function IonCannon CheckMark(Vector MarkLocation, bool bFire)
{
	// End:0x11
	if(FirstCannon != none)
	{
		return FirstCannon;
	}
	// End:0x29
	foreach DynamicActors(Class'XWeapons.IonCannon', FirstCannon)
	{		
		return FirstCannon;		
	}	
	FirstCannon = Spawn(Class'XWeapons.IonCannon',,, Location + vect(0.0000000, 0.0000000, 2000.0000000));
	return FirstCannon;
	//return;	
}

function float GetAIRating()
{
	local Bot B;
	local Vector HitLocation, HitNormal;

	B = Bot(Instigator.Controller);
	// End:0x2A
	if(B == none)
	{
		return AIRating;
	}
	// End:0xB2
	if(B.IsShootingObjective() && Trace(HitLocation, HitNormal, B.Target.Location - vect(0.0000000, 0.0000000, 2000.0000000), B.Target.Location, false) != none)
	{
		MarkLocation = HitLocation;
		// End:0xB2
		if((CheckMark(MarkLocation, false)) != none)
		{
			return AIRating;
		}
	}
	// End:0x118
	if(((B.Enemy == none) || Instigator.Location.Z < B.Enemy.Location.Z) || !B.EnemyVisible())
	{
		return 0.0000000;
	}
	MarkLocation = B.Enemy.Location - (B.Enemy.CollisionHeight * vect(0.0000000, 0.0000000, 2.0000000));
	// End:0x175
	if((CheckMark(MarkLocation, false)) != none)
	{
		return 2.0000000;
	}
	// End:0x19D
	if(TerrainInfo(B.Enemy.Base) == none)
	{
		return 0.0000000;
	}
	return 0.1000000;
	//return;	
}

function byte BestMode()
{
	return 0;
	//return;	
}

function float SuggestAttackStyle()
{
	return 0.0000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return 2.0000000;
	//return;	
}

function float RangedAttackTime()
{
	return 6.0000000;
	//return;	
}

function bool RecommendRangedAttack()
{
	return true;
	//return;	
}

function bool RecommendLongRangedAttack()
{
	return true;
	//return;	
}

defaultproperties
{
	borderX=60.0000000
	borderY=60.0000000
	focusX=135.0000000
	focusY=105.0000000
	innerArrowsX=42.0000000
	innerArrowsY=42.0000000
	ArrowColor=(R=200,G=200,B=200,A=255)
	FocusColor=(R=71,G=90,B=126,A=215)
	ChargeColor=(R=255,G=255,B=255,A=255)
	RechargeOrigin=(X=600.0000000,Y=330.0000000,Z=0.0000000)
	RechargeOffset=(X=280.0000000,Y=90.0000000,Z=0.0000000)
	RechargeSize=(X=10.0000000,Y=-180.0000000,Z=0.0000000)
	FireModeClass[0]=Class'XWeapons.PainterFire'
	FireModeClass[1]=Class'XWeapons.PainterZoom'
	PutDownAnim="PutDown"
	SelectSound=Sound'WeaponSounds.LinkGun.SwitchToLinkGun'
	SelectForce="SwitchToLinkGun"
	AIRating=1.0000000
	CurrentRating=1.0000000
	bNotInDemo=true
	Description="The Ion Painter seems innocuous enough at first glance, emitting a harmless low-power laser beam when the primary firing mode is engaged. Several seconds later a multi-gigawatt orbital ion cannon fires on the target, neutralizing any combatants in the vicinity.||The Ion Painter is a remote targeting device used to orient and fire the VAPOR Ion Cannon. The Ion Painter offers increased targeting accuracy via its telescopic sight, easily activated by the secondary fire mode of the weapon.|Once the Ion Painter has been used to designate a target it is highly recommended that the user put considerable distance between themselves and the weapon's area of effect."
	DemoReplacement=Class'XWeapons.SniperRifle'
	EffectOffset=(X=100.0000000,Y=25.0000000,Z=-3.0000000)
	DisplayFOV=60.0000000
	Priority=15
	SmallViewOffset=(X=37.0000000,Y=8.0000000,Z=-7.0000000)
	CenteredOffsetY=-22.0000000
	CenteredRoll=1000
	CustomCrosshair=13
	CustomCrossHairColor=(R=255,G=255,B=128,A=255)
	CustomCrossHairScale=2.0000000
	CustomCrossHairTextureName="Crosshairs.Hud.Crosshair_Circle2"
	InventoryGroup=0
	PickupClass=Class'XWeapons.PainterPickup'
	PlayerViewOffset=(X=25.0000000,Y=2.0000000,Z=-1.0000000)
	BobDamping=1.5750000
	AttachmentClass=Class'XWeapons.PainterAttachment'
	IconMaterial=Texture'HudContent.Generic.HUD'
	IconCoords=(X1=0,Y1=407,X2=118,Y2=442)
	ItemName="Ion Painter"
	Mesh=SkeletalMesh'Weapons.Painter_1st'
	HighDetailOverlay=Combiner'UT2004Weapons.WeaponSpecMap2'
}
