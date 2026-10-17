class ClassicSniperRifle extends Weapon
	config(User);

var transient float LastFOV;
var() bool zoomed;
var Color ChargeColor;

simulated function PostBeginPlay()
{
	super.PostBeginPlay();
	FireMode[1].FireAnim = 'Idle';
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

simulated event RenderOverlays(Canvas Canvas)
{
	local float cX, cY, Scale, ChargeBar, barOrgX, barOrgY,
		barSizeX, barSizeY;

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
		cX = Canvas.ClipX / float(2);
		cY = Canvas.ClipY / float(2);
		Scale = Canvas.ClipX / float(1024);
		Canvas.Style = 5;
		Canvas.SetDrawColor(0, 0, 0);
		Canvas.SetPos(cX - (float(169) * Scale), cY - (float(155) * Scale));
		Canvas.DrawTile(Texture'NewSniperRifle.1stPerson.CogAssaultZoomedCrosshair', 169.0000000 * Scale, 310.0000000 * Scale, 164.0000000, 35.0000000, 169.0000000, 310.0000000);
		Canvas.SetPos(cX, cY - (float(155) * Scale));
		Canvas.DrawTile(Texture'NewSniperRifle.1stPerson.CogAssaultZoomedCrosshair', 169.0000000 * Scale, 310.0000000 * Scale, 332.0000000, 345.0000000, -169.0000000, -310.0000000);
		Canvas.SetPos(160.0000000 * Scale, 160.0000000 * Scale);
		Canvas.DrawTile(Texture'NewSniperRifle.1stPerson.CogAssaultZoomedCrosshair', 111.0000000 * Scale, 111.0000000 * Scale, 0.0000000, 0.0000000, 111.0000000, 111.0000000);
		Canvas.SetPos(Canvas.ClipX - (float(271) * Scale), 160.0000000 * Scale);
		Canvas.DrawTile(Texture'NewSniperRifle.1stPerson.CogAssaultZoomedCrosshair', 111.0000000 * Scale, 111.0000000 * Scale, 111.0000000, 0.0000000, -111.0000000, 111.0000000);
		Canvas.SetPos(160.0000000 * Scale, Canvas.ClipY - (float(271) * Scale));
		Canvas.DrawTile(Texture'NewSniperRifle.1stPerson.CogAssaultZoomedCrosshair', 111.0000000 * Scale, 111.0000000 * Scale, 0.0000000, 111.0000000, 111.0000000, -111.0000000);
		Canvas.SetPos(Canvas.ClipX - (float(271) * Scale), Canvas.ClipY - (float(271) * Scale));
		Canvas.DrawTile(Texture'NewSniperRifle.1stPerson.CogAssaultZoomedCrosshair', 111.0000000 * Scale, 111.0000000 * Scale, 111.0000000, 111.0000000, -111.0000000, -111.0000000);
		Canvas.SetPos(0.0000000, 0.0000000);
		Canvas.DrawTile(Texture'NewSniperRifle.1stPerson.CogAssaultZoomedCrosshair', 160.0000000 * Scale, 160.0000000 * Scale, 0.0000000, 274.0000000, 159.0000000, -158.0000000);
		Canvas.SetPos(Canvas.ClipX - (float(160) * Scale), 0.0000000);
		Canvas.DrawTile(Texture'NewSniperRifle.1stPerson.CogAssaultZoomedCrosshair', 160.0000000 * Scale, 160.0000000 * Scale, 159.0000000, 274.0000000, -159.0000000, -158.0000000);
		Canvas.SetPos(0.0000000, Canvas.ClipY - (float(160) * Scale));
		Canvas.DrawTile(Texture'NewSniperRifle.1stPerson.CogAssaultZoomedCrosshair', 160.0000000 * Scale, 160.0000000 * Scale, 0.0000000, 116.0000000, 159.0000000, 158.0000000);
		Canvas.SetPos(Canvas.ClipX - (float(160) * Scale), Canvas.ClipY - (float(160) * Scale));
		Canvas.DrawTile(Texture'NewSniperRifle.1stPerson.CogAssaultZoomedCrosshair', 160.0000000 * Scale, 160.0000000 * Scale, 159.0000000, 116.0000000, -159.0000000, 158.0000000);
		Canvas.SetPos(160.0000000 * Scale, 0.0000000);
		Canvas.DrawTile(Texture'NewSniperRifle.1stPerson.CogAssaultZoomedCrosshair', Canvas.ClipX - (float(320) * Scale), 160.0000000 * Scale, 284.0000000, 512.0000000, 32.0000000, -160.0000000);
		Canvas.SetPos(160.0000000 * Scale, Canvas.ClipY - (float(160) * Scale));
		Canvas.DrawTile(Texture'NewSniperRifle.1stPerson.CogAssaultZoomedCrosshair', Canvas.ClipX - (float(320) * Scale), 160.0000000 * Scale, 284.0000000, 352.0000000, 32.0000000, 160.0000000);
		Canvas.SetPos(0.0000000, 160.0000000 * Scale);
		Canvas.DrawTile(Texture'NewSniperRifle.1stPerson.CogAssaultZoomedCrosshair', 160.0000000 * Scale, Canvas.ClipY - (float(320) * Scale), 0.0000000, 308.0000000, 160.0000000, 32.0000000);
		Canvas.SetPos(Canvas.ClipX - (float(160) * Scale), 160.0000000 * Scale);
		Canvas.DrawTile(Texture'NewSniperRifle.1stPerson.CogAssaultZoomedCrosshair', 160.0000000 * Scale, Canvas.ClipY - (float(320) * Scale), 160.0000000, 308.0000000, -160.0000000, 32.0000000);
		Canvas.DrawColor = ChargeColor;
		Canvas.DrawColor.A = byte(255);
		// End:0x897
		if(ChargeBar < float(1))
		{
			Canvas.DrawColor.R = byte(float(255) * ChargeBar);			
		}
		else
		{
			Canvas.DrawColor.R = 0;
			Canvas.DrawColor.B = 0;
		}
		// End:0x8EB
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
	// End:0x3B
	if(PlayerController(Instigator.Controller) != none)
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
	// End:0x45
	if(super.PutDown())
	{
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
			return 0.7800000;
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

simulated function bool WantsZoomFade()
{
	return true;
	//return;	
}

defaultproperties
{
	ChargeColor=(R=255,G=255,B=255,A=255)
	FireModeClass[0]=Class'UTClassic.ClassicSniperFire'
	FireModeClass[1]=Class'XWeapons.SniperZoom'
	SelectAnim="Pickup"
	PutDownAnim="PutDown"
	SelectAnimRate=0.7500000
	PutDownAnimRate=0.7800000
	PutDownTime=0.5800000
	BringUpTime=0.6000000
	SelectSound=Sound'NewWeaponSounds.NewSniper_load'
	SelectForce="NewSniperLoad"
	AIRating=0.6900000
	CurrentRating=0.6900000
	bSniping=true
	Description="This high muzzle velocity sniper rifle with a 10X scope is a lethal weapon at any range, especially if you can land a head shot."
	EffectOffset=(X=100.0000000,Y=28.0000000,Z=-19.0000000)
	DisplayFOV=60.0000000
	Priority=12
	HudColor=(R=185,G=170,B=255,A=255)
	SmallViewOffset=(X=36.9000000,Y=10.0000000,Z=-14.0000000)
	CenteredOffsetY=0.0000000
	CenteredYaw=-500
	CustomCrossHairColor=(R=185,G=170,B=255,A=255)
	InventoryGroup=9
	GroupOffset=1
	PickupClass=Class'UTClassic.ClassicSniperRiflePickup'
	PlayerViewOffset=(X=27.7000000,Y=5.3000000,Z=-10.6000000)
	PlayerViewPivot=(Pitch=0,Yaw=16384,Roll=0)
	BobDamping=2.3000000
	AttachmentClass=Class'UTClassic.ClassicSniperAttachment'
	IconMaterial=Texture'HudContent.Generic.HUD'
	IconCoords=(X1=420,Y1=180,X2=512,Y2=210)
	ItemName="Sniper Rifle"
	LightType=1
	LightEffect=13
	LightHue=30
	LightSaturation=170
	LightBrightness=255.0000000
	LightRadius=5.0000000
	LightPeriod=3
	CullDistance=5000.0000000
	Mesh=SkeletalMesh'SniperAnims.SniperRifle_1st'
	DrawScale=0.4800000
	HighDetailOverlay=Combiner'UT2004Weapons.WeaponSpecMap2'
}
