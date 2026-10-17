class SniperRifle extends Weapon
	config(User);

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
	super.PostBeginPlay();
	//return;	
}

simulated function Destroyed()
{
	// End:0x17
	if(chargeEmitter != none)
	{
		chargeEmitter.Destroy();
	}
	super.Destroyed();
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

simulated function IncrementFlashCount(int Mode)
{
	// End:0x0D
	if(Mode == 1)
	{
		return;
	}
	super.IncrementFlashCount(Mode);
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
	local float tileScaleX, tileScaleY, fX, fY, ChargeBar, barOrgX,
		barOrgY, barSizeX, barSizeY, PaddingSize, ChunkSize,
		ChunkSizeRel;

	// End:0x2E
	if(PlayerController(Instigator.Controller) == none)
	{
		super.RenderOverlays(Canvas);
		zoomed = false;
		return;
	}
	// End:0x66
	if(LastFOV > PlayerController(Instigator.Controller).DesiredFOV)
	{
		PlaySound(SoundGroup'WeaponSounds.LightningGun.LightningZoomIn', 1,,,,, false);		
	}
	else
	{
		// End:0x9B
		if(LastFOV < PlayerController(Instigator.Controller).DesiredFOV)
		{
			PlaySound(SoundGroup'WeaponSounds.LightningGun.LightningZoomOut', 1,,,,, false);
		}
	}
	LastFOV = PlayerController(Instigator.Controller).DesiredFOV;
	// End:0x110
	if(PlayerController(Instigator.Controller).DesiredFOV == PlayerController(Instigator.Controller).DefaultFOV)
	{
		super.RenderOverlays(Canvas);
		zoomed = false;		
	}
	else
	{
		// End:0x141
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
		fX = (2.0000000 * focusX) * tileScaleX;
		fY = (2.0000000 * focusY) * tileScaleX;
		barOrgX = (float(Canvas.SizeX) * 0.5000000) + (RechargeOffset.X * tileScaleX);
		barOrgY = (float(Canvas.SizeY) * 0.5000000) + (RechargeOffset.Y * tileScaleY);
		barSizeX = RechargeSize.X * tileScaleX;
		barSizeY = RechargeSize.Y * tileScaleY;
		SetZoomBlendColor(Canvas);
		Canvas.Style = byte(255);
		Canvas.SetPos((float(Canvas.SizeX) - (640.0000000 * tileScaleX)) * 0.5000000, (float(Canvas.SizeY) - (480.0000000 * tileScaleY)) * 0.5000000);
		Canvas.DrawTile(FinalBlend'XGameShaders.ZoomFX.ZoomFB', 640.0000000 * tileScaleX, 480.0000000 * tileScaleY, 128.0000000, 128.0000000, 256.0000000, 256.0000000);
		PaddingSize = (float(Canvas.SizeX) - (640.0000000 * tileScaleX)) * 0.5000000;
		J0x360:

		// End:0x483 [Loop If]
		if(PaddingSize > 0.0000000)
		{
			ChunkSize = FMin(PaddingSize, 320.0000000 * tileScaleX);
			ChunkSizeRel = ChunkSize / (320.0000000 * tileScaleX);
			PaddingSize -= ChunkSize;
			Canvas.SetPos(PaddingSize, 0.0000000);
			Canvas.DrawTile(FinalBlend'XGameShaders.ZoomFX.ZoomFB', ChunkSize, 480.0000000 * tileScaleY, 128.0000000 * (1.0000000 - ChunkSizeRel), 128.0000000, 128.0000000 * ChunkSizeRel, 256.0000000);
			Canvas.SetPos((float(Canvas.SizeX) - PaddingSize) - ChunkSize, 0.0000000);
			Canvas.DrawTile(FinalBlend'XGameShaders.ZoomFX.ZoomFB', ChunkSize, 480.0000000 * tileScaleY, 384.0000000, 128.0000000, 128.0000000 * ChunkSizeRel, 256.0000000);
			// [Loop Continue]
			goto J0x360;
		}
		PaddingSize = (float(Canvas.SizeY) - (480.0000000 * tileScaleY)) * 0.5000000;
		J0x4AE:

		// End:0x5D1 [Loop If]
		if(PaddingSize > 0.0000000)
		{
			ChunkSize = FMin(PaddingSize, 240.0000000 * tileScaleY);
			ChunkSizeRel = ChunkSize / (240.0000000 * tileScaleY);
			PaddingSize -= ChunkSize;
			Canvas.SetPos(0.0000000, PaddingSize);
			Canvas.DrawTile(FinalBlend'XGameShaders.ZoomFX.ZoomFB', 640.0000000 * tileScaleX, ChunkSize, 128.0000000, 128.0000000 * (1.0000000 - ChunkSizeRel), 256.0000000, 128.0000000 * ChunkSizeRel);
			Canvas.SetPos(0.0000000, (float(Canvas.SizeX) - PaddingSize) - ChunkSize);
			Canvas.DrawTile(FinalBlend'XGameShaders.ZoomFX.ZoomFB', 640.0000000 * tileScaleX, ChunkSize, 128.0000000, 384.0000000, 256.0000000, 128.0000000 * ChunkSizeRel);
			// [Loop Continue]
			goto J0x4AE;
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
		// End:0x7DF
		if(ChargeBar < float(1))
		{
			Canvas.DrawColor.R = byte(float(255) * ChargeBar);			
		}
		else
		{
			Canvas.DrawColor.R = 0;
			Canvas.DrawColor.B = 0;
		}
		// End:0x833
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
	// End:0x5B
	if(Mode == 1)
	{
		FireMode[Mode].bIsFiring = false;
		// End:0x58
		if(PlayerController(Instigator.Controller) != none)
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
	// End:0x54
	if(PlayerController(Instigator.Controller) != none)
	{
		LastFOV = PlayerController(Instigator.Controller).DesiredFOV;
		// End:0x54
		if(Instigator.IsLocallyControlled())
		{
			GotoState('TickEffects');
		}
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
	// End:0x4C
	if(super.PutDown())
	{
		GotoState('None');
		return true;
	}
	return false;
	//return;	
}

function float SuggestAttackStyle()
{
	return -0.4000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return 0.2000000;
	//return;	
}

function byte BestMode()
{
	return 0;
	//return;	
}

function float GetAIRating()
{
	local Bot B;
	local float ZDiff, Dist, Result;

	B = Bot(Instigator.Controller);
	// End:0x2A
	if(B == none)
	{
		return AIRating;
	}
	// End:0x49
	if(B.IsShootingObjective())
	{
		return AIRating - 0.1500000;
	}
	// End:0xBD
	if(B.Enemy == none)
	{
		// End:0xB7
		if((B.Target != none) && VSize(B.Target.Location - B.Pawn.Location) > float(8000))
		{
			return 0.9500000;
		}
		return AIRating;
	}
	// End:0xE4
	if(B.Stopped())
	{
		Result = AIRating + 0.1000000;		
	}
	else
	{
		Result = AIRating - 0.1000000;
	}
	// End:0x11B
	if(Vehicle(B.Enemy) != none)
	{
		Result -= 0.2000000;
	}
	ZDiff = Instigator.Location.Z - B.Enemy.Location.Z;
	// End:0x16F
	if(ZDiff < float(-200))
	{
		Result += 0.1000000;
	}
	Dist = VSize(B.Enemy.Location - Instigator.Location);
	// End:0x1F9
	if(Dist > float(2000))
	{
		// End:0x1D5
		if(!B.EnemyVisible())
		{
			Result = Result - 0.1500000;
		}
		return FMin(2.0000000, Result + ((Dist - float(2000)) * 0.0002000));
	}
	// End:0x21A
	if(!B.EnemyVisible())
	{
		return AIRating - 0.1000000;
	}
	return Result;
	//return;	
}

function bool RecommendRangedAttack()
{
	local Bot B;

	B = Bot(Instigator.Controller);
	// End:0x3C
	if((B == none) || B.Enemy == none)
	{
		return true;
	}
	return VSize(B.Enemy.Location - Instigator.Location) > (float(2000) * (float(1) + FRand()));
	//return;	
}

state TickEffects
{
	simulated function Tick(float t)
	{
		// End:0x2A
		if(chargeEmitter == none)
		{
			chargeEmitter = Spawn(Class'XEffects.LightningCharge', self);
			AttachToBone(chargeEmitter, 'tip');
		}
		chargeEmitter.mRegenPause = (FireMode[0].NextFireTime > Level.TimeSeconds) || (AmmoAmount(0)) == 0;
		//return;		
	}
	stop;	
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
	FireModeClass[0]=Class'XWeapons.SniperFire'
	FireModeClass[1]=Class'XWeapons.SniperZoom'
	SelectAnim="Pickup"
	PutDownAnim="PutDown"
	SelectAnimRate=1.2500000
	BringUpTime=0.3600000
	SelectSound=Sound'WeaponSounds.LightningGun.SwitchToLightningGun'
	SelectForce="SwitchToLightningGun"
	AIRating=0.6900000
	CurrentRating=0.6900000
	bSniping=true
	Description="The Lightning Gun is a high-power energy rifle capable of ablating even the heaviest carapace armor. Acquisition of a target at long range requires a steady hand, but the anti-jitter effect of the optical system reduces the weapon's learning curve significantly. Once the target has been acquired, the operator depresses the trigger, painting a proton 'patch' on the target. Milliseconds later the rifle emits a high voltage arc of electricity, which seeks out the charge differential and annihilates the target."
	EffectOffset=(X=100.0000000,Y=28.0000000,Z=-26.0000000)
	DisplayFOV=60.0000000
	Priority=11
	HudColor=(R=185,G=170,B=255,A=255)
	SmallViewOffset=(X=8.0000000,Y=6.3000000,Z=-4.0000000)
	SmallEffectOffset=(X=92.0000000,Y=32.0000000,Z=-35.0000000)
	CenteredOffsetY=0.0000000
	CenteredYaw=-500
	CustomCrossHairColor=(R=185,G=170,B=255,A=255)
	MinReloadPct=0.2500000
	InventoryGroup=9
	PickupClass=Class'XWeapons.SniperRiflePickup'
	PlayerViewOffset=(X=0.0000000,Y=2.3000000,Z=0.0000000)
	BobDamping=2.3000000
	AttachmentClass=Class'XWeapons.SniperAttachment'
	IconMaterial=Texture'HudContent.Generic.HUD'
	IconCoords=(X1=246,Y1=182,X2=331,Y2=210)
	ItemName="Lightning Gun"
	LightType=1
	LightEffect=13
	LightHue=165
	LightSaturation=170
	LightBrightness=255.0000000
	LightRadius=5.0000000
	LightPeriod=3
	Mesh=SkeletalMesh'Weapons.Sniper_1st'
	DrawScale=0.4000000
	HighDetailOverlay=Combiner'UT2004Weapons.WeaponSpecMap2'
}
