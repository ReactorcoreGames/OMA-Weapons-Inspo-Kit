class R9A1RangerRifle extends BallisticWeapon
	config(BallisticProV55);

var() bool bHasHybridScope;
var float lastModeChangeTime;
var() Rotator ScopeSightPivot;
var() Vector ScopeSightOffset;
var() Rotator IronSightPivot;
var() Vector IronSightOffset;

simulated function OnWeaponParamsChanged()
{
	super.OnWeaponParamsChanged();
	assert(WeaponParams != none);
	bHasHybridScope = false;
	// End:0x43
	if(InStr(WeaponParams.LayoutTags, "hybrid") != -1)
	{
		bHasHybridScope = true;
	}
	//return;	
}

simulated function PostBeginPlay()
{
	super.PostBeginPlay();
	// End:0x39
	if(int(CurrentWeaponMode) == 2)
	{
		SetBoneScale(0, 1.0000000, 'LaserMag');
		SetBoneScale(1, 0.0000000, 'BulletMag');		
	}
	else
	{
		SetBoneScale(0, 0.0000000, 'LaserMag');
		SetBoneScale(1, 1.0000000, 'BulletMag');
	}
	//return;	
}

function ServerSwitchWeaponMode(byte newmode)
{
	local int M;

	// End:0x0B
	if(bPreventReload)
	{
		return;
	}
	// End:0x1D
	if(int(ReloadState) != int(0))
	{
		return;
	}
	// End:0x3D
	if(int(newmode) == 255)
	{
		newmode = byte(int(CurrentWeaponMode) + 1);
	}
	// End:0x52
	if(int(newmode) == int(CurrentWeaponMode))
	{
		return;
	}
	J0x52:

	// End:0xB8 [Loop If]
	if((int(newmode) != int(CurrentWeaponMode)) && (int(newmode) >= WeaponModes.Length) || WeaponModes[int(newmode)].bUnavailable)
	{
		// End:0xAE
		if(int(newmode) >= WeaponModes.Length)
		{
			newmode = 0;			
		}
		else
		{
			newmode++;
		}
		// [Loop Continue]
		goto J0x52;
	}
	// End:0xFF
	if(!WeaponModes[int(newmode)].bUnavailable)
	{
		CommonSwitchWeaponMode(newmode);
		ClientSwitchWeaponMode(CurrentWeaponMode);
		NetUpdateTime = Level.TimeSeconds - float(1);
	}
	R9A1Attachment(ThirdPersonActor).CurrentTracerMode = CurrentWeaponMode;
	M = 0;
	J0x11F:

	// End:0x16B [Loop If]
	if(M < 2)
	{
		// End:0x161
		if((FireMode[M] != none) && FireMode[M].bIsFiring)
		{
			StopFire(M);
		}
		M++;
		// [Loop Continue]
		goto J0x11F;
	}
	bServerReloading = true;
	// End:0x1B6
	if((BallisticAttachment(ThirdPersonActor) != none) && BallisticAttachment(ThirdPersonActor).ReloadAnim != 'None')
	{
		Instigator.SetAnimAction('ReloadGun');
	}
	CommonStartReload(0);
	ClientStartReload(0);
	//return;	
}

simulated exec function SwitchWeaponMode(optional byte modeNum)
{
	// End:0x36
	if(((int(ClientState) == int(3)) || int(ClientState) == int(1)) || int(ReloadState) != int(0))
	{
		return;
	}
	bRedirectSwitchToFiremode = true;
	PendingMode = CurrentWeaponMode;
	//return;	
}

simulated exec function WeaponModeRelease()
{
	bRedirectSwitchToFiremode = false;
	ServerSwitchWeaponMode(PendingMode);
	CurrentWeaponMode = PendingMode;
	//return;	
}

simulated function Weapon PrevWeapon(Weapon CurrentChoice, Weapon CurrentWeapon)
{
	// End:0x35
	if(bRedirectSwitchToFiremode)
	{
		PendingMode--;
		// End:0x33
		if(int(PendingMode) >= WeaponModes.Length)
		{
			PendingMode = byte(WeaponModes.Length - 1);
		}
		return none;
	}
	return super.PrevWeapon(CurrentChoice, CurrentWeapon);
	//return;	
}

simulated function Weapon NextWeapon(Weapon CurrentChoice, Weapon CurrentWeapon)
{
	// End:0x2C
	if(bRedirectSwitchToFiremode)
	{
		PendingMode++;
		// End:0x2A
		if(int(PendingMode) >= WeaponModes.Length)
		{
			PendingMode = 0;
		}
		return none;
	}
	return super.NextWeapon(CurrentChoice, CurrentWeapon);
	//return;	
}

simulated function bool PutDown()
{
	// End:0x25
	if(Instigator.IsLocallyControlled())
	{
		bRedirectSwitchToFiremode = false;
		PendingMode = CurrentWeaponMode;
	}
	return super.PutDown();
	//return;	
}

simulated function NewDrawWeaponInfo(Canvas C, float YPos)
{
	local float ScaleFactor, XL, YL, YL2, SprintFactor;

	local string Temp;
	local int i;
	local byte StartMode;

	super(Weapon).NewDrawWeaponInfo(C, YPos);
	DrawCrosshairs(C);
	// End:0x26
	if(bSkipDrawWeaponInfo)
	{
		return;
	}
	ScaleFactor = C.ClipX / float(1600);
	C.Font = GetFontSizeIndex(C, -2 + int(float(2) * Class'Engine.HUD'.default.HudScale));
	C.DrawColor = Class'Engine.HUD'.default.WhiteColor;
	Temp = string(Ammo[0].AmmoAmount);
	C.TextSize(Temp, XL, YL);
	// End:0x4FA
	if(((int(CurrentWeaponMode) < WeaponModes.Length) && !WeaponModes[int(CurrentWeaponMode)].bUnavailable) && WeaponModes[int(CurrentWeaponMode)].ModeName != "")
	{
		// End:0x301
		if(!bRedirectSwitchToFiremode)
		{
			// End:0x146
			if(Temp == "0")
			{
				C.DrawColor = Class'Engine.HUD'.default.RedColor;
			}
			C.CurX = (C.ClipX - ((float(20) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - XL;
			C.CurY = (C.ClipY - ((float(120) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - YL;
			C.DrawText(Temp, false);
			C.DrawColor = Class'Engine.HUD'.default.WhiteColor;
			C.Font = GetFontSizeIndex(C, -3 + int(float(2) * Class'Engine.HUD'.default.HudScale));
			C.TextSize(WeaponModes[int(CurrentWeaponMode)].ModeName, XL, YL2);
			C.CurX = (C.ClipX - ((float(15) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - XL;
			C.CurY = ((C.ClipY - ((float(130) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - YL2) - YL;
			C.DrawText(WeaponModes[int(CurrentWeaponMode)].ModeName, false);			
		}
		else
		{
			StartMode = byte(int(PendingMode) - 2);
			// End:0x348
			if(int(StartMode) >= WeaponModes.Length)
			{
				StartMode = byte(int(byte(WeaponModes.Length - 1)) - (255 - int(StartMode)));
			}
			i = -2;
			J0x353:

			// End:0x4FA [Loop If]
			if(i < 3)
			{
				// End:0x39B
				if(i != 0)
				{
					C.SetDrawColor(byte(255), 128, 128, byte(float(255) - (float(75) * Abs(float(i)))));					
				}
				else
				{
					C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
				}
				C.Font = GetFontSizeIndex(C, -3 + int(float(2) * Class'Engine.HUD'.default.HudScale));
				C.TextSize(WeaponModes[int(StartMode)].ModeName, XL, YL2);
				C.CurX = (C.ClipX - ((float(15) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - XL;
				C.CurY = ((C.ClipY - ((float(130) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - (YL2 * float(-i + 1))) - YL;
				C.DrawText(WeaponModes[int(StartMode)].ModeName, false);
				StartMode++;
				// End:0x4F0
				if(int(StartMode) >= WeaponModes.Length)
				{
					StartMode = 0;
				}
				i++;
				// [Loop Continue]
				goto J0x353;
			}
		}
	}
	// End:0x690
	if((SprintControl != none) && SprintControl.Stamina < SprintControl.MaxStamina)
	{
		SprintFactor = SprintControl.Stamina / SprintControl.MaxStamina;
		C.CurX = C.OrgX + ((float(5) * ScaleFactor) * Class'Engine.HUD'.default.HudScale);
		C.CurY = C.ClipY - ((float(330) * ScaleFactor) * Class'Engine.HUD'.default.HudScale);
		// End:0x5EC
		if(SprintFactor < 0.2000000)
		{
			C.SetDrawColor(byte(255), 0, 0);			
		}
		else
		{
			// End:0x615
			if(SprintFactor < 0.5000000)
			{
				C.SetDrawColor(64, 128, byte(255));				
			}
			else
			{
				C.SetDrawColor(0, 0, byte(255));
			}
		}
		C.DrawTile(Texture'Engine.MenuWhite', ((200.0000000 * ScaleFactor) * Class'Engine.HUD'.default.HudScale) * SprintFactor, (30.0000000 * ScaleFactor) * Class'Engine.HUD'.default.HudScale, 0.0000000, 0.0000000, 1.0000000, 1.0000000);
	}
	//return;	
}

simulated exec function ScopeView()
{
	// End:0x8F
	if(bHasHybridScope)
	{
		// End:0x3F
		if(((int(ZoomType) == int(1)) && int(SightingState) != int(0)) && int(SightingState) != int(3))
		{
			return;
		}
		// End:0x8F
		if(int(SightingState) == int(0))
		{
			// End:0x8F
			if(int(ZoomType) == int(1))
			{
				SightPivot = IronSightPivot;
				SightOffset = IronSightOffset;
				ZoomType = 0;
				ScopeViewTex = none;
				SightingTime = default.SightingTime;
			}
		}
	}
	super.ScopeView();
	//return;	
}

simulated exec function ScopeViewRelease()
{
	// End:0x3F
	if(bHasHybridScope)
	{
		// End:0x3F
		if(((int(ZoomType) != int(0)) && int(SightingState) != int(0)) && int(SightingState) != int(3))
		{
			return;
		}
	}
	super.ScopeViewRelease();
	//return;	
}

simulated function ScopeViewTwo()
{
	// End:0xC3
	if(bHasHybridScope)
	{
		// End:0x3F
		if(((int(ZoomType) == int(0)) && int(SightingState) != int(0)) && int(SightingState) != int(3))
		{
			return;
		}
		// End:0xC3
		if(int(SightingState) == int(0))
		{
			switch(CurrentWeaponMode)
			{
				// End:0x69
				case 1:
					ScopeViewTex = FinalBlend'BWBP_OP_Tex.R9A1.R9_scope_UI_FB1';
					// End:0x8A
					break;
				// End:0x7C
				case 2:
					ScopeViewTex = FinalBlend'BWBP_OP_Tex.R9A1.R9_scope_UI_FB2';
					// End:0x8A
					break;
				// End:0xFFFF
				default:
					ScopeViewTex = Texture'BWBP_OP_Tex.R9A1.R9_scope_UI_DO1';
					break;
			}
			// End:0xC3
			if(int(ZoomType) == int(0))
			{
				SightPivot = ScopeSightPivot;
				SightOffset = ScopeSightOffset;
				ZoomType = 1;
				MaxZoom = 4.0000000;
			}
		}
	}
	ScopeView();
	//return;	
}

simulated function ScopeViewTwoRelease()
{
	// End:0x3F
	if(bHasHybridScope)
	{
		// End:0x3F
		if(((int(ZoomType) == int(0)) && int(SightingState) != int(0)) && int(SightingState) != int(3))
		{
			return;
		}
	}
	ScopeViewRelease();
	//return;	
}

simulated function SetHand(float InHand)
{
	IronSightPivot = default.SightPivot;
	IronSightOffset = default.SightOffset;
	super.SetHand(InHand);
	// End:0xF8
	if((hand < float(0)) && bHasHybridScope)
	{
		// End:0xA2
		if(int(ZoomType) != int(0))
		{
			ScopeSightOffset.Y = ScopeSightOffset.Y * float(-1);
			ScopeSightPivot.Roll = ScopeSightPivot.Roll * -1;
			ScopeSightPivot.Yaw = ScopeSightPivot.Yaw * -1;			
		}
		else
		{
			IronSightOffset.Y = IronSightOffset.Y * float(-1);
			IronSightPivot.Roll = IronSightPivot.Roll * -1;
			IronSightPivot.Yaw = IronSightPivot.Yaw * -1;
		}
	}
	//return;	
}

simulated function Notify_MagDown()
{
	// End:0x33
	if(int(CurrentWeaponMode) == 2)
	{
		SetBoneScale(0, 1.0000000, 'LaserMag');
		SetBoneScale(1, 0.0000000, 'BulletMag');		
	}
	else
	{
		SetBoneScale(0, 0.0000000, 'LaserMag');
		SetBoneScale(1, 1.0000000, 'BulletMag');
	}
	//return;	
}

simulated function bool CheckWeaponMode(int Mode)
{
	// End:0x48
	if((WeaponModes[int(CurrentWeaponMode)].ModeID ~= "WM_FullAuto") || WeaponModes[int(CurrentWeaponMode)].ModeID ~= "WM_None")
	{
		return true;
	}
	// End:0x90
	if(((Mode == 0) && float(FireCount) >= WeaponModes[int(CurrentWeaponMode)].Value) || (Mode == 1) && FireCount >= 2)
	{
		return false;
	}
	return true;
	//return;	
}

function int ManageHeatInteraction(Pawn P, int HeatPerShot)
{
	local R9A1HeatManager HM;
	local int HeatBonus;

	// End:0x1D
	foreach P.BasedActors(Class'BWBP_OP_Pro.R9A1HeatManager', HM)
	{
		// End:0x1D
		break;		
	}	
	// End:0x6B
	if(HM == none)
	{
		HM = Spawn(Class'BWBP_OP_Pro.R9A1HeatManager', P,, P.Location + vect(0.0000000, 0.0000000, -30.0000000));
		HM.SetBase(P);
	}
	// End:0xCF
	if(HM != none)
	{
		HeatBonus = int(HM.Heat);
		// End:0xB9
		if(Vehicle(P) != none)
		{
			HM.AddHeat(float(HeatPerShot / 4));			
		}
		else
		{
			HM.AddHeat(float(HeatPerShot));
		}
	}
	return HeatBonus;
	//return;	
}

simulated function bool HasAmmo()
{
	// End:0x38
	if((!bNoMag && FireMode[0] != none) && MagAmmo >= FireMode[0].AmmoPerFire)
	{
		return true;
	}
	// End:0x7D
	if(((Ammo[0] != none) && FireMode[0] != none) && Ammo[0].AmmoAmount >= FireMode[0].AmmoPerFire)
	{
		return true;
	}
	return false;
	//return;	
}

function byte BestMode()
{
	local Bot B;
	local R9HeatManager HM;
	local float dist;

	B = Bot(Instigator.Controller);
	// End:0x3D
	if((B == none) || B.Enemy == none)
	{
		return 0;
	}
	// End:0x76
	if((Level.TimeSeconds - lastModeChangeTime) < (1.4000000 - (B.Skill * 0.1000000)))
	{
		return 0;
	}
	dist = VSize(Instigator.Location - B.Enemy.Location);
	// End:0xCB
	foreach B.Enemy.BasedActors(Class'BallisticProV55.R9HeatManager', HM)
	{
		// End:0xCB
		break;		
	}	
	// End:0x148
	if((HM != none) || (float(B.Enemy.Health) + B.Enemy.ShieldStrength) > float(200))
	{
		// End:0x145
		if(int(CurrentWeaponMode) != 2)
		{
			CurrentWeaponMode = 2;
			R9A1PrimaryFire(FireMode[0]).SwitchWeaponMode(CurrentWeaponMode);
		}		
	}
	else
	{
		// End:0x178
		if(int(CurrentWeaponMode) != 0)
		{
			CurrentWeaponMode = 0;
			R9A1PrimaryFire(FireMode[0]).SwitchWeaponMode(CurrentWeaponMode);
		}
	}
	lastModeChangeTime = Level.TimeSeconds;
	return 0;
	//return;	
}

function float GetAIRating()
{
	local Bot B;
	local float dist, rating;

	B = Bot(Instigator.Controller);
	// End:0x2A
	if(B == none)
	{
		return AIRating;
	}
	rating = super.GetAIRating();
	// End:0x50
	if(B.Enemy == none)
	{
		return rating;
	}
	dist = VSize(B.Enemy.Location - Instigator.Location);
	return Class'BCoreProV55.BUtil'.static.ReverseDistanceAtten(rating, 0.7500000, dist, 2048.0000000, 2048.0000000);
	//return;	
}

function float SuggestAttackStyle()
{
	return -0.7000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return 0.7000000;
	//return;	
}

defaultproperties
{
	ScopeSightPivot=(Pitch=50,Yaw=0,Roll=0)
	ScopeSightOffset=(X=2.4000000,Y=0.0000000,Z=5.7000000)
	SpecialInfo[0]=(Id="EvoDefs",Info="240.0;25.0;0.5;50.0;1.0;0.2;0.0")
	SightAnimScale=0.2500000
	ParamsClasses[0]=Class'BWBP_OP_Pro.R9A1WeaponParamsComp'
	ParamsClasses[1]=Class'BWBP_OP_Pro.R9A1WeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_OP_Pro.R9A1WeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_OP_Pro.R9A1WeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_OP_Tex.R9A1.BigIcon_R9A1'
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.R78.R78Pullout',Volume=0.2200000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.R78.R78Putaway',Volume=0.2200000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Regular",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Freeze",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Heat Ray",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=0
	FullZoomFOV=25.0000000
	bNoCrosshairInScope=true
	SightBobScale=0.3000000
	CockSound=(Sound=Sound'BW_Core_WeaponSound.USSR.USSR-Cock',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipHitSound=(Sound=Sound'BW_Core_WeaponSound.USSR.USSR-ClipHit',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipOutSound=(Sound=Sound'BW_Core_WeaponSound.USSR.USSR-ClipOut',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BW_Core_WeaponSound.USSR.USSR-ClipIn',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.6500000
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.Misc6',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.R78InA',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=0,G=0,B=206,A=152),Color2=(R=0,G=0,B=0,A=194),StartSize1=132,StartSize2=115)
	bWT_Bullet=true
	ManualLines[0]="Semi-automatic, long-range, moderate recoil rifle fire with three choices of ammunition, switched between using the fire mode function.||Standard rounds inflict good damage with high penetration.||Freeze rounds inflict lower damage, but progressively slow struck targets.||Heat Ray shots inflict low initial damage, but heat up the target, causing subsequent shots to inflict more damage. This effect wears off over time."
	ManualLines[1]="Raises the scope."
	ManualLines[2]="The R9A1 has both a scope (secondary fire) and iron sights (normal key).||Modes are switched by holding the Fire Mode key and then scrolling the mouse.||Effective at long range and against enemies making use of healing items and weapons."
	SightingTime=0.4000000
	SightPivot=(Pitch=0,Yaw=0,Roll=11800)
	SightOffset=(X=0.0000000,Y=0.3600000,Z=4.7500000)
	GunLength=80.0000000
	FireModeClass[0]=Class'BWBP_OP_Pro.R9A1PrimaryFire'
	FireModeClass[1]=Class'BWBP_OP_Pro.R9A1ScopeFire'
	SelectAnimRate=1.1000000
	BringUpTime=0.4000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.8000000
	CurrentRating=0.8000000
	Description="Outstanding reliability and durability in the field are what characterise one of Black & Wood's legendary rifles. Though not widely used by most military forces, the R9 is renowned for its near indestructable design, and superb reliability. Those who use the weapon, mostly snipers, hunters, and specialised squads, swear by it's accuracy and dependability. Often used without fancy features or burdening devices such as optical scopes and similar attachements, the R9 is a true legend with it's users."
	Priority=33
	HudColor=(R=255,G=175,B=0,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=9
	GroupOffset=3
	PickupClass=Class'BWBP_OP_Pro.R9A1Pickup'
	PlayerViewOffset=(X=7.0000000,Y=5.3000000,Z=-7.0000000)
	AttachmentClass=Class'BWBP_OP_Pro.R9A1Attachment'
	IconMaterial=Texture'BWBP_OP_Tex.R9A1.SmallIcon_R9A1'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="R9A1 Ranger Rifle"
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=5.0000000
	Mesh=SkeletalMesh'BWBP_OP_Anim.R9A1_FPm'
	DrawScale=0.3000000
}
