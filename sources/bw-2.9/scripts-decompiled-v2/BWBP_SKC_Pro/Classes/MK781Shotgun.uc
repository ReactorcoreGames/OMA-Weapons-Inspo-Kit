class MK781Shotgun extends BallisticProShotgun
	config(BallisticProV55);

struct RevInfo
{
	var() name ShellName;
};

var() bool bHasSuppressor;
var() bool bSilenced;
var() name SilencerBone;
var() name SilencerOnAnim;
var() name SilencerOffAnim;
var() Sound SilencerOnSound;
var() Sound SilencerOffSound;
var() Sound SilencerOnTurnSound;
var() Sound SilencerOffTurnSound;
var() bool bHasAltShells;
var() name SGPrepAnim;
var() name ReloadAltAnim;
var() name ReloadAnimEmpty;
var() Sound GrenLoadSound;
var() float VisGrenades;
var() int Grenades;
var() int StartingGrenades;
var() byte PreviousWeaponMode;
var() bool bReady;
var byte ShellIndex;
var() bool bIsSlug;
var() bool bHasLAM;
var() byte GearStatus;
var() bool bLaserOn;
var() bool bOldLaserOn;
var() LaserActor Laser;
var() Sound LaserOnSound;
var() Sound LaserOffSound;
var() Emitter LaserDot;
var() Projector FlashLightProj;
var() Emitter FlashLightEmitter;
var() bool bLightsOn;
var() bool bFirstDraw;
var() Vector TorchOffset;
var() Sound TorchOnSound;
var() Sound TorchOffSound;
var() RevInfo Shells[6];

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		Grenades, bLaserOn, 
		bReady;

	// Pos:0x00D
	reliable if(int(Role) < int(ROLE_Authority))
		ServerFlashLight, ServerSwitchLaser, 
		ServerSwitchSilencer;
}

simulated function PostNetBeginPlay()
{
	super(BallisticWeapon).PostNetBeginPlay();
	// End:0x20
	if(Class'BCoreProV55.BallisticReplicationInfo'.static.IsClassicOrRealism())
	{
		StartingGrenades = 6;
	}
	Grenades = StartingGrenades;
	//return;	
}

simulated event PostNetReceive()
{
	// End:0x1B
	if(int(Level.NetMode) != int(NM_Client))
	{
		return;
	}
	// End:0x45
	if(bLaserOn != bOldLaserOn)
	{
		OnLaserSwitched();
		bOldLaserOn = bLaserOn;
		ClientSwitchLaser();
	}
	super(Weapon).PostNetReceive();
	//return;	
}

simulated function OnWeaponParamsChanged()
{
	super(BallisticWeapon).OnWeaponParamsChanged();
	assert(WeaponParams != none);
	bHasLAM = false;
	bHasSuppressor = true;
	bHasAltShells = true;
	bIsSlug = false;
	// End:0x59
	if(InStr(WeaponParams.LayoutTags, "slug") != -1)
	{
		bIsSlug = true;
	}
	// End:0x80
	if(InStr(WeaponParams.LayoutTags, "lam") != -1)
	{
		bHasLAM = true;
	}
	// End:0xB1
	if(InStr(WeaponParams.LayoutTags, "no_suppressor") != -1)
	{
		bHasSuppressor = false;
	}
	// End:0xE2
	if(InStr(WeaponParams.LayoutTags, "no_alt") != -1)
	{
		bHasAltShells = false;
		StartingGrenades = 0;
	}
	// End:0x171
	if(InStr(WeaponParams.LayoutTags, "start_suppressed") != -1)
	{
		bSilenced = true;
		bFireMode[0].bAISilent = true;
		MK781PrimaryFire(FireMode[0]).SwitchSilencerMode(true);
		MK781SecondaryFire(FireMode[1]).SwitchSilencerMode(true);
		ParamsClasses[int(GameStyleIndex)].static.OverrideFireParams(self, 3);
	}
	//return;	
}

simulated function OnAimParamsChanged()
{
	super(BallisticWeapon).OnAimParamsChanged();
	// End:0x15
	if(bSilenced)
	{
		ApplySuppressorAim();
	}
	// End:0x24
	if(bLaserOn)
	{
		ApplyLaserAim();
	}
	//return;	
}

function GiveAmmo(int M, WeaponPickup WP, bool bJustSpawned)
{
	// End:0x193
	if((FireMode[M] != none) && FireMode[M].AmmoClass != none)
	{
		Ammo[M] = Ammunition(Instigator.FindInventoryType(FireMode[M].AmmoClass));
		// End:0xB4
		if(Ammo[M] == none)
		{
			Ammo[M] = Spawn(FireMode[M].AmmoClass, Instigator);
			Instigator.AddInventory(Ammo[M]);
		}
		// End:0x11B
		if((WP != none) && WP.bDropped || WP.AmmoAmount[M] > 0)
		{
			Ammo[M].AddAmmo(WP.AmmoAmount[M]);			
		}
		else
		{
			// End:0x17D
			if((bJustSpawned && (WP == none) || !WP.bDropped) && M == 0)
			{
				Ammo[M].AddAmmo(Ammo[M].InitialAmount);
			}
		}
		Ammo[M].GotoState('None');
	}
	//return;	
}

simulated function EmptyAltFire(byte Mode)
{
	// End:0x49
	if((((Grenades <= 0) && int(ClientState) == int(4)) && FireCount < 1) && Instigator.IsLocallyControlled())
	{
		ServerStartReload(Mode);
	}
	//return;	
}

simulated function DrawWeaponInfo(Canvas Canvas)
{
	NewDrawWeaponInfo(Canvas, 0.7050000 * Canvas.ClipY);
	//return;	
}

simulated function NewDrawWeaponInfo(Canvas C, float YPos)
{
	local int i, Count;
	local float ScaleFactor2, ScaleFactor, XL, YL, YL2, SprintFactor;

	local string Temp;
	local int TempNum;

	DrawCrosshairs(C);
	ScaleFactor = C.ClipX / float(1600);
	ScaleFactor2 = (99.0000000 * C.ClipX) / float(3200);
	C.Style = 5;
	C.DrawColor = Class'Engine.HUD'.default.WhiteColor;
	// End:0x145
	if(bHasAltShells)
	{
		Count = Min(8, Grenades);
		i = 0;
		J0x99:

		// End:0x145 [Loop If]
		if(i < Count)
		{
			C.SetPos(C.ClipX - (((0.5000000 * float(i)) + float(1)) * ScaleFactor2), C.ClipY - ((float(100) * ScaleFactor) * Class'Engine.HUD'.default.HudScale));
			C.DrawTile(Texture'BWBP_SKC_Tex.M1014.M1014-SGIcon', ScaleFactor2, ScaleFactor2, 0.0000000, 0.0000000, 128.0000000, 128.0000000);
			i++;
			// [Loop Continue]
			goto J0x99;
		}
	}
	// End:0x150
	if(bSkipDrawWeaponInfo)
	{
		return;
	}
	C.Font = GetFontSizeIndex(C, -2 + int(float(2) * Class'Engine.HUD'.default.HudScale));
	C.DrawColor = Class'Engine.HUD'.default.WhiteColor;
	// End:0x26B
	if(!bNoMag)
	{
		Temp = GetHUDAmmoText(0);
		C.TextSize(Temp, XL, YL);
		C.CurX = (C.ClipX - ((float(20) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - XL;
		C.CurY = (C.ClipY - ((float(140) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - YL;
		C.DrawText(Temp, false);
	}
	// End:0x356
	if((Ammo[1] != none) && Ammo[1] != Ammo[0])
	{
		TempNum = Ammo[1].AmmoAmount;
		C.TextSize(string(TempNum), XL, YL);
		C.CurX = (C.ClipX - ((float(160) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - XL;
		C.CurY = (C.ClipY - ((float(140) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - YL;
		C.DrawText(string(TempNum), false);
	}
	// End:0x4A4
	if(((int(CurrentWeaponMode) < WeaponModes.Length) && !WeaponModes[int(CurrentWeaponMode)].bUnavailable) && WeaponModes[int(CurrentWeaponMode)].ModeName != "")
	{
		C.Font = GetFontSizeIndex(C, -3 + int(float(2) * Class'Engine.HUD'.default.HudScale));
		C.TextSize(WeaponModes[int(CurrentWeaponMode)].ModeName, XL, YL2);
		C.CurX = (C.ClipX - ((float(15) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - XL;
		C.CurY = ((C.ClipY - ((float(150) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - YL2) - YL;
		C.DrawText(WeaponModes[int(CurrentWeaponMode)].ModeName, false);
	}
	// End:0x63A
	if((SprintControl != none) && SprintControl.Stamina < SprintControl.MaxStamina)
	{
		SprintFactor = SprintControl.Stamina / SprintControl.MaxStamina;
		C.CurX = C.OrgX + ((float(5) * ScaleFactor) * Class'Engine.HUD'.default.HudScale);
		C.CurY = C.ClipY - ((float(330) * ScaleFactor) * Class'Engine.HUD'.default.HudScale);
		// End:0x596
		if(SprintFactor < 0.2000000)
		{
			C.SetDrawColor(byte(255), 0, 0);			
		}
		else
		{
			// End:0x5BF
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

simulated function Special_ShellRemove()
{
	VisGrenades -= float(1);
	UpdateBones();
	//return;	
}

simulated function PrepAltFire()
{
	PlayAnim(SGPrepAnim, 1.0000000, 0.0000000);
	ReloadState = 8;
	//return;	
}

simulated function Special_GrenadeReady()
{
	ReloadState = 0;
	bReady = true;
	Grenades -= 1;
	WeaponModes[0].ModeName = "X-007 Loaded";
	WeaponModes[1].ModeName = "X-007 Loaded";
	//return;	
}

simulated function PrepPriFire()
{
	WeaponModes[0].ModeName = default.WeaponModes[0].ModeName;
	WeaponModes[1].ModeName = default.WeaponModes[1].ModeName;
	//return;	
}

simulated function Special_ShellsIn()
{
	local int GrenadesNeeded;

	PlaySound(GrenLoadSound, 1, 0.5000000,, 64.0000000);
	ReloadState = 3;
	GrenadesNeeded = 6 - Grenades;
	// End:0x5C
	if(GrenadesNeeded > Ammo[1].AmmoAmount)
	{
		GrenadesNeeded = Ammo[1].AmmoAmount;
	}
	// End:0xA7
	if(int(Role) == int(ROLE_Authority))
	{
		MK781SecondaryFire(FireMode[1]).bLoaded = true;
		Grenades += GrenadesNeeded;
		Ammo[1].UseAmmo(GrenadesNeeded, true);
	}
	VisGrenades = float(Grenades);
	UpdateBones();
	//return;	
}

simulated function bool IsGrenadeLoaded()
{
	return MK781SecondaryFire(FireMode[1]).bLoaded;
	//return;	
}

function ServerStartReload(optional byte i)
{
	local int M;
	local byte Loadings[2];

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
	// End:0x4E
	if((MagAmmo < default.MagAmmo) && Ammo[0].AmmoAmount > 0)
	{
		Loadings[0] = 1;
	}
	// End:0x7C
	if((Grenades < 6) && Ammo[1].AmmoAmount > 0)
	{
		Loadings[1] = 1;
	}
	// End:0x9E
	if((int(Loadings[0]) == 0) && int(Loadings[1]) == 0)
	{
		return;
	}
	M = 0;
	J0xA5:

	// End:0xF1 [Loop If]
	if(M < 2)
	{
		// End:0xE7
		if((FireMode[M] != none) && FireMode[M].bIsFiring)
		{
			StopFire(M);
		}
		M++;
		// [Loop Continue]
		goto J0xA5;
	}
	bServerReloading = true;
	// End:0x110
	if(int(i) == 1)
	{
		M = 0;		
	}
	else
	{
		M = 1;
	}
	// End:0x145
	if(int(Loadings[int(i)]) == 1)
	{
		ClientStartReload(i);
		CommonStartReload(i);		
	}
	else
	{
		// End:0x172
		if(int(Loadings[M]) == 1)
		{
			ClientStartReload(byte(M));
			CommonStartReload(byte(M));
		}
	}
	// End:0x1B5
	if((BallisticAttachment(ThirdPersonActor) != none) && BallisticAttachment(ThirdPersonActor).ReloadAnim != 'None')
	{
		Instigator.SetAnimAction('ReloadGun');
	}
	//return;	
}

simulated function ClientStartReload(optional byte i)
{
	// End:0x39
	if(int(Level.NetMode) == int(NM_Client))
	{
		// End:0x31
		if(int(i) == 1)
		{
			CommonStartReload(1);			
		}
		else
		{
			CommonStartReload(0);
		}
	}
	//return;	
}

simulated function CommonStartReload(optional byte i)
{
	local int M;

	// End:0x18
	if(int(ClientState) == int(2))
	{
		ClientState = 4;
	}
	// End:0x36
	if(int(i) == 1)
	{
		ReloadState = 1;
		PlayReloadAlt();		
	}
	else
	{
		ReloadState = 4;
		PlayReload();
	}
	// End:0x6C
	if(bScopeView && Instigator.IsLocallyControlled())
	{
		TemporaryScopeDown(default.SightingTime);
	}
	M = 0;
	J0x73:

	// End:0xB4 [Loop If]
	if(M < 2)
	{
		// End:0xAA
		if(bFireMode[M] != none)
		{
			bFireMode[M].ReloadingGun(i);
		}
		M++;
		// [Loop Continue]
		goto J0x73;
	}
	// End:0xC5
	if(bCockAfterReload)
	{
		bNeedCock = true;
	}
	// End:0xE3
	if(bCockOnEmpty && MagAmmo < 1)
	{
		bNeedCock = true;
	}
	bNeedReload = false;
	//return;	
}

simulated function PlayReloadAlt()
{
	SafePlayAnim(ReloadAltAnim, 1.0000000,, 0, "RELOAD");
	//return;	
}

simulated event WeaponTick(float dt)
{
	super(BallisticWeapon).WeaponTick(dt);
	// End:0x5E
	if(((((AIController(Instigator.Controller) != none) && !IsGrenadeLoaded()) && (AmmoAmount(1)) > 0) && BotShouldReloadGrenade()) && !IsReloadingGrenade())
	{
		LoadGrenadeLoop();
	}
	//return;	
}

simulated function LoadGrenadeLoop()
{
	// End:0x26
	if((Ammo[1].AmmoAmount < 1) && Grenades > 6)
	{
		return;
	}
	// End:0x77
	if(((int(ReloadState) == int(0)) || int(ReloadState) == int(4)) && Ammo[1].AmmoAmount >= 1)
	{
		PlayAnim(ReloadAltAnim, ReloadAnimRate,, 0);
		ReloadState = 4;
	}
	//return;	
}

function bool BotShouldReloadGrenade()
{
	// End:0x2A
	if((Level.TimeSeconds - Instigator.LastPainTime) > 1.0000000)
	{
		return true;
	}
	return false;
	//return;	
}

simulated function bool IsReloadingGrenade()
{
	local name Anim;
	local float frame, Rate;

	GetAnimParams(0, Anim, frame, Rate);
	// End:0x27
	if(Anim == ReloadAltAnim)
	{
		return true;
	}
	return false;
	//return;	
}

simulated function UpdateBones()
{
	local int i;

	// End:0x18
	if(VisGrenades < float(0))
	{
		VisGrenades = 0.0000000;
	}
	i = 5;
	J0x20:

	// End:0x5B [Loop If]
	if(float(i) >= VisGrenades)
	{
		SetBoneScale(i, 0.0000000, Shells[i].ShellName);
		i--;
		// [Loop Continue]
		goto J0x20;
	}
	// End:0x74
	if(VisGrenades > float(5))
	{
		VisGrenades = 6.0000000;
	}
	i = 0;
	J0x7B:

	// End:0xB6 [Loop If]
	if(float(i) < VisGrenades)
	{
		SetBoneScale(i, 1.0000000, Shells[i].ShellName);
		i++;
		// [Loop Continue]
		goto J0x7B;
	}
	// End:0xD4
	if(bSilenced)
	{
		SetBoneScale(6, 1.0000000, SilencerBone);		
	}
	else
	{
		SetBoneScale(6, 0.0000000, SilencerBone);
	}
	//return;	
}

simulated exec function WeaponSpecial(optional byte i)
{
	// End:0x24
	if((int(ReloadState) != int(0)) || int(SightingState) != int(0))
	{
		return;
	}
	// End:0x36
	if(int(ClientState) != int(4))
	{
		return;
	}
	TemporaryScopeDown(0.5000000);
	// End:0x7F
	if(bHasSuppressor)
	{
		// End:0x71
		if(int(Level.NetMode) == int(NM_Client))
		{
			ServerSwitchSilencer(!bSilenced);
		}
		SwitchSilencer(!bSilenced);
	}
	// End:0x176
	if(bHasLAM)
	{
		GearStatus++;
		// End:0xA5
		if(int(GearStatus) > 4)
		{
			GearStatus = 1;
		}
		// End:0x162
		if(bool(int(GearStatus) & 1))
		{
			bLightsOn = !bLightsOn;
			ServerFlashLight(bLightsOn);
			// End:0x12E
			if(bLightsOn)
			{
				PlaySound(TorchOnSound,, 0.7000000,, 32.0000000);
				// End:0x10C
				if(FlashLightEmitter == none)
				{
					FlashLightEmitter = Spawn(Class'BallisticProV55.MRS138TorchEffect', self,, Location);
				}
				Class'BCoreProV55.BallisticEmitter'.static.ScaleEmitter(FlashLightEmitter, DrawScale);
				StartProjector();				
			}
			else
			{
				PlaySound(TorchOffSound,, 0.7000000,, 32.0000000);
				// End:0x159
				if(FlashLightEmitter != none)
				{
					FlashLightEmitter.Destroy();
				}
				KillProjector();
			}			
		}
		else
		{
			ServerSwitchLaser(!bLaserOn);
			PlayIdle();
		}
	}
	//return;	
}

function ServerSwitchSilencer(bool bNewValue)
{
	SwitchSilencer(bNewValue);
	//return;	
}

simulated function SwitchSilencer(bool bNewValue)
{
	// End:0x13
	if(bNewValue == bSilenced)
	{
		return;
	}
	// End:0x45
	if(int(Role) == int(ROLE_Authority))
	{
		bServerReloading = true;
		MK781Attachment(ThirdPersonActor).SetSilenced(bNewValue);
	}
	ReloadState = 9;
	bSilenced = bNewValue;
	bFireMode[0].bAISilent = bSilenced;
	MK781PrimaryFire(FireMode[0]).SwitchSilencerMode(bNewValue);
	MK781SecondaryFire(FireMode[1]).SwitchSilencerMode(bNewValue);
	// End:0xD8
	if(bNewValue)
	{
		PlayAnim(SilencerOnAnim);
		ParamsClasses[int(GameStyleIndex)].static.OverrideFireParams(self, 3);		
	}
	else
	{
		PlayAnim(SilencerOffAnim);
		SightZoomFactor = default.SightZoomFactor;
		ParamsClasses[int(GameStyleIndex)].static.OverrideFireParams(self, 0);
	}
	//return;	
}

simulated function ApplySuppressorAim()
{
	AimComponent.AimSpread.Min *= 1.2500000;
	AimComponent.AimSpread.Max *= 1.2500000;
	//return;	
}

simulated function Notify_SilencerOn()
{
	PlaySound(SilencerOnSound,, 0.5000000);
	//return;	
}

simulated function Notify_SilencerOff()
{
	PlaySound(SilencerOffSound,, 0.5000000);
	//return;	
}

simulated function Notify_SilencerShow()
{
	UpdateBones();
	//return;	
}

simulated function Notify_SilencerHide()
{
	UpdateBones();
	//return;	
}

simulated function CommonSwitchWeaponMode(byte newmode)
{
	local int LastMode;

	// End:0x0D
	if(Instigator == none)
	{
		return;
	}
	LastMode = int(CurrentWeaponMode);
	CurrentWeaponMode = newmode;
	ParamsClasses[int(GameStyleIndex)].static.SetFireParams(self);
	// End:0x63
	if(bSilenced)
	{
		ParamsClasses[int(GameStyleIndex)].static.OverrideFireParams(self, 3);		
	}
	else
	{
		ParamsClasses[int(GameStyleIndex)].static.OverrideFireParams(self, 0);
	}
	bFireMode[0].SwitchWeaponMode(CurrentWeaponMode);
	bFireMode[1].SwitchWeaponMode(CurrentWeaponMode);
	// End:0xE7
	if(WeaponModes[LastMode].RecoilParamsIndex != WeaponModes[int(CurrentWeaponMode)].RecoilParamsIndex)
	{
		ParamsClasses[int(GameStyleIndex)].static.SetRecoilParams(self);
	}
	// End:0x126
	if(WeaponModes[LastMode].AimParamsIndex != WeaponModes[int(CurrentWeaponMode)].AimParamsIndex)
	{
		ParamsClasses[int(GameStyleIndex)].static.SetAimParams(self);
	}
	CheckBurstMode();
	// End:0x15B
	if((int(ModeHandling) == int(1)) && Instigator.IsLocallyControlled())
	{
		default.LastWeaponMode = CurrentWeaponMode;
	}
	//return;	
}

function ServerFlashLight(bool bNew)
{
	bLightsOn = bNew;
	MK781Attachment(ThirdPersonActor).bLightsOn = bLightsOn;
	//return;	
}

simulated function StartProjector()
{
	// End:0x20
	if(FlashLightProj == none)
	{
		FlashLightProj = Spawn(Class'BallisticProV55.MRS138TorchProjector', self,, Location);
	}
	AttachToBone(FlashLightProj, 'Laser');
	FlashLightProj.SetRelativeLocation(TorchOffset);
	//return;	
}

simulated function KillProjector()
{
	// End:0x17
	if(FlashLightProj != none)
	{
		FlashLightProj.Destroy();
	}
	//return;	
}

simulated event Tick(float dt)
{
	super(BallisticWeapon).Tick(dt);
	// End:0x2A
	if(!bLightsOn || int(ClientState) != int(4))
	{
		return;
	}
	// End:0x47
	if(!Instigator.IsFirstPerson())
	{
		KillProjector();		
	}
	else
	{
		// End:0x58
		if(FlashLightProj == none)
		{
			StartProjector();
		}
	}
	//return;	
}

simulated event RenderOverlays(Canvas Canvas)
{
	local Vector TazLoc;
	local Rotator TazRot;

	super(BallisticWeapon).RenderOverlays(Canvas);
	// End:0x23
	if(!IsInState('Lowered'))
	{
		DrawLaserSight(Canvas);
	}
	// End:0x98
	if(bLightsOn)
	{
		TazLoc = GetBoneCoords('Laser').Origin;
		TazRot = GetBoneRotation('Laser');
		// End:0x98
		if(FlashLightEmitter != none)
		{
			FlashLightEmitter.SetLocation(TazLoc);
			FlashLightEmitter.SetRotation(TazRot);
			Canvas.DrawActor(FlashLightEmitter, false, false, DisplayFOV);
		}
	}
	//return;	
}

simulated function OnLaserSwitched()
{
	// End:0x12
	if(bLaserOn)
	{
		ApplyLaserAim();		
	}
	else
	{
		AimComponent.Recalculate();
	}
	//return;	
}

simulated function ApplyLaserAim()
{
	AimComponent.AimAdjustTime *= 0.7500000;
	AimComponent.AimSpread.Max *= 0.7500000;
	AimComponent.AimSpread.Min *= 0.7500000;
	//return;	
}

function ServerSwitchLaser(bool bNewLaserOn)
{
	bLaserOn = bNewLaserOn;
	// End:0x33
	if(ThirdPersonActor != none)
	{
		MK781Attachment(ThirdPersonActor).bLaserOn = bLaserOn;
	}
	OnLaserSwitched();
	// End:0x51
	if(Instigator.IsLocallyControlled())
	{
		ClientSwitchLaser();
	}
	//return;	
}

simulated function ClientSwitchLaser()
{
	OnLaserSwitched();
	// End:0x2C
	if(bLaserOn)
	{
		SpawnLaserDot();
		PlaySound(LaserOnSound,, 0.7000000,, 32.0000000);		
	}
	else
	{
		KillLaserDot();
		PlaySound(LaserOffSound,, 0.7000000,, 32.0000000);
	}
	PlayIdle();
	//return;	
}

simulated function SpawnLaserDot(optional Vector loc)
{
	// End:0x20
	if(LaserDot == none)
	{
		LaserDot = Spawn(Class'BallisticProV55.MD24LaserDot',,, loc);
	}
	//return;	
}

simulated function KillLaserDot()
{
	// End:0x21
	if(LaserDot != none)
	{
		LaserDot.Kill();
		LaserDot = none;
	}
	//return;	
}

simulated function DrawLaserSight(Canvas Canvas)
{
	local Vector HitLocation, Start, End, HitNormal, Scale3D, loc;

	local Rotator AimDir;
	local Actor Other;

	// End:0x4F
	if(((((int(ClientState) == int(1)) || !bLaserOn) || Instigator == none) || Instigator.Controller == none) || Laser == none)
	{
		return;
	}
	AimDir = BallisticFire(FireMode[0]).GetFireAim(Start);
	loc = GetBoneCoords('Laser').Origin;
	End = Start + (Normal(Vector(AimDir)) * float(5000));
	Other = FireMode[0].Trace(HitLocation, HitNormal, End, Start, true);
	// End:0xE7
	if(Other == none)
	{
		HitLocation = End;
	}
	// End:0x143
	if(((int(ReloadState) == int(0)) && int(ClientState) == int(4)) && (Level.TimeSeconds - FireMode[0].NextFireTime) > 0.2000000)
	{
		SpawnLaserDot(HitLocation);		
	}
	else
	{
		KillLaserDot();
	}
	// End:0x165
	if(LaserDot != none)
	{
		LaserDot.SetLocation(HitLocation);
	}
	Canvas.DrawActor(LaserDot, false, false, Instigator.Controller.FovAngle);
	Laser.SetLocation(loc);
	HitLocation = Class'BCoreProV55.BUtil'.static.ConvertFOVs(Instigator.Location + Instigator.EyePosition(), Instigator.GetViewRotation(), End, Instigator.Controller.FovAngle, DisplayFOV, 400.0000000);
	// End:0x2CE
	if(((int(ReloadState) == int(0)) && int(ClientState) == int(4)) && (FireMode[0].IsFiring() && (Level.TimeSeconds - FireMode[0].NextFireTime) > -0.0500000) || !FireMode[0].IsFiring() && (Level.TimeSeconds - FireMode[0].NextFireTime) > 0.2000000)
	{
		Laser.SetRotation(Rotator(HitLocation - loc));		
	}
	else
	{
		AimDir = GetBoneRotation('Laser');
		Laser.SetRotation(AimDir);
	}
	Scale3D.X = VSize(HitLocation - loc) / float(128);
	Scale3D.Y = 1.0000000;
	Scale3D.Z = 1.0000000;
	Laser.SetDrawScale3D(Scale3D);
	Canvas.DrawActor(Laser, false, false, DisplayFOV);
	//return;	
}

simulated function bool PutDown()
{
	// End:0x4F
	if(super(BallisticWeapon).PutDown())
	{
		KillLaserDot();
		// End:0x30
		if(ThirdPersonActor != none)
		{
			MK781Attachment(ThirdPersonActor).bLaserOn = false;
		}
		KillProjector();
		// End:0x4D
		if(FlashLightEmitter != none)
		{
			FlashLightEmitter.Destroy();
		}
		return true;
	}
	return false;
	//return;	
}

simulated function Destroyed()
{
	default.bLaserOn = false;
	// End:0x1F
	if(Laser != none)
	{
		Laser.Destroy();
	}
	// End:0x36
	if(LaserDot != none)
	{
		LaserDot.Destroy();
	}
	// End:0x4D
	if(FlashLightEmitter != none)
	{
		FlashLightEmitter.Destroy();
	}
	KillProjector();
	super(BallisticWeapon).Destroyed();
	//return;	
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	// End:0x39
	if(bSilenced)
	{
		MK781Attachment(ThirdPersonActor).bSilenced = true;
		ParamsClasses[int(GameStyleIndex)].static.OverrideFireParams(self, 3);
	}
	VisGrenades = float(Grenades);
	ShellIndex = byte(FMin(float(Grenades - 1), 5.0000000));
	super(BallisticWeapon).BringUp(PrevWeapon);
	// End:0xAB
	if(((Instigator != none) && Laser == none) && PlayerController(Instigator.Controller) != none)
	{
		Laser = Spawn(Class'BallisticProV55.LaserActor');
	}
	// End:0xE4
	if(((Instigator != none) && LaserDot == none) && PlayerController(Instigator.Controller) != none)
	{
		SpawnLaserDot();
	}
	// End:0x14A
	if((Instigator != none) && AIController(Instigator.Controller) != none)
	{
		// End:0x131
		if(bHasLAM)
		{
			ServerSwitchLaser(FRand() > 0.5000000);
			ServerFlashLight(FRand() > 0.5000000);
		}
		// End:0x14A
		if(bHasSuppressor)
		{
			bSilenced = FRand() > 0.5000000;
		}
	}
	// End:0x170
	if(ThirdPersonActor != none)
	{
		MK781Attachment(ThirdPersonActor).bLaserOn = bLaserOn;
	}
	UpdateBones();
	//return;	
}

simulated function AnimEnded(int Channel, name Anim, float frame, float Rate)
{
	// End:0x7B
	if((Anim == bFireMode[0].AimedFireAnim) || Anim == bFireMode[1].AimedFireAnim)
	{
		AnimBlendParams(1, 0.0000000);
		// End:0x73
		if((float(SightingState) > FireAnimCutThreshold) && SafePlayAnim(IdleAnim, 1.0000000))
		{
			FreezeAnimAt(0.0000000);
		}
		bPreventReload = false;
	}
	// End:0x1BD
	if(((int(ClientState) == int(4)) || (int(ClientState) == int(0)) && Instigator.Weapon == self) && int(ReloadState) == int(0))
	{
		// End:0x125
		if((Anim == FireMode[0].FireAnim) && HasAnim(FireMode[0].FireEndAnim))
		{
			SafePlayAnim(FireMode[0].FireEndAnim, FireMode[0].FireEndAnimRate, 0.0000000);			
		}
		else
		{
			// End:0x194
			if(((FireMode[1] != none) && Anim == FireMode[1].FireAnim) && HasAnim(FireMode[1].FireEndAnim))
			{
				SafePlayAnim(FireMode[1].FireEndAnim, FireMode[1].FireEndAnimRate, 0.0000000);				
			}
			else
			{
				// End:0x1AC
				if(int(MeleeState) < int(2))
				{
					bPreventReload = false;
				}
			}
		}
		// End:0x1BD
		if(Channel == 0)
		{
			PlayIdle();
		}
	}
	// End:0x1F1
	if(int(ReloadState) == int(4))
	{
		ReloadState = 5;
		// End:0x1E9
		if(MagAmmo == 0)
		{
			PlayShovelLoopEmpty();			
		}
		else
		{
			PlayShovelLoop();
		}
		return;
	}
	// End:0x248
	if(int(ReloadState) == int(6))
	{
		// End:0x238
		if((MagAmmo >= default.MagAmmo) || Ammo[0].AmmoAmount < 1)
		{
			PlayShovelEnd();
			ReloadState = 7;
			return;
		}
		ReloadState = 5;
		PlayShovelLoop();
		return;
	}
	// End:0x2BB
	if((int(ReloadState) == int(3)) || int(ReloadState) == int(7))
	{
		// End:0x289
		if(bNeedCock && MagAmmo > 0)
		{
			CommonCockGun();			
		}
		else
		{
			bNeedCock = false;
			ReloadState = 0;
			ReloadFinished();
			PlayIdle();
			AimComponent.Reaim(0.0500000);
		}
		return;
	}
	// End:0x2F3
	if(int(ReloadState) == int(8))
	{
		ReloadState = 0;
		ReloadFinished();
		PlayIdle();
		AimComponent.Reaim(0.0500000);
	}
	// End:0x329
	if(int(ReloadState) == int(9))
	{
		// End:0x31B
		if(int(Role) == int(ROLE_Authority))
		{
			bServerReloading = false;
		}
		ReloadState = 0;
		PlayIdle();
	}
	//return;	
}

simulated function PlayShovelLoopEmpty()
{
	SafePlayAnim(ReloadAnimEmpty, ReloadAnimRate, 0.0000000,, "RELOAD");
	//return;	
}

simulated function float RateSelf()
{
	// End:0x54
	if(((PlayerController(Instigator.Controller) != none) && Ammo[0].AmmoAmount <= 0) && MagAmmo <= 0)
	{
		CurrentRating = super(BallisticWeapon).RateSelf() * 0.2000000;		
	}
	else
	{
		return super(BallisticWeapon).RateSelf();
	}
	return CurrentRating;
	//return;	
}

function byte BestMode()
{
	local Bot B;
	local float dist;
	local Vector Dir;

	// End:0x0E
	if(!bHasAltShells)
	{
		return 0;
	}
	B = Bot(Instigator.Controller);
	// End:0x4B
	if((B == none) || B.Enemy == none)
	{
		return 0;
	}
	Dir = Instigator.Location - B.Enemy.Location;
	dist = VSize(Dir);
	// End:0x99
	if(dist > float(400))
	{
		return 0;
	}
	// End:0xC5
	if((dist < FireMode[1].MaxRange()) && FRand() > 0.3000000)
	{
		return 1;
	}
	// End:0x14F
	if(((Vector(B.Enemy.Rotation) Dot Normal(Dir)) < 0.0000000) && (VSize(B.Enemy.Velocity) < float(100)) || (Normal(B.Enemy.Velocity) Dot Normal(B.Velocity)) < 0.5000000)
	{
		return 1;
	}
	return byte(Rand(2));
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
	rating = super(BallisticWeapon).GetAIRating();
	// End:0x50
	if(B.Enemy == none)
	{
		return rating;
	}
	dist = VSize(B.Enemy.Location - Instigator.Location);
	return Class'BCoreProV55.BUtil'.static.DistanceAtten(rating, 0.3500000, dist, BallisticInstantFire(bFireMode[0]).DecayRange.Min, BallisticInstantFire(bFireMode[0]).DecayRange.Max);
	//return;	
}

function float SuggestAttackStyle()
{
	// End:0x1F
	if(AIController(Instigator.Controller) == none)
	{
		return 0.5000000;
	}
	return AIController(Instigator.Controller).Skill / float(7);
	//return;	
}

function float SuggestDefenseStyle()
{
	local Bot B;
	local float Result, dist;

	B = Bot(Instigator.Controller);
	// End:0x40
	if((B == none) || B.Enemy == none)
	{
		return -0.5000000;
	}
	dist = VSize(B.Enemy.Location - Instigator.Location);
	Result = -1.0000000 * (B.Skill / float(6));
	Result *= (float(1) - (dist / float(4000)));
	return FClamp(Result, -1.0000000, -0.3000000);
	//return;	
}

simulated function Notify_BrassOut()
{
	//return;	
}

function ServerSwitchWeaponMode(byte newmode)
{
	// End:0x25
	if((int(CurrentWeaponMode) > 0) && FireMode[0].IsFiring())
	{
		return;
	}
	// End:0x5A
	if((FireMode[0].NextFireTime - Level.TimeSeconds) < -0.1000000)
	{
		super(BallisticWeapon).ServerSwitchWeaponMode(newmode);
	}
	//return;	
}

defaultproperties
{
	SilencerBone="Silencer"
	SilencerOnAnim="SilencerOn"
	SilencerOffAnim="SilencerOff"
	SilencerOnSound=Sound'BW_Core_WeaponSound.SRS900.SRS-SilencerOn'
	SilencerOffSound=Sound'BW_Core_WeaponSound.SRS900.SRS-SilencerOff'
	SGPrepAnim="LoadSpecial2"
	ReloadAltAnim="ReloadSpecialFull"
	ReloadAnimEmpty="ReloadEmpty"
	GrenLoadSound=Sound'BW_Core_WeaponSound.M50.M50GrenLoad'
	Grenades=6
	StartingGrenades=3
	LaserOnSound=Sound'BW_Core_WeaponSound.M806.M806LSight'
	LaserOffSound=Sound'BW_Core_WeaponSound.M806.M806LSight'
	TorchOffset=(X=-50.0000000,Y=0.0000000,Z=0.0000000)
	TorchOnSound=Sound'BW_Core_WeaponSound.MRS38.RSS-FlashClick'
	TorchOffSound=Sound'BW_Core_WeaponSound.MRS38.RSS-FlashClick'
	Shells[0]=(ShellName="HShell1")
	Shells[1]=(ShellName="HShell2")
	Shells[2]=(ShellName="HShell3")
	Shells[3]=(ShellName="HShell4")
	Shells[4]=(ShellName="HShell5")
	Shells[5]=(ShellName="HShell6")
	SpecialInfo[0]=(Id="EvoDefs",Info="300.0;25.0;0.5;60.0;0.6;1.0;0.0")
	SightAnimScale=0.7500000
	ParamsClasses[0]=Class'BWBP_SKC_Pro.MK781WeaponParamsComp'
	ParamsClasses[1]=Class'BWBP_SKC_Pro.Mk781WeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_SKC_Pro.Mk781WeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_SKC_Pro.MK781WeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_SKC_Tex.M1014.BigIcon_M1014'
	BigIconCoords=(X1=0,Y1=25,X2=511,Y2=210)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.M763.M763Pullout',Volume=0.2200000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.M763.M763Putaway',Volume=0.2600000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Automatic",bUnavailable=false,ModeID="WM_FullAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Semi-Automatic",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="X-007 Loaded",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=1
	bNoCrosshairInScope=true
	SightBobScale=0.3500000
	CockSound=(Sound=Sound'BWBP_SKC_Sounds.M781.M781-Pump',Volume=2.3000000,Radius=32.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	CockSelectSound=(Sound=Sound'BWBP_SKC_Sounds.M1911.RS04-SlideLock',Volume=2.3000000,Radius=32.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ReloadAnim="ReloadLoop"
	ClipInSound=(Sound=Sound'BWBP_SKC_Sounds.Mk781.Mk781-ShellPlus',Volume=2.3000000,Radius=32.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.3250000
	bCanSkipReload=true
	bShovelLoad=true
	StartShovelAnim="ReloadStart"
	EndShovelAnim="ReloadEnd"
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.M353OutA',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.M763InA',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=255,G=255,B=255,A=192),Color2=(R=0,G=0,B=170,A=255),StartSize1=66,StartSize2=90)
	bWT_Shotgun=true
	bWT_Machinegun=true
	ManualLines[0]="Automatic shotgun fire. Lower overall damage per shot than other shotguns, but good fire rate and tight spread. Spread tightens further with the suppressor employed."
	ManualLines[1]="Loads an electroshock shell.|Without the suppressor employed, will subsequently generate an electric shot with high power and excellent range.|With the suppressor employed, will generate an arcing bolt with fast travel time and strong impact damage. Deals lesser damage in a radius around the point of impact."
	ManualLines[2]="The Weapon Function key attaches the suppressor, which removes the flash, reduces recoil, quietens the fire sound of the primary and changes the functionality of the weapon. Due to the suppressor's length, the weapon will offset while jumping if it is attached.||Effective at medium range."
	SightOffset=(X=4.2000000,Y=0.0100000,Z=6.9700000)
	CockingBringUpTime=1.1000000
	GunLength=48.0000000
	FireModeClass[0]=Class'BWBP_SKC_Pro.MK781PrimaryFire'
	FireModeClass[1]=Class'BWBP_SKC_Pro.MK781SecondaryFire'
	PutDownTime=0.5000000
	AIRating=0.8000000
	CurrentRating=0.8000000
	Description="The Avenger Mk 781 is the special ops version of the M763. It boasts a modernized firing and recoil suppression system and has been praised for its field effectiveness. A good weapon in a pinch, the M781 has been known to save many soldiers' lives. ||This particular model is the MK781 Mod 0, which uses a new lightweight polymer frame and is designed specifically for tactical wetwork. Tube length and barrel length are shortened to cut weight, leaving the Mark 781 with a shell capacity of 6. As part of its wetwork upgrades, this Mark 781 has gained the ability to affix a special suppressor designed for flechette sabot ammunition and slugs. Operators are advised not to load high-powered rounds or buckshot into the suppressor due to potential suppressor damage and failure."
	Priority=245
	HudColor=(R=83,G=111,B=168,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=7
	PickupClass=Class'BWBP_SKC_Pro.MK781Pickup'
	PlayerViewOffset=(X=15.0000000,Y=9.0000000,Z=-11.5000000)
	AttachmentClass=Class'BWBP_SKC_Pro.MK781Attachment'
	IconMaterial=Texture'BWBP_SKC_Tex.M1014.SmallIcon_M1014'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=35)
	ItemName="MK781 Combat Shotgun"
	LightType=2
	LightEffect=13
	LightHue=25
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=5.0000000
	Mesh=SkeletalMesh'BWBP_SKC_Anim.MK781_FPm'
	DrawScale=0.3000000
	Skins[0]=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny'
	Skins[1]=Shader'BWBP_SKC_Tex.M1014.M1014-Shine'
	Skins[2]=Shader'BWBP_SKC_Tex.M1014.M1014-MiscShine'
}
