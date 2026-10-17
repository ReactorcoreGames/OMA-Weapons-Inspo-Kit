class R9000ERifle extends BallisticWeapon
	config(BallisticProV55);

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
	R9000EAttachment(ThirdPersonActor).CurrentTracerMode = CurrentWeaponMode;
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

simulated function PlayCocking(optional byte Type)
{
	local float AdjustedCockAnimRate;

	// End:0x40
	if((int(ReloadState) != int(0)) && int(ReloadState) != int(8))
	{
		AdjustedCockAnimRate = CockAnimRate * Class'BCoreProV55.BallisticReplicationInfo'.default.ReloadScale;		
	}
	else
	{
		AdjustedCockAnimRate = CockAnimRate;
	}
	// End:0x87
	if((int(Type) == 2) && HasAnim(CockAnimPostReload))
	{
		SafePlayAnim(CockAnimPostReload, AdjustedCockAnimRate, 0.2000000,, "RELOAD");		
	}
	else
	{
		SafePlayAnim(CockAnim, AdjustedCockAnimRate, 0.2000000,, "RELOAD");
	}
	// End:0xCF
	if((int(SightingState) != int(0)) && int(Type) != 1)
	{
		TemporaryScopeDown(0.5000000);
	}
	//return;	
}

simulated function Notify_CockAimed()
{
	bNeedCock = false;
	ReloadState = 8;
	PlayOwnedSound(CockSound.Sound, CockSound.Slot, CockSound.Volume, CockSound.bNoOverride, CockSound.Radius, CockSound.Pitch, CockSound.bAtten);
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
	return Class'BCoreProV55.BUtil'.static.ReverseDistanceAtten(rating, 0.5000000, dist, 2048.0000000, 3072.0000000);
	//return;	
}

function float SuggestAttackStyle()
{
	return -0.9000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return 0.9000000;
	//return;	
}

defaultproperties
{
	SpecialInfo[0]=(Id="EvoDefs",Info="240.0;25.0;0.5;60.0;10.0;0.0;0.0")
	ParamsClasses[0]=Class'BWBP_APC_Pro.R9000EWeaponParamsArena'
	ParamsClasses[1]=Class'BWBP_APC_Pro.R9000EWeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_APC_Pro.R9000EWeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_APC_Pro.R9000EWeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_APC_Tex.ElementalSniper.BigIcon_R9000E'
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.R78.R78Pullout',Volume=0.2200000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.R78.R78Putaway',Volume=0.2200000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Ammo: FMJ",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Ammo: Incendiary",bUnavailable=false,ModeID="WM_Burst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Ammo: Radiation",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=0
	ZoomInSound=(Sound=SoundGroup'BWBP_APC_Sounds.R9000E.R9000E-ZoomIn',Volume=0.5000000,Radius=0.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	ZoomOutSound=(Sound=SoundGroup'BWBP_APC_Sounds.R9000E.R9000E-ZoomOut',Volume=0.5000000,Radius=0.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	MinZoom=4.0000000
	MaxZoom=16.0000000
	FullZoomFOV=20.0000000
	ScopeViewTex=Texture'BWBP_APC_Tex.ElementalSniper.ES_ScopeTex'
	bNoCrosshairInScope=true
	CockSound=(Sound=Sound'BWBP_APC_Sounds.R9000E.R9000E-Cock',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	CockSelectSound=(Sound=Sound'BWBP_APC_Sounds.R9000E.R9000E-Cock',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	bCockOnEmpty=true
	ClipHitSound=(Sound=Sound'BWBP_APC_Sounds.R9000E.R9000E-ClipHit',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipOutSound=(Sound=Sound'BWBP_APC_Sounds.R9000E.R9000E-ClipOut',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BWBP_APC_Sounds.R9000E.R9000E-ClipIn',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.6500000
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.Misc6',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.M50InA',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=108,G=108,B=109,A=95),Color2=(R=0,G=134,B=255,A=151),StartSize1=96,StartSize2=96)
	bWT_Bullet=true
	ManualLines[0]="Bolt-action sniper rifle fire with Regular, Incendiary & Radiation rounds. High damage, long range, slow fire rate and deals damage to targets near the struck target."
	ManualLines[1]="Engages the scope."
	ManualLines[2]="Be wary of tracer rounds due to different variations of ammo. Effective at long range and against clustered enemies."
	SightPivot=(Pitch=0,Yaw=0,Roll=-1024)
	SightOffset=(X=0.0000000,Y=-1.6000000,Z=22.0000000)
	CockingBringUpTime=2.4000000
	ReloadAnimRate=1.2500000
	GunLength=80.0000000
	FireModeClass[0]=Class'BWBP_APC_Pro.R9000EPrimaryFire'
	FireModeClass[1]=Class'BCoreProV55.BallisticScopeFire'
	PutDownTime=0.5000000
	BringUpTime=0.5000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.8000000
	CurrentRating=0.8000000
	bSniping=true
	Description="Precision weapons often haven't had the need to get with the times, that was until the second Skrith war broke out. While the regular marksman weapons and sniper rifles did their job against high value targets, the ever-changing situation eventually cultivated a need to upgrade their long ranged capabilities.  Enravion, hearing the call, managed to upgrade their old R98 platform into a new breed, the R9000-E 'Chimera' Modular Sniper Rifle or 'MSR' for short. In addition to much needed upgrades like being chambered in .338 Lapua Magnum, cold bore floating barrel and picatinny rails, the Chimera earns it's nickname for its ability to accept the AMP system that's prevalent on several weapon systems already. Though it can be outfitted for different environments, the traditional long rifle is the way to go, with the amp to either ignite Krao or fry Cryons with radiation, the Chimera is a force to be reckoned with."
	Priority=33
	HudColor=(R=200,G=50,B=50,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=9
	GroupOffset=2
	PickupClass=Class'BWBP_APC_Pro.R9000EPickup'
	PlayerViewOffset=(X=-3.0000000,Y=9.0000000,Z=-18.0000000)
	BobDamping=2.4000000
	AttachmentClass=Class'BWBP_APC_Pro.R9000EAttachment'
	IconMaterial=Texture'BWBP_APC_Tex.ElementalSniper.SmallIcon_R9000E'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="R9000-E Modular Sniper Rifle"
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=5.0000000
	Mesh=SkeletalMesh'BWBP_APC_Anim.R9000E_FPm'
	DrawScale=0.3000000
}
