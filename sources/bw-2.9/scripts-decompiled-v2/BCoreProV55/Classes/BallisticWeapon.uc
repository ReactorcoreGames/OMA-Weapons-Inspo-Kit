class BallisticWeapon extends Weapon
	abstract
	config(BallisticProV55)
	hidedropdown
	cacheexempt;

enum EReloadState
{
	RS_None,                        // 0
	RS_PreClipOut,                  // 1
	RS_PreClipIn,                   // 2
	RS_PostClipIn,                  // 3
	RS_StartShovel,                 // 4
	RS_Shovel,                      // 5
	RS_PostShellIn,                 // 6
	RS_EndShovel,                   // 7
	RS_Cocking,                     // 8
	RS_GearSwitch                   // 9
};

enum EMeleeState
{
	MS_None,                        // 0
	MS_Pending,                     // 1
	MS_Held,                        // 2
	MS_Strike,                      // 3
	MS_StrikePending                // 4
};

enum ESightingState
{
	SS_None,                        // 0
	SS_Lowering,                    // 1
	SS_Raising,                     // 2
	SS_Active                       // 3
};

enum ModeSaveType
{
	MR_None,                        // 0
	MR_Last,                        // 1
	MR_SavedDefault                 // 2
};

enum EScopeHandling
{
	SH_Default,                     // 0
	SH_Hold,                        // 1
	SH_Toggle                       // 2
};

enum ECrosshairMode
{
	CHM_Simple,                     // 0
	CHM_Graphical,                  // 1
	CHM_Unreal                      // 2
};

struct XYRange
{
	var() config Range X;
	var() config Range Y;
};

struct WeaponModeType
{
	var() localized string ModeName;
	var() bool bUnavailable;
	var() string ModeID;
	var() float Value;
	var() int RecoilParamsIndex;
	var() int AimParamsIndex;
};

struct SpecialInfoEntry
{
	var() name Id;
	var() string Info;
};

struct NonDefCrosshairCfg
{
	var() Material Pic1;
	var() Material Pic2;
	var() int USize1;
	var() int VSize1;
	var() int USize2;
	var() int VSize2;
	var() Color Color1;
	var() Color Color2;
	var() int StartSize1;
	var() int StartSize2;
};

struct NonDefCrosshairInfo
{
	var() FloatBox SpreadRatios;
	var() FloatBox SizeFactors;
	var() float MaxScale;
	var float CurrentScale;
};

struct WeaponSkin
{
	var() Material RedTex;
	var() Material BlueTex;
	var() int SkinNum;
};

var() globalconfig BallisticWeapon.ModeSaveType ModeHandling;
var() globalconfig bool bInvertScope;
var() globalconfig BallisticWeapon.EScopeHandling ScopeHandling;
var() globalconfig float AimKnockScale;
var() globalconfig BallisticWeapon.ECrosshairMode CrosshairMode;
var() globalconfig bool bUseBigIcon;
var() globalconfig byte MaxInventoryCapacity;
var() config byte LastWeaponMode;
var() config byte SavedWeaponMode;
var() config float WeaponPrice;
var() config float PrimaryAmmoPrice;
var() config float SecondaryAmmoPrice;
var() config array<SpecialInfoEntry> SpecialInfo;
var Color MagEmptyColor;
var Color CockingColor;
var Color CrossHairColor;
var RewindCollisionManager RwColMgr;
var bool RewindActive;
var() editinline WeaponParams WeaponParams;
var WeaponCamo WeaponCamo;
var bool bPendingBringupTimer;
var int NetInventoryGroup;
var bool bDeferInitialSwitch;
var bool bServerDeferInitialSwitch;
var() float AIReloadTime;
var float BotTryReloadTime;
var Vehicle OwnerLastVehicle;
var Controller InstigatorController;
var bool bNoaltfire;
var BallisticFire bFireMode[2];
var byte PendingMode;
var int FireCount;
var float LastFireTime;
var float OldZoomFOV;
var float SightingPhase;
var bool bPendingSightUp;
var bool bScopeView;
var bool bScopeDesired;
var bool bScopeHeld;
var float NextCheckScopeTime;
var float LogZoomLevel;
var BallisticWeapon.ESightingState SightingState;
var bool bStandardCrosshairOff;
var float SightAnimScale;
var bool PlayerSpeedUp;
var BCSprintControl SprintControl;
var BallisticWeapon.EMeleeState MeleeState;
var float MeleeInterval;
var float MeleeHoldTime;
var protected BallisticMeleeFire MeleeFireMode;
var float MeleeFatigue;
var bool bNeedReload;
var bool bNeedCock;
var bool bPreventReload;
var BallisticWeapon.EReloadState ReloadState;
var bool bServerReloading;
var bool bMagPlusOne;
var() editinline RecoilComponent RcComponent;
var() editinline AimComponent AimComponent;
var() array< Class<BallisticWeaponParams> > ParamsClasses;
var() array<WeaponSkin> TeamSkins;
var() Material BigIconMaterial;
var() IntBox BigIconCoords;
var bool bSkipDrawWeaponInfo;
var bool bAllowWeaponInfoOverride;
var() float IdleTweenTime;
var() array<BallisticGunAugment> GunAugments;
var private int CachedCanvasX;
var private int CachedCanvasY;
var() int BaseDisplayFOV;
var() FullSound BringUpSound;
var() FullSound PutDownSound;
var() array<WeaponModeType> WeaponModes;
var() travel byte CurrentWeaponMode;
var bool bRedirectSwitchToFiremode;
var Actor SightFX;
var() Class<Actor> SightFXClass;
var() name SightFXBone;
var() bool bUseSights;
var() bool bNoTweenToScope;
var() float ScopeXScale;
var() float ScopeScale;
var() name ZoomInAnim;
var() name ZoomOutAnim;
var() globalconfig float ZoomTimeMod;
var() FullSound ZoomInSound;
var() FullSound ZoomOutSound;
var() float SightDisplayFOV;
var float MinFixedZoomLevel;
var float MinZoom;
var float MaxZoom;
var int ZoomStages;
var() float SightZoomFactor;
var() float FullZoomFOV;
var() Material ScopeViewTex;
var() bool bNoCrosshairInScope;
var() name SightBone;
var Vector SMuzzleFlashOffset;
var() float SightBobScale;
var() int AmmoIndex;
var() bool bNoMag;
var() name CockAnim;
var() name CockAnimPostReload;
var() name CockSelectAnim;
var() FullSound CockSound;
var() FullSound CockSelectSound;
var() bool bCockAfterReload;
var() bool bCockOnEmpty;
var() bool bNonCocking;
var() name ReloadAnim;
var() name ReloadEmptyAnim;
var() FullSound ClipHitSound;
var() FullSound ClipOutSound;
var() FullSound ClipInSound;
var() float ClipInFrame;
var() bool bCanSkipReload;
var() bool bAltTriggerReload;
var() bool bShovelLoad;
var() name StartShovelAnim;
var() name EndShovelAnim;
var() name EndShovelEmptyAnim;
var() int ShovelIncrement;
var bool bPlayThirdPersonReload;
var float FireAnimCutThreshold;
var() globalconfig bool bGlobalCrosshair;
var() globalconfig bool bDrawCrosshairDot;
var() config NonDefCrosshairCfg NDCrosshairCfg;
var() config NonDefCrosshairInfo NDCrosshairInfo;
var float NDCrosshairScale;
var() float NDCrosshairChaosFactor;
var() globalconfig float NDCrosshairScaleFactor;
var() Rotator LongGunPivot;
var() Vector LongGunOffset;
var Class<BallisticMeleeFire> MeleeFireClass;
var() bool bWT_Bullet;
var() bool bWT_Shotgun;
var() bool bWT_Hazardous;
var() bool bWT_Splash;
var() bool bWT_Sidearm;
var() bool bWT_Machinegun;
var() bool bWT_RapidProj;
var() bool bWT_Projectile;
var() bool bWT_Grenade;
var() bool bWT_Energy;
var() bool bWT_Super;
var() bool bWT_Trap;
var() bool bWT_Heal;
var() bool bWT_Spam;
var() localized array<localized string> ManualLines;
var Color HeaderColor;
var Color TextColor;
var() byte GameStyleIndex;
var() byte LayoutIndex;
var() bool bLayoutSet;
var() byte CamoIndex;
var() bool bCamoSet;
var() float PlayerSpeedFactor;
var() float PlayerJumpFactor;
var() Sound UsedAmbientSound;
var() WeaponParams.EZoomType ZoomType;
var() float SightingTime;
var() Rotator SightPivot;
var() Vector SightOffset;
var() bool bAdjustHands;
var() Rotator WristAdjust;
var() Rotator RootAdjust;
var() travel int MagAmmo;
var() float CockAnimRate;
var() float CockSelectAnimRate;
var() float CockingBringUpTime;
var() float ReloadAnimRate;
var() float StartShovelAnimRate;
var() float EndShovelAnimRate;
var(Aim) bool bAimDisabled;
var(Aim) bool bUseSpecialAim;
var() float GunLength;
var() bool bHasPenetrated;
var private bool bSetNearClip;
//var delegate<DumpHead> __DumpHead__Delegate;
//var delegate<DumpLine> __DumpLine__Delegate;
//var delegate<DumpTail> __DumpTail__Delegate;
//var delegate<DumpIHead> __DumpIHead__Delegate;
//var delegate<DumpILine> __DumpILine__Delegate;
//var delegate<DumpITail> __DumpITail__Delegate;

replication
{
	// Pos:0x000
	reliable if(bNetOwner && int(Role) == int(ROLE_Authority))
		CamoIndex, GameStyleIndex, 
		LayoutIndex, MagAmmo, 
		NetInventoryGroup, bServerDeferInitialSwitch, 
		bServerReloading;

	// Pos:0x018
	reliable if(int(Role) < int(ROLE_Authority))
		ServerCockGun, ServerMeleeHold, 
		ServerMeleeRelease, ServerReaim, 
		ServerReloadRelease, ServerReloaded, 
		ServerSetScopeView, ServerSkipReload, 
		ServerStartReload, ServerStopReload, 
		ServerSwitchWeaponMode, ServerWeaponSpecial, 
		ServerWeaponSpecialRelease, ServerZeroAim;

	// Pos:0x025
	reliable if(int(Role) == int(ROLE_Authority))
		ClientApplyBlockFatigue, ClientCockGun, 
		ClientDisplaceAim, ClientDodged, 
		ClientInitWeaponFromTurret, ClientJamMode, 
		ClientJumped, ClientPlayerDamaged, 
		ClientReloadRelease, ClientScopeDown, 
		ClientSetMagAmmo, ClientStartReload, 
		ClientSwitchWeaponMode, ClientWeaponReloaded, 
		ClientWeaponSpecial, ClientWeaponSpecialRelease, 
		ReceiveNetAim, ReceiveNetRecoil;
}

final simulated function bool SafePlayAnim(name Sequence, optional float Rate, optional float TweenTime, optional int Channel, optional string AnimID)
{
	// End:0x1C
	if(!CanPlayAnim(Sequence, Channel, AnimID))
	{
		return false;
	}
	return PlayAnim(Sequence, Rate, TweenTime, Channel);
	//return;	
}

final simulated function bool SafeLoopAnim(name Sequence, optional float Rate, optional float TweenTime, optional int Channel, optional string AnimID)
{
	// End:0x1C
	if(!CanPlayAnim(Sequence, Channel, AnimID))
	{
		return false;
	}
	return LoopAnim(Sequence, Rate, TweenTime, Channel);
	//return;	
}

final simulated function bool SafeTweenAnim(name Sequence, float Time, optional int Channel, optional string AnimID)
{
	// End:0x1C
	if(!CanPlayAnim(Sequence, Channel, AnimID))
	{
		return false;
	}
	return TweenAnim(Sequence, Time, Channel);
	//return;	
}

simulated function bool CanPlayAnim(name Sequence, optional int Channel, optional string AnimID)
{
	// End:0x4A
	if((int(ReloadState) != int(0)) && AnimID != "RELOAD")
	{
		// End:0x48
		if((int(MeleeState) > int(1)) && AnimID == "FIRE")
		{
			return true;
		}
		return false;
	}
	return true;
	//return;	
}

final simulated function Vector ViewAlignedOffset(Vector offset)
{
	return Class'BCoreProV55.BUtil'.static.ViewAlignedOffset(self, offset);
	//return;	
}

final simulated function LinkSprintControl()
{
	local Inventory Inv;

	// End:0x0D
	if(Instigator == none)
	{
		return;
	}
	// End:0x71
	if(SprintControl == none)
	{
		Inv = Instigator.Inventory;
		J0x2C:

		// End:0x71 [Loop If]
		if(Inv != none)
		{
			// End:0x5A
			if(BCSprintControl(Inv) != none)
			{
				SprintControl = BCSprintControl(Inv);
				// [Explicit Break]
				goto J0x71;
			}
			Inv = Inv.Inventory;
			// [Loop Continue]
			goto J0x2C;
		}
	}
	J0x71:

	//return;	
}

simulated function PostBeginPlay()
{
	local int M;

	// End:0x44
	if(int(Role) == int(ROLE_Authority))
	{
		// End:0x44
		if(ParamsClasses[int(Class'BCoreProV55.BallisticReplicationInfo'.default.GameStyle)] != none)
		{
			GameStyleIndex = byte(int(Class'BCoreProV55.BallisticReplicationInfo'.default.GameStyle));
		}
	}
	// End:0x94
	if(!default.bSetNearClip && Level.GetLocalPlayerController() != none)
	{
		Level.GetLocalPlayerController().ConsoleCommand("nearclip 3");
		default.bSetNearClip = true;
	}
	super.PostBeginPlay();
	M = 0;
	J0xA1:

	// End:0xFC [Loop If]
	if(M < 2)
	{
		// End:0xF2
		if((FireMode[M] != none) && BallisticFire(FireMode[M]) != none)
		{
			bFireMode[M] = BallisticFire(FireMode[M]);
		}
		M++;
		// [Loop Continue]
		goto J0xA1;
	}
	CreateRecoilComponent();
	CreateAimComponent();
	OnMeshChanged();
	// End:0x12D
	if(bUseBigIcon)
	{
		IconMaterial = BigIconMaterial;
		IconCoords = BigIconCoords;
	}
	// End:0x210
	if(MeleeFireClass != none)
	{
		MeleeFireMode = BallisticMeleeFire(Level.ObjectPool.AllocateObject(MeleeFireClass));
		// End:0x210
		if(MeleeFireMode != none)
		{
			MeleeFireMode.ThisModeNum = 2;
			MeleeFireMode.Weapon = self;
			MeleeFireMode.BW = self;
			MeleeFireMode.Instigator = Instigator;
			MeleeFireMode.Level = Level;
			MeleeFireMode.Owner = self;
			MeleeFireMode.PreBeginPlay();
			MeleeFireMode.BeginPlay();
			MeleeFireMode.PostBeginPlay();
			MeleeFireMode.PostNetBeginPlay();
		}
	}
	//return;	
}

simulated function OnMeshChanged()
{
	AnimBlendParams(1, 0.0000000);
	AnimBlendParams(2, 0.0000000);
	SafePlayAnim(IdleAnim, 1.0000000, 0.0000000, 2);
	FreezeAnimAt(0.0000000, 2);
	//return;	
}

simulated function CalcDisplayFOVs(int CanvasSizeX, int CanvasSizeY)
{
	local float ResScaleX, ResScaleY, AspectRatio;

	CachedCanvasX = CanvasSizeX;
	CachedCanvasY = CanvasSizeY;
	ResScaleX = float(CachedCanvasX / 4);
	ResScaleY = float(CachedCanvasY / 3);
	AspectRatio = FClamp(ResScaleX / ResScaleY, 1.0000000, 3.0000000);
	BaseDisplayFOV = int(Class'BCoreProV55.BUtil'.static.CalcZoomFOV(default.DisplayFOV, 1.0000000 / AspectRatio));
	DisplayFOV = float(BaseDisplayFOV);
	SightDisplayFOV = Class'BCoreProV55.BUtil'.static.CalcZoomFOV(float(BaseDisplayFOV), SightZoomFactor);
	//return;	
}

simulated function SetLayoutIndex(byte NewLayoutIndex)
{
	LayoutIndex = NewLayoutIndex;
	bLayoutSet = true;
	//return;	
}

simulated function SetCamoIndex(byte NewCamoIndex)
{
	CamoIndex = NewCamoIndex;
	bCamoSet = true;
	//return;	
}

simulated function PostNetBeginPlay()
{
	super(Actor).PostNetBeginPlay();
	LinkSprintControl();
	// End:0x70
	if(ParamsClasses[int(GameStyleIndex)] == none)
	{
		// End:0x6E
		if(PlayerController(Instigator.Controller) != none)
		{
			PlayerController(Instigator.Controller).ClientMessage("NO PARAMS FOR " $ string(Name));
		}
		return;
	}
	// End:0xA1
	if(int(Level.NetMode) == int(NM_Client))
	{
		ParamsClasses[int(GameStyleIndex)].static.Initialize(self);
	}
	// End:0xBB
	if(Class'BCoreProV55.BallisticReplicationInfo'.default.bNoReloading)
	{
		bNoMag = true;
	}
	// End:0xD4
	if(NetInventoryGroup != 255)
	{
		InventoryGroup = byte(NetInventoryGroup);
	}
	bDeferInitialSwitch = bServerDeferInitialSwitch;
	SightBobScale *= Class'BCoreProV55.BallisticGameStyles'.static.GetReplicatedStyle().default.SightBobScale;
	//return;	
}

simulated function CheckSetBurstMode()
{
	// End:0x7F
	if((WeaponModes[int(CurrentWeaponMode)].ModeID ~= "WM_Burst") || WeaponModes[int(CurrentWeaponMode)].ModeID ~= "WM_BigBurst")
	{
		bFireMode[0].bBurstMode = true;
		bFireMode[0].MaxBurst = int(WeaponModes[int(CurrentWeaponMode)].Value);
	}
	//return;	
}

simulated function GenerateLayout(byte Index)
{
	local byte i;
	local float F;
	local int WeightSum, CurrentWeight;
	local array<WeaponParams> Layouts;

	Layouts = ParamsClasses[int(GameStyleIndex)].default.Layouts;
	// End:0x4A
	if((int(Index) < Layouts.Length) && int(Index) >= 0)
	{
		SetLayoutIndex(Index);
		return;
	}
	// End:0x15F
	if(!bLayoutSet)
	{
		// End:0x157
		if((Layouts.Length > 0) && !Class'BCoreProV55.BallisticReplicationInfo'.default.bNoRandomCamo)
		{
			i = 0;
			J0x7F:

			// End:0xB8 [Loop If]
			if(int(i) < Layouts.Length)
			{
				WeightSum += Layouts[int(i)].Weight;
				i++;
				// [Loop Continue]
				goto J0x7F;
			}
			F = FRand() * float(WeightSum);
			i = 0;
			J0xD1:

			// End:0x154 [Loop If]
			if(int(i) < Layouts.Length)
			{
				// End:0x12D
				if((F >= float(CurrentWeight)) && F < float(CurrentWeight + Layouts[int(i)].Weight))
				{
					SetLayoutIndex(i);
					// [Explicit Break]
					goto J0x154;
				}
				CurrentWeight += Layouts[int(i)].Weight;
				i++;
				// [Loop Continue]
				goto J0xD1;
			}
			J0x154:
			
		}
		else
		{
			SetLayoutIndex(0);
		}
	}
	//return;	
}

simulated function GenerateCamo(byte Index)
{
	local byte i;
	local float F;
	local int WeightSum, CurrentWeight;
	local array<WeaponCamo> Camos, CamoSublist;
	local array<int> AllowedCamos;

	Camos = ParamsClasses[int(GameStyleIndex)].default.Camos;
	AllowedCamos = ParamsClasses[int(GameStyleIndex)].default.Layouts[int(LayoutIndex)].AllowedCamos;
	// End:0x61
	if(Camos.Length == 0)
	{
		SetCamoIndex(byte(255));
		return;
	}
	// End:0x8F
	if((int(Index) < Camos.Length) && int(Index) >= 0)
	{
		SetCamoIndex(Index);
		return;
	}
	// End:0x231
	if(!bCamoSet)
	{
		// End:0xB4
		if(AllowedCamos.Length == 0)
		{
			CamoSublist = Camos;			
		}
		else
		{
			i = 0;
			J0xBC:

			// End:0xFB [Loop If]
			if(int(i) < AllowedCamos.Length)
			{
				CamoSublist.Insert(0, 1);
				CamoSublist[0] = Camos[AllowedCamos[int(i)]];
				i++;
				// [Loop Continue]
				goto J0xBC;
			}
		}
		// End:0x210
		if((CamoSublist.Length > 0) && !Class'BCoreProV55.BallisticReplicationInfo'.default.bNoRandomCamo)
		{
			i = 0;
			J0x125:

			// End:0x15E [Loop If]
			if(int(i) < CamoSublist.Length)
			{
				WeightSum += CamoSublist[int(i)].Weight;
				i++;
				// [Loop Continue]
				goto J0x125;
			}
			F = FRand() * float(WeightSum);
			i = 0;
			J0x177:

			// End:0x20D [Loop If]
			if(int(i) < CamoSublist.Length)
			{
				// End:0x1E6
				if((F >= float(CurrentWeight)) && F < float(CurrentWeight + CamoSublist[int(i)].Weight))
				{
					SetCamoIndex(byte(CamoSublist[int(i)].Index));
					// [Explicit Break]
					goto J0x20D;
				}
				CurrentWeight += CamoSublist[int(i)].Weight;
				i++;
				// [Loop Continue]
				goto J0x177;
			}
			J0x20D:
			
		}
		else
		{
			// End:0x229
			if(CamoSublist.Length == 0)
			{
				SetCamoIndex(byte(255));				
			}
			else
			{
				SetCamoIndex(0);
			}
		}
	}
	//return;	
}

simulated function OnWeaponParamsChanged()
{
	local int i;
	local Material M;

	assert(WeaponParams != none);
	SightingTime = WeaponParams.SightingTime / ZoomTimeMod;
	default.SightingTime = WeaponParams.SightingTime / ZoomTimeMod;
	MagAmmo = WeaponParams.MagAmmo;
	default.MagAmmo = WeaponParams.MagAmmo;
	bMagPlusOne = WeaponParams.bMagPlusOne;
	default.bMagPlusOne = WeaponParams.bMagPlusOne;
	PlayerSpeedFactor = WeaponParams.PlayerSpeedFactor;
	default.PlayerSpeedFactor = WeaponParams.PlayerSpeedFactor;
	PlayerJumpFactor = WeaponParams.PlayerJumpFactor;
	ReloadAnimRate = WeaponParams.ReloadAnimRate;
	default.ReloadAnimRate = WeaponParams.ReloadAnimRate;
	ReloadAnimRate *= Class'BCoreProV55.BallisticReplicationInfo'.default.ReloadScale;
	default.ReloadAnimRate *= Class'BCoreProV55.BallisticReplicationInfo'.default.ReloadScale;
	StartShovelAnimRate *= Class'BCoreProV55.BallisticReplicationInfo'.default.ReloadScale;
	EndShovelAnimRate *= Class'BCoreProV55.BallisticReplicationInfo'.default.ReloadScale;
	CockAnimRate = WeaponParams.CockAnimRate;
	default.CockAnimRate = WeaponParams.CockAnimRate;
	// End:0x1E8
	if((Level.GRI != none) && Level.GRI.bFastWeaponSwitching)
	{
		BringUpTime = 0.1000000;
		default.BringUpTime = 0.1000000;
		PutDownTime = 0.1000000;
		default.PutDownTime = 0.1000000;
		CockSelectAnimRate = 3.0000000;
		CockingBringUpTime = 0.1000000;
	}
	bNeedCock = WeaponParams.bNeedCock;
	ZoomType = WeaponParams.ZoomType;
	ScopeScale = FMin(1.0000000, WeaponParams.ScopeScale);
	bNoaltfire = WeaponParams.bNoaltfire;
	// End:0x26B
	if(WeaponParams.ScopeViewTex != none)
	{
		ScopeViewTex = WeaponParams.ScopeViewTex;
	}
	// End:0x295
	if(WeaponParams.MaxZoom > float(0))
	{
		MaxZoom = WeaponParams.MaxZoom;
	}
	// End:0x2E9
	if((WeaponParams.MinZoom > float(0)) && WeaponParams.ZoomStages > 0)
	{
		MinZoom = WeaponParams.MinZoom;
		ZoomStages = WeaponParams.ZoomStages;
	}
	bAdjustHands = WeaponParams.bAdjustHands;
	// End:0x333
	if(WeaponParams.WristAdjust != rot(0, 0, 0))
	{
		WristAdjust = WeaponParams.WristAdjust;
	}
	// End:0x367
	if(WeaponParams.RootAdjust != rot(0, 0, 0))
	{
		RootAdjust = WeaponParams.RootAdjust;
	}
	// End:0x3A4
	if(WeaponParams.WeaponName != "")
	{
		ItemName = WeaponParams.WeaponName;
		default.ItemName = WeaponParams.WeaponName;
	}
	// End:0x3D8
	if(WeaponParams.SightOffset != vect(0.0000000, 0.0000000, 0.0000000))
	{
		SightOffset = WeaponParams.SightOffset;
	}
	SightPivot = WeaponParams.SightPivot;
	// End:0x420
	if(WeaponParams.ViewPivot != rot(0, 0, 0))
	{
		PlayerViewPivot = WeaponParams.ViewPivot;
	}
	i = 0;
	J0x427:

	// End:0x521 [Loop If]
	if(i < WeaponParams.WeaponMaterialSwaps.Length)
	{
		// End:0x498
		if(WeaponParams.WeaponMaterialSwaps[i].Material != none)
		{
			Skins[WeaponParams.WeaponMaterialSwaps[i].Index] = WeaponParams.WeaponMaterialSwaps[i].Material;
		}
		// End:0x517
		if(WeaponParams.WeaponMaterialSwaps[i].MaterialName != "")
		{
			M = Material(DynamicLoadObject(WeaponParams.WeaponMaterialSwaps[i].MaterialName, Class'Engine.Material'));
			// End:0x517
			if(M != none)
			{
				Skins[WeaponParams.WeaponMaterialSwaps[i].Index] = M;
			}
		}
		++i;
		// [Loop Continue]
		goto J0x427;
	}
	// End:0x650
	if(WeaponCamo != none)
	{
		i = 0;
		J0x533:

		// End:0x650 [Loop If]
		if(i < WeaponCamo.WeaponMaterialSwaps.Length)
		{
			// End:0x646
			if(WeaponCamo.WeaponMaterialSwaps[i].Index != -1)
			{
				// End:0x5C7
				if(WeaponCamo.WeaponMaterialSwaps[i].Material != none)
				{
					Skins[WeaponCamo.WeaponMaterialSwaps[i].Index] = WeaponCamo.WeaponMaterialSwaps[i].Material;
				}
				// End:0x646
				if(WeaponCamo.WeaponMaterialSwaps[i].MaterialName != "")
				{
					M = Material(DynamicLoadObject(WeaponCamo.WeaponMaterialSwaps[i].MaterialName, Class'Engine.Material'));
					// End:0x646
					if(M != none)
					{
						Skins[WeaponCamo.WeaponMaterialSwaps[i].Index] = M;
					}
				}
			}
			++i;
			// [Loop Continue]
			goto J0x533;
		}
	}
	// End:0x67E
	if(WeaponParams.LayoutMesh != none)
	{
		LinkMesh(WeaponParams.LayoutMesh);
		OnMeshChanged();
	}
	i = 0;
	J0x685:

	// End:0x6F9 [Loop If]
	if(i < WeaponParams.WeaponBoneScales.Length)
	{
		SetBoneScale(WeaponParams.WeaponBoneScales[i].Slot, WeaponParams.WeaponBoneScales[i].Scale, WeaponParams.WeaponBoneScales[i].BoneName);
		++i;
		// [Loop Continue]
		goto J0x685;
	}
	i = 0;
	J0x700:

	// End:0x855 [Loop If]
	if(i < WeaponParams.GunAugments.Length)
	{
		GunAugments[i] = Spawn(WeaponParams.GunAugments[i].GunAugmentClass);
		GunAugments[i].SetDrawScale(WeaponParams.GunAugments[i].Scale);
		AttachToBone(GunAugments[i], WeaponParams.GunAugments[i].BoneName);
		// End:0x7F2
		if(WeaponParams.GunAugments[i].AugmentOffset != vect(0.0000000, 0.0000000, 0.0000000))
		{
			GunAugments[i].SetRelativeLocation(WeaponParams.GunAugments[i].AugmentOffset);
		}
		// End:0x84B
		if(WeaponParams.GunAugments[i].AugmentRot != rot(0, 0, 0))
		{
			GunAugments[i].SetRelativeRotation(WeaponParams.GunAugments[i].AugmentRot);
		}
		++i;
		// [Loop Continue]
		goto J0x700;
	}
	// End:0x9DC
	if(WeaponParams.WeaponModes.Length != 0)
	{
		i = 0;
		J0x871:

		// End:0x89E [Loop If]
		if(i < WeaponModes.Length)
		{
			WeaponModes[i].bUnavailable = true;
			++i;
			// [Loop Continue]
			goto J0x871;
		}
		i = 0;
		J0x8A5:

		// End:0x9C6 [Loop If]
		if(i < WeaponParams.WeaponModes.Length)
		{
			WeaponModes[i].ModeName = WeaponParams.WeaponModes[i].ModeName;
			WeaponModes[i].bUnavailable = WeaponParams.WeaponModes[i].bUnavailable;
			WeaponModes[i].ModeID = WeaponParams.WeaponModes[i].ModeID;
			WeaponModes[i].Value = WeaponParams.WeaponModes[i].Value;
			WeaponModes[i].RecoilParamsIndex = WeaponParams.WeaponModes[i].RecoilParamsIndex;
			WeaponModes[i].AimParamsIndex = WeaponParams.WeaponModes[i].AimParamsIndex;
			++i;
			// [Loop Continue]
			goto J0x8A5;
		}
		CurrentWeaponMode = byte(WeaponParams.InitialWeaponMode);
	}
	CheckSetBurstMode();
	//return;	
}

final simulated function CreateRecoilComponent()
{
	RcComponent = RecoilComponent(Level.ObjectPool.AllocateObject(Class'BCoreProV55.RecoilComponent'));
	RcComponent.BW = self;
	RcComponent.Level = Level;
	//return;	
}

final simulated function CreateAimComponent()
{
	AimComponent = AimComponent(Level.ObjectPool.AllocateObject(Class'BCoreProV55.AimComponent'));
	AimComponent.BW = self;
	AimComponent.Level = Level;
	AimComponent.GunLength = GunLength;
	AimComponent.LongGunPivot = LongGunPivot;
	AimComponent.LongGunOffset = LongGunOffset;
	//return;	
}

exec function OffsetX1(int X1)
{
	IconCoords.X1 = X1;
	//return;	
}

exec function OffsetX2(int X2)
{
	IconCoords.X2 = X2;
	//return;	
}

exec function OffsetY1(int Y1)
{
	IconCoords.Y1 = Y1;
	//return;	
}

exec function OffsetY2(int Y2)
{
	IconCoords.Y2 = Y2;
	//return;	
}

exec function LogIconCoords()
{
	Log(((((((((string(self) @ "BigIconCoords=(X1=") $ string(IconCoords.X1)) $ ",X2=") $ string(IconCoords.X2)) $ ",Y1=") $ string(IconCoords.Y1)) $ ",Y2=") $ string(IconCoords.Y2)) $ ")");
	PlayerController(InstigatorController).ClientMessage("Logged IconCoords for" @ string(self));
	//return;	
}

static final operator(34) Range *=(out Range A, float B)
{
	A.Min *= B;
	A.Max *= B;
	return A;
	//return;	
}

static final operator(34) XYRange *=(out XYRange A, float B)
{
	A.X *= B;
	A.Y *= B;
	return A;
	//return;	
}

static final operator(34) Range /=(out Range A, float B)
{
	A.Min /= B;
	A.Max /= B;
	return A;
	//return;	
}

static final operator(34) XYRange /=(out XYRange A, float B)
{
	A.X /= B;
	A.Y /= B;
	return A;
	//return;	
}

static final simulated function Class<BallisticWeaponParams> GetParams()
{
	return default.ParamsClasses[int(Class'BCoreProV55.BallisticReplicationInfo'.default.GameStyle)];
	//return;	
}

final simulated function bool BlendFire()
{
	switch(SightingState)
	{
		// End:0x0E
		case 0:
			return false;
		// End:0x5B
		case 2:
			AnimBlendToAlpha(1, 1.0000000, (1.0000000 - SightingPhase) * SightingTime);
			AnimBlendToAlpha(2, 1.0000000 - SightAnimScale, (1.0000000 - SightingPhase) * SightingTime);
			return true;
		// End:0x93
		case 1:
			AnimBlendToAlpha(1, 0.0000000, SightingPhase * SightingTime);
			AnimBlendToAlpha(2, 0.0000000, SightingPhase * SightingTime);
			return true;
		// End:0xBA
		case 3:
			AnimBlendParams(1, 1.0000000);
			AnimBlendParams(2, 1.0000000 - SightAnimScale);
			return true;
		// End:0xFFFF
		default:
			return false;
			break;
	}
	//return;	
}

simulated function AnimEnded(int Channel, name Anim, float frame, float Rate)
{
	// End:0x22
	if(Anim == ZoomInAnim)
	{
		SightingState = 3;
		ScopeUpAnimEnd();
		return;		
	}
	else
	{
		// End:0x41
		if(Anim == ZoomOutAnim)
		{
			SightingState = 0;
			ScopeDownAnimEnd();
			return;
		}
	}
	// End:0x8E
	if((Anim == FireMode[0].FireAnim) || (FireMode[1] != none) && Anim == FireMode[1].FireAnim)
	{
		bPreventReload = false;
	}
	// End:0xFE
	if((MeleeFireMode != none) && Anim == MeleeFireMode.FireAnim)
	{
		// End:0xCE
		if(int(MeleeState) == int(4))
		{
			MeleeState = 1;			
		}
		else
		{
			MeleeState = 0;
		}
		ReloadState = 0;
		// End:0xF6
		if(int(Role) == int(ROLE_Authority))
		{
			bServerReloading = false;
		}
		bPreventReload = false;
	}
	// End:0x186
	if((Anim == bFireMode[0].AimedFireAnim) || Anim == bFireMode[1].AimedFireAnim)
	{
		AnimBlendParams(1, 0.0000000);
		AnimBlendParams(2, 0.0000000);
		// End:0x17E
		if((float(SightingState) > FireAnimCutThreshold) && SafePlayAnim(IdleAnim, 1.0000000))
		{
			FreezeAnimAt(0.0000000);
		}
		bPreventReload = false;
	}
	// End:0x333
	if(((int(ClientState) == int(4)) || (int(ClientState) == int(0)) && Instigator.Weapon == self) && int(ReloadState) == int(0))
	{
		// End:0x230
		if((Anim == FireMode[0].FireAnim) && HasAnim(FireMode[0].FireEndAnim))
		{
			SafePlayAnim(FireMode[0].FireEndAnim, FireMode[0].FireEndAnimRate, 0.0000000);			
		}
		else
		{
			// End:0x29F
			if(((FireMode[1] != none) && Anim == FireMode[1].FireAnim) && HasAnim(FireMode[1].FireEndAnim))
			{
				SafePlayAnim(FireMode[1].FireEndAnim, FireMode[1].FireEndAnimRate, 0.0000000);				
			}
			else
			{
				// End:0x2B7
				if(int(MeleeState) < int(2))
				{
					bPreventReload = false;
				}
			}
		}
		// End:0x333
		if(((Channel == 0) && bNeedReload || ((FireMode[0] == none) || !FireMode[0].bIsFiring) && (FireMode[1] == none) || !FireMode[1].bIsFiring) && int(MeleeState) < int(2))
		{
			PlayIdle();
		}
	}
	// End:0x340
	if(Channel > 0)
	{
		return;
	}
	// End:0x360
	if(int(ReloadState) == int(4))
	{
		ReloadState = 5;
		PlayShovelLoop();
		return;
	}
	// End:0x3E2
	if(int(ReloadState) == int(6))
	{
		// End:0x3D2
		if(((MagAmmo - ((int(!bNeedCock) * int(!bNonCocking)) * int(bMagPlusOne))) >= WeaponParams.MagAmmo) || Ammo[0].AmmoAmount < 1)
		{
			PlayShovelEnd();
			ReloadState = 7;
			return;
		}
		ReloadState = 5;
		PlayShovelLoop();
		return;
	}
	// End:0x455
	if((int(ReloadState) == int(3)) || int(ReloadState) == int(7))
	{
		// End:0x423
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
	// End:0x495
	if(int(ReloadState) == int(8))
	{
		bNeedCock = false;
		ReloadState = 0;
		ReloadFinished();
		PlayIdle();
		AimComponent.Reaim(0.0500000);
	}
	// End:0x4CB
	if(int(ReloadState) == int(9))
	{
		// End:0x4BD
		if(int(Role) == int(ROLE_Authority))
		{
			bServerReloading = false;
		}
		ReloadState = 0;
		PlayIdle();
	}
	//return;	
}

simulated event AnimEnd(int Channel)
{
	local name Anim;
	local float frame, Rate;

	GetAnimParams(Channel, Anim, frame, Rate);
	AnimEnded(Channel, Anim, frame, Rate);
	//return;	
}

simulated function float GetModifiedJumpZ(Pawn P)
{
	return P.JumpZ * PlayerJumpFactor;
	//return;	
}

simulated function StartBerserk()
{
	// End:0x39
	if((Level.GRI != none) && Level.GRI.WeaponBerserk > 1.0000000)
	{
		return;
	}
	bBerserk = true;
	UpdateBerserkRecoil();
	ReloadAnimRate = default.ReloadAnimRate / 0.7500000;
	CockAnimRate = default.CockAnimRate / 0.7500000;
	// End:0x89
	if(FireMode[0] != none)
	{
		FireMode[0].StartBerserk();
	}
	// End:0xA7
	if(FireMode[1] != none)
	{
		FireMode[1].StartBerserk();
	}
	//return;	
}

simulated function StopBerserk()
{
	bBerserk = false;
	UpdateBerserkRecoil();
	ReloadAnimRate = default.ReloadAnimRate;
	CockAnimRate = default.CockAnimRate;
	// End:0x5D
	if((Level.GRI != none) && Level.GRI.WeaponBerserk > 1.0000000)
	{
		return;
	}
	// End:0x7B
	if(FireMode[0] != none)
	{
		FireMode[0].StopBerserk();
	}
	// End:0x99
	if(FireMode[1] != none)
	{
		FireMode[1].StopBerserk();
	}
	//return;	
}

simulated function UpdateBerserkRecoil()
{
	local float factor;

	factor = 0.7500000;
	// End:0x28
	if(!bBerserk)
	{
		factor = 1.0000000 / factor;
	}
	RcComponent.DeclineTime *= factor;
	RcComponent.DeclineDelay *= factor;
	//return;	
}

simulated function PlayerEnteredVehicle(Vehicle V)
{
	// End:0x18
	if(int(Role) == int(ROLE_Authority))
	{
		bServerReloading = false;
	}
	ReloadState = 0;
	PlayIdle();
	// End:0x38
	if(int(CrosshairMode) == int(2))
	{
		return;
	}
	// End:0x9E
	if((PlayerController(InstigatorController) != none) && PlayerController(InstigatorController).myHUD != none)
	{
		PlayerController(InstigatorController).myHUD.bCrosshairShow = PlayerController(InstigatorController).myHUD.default.bCrosshairShow;
	}
	//return;	
}

simulated function PlayerLeftVehicle(Vehicle V)
{
	// End:0x12
	if(int(CrosshairMode) == int(2))
	{
		return;
	}
	// End:0x5C
	if((PlayerController(InstigatorController) != none) && PlayerController(InstigatorController).myHUD != none)
	{
		PlayerController(InstigatorController).myHUD.bCrosshairShow = false;
	}
	//return;	
}

simulated event Tick(float dt)
{
	super(Actor).Tick(dt);
	// End:0x90
	if(((Instigator != none) && Instigator.Weapon == self) && OwnerLastVehicle != Instigator.DrivenVehicle)
	{
		// End:0x71
		if(Instigator.DrivenVehicle != none)
		{
			PlayerEnteredVehicle(Instigator.DrivenVehicle);			
		}
		else
		{
			PlayerLeftVehicle(OwnerLastVehicle);
		}
		OwnerLastVehicle = Instigator.DrivenVehicle;
	}
	//return;	
}

simulated event WeaponTick(float dt)
{
	super.WeaponTick(dt);
	AimComponent.UpdateAim(dt);
	RcComponent.UpdateRecoil(dt);
	ApplyAimRotation();
	AimComponent.SetLastLookDir(GetPlayerAim());
	AimComponent.UpdateDisplacements(dt);
	// End:0x86
	if(AIController(Instigator.Controller) == none)
	{
		TickSighting(dt);
	}
	TickFireCounter(dt);
	// End:0xA2
	if(SprintControl == none)
	{
		LinkSprintControl();
	}
	// End:0xC0
	if(bPreventReload && !IsFiring())
	{
		bPreventReload = false;
	}
	// End:0x149
	if((((!bNoMag && Level.TimeSeconds > BotTryReloadTime) && AIController(InstigatorController) != none) && !InstigatorController.LineOfSightTo(AIController(InstigatorController).Enemy)) && BotShouldReload())
	{
		BotTryReloadTime = Level.TimeSeconds + 1.0000000;
		BotReload();
	}
	//return;	
}

final simulated function bool CheckFireAnim()
{
	local int i, Channel;
	local name Anim;
	local float Rate, frame;

	i = 0;
	J0x07:

	// End:0x5B [Loop If]
	if(i < 2)
	{
		// End:0x51
		if(!HasAnim(FireMode[i].FireAnim) || FireMode[i].FireAnim == IdleAnim)
		{
			return true;
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	GetAnimParams(Channel, Anim, frame, Rate);
	// End:0xAD
	if((Anim == FireMode[0].FireAnim) || Anim == FireMode[1].FireAnim)
	{
		return false;
	}
	// End:0xE5
	if((Anim == FireMode[0].FireEndAnim) || Anim == FireMode[1].FireEndAnim)
	{
		return false;
	}
	return true;
	//return;	
}

simulated function TickFireCounter(float dt)
{
	// End:0x4F
	if(((!FireMode[1].bModeExclusive && !FireMode[0].bIsFiring) || !IsFiring()) && FireCount > 0)
	{
		FireCount = 0;
	}
	//return;	
}

final function RewindCollisions()
{
	local PlayerController PC;

	// End:0x0D
	if(RwColMgr == none)
	{
		return;
	}
	PC = PlayerController(InstigatorController);
	// End:0x2A
	if(PC == none)
	{
		return;
	}
	RewindActive = true;
	RwColMgr.super(BallisticWeapon).RewindCollisions(Instigator, float(PC.PlayerReplicationInfo.Ping) * 0.0040000);
	//return;	
}

final function RestoreCollisions()
{
	// End:0x1A
	if((RwColMgr == none) || !RewindActive)
	{
		return;
	}
	RwColMgr.super(BallisticWeapon).RestoreCollisions();
	RewindActive = false;
	//return;	
}

simulated function Notify_ShellIn()
{
	local float BotSafety;
	local int AmmoNeeded;

	// End:0x1A4
	if(int(ReloadState) == int(5))
	{
		ReloadState = 6;
		// End:0xCF
		if(int(Role) == int(ROLE_Authority))
		{
			AmmoNeeded = Min(ShovelIncrement, (WeaponParams.MagAmmo - MagAmmo) + (((int(!bNeedCock) * int(bMagPlusOne)) * int(!bNonCocking)) * int(MagAmmo > 0)));
			// End:0xAC
			if(AmmoNeeded > Ammo[0].AmmoAmount)
			{
				MagAmmo += Ammo[0].AmmoAmount;				
			}
			else
			{
				MagAmmo += AmmoNeeded;
			}
			Ammo[0].UseAmmo(AmmoNeeded, true);
		}
		Class'BCoreProV55.BUtil'.static.PlayFullSound(self, ClipInSound, true);
		// End:0x1A4
		if(((AIController(InstigatorController) != none) && MagAmmo > 0) && AIController(InstigatorController).Enemy != none)
		{
			BotSafety = FMin(Level.TimeSeconds - Instigator.LastPainTime, VSize(Instigator.Location - AIController(InstigatorController).Enemy.Location) / float(200));
			// End:0x1A4
			if((AIController(InstigatorController).Skill + (FRand() * float(2))) > BotSafety)
			{
				SkipReload();
			}
		}
	}
	//return;	
}

simulated function Notify_ClipIn()
{
	local int AmmoNeeded;

	// End:0x12
	if(int(ReloadState) == int(0))
	{
		return;
	}
	ReloadState = 3;
	Class'BCoreProV55.BUtil'.static.PlayFullSound(self, ClipInSound, true);
	// End:0xE9
	if(int(Level.NetMode) != int(NM_Client))
	{
		AmmoNeeded = (WeaponParams.MagAmmo - MagAmmo) + (((int(!bNeedCock) * int(bMagPlusOne)) * int(!bNonCocking)) * int(MagAmmo > 0));
		// End:0xC6
		if(AmmoNeeded > Ammo[0].AmmoAmount)
		{
			MagAmmo += Ammo[0].AmmoAmount;			
		}
		else
		{
			MagAmmo += AmmoNeeded;
		}
		Ammo[0].UseAmmo(AmmoNeeded, true);
	}
	//return;	
}

simulated function Notify_ClipOut()
{
	// End:0x12
	if(int(ReloadState) == int(0))
	{
		return;
	}
	ReloadState = 2;
	Class'BCoreProV55.BUtil'.static.PlayFullSound(self, ClipOutSound, true);
	//return;	
}

simulated function Notify_CockStart()
{
	// End:0x1F
	if((int(ReloadState) == int(0)) && !bNeedCock)
	{
		return;
	}
	ReloadState = 8;
	Class'BCoreProV55.BUtil'.static.PlayFullSound(self, CockSound, true);
	//return;	
}

simulated function Notify_CockPullout()
{
	// End:0x1F
	if((int(ReloadState) == int(0)) && !bNeedCock)
	{
		return;
	}
	ReloadState = 8;
	Class'BCoreProV55.BUtil'.static.PlayFullSound(self, CockSelectSound, true);
	//return;	
}

simulated function Notify_BrassOut()
{
	bFireMode[0].EjectBrass();
	//return;	
}

simulated function Notify_CockAfterFire()
{
	bPreventReload = false;
	// End:0x38
	if((bNeedCock && int(ReloadState) == int(0)) && MagAmmo > 0)
	{
		CommonCockGun(1);
	}
	//return;	
}

simulated function Notify_CockAfterReload()
{
	// End:0x30
	if((bNeedCock && int(ReloadState) == int(0)) && MagAmmo > 0)
	{
		CommonCockGun(2);
	}
	//return;	
}

simulated function Notify_ClipHit()
{
	Class'BCoreProV55.BUtil'.static.PlayFullSound(self, ClipHitSound, true);
	//return;	
}

simulated function PlayIdle()
{
	// End:0x55
	if(int(MeleeState) == int(1))
	{
		MeleeState = 2;
		MeleeFireMode.PlayPreFire();
		// End:0x4D
		if((SprintControl != none) && SprintControl.bSprinting)
		{
			PlayerSprint(false);
		}
		ServerMeleeHold();
		return;
	}
	// End:0x86
	if(int(SightingState) != int(0))
	{
		// End:0x83
		if(SafePlayAnim(IdleAnim, 1.0000000))
		{
			FreezeAnimAt(0.0000000);
		}		
	}
	else
	{
		// End:0xBD
		if(bScopeView)
		{
			// End:0xBA
			if(HasAnim(ZoomOutAnim) && SafePlayAnim(ZoomOutAnim, 1.0000000))
			{
				FreezeAnimAt(0.0000000);
			}			
		}
		else
		{
			SafeLoopAnim(IdleAnim, IdleAnimRate, IdleTweenTime,, "IDLE");
		}
	}
	//return;	
}

simulated function PlayReload()
{
	// End:0x26
	if(bShovelLoad)
	{
		SafePlayAnim(StartShovelAnim, StartShovelAnimRate,, 0, "RELOAD");		
	}
	else
	{
		// End:0x5B
		if((MagAmmo < 1) && HasAnim(ReloadEmptyAnim))
		{
			SafePlayAnim(ReloadEmptyAnim, ReloadAnimRate,, 0, "RELOAD");			
		}
		else
		{
			SafePlayAnim(ReloadAnim, ReloadAnimRate,, 0, "RELOAD");
		}
	}
	//return;	
}

simulated function PlayShovelEnd()
{
	// End:0x37
	if(bNeedCock && HasAnim(EndShovelEmptyAnim))
	{
		SafePlayAnim(EndShovelEmptyAnim, EndShovelAnimRate, 0.1000000,, "RELOAD");		
	}
	else
	{
		SafePlayAnim(EndShovelAnim, EndShovelAnimRate, 0.1000000,, "RELOAD");
	}
	//return;	
}

simulated function PlayShovelLoop()
{
	SafePlayAnim(ReloadAnim, ReloadAnimRate, 0.0000000,, "RELOAD");
	// End:0x61
	if((BallisticAttachment(ThirdPersonActor) != none) && BallisticAttachment(ThirdPersonActor).ReloadAnim != 'None')
	{
		Instigator.SetAnimAction('Shovel');
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
	// End:0xC0
	if(int(SightingState) != int(0))
	{
		TemporaryScopeDown(default.SightingTime);
	}
	//return;	
}

simulated function ClientJamMode(byte Mode)
{
	// End:0x30
	if(int(Level.NetMode) == int(NM_Client))
	{
		bFireMode[int(Mode)].DoJam();
	}
	//return;	
}

simulated function ReloadFinished()
{
	// End:0x18
	if(int(Role) == int(ROLE_Authority))
	{
		bServerReloading = false;
	}
	// End:0x36
	if(bFireMode[0] != none)
	{
		bFireMode[0].WeaponReloaded();
	}
	// End:0x54
	if(bFireMode[1] != none)
	{
		bFireMode[1].WeaponReloaded();
	}
	//return;	
}

simulated function bool MayNeedReload(byte Mode, float load)
{
	// End:0x56
	if(((!bNoMag && bFireMode[int(Mode)] != none) && bFireMode[int(Mode)].bUseWeaponMag) && (float(MagAmmo) - load) < float(1))
	{
		return true;
	}
	return bNeedReload;
	//return;	
}

simulated function EmptyFire(byte Mode)
{
	// End:0x3C
	if(((int(ClientState) == int(4)) && FireCount < 1) && Instigator.IsLocallyControlled())
	{
		ServerStartReload(Mode);
	}
	//return;	
}

simulated function FirePressed(float F)
{
	// End:0x14
	if(!HasAmmo())
	{
		OutOfAmmo();		
	}
	else
	{
		// End:0x32
		if(bNeedReload && int(ClientState) == int(4))
		{			
		}
		else
		{
			// End:0x99
			if(bCanSkipReload && ((int(ReloadState) == int(5)) || int(ReloadState) == int(6)) || int(ReloadState) == int(1))
			{
				ServerSkipReload();
				// End:0x96
				if(int(Level.NetMode) == int(NM_Client))
				{
					SkipReload();
				}				
			}
			else
			{
				// End:0x125
				if((((((int(ReloadState) == int(0)) && bNeedCock) && !bPreventReload) && MagAmmo > 0) && !IsFiring()) && Level.TimeSeconds > FireMode[0].NextFireTime)
				{
					CommonCockGun();
					// End:0x125
					if(int(Level.NetMode) == int(NM_Client))
					{
						ServerCockGun();
					}
				}
			}
		}
	}
	//return;	
}

simulated function OutOfAmmo()
{
	// End:0x39
	if((((Instigator == none) || !Instigator.IsLocallyControlled()) || HasAmmo()) || bPreventReload)
	{
		return;
	}
	DoAutoSwitch();
	//return;	
}

simulated function Fire(float F)
{
	FirePressed(0.0000000);
	//return;	
}

simulated function AltFire(float F)
{
	// End:0x14
	if(bAltTriggerReload)
	{
		FirePressed(1.0000000);
	}
	//return;	
}

simulated function SkipReload()
{
	// End:0x33
	if((int(ReloadState) == int(5)) || int(ReloadState) == int(6))
	{
		PlayShovelEnd();
		ReloadState = 7;		
	}
	else
	{
		// End:0x56
		if(int(ReloadState) == int(1))
		{
			ReloadState = 3;
			SetAnimFrame(ClipInFrame);
		}
	}
	//return;	
}

final function ServerSkipReload()
{
	SkipReload();
	//return;	
}

final function ServerStopReload()
{
	ReloadState = 0;
	//return;	
}

simulated function bool CanUseSights()
{
	// End:0x69
	if((((((SprintControl != none) && SprintControl.bSprinting) || int(ClientState) == int(2)) || int(ClientState) == int(3)) || int(ReloadState) != int(0)) || int(MeleeState) != int(0))
	{
		return false;
	}
	return true;
	//return;	
}

simulated exec function ScopeView()
{
	bScopeHeld = true;
	bPendingSightUp = false;
	// End:0x29
	if(bScopeView)
	{
		bScopeDesired = false;
		StopScopeView();
		return;
	}
	// End:0x36
	if(!bUseSights)
	{
		return;
	}
	// End:0x43
	if(!CanUseSights())
	{
		return;
	}
	switch(ScopeHandling)
	{
		// End:0x4F
		case 0:
		// End:0x5F
		case 1:
			bScopeDesired = true;
			// End:0x79
			break;
		// End:0x76
		case 2:
			bScopeDesired = !bScopeDesired;
			// End:0x79
			break;
		// End:0xFFFF
		default:
			break;
	}
	// End:0xD0
	if(bScopeDesired)
	{
		ZeroAim(SightingTime);
		// End:0xB5
		if(!IsFiring() && !bNoTweenToScope)
		{
			SafeTweenAnim(IdleAnim, SightingTime);
		}
		// End:0xCD
		if(AimComponent.AllowADS())
		{
			PlayScopeUp();
		}		
	}
	else
	{
		ServerReaim(0.1000000);
		// End:0x115
		if(InstigatorController.IsA('PlayerController') && int(ZoomType) == int(4))
		{
			PlayerController(InstigatorController).StopZoom();
		}
	}
	//return;	
}

simulated exec function ScopeViewRelease()
{
	bScopeHeld = false;
	// End:0x15
	if(!bUseSights)
	{
		return;
	}
	switch(ScopeHandling)
	{
		// End:0x3B
		case 1:
			// End:0x30
			if(bScopeView)
			{
				StopScopeView();
			}
			bScopeDesired = false;
			// End:0x53
			break;
		// End:0x48
		case 0:
			bScopeDesired = false;
		// End:0x50
		case 2:
			// End:0x53
			break;
		// End:0xFFFF
		default:
			break;
	}
	// End:0x69
	if(!bScopeView)
	{
		ServerReaim(0.1000000);
	}
	// End:0xA3
	if(InstigatorController.IsA('PlayerController') && int(ZoomType) == int(4))
	{
		PlayerController(InstigatorController).StopZoom();
	}
	//return;	
}

final simulated function bool CanContinueScope()
{
	// End:0x14
	if(AimComponent.IsDisplaced())
	{
		return false;
	}
	// End:0x38
	if((int(ReloadState) != int(0)) && int(ReloadState) != int(8))
	{
		return false;
	}
	// End:0x74
	if((int(Instigator.Controller.bRun) == 0) && int(Instigator.Physics) == int(1))
	{
		return false;
	}
	// End:0x95
	if((SprintControl != none) && SprintControl.bSprinting)
	{
		return false;
	}
	// End:0xC4
	if(Class'BCoreProV55.BallisticReplicationInfo'.static.IsRealism() && int(Instigator.Physics) == int(2))
	{
		return false;
	}
	return true;
	//return;	
}

simulated function bool CheckScope()
{
	// End:0x1A
	if(Level.TimeSeconds < NextCheckScopeTime)
	{
		return true;
	}
	NextCheckScopeTime = Level.TimeSeconds + 0.2500000;
	// End:0x48
	if(!CanContinueScope())
	{
		StopScopeView();
		return false;
	}
	return true;
	//return;	
}

final simulated function StartScopeView()
{
	// End:0x16
	if(int(ZoomType) != int(0))
	{
		StartScopeZoom();
	}
	SetScopeView(true);
	ScopeModifyCrosshair();
	// End:0x34
	if(bPendingSightUp)
	{
		bPendingSightUp = false;
	}
	// End:0x45
	if(!bNeedCock)
	{
		PlayIdle();
	}
	//return;	
}

final function ServerSetScopeView(bool bNewValue)
{
	SetScopeView(bNewValue);
	//return;	
}

final simulated function SetScopeView(bool bNewValue)
{
	// End:0x13
	if(bScopeView == bNewValue)
	{
		return;
	}
	// End:0x38
	if(int(Level.NetMode) == int(NM_Client))
	{
		ServerSetScopeView(bNewValue);
	}
	// End:0x6F
	if((int(Role) == int(ROLE_Authority)) && ThirdPersonActor != none)
	{
		BallisticAttachment(ThirdPersonActor).SetAimed(bNewValue);
	}
	bScopeView = bNewValue;
	// End:0xA6
	if(int(Role) == int(ROLE_Authority))
	{
		// End:0xA6
		if(!Instigator.IsLocallyControlled())
		{
			BindScopeViewFactors();
		}
	}
	OnScopeViewChanged();
	//return;	
}

final simulated function StopScopeView(optional bool bNoAnim)
{
	SetScopeView(false);
	// End:0x97
	if(int(ZoomType) != int(0))
	{
		// End:0x57
		if((bFireMode[0] != none) && bFireMode[0].MuzzleFlash != none)
		{
			AttachToBone(bFireMode[0].MuzzleFlash, 'tip');
		}
		// End:0x97
		if((bFireMode[1] != none) && bFireMode[1].MuzzleFlash != none)
		{
			AttachToBone(bFireMode[1].MuzzleFlash, 'tip');
		}
	}
	PlayScopeDown(bNoAnim);
	bScopeDesired = false;
	// End:0xC1
	if(int(ZoomType) != int(0))
	{
		EndScopeZoom();
	}
	ScopeRestoreCrosshair();
	//return;	
}

simulated function PlayScopeDown(optional bool bNoAnim)
{
	// End:0x2B
	if(!bNoAnim && HasAnim(ZoomOutAnim))
	{
		SafePlayAnim(ZoomOutAnim, ZoomTimeMod);		
	}
	else
	{
		// End:0x55
		if((int(SightingState) == int(3)) || int(SightingState) == int(2))
		{
			SightingState = 1;
		}
	}
	BlendFire();
	InstigatorController.bRun = 0;
	//return;	
}

simulated function PlayScopeUp()
{
	// End:0x1E
	if(HasAnim(ZoomInAnim))
	{
		SafePlayAnim(ZoomInAnim, ZoomTimeMod);		
	}
	else
	{
		SightingState = 2;
	}
	// End:0x4C
	if(int(ZoomType) == int(0))
	{
		PlayerController(InstigatorController).bZooming = true;
	}
	InstigatorController.bRun = 1;
	//return;	
}

simulated function ScopeUpAnimEnd()
{
	// End:0x34
	if(!bUseSights || (SprintControl != none) && SprintControl.bSprinting)
	{
		PlayScopeDown();
		return;
	}
	// End:0x4E
	if(bPendingSightUp)
	{
		StartScopeView();
		bPendingSightUp = false;		
	}
	else
	{
		// End:0x68
		if(bScopeDesired)
		{
			StartScopeView();
			bScopeDesired = false;			
		}
		else
		{
			PlayScopeDown();
		}
	}
	//return;	
}

simulated function ScopeDownAnimEnd()
{
	local int Channel;
	local name Anim;
	local float frame, Rate;

	GetAnimParams(Channel, Anim, frame, Rate);
	// End:0x3C
	if(!bPendingSightUp && frame == 0.0000000)
	{
		PlayIdle();
	}
	PlayerController(InstigatorController).bZooming = false;
	//return;	
}

simulated function OnScopeViewChanged()
{
	// End:0x21
	if(bScopeView)
	{
		AimComponent.ApplyADSModifiers();
		ApplyADSAimModifiers();		
	}
	else
	{
		AimComponent.Recalculate();
	}
	//return;	
}

simulated function OnAimParamsChanged()
{
	// End:0x1E
	if(bScopeView)
	{
		AimComponent.ApplyADSModifiers();
		ApplyADSAimModifiers();
	}
	// End:0x7A
	if(Class'BCoreProV55.BallisticReplicationInfo'.default.AccuracyScale != float(1))
	{
		AimComponent.AimSpread.Min *= Class'BCoreProV55.BallisticReplicationInfo'.default.AccuracyScale;
		AimComponent.AimSpread.Max *= Class'BCoreProV55.BallisticReplicationInfo'.default.AccuracyScale;
	}
	//return;	
}

final simulated function BindScopeViewFactors()
{
	// End:0x2A
	if(bScopeView)
	{
		AimComponent.OnADSViewStart();
		RcComponent.OnADSViewStart();		
	}
	else
	{
		AimComponent.OnADSViewEnd();
		RcComponent.OnADSViewEnd();
	}
	//return;	
}

simulated function ApplyADSAimModifiers()
{
	AimComponent.ChaosDeclineTime *= 2.0000000;
	AimComponent.ChaosSpeedThreshold *= 0.7000000;
	//return;	
}

simulated function StartScopeZoom()
{
	local PlayerController PC;

	PC = PlayerController(InstigatorController);
	// End:0x35
	if(ZoomInSound.Sound != none)
	{
		Class'BCoreProV55.BUtil'.static.PlayFullSound(self, ZoomInSound);
	}
	// End:0x42
	if(!CanUseSights())
	{
		return;
	}
	PlayerZoom(PC);
	//return;	
}

final simulated function PlayerZoom(PlayerController PC)
{
	switch(ZoomType)
	{
		// End:0x30
		case 4:
			PC.StartZoomWithMax((90.0000000 - FullZoomFOV) / float(88));
			// End:0x206
			break;
		// End:0xB2
		case 3:
			PC.bZooming = true;
			PC.SetFOV(FClamp(90.0000000 - ((((float(90) - FullZoomFOV) / float(88)) * MinFixedZoomLevel) * 88.0000000), 1.0000000, 170.0000000));
			PC.ZoomLevel = MinFixedZoomLevel;
			PC.DesiredZoomLevel = MinFixedZoomLevel;
			// End:0x206
			break;
		// End:0x143
		case 1:
			PC.bZooming = true;
			PC.SetFOV(Class'BCoreProV55.BUtil'.static.CalcZoomFOV(PC.DefaultFOV, MaxZoom));
			PC.ZoomLevel = (90.0000000 - PC.FovAngle) / float(88);
			PC.DesiredZoomLevel = PC.ZoomLevel;
			// End:0x206
			break;
		// End:0x203
		case 2:
			PC.bZooming = true;
			LogZoomLevel = Loge(MinZoom) / Loge(MaxZoom);
			PC.SetFOV(Class'BCoreProV55.BUtil'.static.CalcZoomFOV(PC.DefaultFOV, 2.0000000 ** ((Loge(MaxZoom) / Loge(2.0000000)) * LogZoomLevel)));
			PC.ZoomLevel = (90.0000000 - PC.FovAngle) / float(88);
			PC.DesiredZoomLevel = PC.ZoomLevel;
			// End:0x206
			break;
		// End:0xFFFF
		default:
			break;
	}
	//return;	
}

final simulated function EndScopeZoom()
{
	local PlayerController PC;

	PC = PlayerController(InstigatorController);
	// End:0x35
	if(ZoomOutSound.Sound != none)
	{
		Class'BCoreProV55.BUtil'.static.PlayFullSound(self, ZoomOutSound);
	}
	OldZoomFOV = PC.FovAngle;
	PC.SetFOV(PC.DefaultFOV);
	PC.bZooming = false;
	//return;	
}

simulated function ChangeZoom(float Value)
{
	local PlayerController PC;
	local float OldZoomLevel, NewZoomLevel;
	local int SoughtFOV;

	PC = PlayerController(InstigatorController);
	// End:0x1D
	if(PC == none)
	{
		return;
	}
	// End:0x34
	if(bInvertScope)
	{
		Value *= float(-1);
	}
	OldZoomLevel = PC.ZoomLevel;
	switch(ZoomType)
	{
		// End:0x8B
		case 4:
			NewZoomLevel = FClamp(PC.ZoomLevel + Value, 0.0500000, (90.0000000 - FullZoomFOV) / float(88));
			// End:0x19E
			break;
		// End:0xF4
		case 3:
			NewZoomLevel = FClamp(PC.ZoomLevel + (Value * (((float(90) - FullZoomFOV) / float(88)) - (((float(90) - FullZoomFOV) / float(88)) * MinFixedZoomLevel))), MinFixedZoomLevel, (90.0000000 - FullZoomFOV) / float(88));
			// End:0x19E
			break;
		// End:0x19B
		case 2:
			Value *= (float(1) - (Loge(MinZoom) / Loge(MaxZoom)));
			LogZoomLevel = FClamp(LogZoomLevel + Value, Loge(MinZoom) / Loge(MaxZoom), 1.0000000);
			SoughtFOV = int(Class'BCoreProV55.BUtil'.static.CalcZoomFOV(PC.DefaultFOV, 2.0000000 ** ((Loge(MaxZoom) / Loge(2.0000000)) * LogZoomLevel)));
			NewZoomLevel = (90.0000000 - float(SoughtFOV)) / float(88);
		// End:0xFFFF
		default:
			break;
	}
	// End:0x209
	if(NewZoomLevel > OldZoomLevel)
	{
		// End:0x1D5
		if(ZoomInSound.Sound != none)
		{
			Class'BCoreProV55.BUtil'.static.PlayFullSound(self, ZoomInSound);			
		}
		else
		{
			// End:0x209
			if(NewZoomLevel < OldZoomLevel)
			{
				// End:0x209
				if(ZoomOutSound.Sound != none)
				{
					Class'BCoreProV55.BUtil'.static.PlayFullSound(self, ZoomOutSound);
				}
			}
		}
	}
	PC.bZooming = true;
	// End:0x22B
	if(NewZoomLevel == OldZoomLevel)
	{
		return;
	}
	// End:0x265
	if(int(ZoomType) == int(2))
	{
		PC.SetFOV(float(SoughtFOV));
		PC.ZoomLevel = NewZoomLevel;
	}
	PC.DesiredZoomLevel = NewZoomLevel;
	//return;	
}

final simulated function ScopeModifyCrosshair()
{
	local PlayerController PC;

	PC = PlayerController(InstigatorController);
	// End:0x2D
	if(PC.bBehindView)
	{
		bNoCrosshairInScope = false;		
	}
	else
	{
		bNoCrosshairInScope = default.bNoCrosshairInScope;
	}
	// End:0x95
	if(bNoCrosshairInScope)
	{
		// End:0x92
		if((int(CrosshairMode) == int(2)) && PC.myHUD.bCrosshairShow)
		{
			bStandardCrosshairOff = true;
			PC.myHUD.bCrosshairShow = false;
		}		
	}
	else
	{
		// End:0xCC
		if(!PC.myHUD.bCrosshairShow)
		{
			PC.myHUD.bCrosshairShow = true;
		}
	}
	//return;	
}

final simulated function ScopeRestoreCrosshair()
{
	// End:0x43
	if(bStandardCrosshairOff)
	{
		// End:0x40
		if(int(CrosshairMode) == int(2))
		{
			bStandardCrosshairOff = false;
			PlayerController(InstigatorController).myHUD.bCrosshairShow = true;
		}		
	}
	else
	{
		// End:0x72
		if(int(CrosshairMode) != int(2))
		{
			PlayerController(InstigatorController).myHUD.bCrosshairShow = false;
		}
	}
	//return;	
}

simulated function TemporaryScopeDown(optional float NewSightingTime, optional float StartPhase)
{
	// End:0x1F
	if(!bScopeView && int(SightingState) == int(0))
	{
		return;
	}
	bScopeDesired = false;
	StopScopeView();
	// End:0x47
	if(StartPhase != 0.0000000)
	{
		SightingPhase = StartPhase;
	}
	//return;	
}

simulated function ScopeBackUp(optional float NewSightingTime, optional float StartPhase)
{
	// End:0x1A
	if(StartPhase != 0.0000000)
	{
		SightingPhase = StartPhase;
	}
	PlayScopeUp();
	//return;	
}

simulated function RenderSightFX(Canvas Canvas)
{
	local Coords C;

	// End:0xBC
	if(SightFX != none)
	{
		C = GetBoneCoords(SightFXBone);
		SightFX.SetLocation(C.Origin);
		// End:0x74
		if(RenderedHand < float(0))
		{
			SightFX.SetRotation(OrthoRotation(C.XAxis, -C.YAxis, C.ZAxis));			
		}
		else
		{
			SightFX.SetRotation(OrthoRotation(C.XAxis, C.YAxis, C.ZAxis));
		}
		Canvas.DrawActor(SightFX, false, false, DisplayFOV);
	}
	//return;	
}

simulated function DrawFPWeapon(Canvas Canvas)
{
	local int M;
	local Vector NewScale3D;
	local Rotator CenteredRotation;
	local name AnimSeq;
	local float frame, Rate;

	// End:0x0D
	if(Instigator == none)
	{
		return;
	}
	// End:0x38
	if(InstigatorController != none)
	{
		hand = float(Clamp(int(InstigatorController.Handedness), -1, 1));
	}
	// End:0x8C
	if((Canvas.SizeX != CachedCanvasX) || Canvas.SizeY != CachedCanvasY)
	{
		CalcDisplayFOVs(Canvas.SizeX, Canvas.SizeY);
	}
	M = 0;
	J0x93:

	// End:0xD4 [Loop If]
	if(M < 2)
	{
		// End:0xCA
		if(FireMode[M] != none)
		{
			FireMode[M].DrawMuzzleFlash(Canvas);
		}
		M++;
		// [Loop Continue]
		goto J0x93;
	}
	// End:0x14A
	if((OldMesh != none) && bUseOldWeaponMesh != (OldMesh == Mesh))
	{
		GetAnimParams(0, AnimSeq, frame, Rate);
		bInitOldMesh = true;
		// End:0x12D
		if(bUseOldWeaponMesh)
		{
			LinkMesh(OldMesh);			
		}
		else
		{
			LinkMesh(default.Mesh);
		}
		PlayAnim(AnimSeq, Rate, 0.0000000);
	}
	// End:0x363
	if((hand != RenderedHand) || bInitOldMesh)
	{
		NewScale3D = default.DrawScale3D;
		// End:0x18D
		if(hand != float(0))
		{
			NewScale3D.Y *= hand;
		}
		SetDrawScale3D(NewScale3D);
		SetDrawScale(default.DrawScale);
		CenteredRoll = default.CenteredRoll;
		CenteredYaw = default.CenteredYaw;
		CenteredOffsetY = default.CenteredOffsetY;
		PlayerViewPivot = default.PlayerViewPivot;
		SmallViewOffset = default.SmallViewOffset;
		// End:0x1FC
		if(SmallViewOffset == vect(0.0000000, 0.0000000, 0.0000000))
		{
			SmallViewOffset = default.PlayerViewOffset;
		}
		bInitOldMesh = false;
		// End:0x237
		if(default.SmallEffectOffset == vect(0.0000000, 0.0000000, 0.0000000))
		{
			SmallEffectOffset = (EffectOffset + default.PlayerViewOffset) - SmallViewOffset;			
		}
		else
		{
			SmallEffectOffset = default.SmallEffectOffset;
		}
		// End:0x2DE
		if(Mesh == OldMesh)
		{
			SmallEffectOffset = (EffectOffset + OldPlayerViewOffset) - OldSmallViewOffset;
			PlayerViewPivot = OldPlayerViewPivot;
			SmallViewOffset = OldSmallViewOffset;
			// End:0x2AF
			if(hand != float(0))
			{
				PlayerViewPivot.Roll *= hand;
				PlayerViewPivot.Yaw *= hand;
			}
			CenteredRoll = OldCenteredRoll;
			CenteredYaw = OldCenteredYaw;
			CenteredOffsetY = OldCenteredOffsetY;
			SetDrawScale(OldDrawScale);			
		}
		else
		{
			// End:0x318
			if(hand == float(0))
			{
				PlayerViewPivot.Roll = default.PlayerViewPivot.Roll;
				PlayerViewPivot.Yaw = default.PlayerViewPivot.Yaw;				
			}
			else
			{
				PlayerViewPivot.Roll = int(float(default.PlayerViewPivot.Roll) * hand);
				PlayerViewPivot.Yaw = int(float(default.PlayerViewPivot.Yaw) * hand);
			}
		}
		RenderedHand = hand;
	}
	// End:0x3A7
	if((WeaponParams != none) && WeaponParams.ViewOffset != vect(0.0000000, 0.0000000, 0.0000000))
	{
		PlayerViewOffset = WeaponParams.ViewOffset;		
	}
	else
	{
		// End:0x3C7
		if(Class'Engine.PlayerController'.default.bSmallWeapons)
		{
			PlayerViewOffset = SmallViewOffset;			
		}
		else
		{
			// End:0x3E4
			if(Mesh == OldMesh)
			{
				PlayerViewOffset = OldPlayerViewOffset;				
			}
			else
			{
				PlayerViewOffset = default.PlayerViewOffset;
			}
		}
	}
	// End:0x40F
	if(hand == float(0))
	{
		PlayerViewOffset.Y = CenteredOffsetY;		
	}
	else
	{
		PlayerViewOffset.Y *= hand;
	}
	SetLocation(Instigator.Location + Instigator.CalcDrawOffset(self));
	// End:0x491
	if(hand == float(0))
	{
		CenteredRotation = Instigator.GetViewRotation();
		CenteredRotation.Yaw += CenteredYaw;
		CenteredRotation.Roll = CenteredRoll;
		SetRotation(CenteredRotation);		
	}
	else
	{
		SetRotation(Instigator.GetViewRotation());
	}
	PreDrawFPWeapon();
	bDrawingFirstPerson = true;
	Canvas.DrawActor(self, false, false, DisplayFOV);
	bDrawingFirstPerson = false;
	// End:0x4EA
	if(hand == float(0))
	{
		PlayerViewOffset.Y = 0.0000000;
	}
	// End:0x500
	if(SightFX != none)
	{
		RenderSightFX(Canvas);
	}
	//return;	
}

simulated event RenderOverlays(Canvas C)
{
	// End:0x23
	if((Instigator == none) || Instigator.Controller == none)
	{
		return;
	}
	// End:0x42
	if(SprintControl != none)
	{
		SprintControl.RenderOverlays(C);
	}
	// End:0x6D
	if(!bScopeView || int(ZoomType) == int(0))
	{
		DrawFPWeapon(C);		
	}
	else
	{
		SetLocation(Instigator.Location + Instigator.CalcDrawOffset(self));
		SetRotation(Instigator.GetViewRotation());
		DrawScopeMuzzleFlash(C);
		DrawScopeOverlays(C);
	}
	//return;	
}

simulated function DrawScopeMuzzleFlash(Canvas C)
{
	local Vector X, Y, Z;

	GetViewAxes(X, Y, Z);
	// End:0xD0
	if(bFireMode[0].MuzzleFlash != none)
	{
		bFireMode[0].MuzzleFlash.SetLocation(((Instigator.Location + Instigator.EyePosition()) + (X * SMuzzleFlashOffset.X)) + (Z * SMuzzleFlashOffset.Z));
		bFireMode[0].MuzzleFlash.SetRotation(Instigator.GetViewRotation());
		C.DrawActor(bFireMode[0].MuzzleFlash, false, false, DisplayFOV);
	}
	// End:0x18B
	if(bFireMode[1].MuzzleFlash != none)
	{
		bFireMode[1].MuzzleFlash.SetLocation(((Instigator.Location + Instigator.EyePosition()) + (X * SMuzzleFlashOffset.X)) + (Z * SMuzzleFlashOffset.Z));
		bFireMode[1].MuzzleFlash.SetRotation(Instigator.GetViewRotation());
		C.DrawActor(bFireMode[1].MuzzleFlash, false, false, DisplayFOV);
	}
	//return;	
}

simulated function PreDrawScope(Canvas C, int OffsetX, int OffsetY, int SizeX, int SizeY)
{
	//return;	
}

simulated function DrawScopeOverlays(Canvas C)
{
	local int ScopeSizeX, ScopeSizeY, ScopeOffsetX, ScopeOffsetY;

	// End:0x0D
	if(ScopeViewTex == none)
	{
		return;
	}
	C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
	C.Style = 5;
	C.ColorModulate.W = 1.0000000;
	ScopeSizeY = int(float(C.SizeY) * ScopeScale);
	ScopeSizeX = int(float(ScopeSizeY) * ScopeXScale);
	ScopeOffsetX = (C.SizeX - ScopeSizeX) / 2;
	ScopeOffsetY = (C.SizeY - ScopeSizeY) / 2;
	C.SetPos(float(ScopeOffsetX), float(ScopeOffsetY));
	PreDrawScope(C, ScopeOffsetX, ScopeOffsetY, ScopeSizeX, ScopeSizeY);
	// End:0x1E7
	if(ScopeOffsetY > 0)
	{
		C.SetPos(C.OrgX, C.OrgY);
		C.DrawTile(ScopeViewTex, float(C.SizeX), float(ScopeOffsetY), 8.0000000, 8.0000000, 1.0000000, 1.0000000);
		C.SetPos(C.OrgX, float(C.SizeY - ScopeOffsetY));
		C.DrawTile(ScopeViewTex, float(C.SizeX), float(ScopeOffsetY), 8.0000000, 8.0000000, 1.0000000, 1.0000000);
	}
	C.SetPos(C.OrgX, float(ScopeOffsetY));
	C.DrawTile(ScopeViewTex, float(ScopeOffsetX), float(ScopeSizeY), 8.0000000, 8.0000000, 1.0000000, 1.0000000);
	C.SetPos(float((C.SizeX - ScopeOffsetX) - 4), float(ScopeOffsetY));
	C.DrawTile(ScopeViewTex, float(ScopeOffsetX + 4), float(ScopeSizeY), 8.0000000, 8.0000000, 1.0000000, 1.0000000);
	C.SetPos(float(ScopeOffsetX), float(ScopeOffsetY));
	C.DrawTile(ScopeViewTex, float(ScopeSizeX), float(ScopeSizeY), 0.0000000, 0.0000000, 1024.0000000, 1024.0000000);
	//return;	
}

simulated function PreDrawFPWeapon()
{
	// End:0x16
	if(int(SightingState) != int(0))
	{
		PositionSights();
	}
	AimComponent.OnPreDrawFPWeapon();
	//return;	
}

simulated function PositionSights()
{
	local Vector SightPos, offset, NewLoc, OldLoc;
	local PlayerController PC;

	PC = PlayerController(InstigatorController);
	// End:0x1D
	if(PC == none)
	{
		return;
	}
	// End:0x49
	if(SightBone != 'None')
	{
		SightPos = GetBoneCoords(SightBone).Origin - Location;
	}
	OldLoc = Instigator.Location + Instigator.CalcDrawOffset(self);
	offset = SightOffset;
	offset.X += (float(Normalize(Instigator.GetViewRotation()).Pitch) / float(8192));
	NewLoc = (PC.CalcViewLocation - (Instigator.WalkBob * (float(1) - (SightingPhase * (float(1) - SightBobScale))))) - (SightPos + ViewAlignedOffset(offset));
	// End:0x1A9
	if(SightingPhase >= 1.0000000)
	{
		SetLocation(NewLoc);
		SetRotation(Instigator.GetViewRotation() + SightPivot);
		DisplayFOV = SightDisplayFOV;
		// End:0x165
		if(int(SightingState) == int(2))
		{
			AimComponent.OnADSViewStart();
			RcComponent.OnADSViewStart();
		}
		// End:0x1A6
		if(int(ZoomType) == int(0))
		{
			PC.DesiredFOV = Class'BCoreProV55.BUtil'.static.CalcZoomFOV(PC.DefaultFOV, SightZoomFactor);
		}		
	}
	else
	{
		// End:0x290
		if(SightingPhase <= 0.0000000)
		{
			SetLocation(OldLoc);
			SetRotation(Instigator.GetViewRotation());
			DisplayFOV = float(BaseDisplayFOV);
			PlayerController(InstigatorController).bZooming = false;
			// End:0x223
			if(int(SightingState) == int(1))
			{
				AimComponent.OnADSViewEnd();
				RcComponent.OnADSViewEnd();
			}
			// End:0x28D
			if(int(ZoomType) == int(0))
			{
				PC.DesiredFOV = PC.DefaultFOV;
				PlayerController(InstigatorController).SetFOV(PlayerController(InstigatorController).DefaultFOV);
				PlayerController(InstigatorController).bZooming = false;
			}			
		}
		else
		{
			SetLocation(Class'BCoreProV55.BUtil'.static.VSmerp(SightingPhase, OldLoc, NewLoc));
			SetRotation(Instigator.GetViewRotation() + (SightPivot * SightingPhase));
			DisplayFOV = Smerp(SightingPhase, float(BaseDisplayFOV), SightDisplayFOV);
			AimComponent.UpdateADSTransition(SightingPhase);
			RcComponent.UpdateADSTransition(SightingPhase);
			// End:0x361
			if(int(ZoomType) == int(0))
			{
				PC.DesiredFOV = Class'BCoreProV55.BUtil'.static.CalcZoomFOV(PC.DefaultFOV, Lerp(SightingPhase, 1.0000000, SightZoomFactor));
			}
		}
	}
	//return;	
}

simulated function TickSighting(float dt)
{
	// End:0x0F
	if(bScopeView)
	{
		CheckScope();
	}
	// End:0x3B
	if(!Instigator.IsFirstPerson() && int(SightingState) != int(0))
	{
		PositionSights();
	}
	switch(SightingState)
	{
		// End:0x47
		case 0:
		// End:0x4E
		case 3:
			return;
		// End:0xCF
		case 2:
			// End:0xB3
			if(SightingPhase < 1.0000000)
			{
				// End:0x97
				if((bScopeDesired || bPendingSightUp) && CanUseSights())
				{
					SightingPhase += (dt / SightingTime);					
				}
				else
				{
					SightingState = 1;
					InstigatorController.bRun = 0;
				}				
			}
			else
			{
				SightingPhase = 1.0000000;
				SightingState = 3;
				ScopeUpAnimEnd();
			}
			// End:0x144
			break;
		// End:0x141
		case 1:
			// End:0x118
			if(SightingPhase > 0.0000000)
			{
				// End:0x102
				if(bScopeDesired && CanUseSights())
				{
					SightingState = 2;					
				}
				else
				{
					SightingPhase -= (dt / SightingTime);
				}				
			}
			else
			{
				SightingPhase = 0.0000000;
				SightingState = 0;
				ScopeDownAnimEnd();
				DisplayFOV = float(BaseDisplayFOV);
			}
			// End:0x144
			break;
		// End:0xFFFF
		default:
			break;
	}
	//return;	
}

final simulated function ClientScopeDown()
{
	// End:0x1B
	if(int(Level.NetMode) != int(NM_Client))
	{
		return;
	}
	StopScopeView();
	//return;	
}

simulated function bool WeaponCentered()
{
	return (bSpectated || bScopeView) || hand > float(1);
	//return;	
}

simulated function SetHand(float InHand)
{
	super.SetHand(InHand);
	// End:0x8C
	if(hand < float(0))
	{
		SightOffset.Y = WeaponParams.SightOffset.Y * float(-1);
		SightPivot.Roll = WeaponParams.SightPivot.Roll * -1;
		SightPivot.Yaw = WeaponParams.SightPivot.Yaw * -1;		
	}
	else
	{
		SightOffset.Y = WeaponParams.SightOffset.Y;
		SightPivot.Roll = WeaponParams.SightPivot.Roll;
		SightPivot.Yaw = WeaponParams.SightPivot.Yaw;
	}
	//return;	
}

simulated exec function WeaponSpecial(optional byte i)
{
	WeaponSpecialImpl(i);
	//return;	
}

simulated function WeaponSpecialImpl(byte i)
{
	// End:0x1F
	if(!Instigator.bNoWeaponFiring)
	{
		ServerWeaponSpecial(i);
	}
	//return;	
}

function ServerWeaponSpecial(optional byte i)
{
	//return;	
}

simulated function ClientWeaponSpecial(optional byte i)
{
	//return;	
}

simulated function CommonWeaponSpecial(optional byte i)
{
	//return;	
}

simulated exec function WeaponSpecialRelease(optional byte i)
{
	// End:0x1F
	if(!Instigator.bNoWeaponFiring)
	{
		ServerWeaponSpecialRelease(i);
	}
	//return;	
}

function ServerWeaponSpecialRelease(optional byte i)
{
	//return;	
}

simulated function ClientWeaponSpecialRelease(optional byte i)
{
	//return;	
}

simulated function CommonWeaponSpecialRelease(optional byte i)
{
	//return;	
}

simulated exec function CockGun(optional byte Type)
{
	// End:0x3A
	if(((bNonCocking || int(ReloadState) != int(0)) || int(ClientState) == int(2)) || bPreventReload)
	{
		return;
	}
	ServerCockGun(Type);
	//return;	
}

simulated function ClientCockGun(optional byte Type)
{
	CommonCockGun(Type);
	//return;	
}

function ServerCockGun(optional byte Type)
{
	// End:0x28
	if((bNonCocking || int(ReloadState) != int(0)) || bPreventReload)
	{
		return;
	}
	bServerReloading = true;
	ClientCockGun(Type);
	CommonCockGun(Type);
	//return;	
}

simulated function CommonCockGun(optional byte Type)
{
	local int M;

	// End:0x28
	if((bNonCocking || int(ReloadState) == int(8)) || bPreventReload)
	{
		return;
	}
	// End:0x83
	if(int(Role) == int(ROLE_Authority))
	{
		bServerReloading = true;
		// End:0x83
		if((BallisticAttachment(ThirdPersonActor) != none) && BallisticAttachment(ThirdPersonActor).CockingAnim != 'None')
		{
			Instigator.SetAnimAction('CockGun');
		}
	}
	ReloadState = 8;
	PlayCocking(Type);
	M = 0;
	J0x9D:

	// End:0xDE [Loop If]
	if(M < 2)
	{
		// End:0xD4
		if(bFireMode[M] != none)
		{
			bFireMode[M].CockingGun(Type);
		}
		M++;
		// [Loop Continue]
		goto J0x9D;
	}
	//return;	
}

final simulated function SetMeleeGunLength()
{
	AimComponent.GunLength = 1.0000000;
	//return;	
}

final simulated function SetDefaultGunLength()
{
	AimComponent.GunLength = default.GunLength;
	//return;	
}

simulated exec function MeleeHold()
{
	MeleeHoldImpl();
	//return;	
}

simulated function MeleeHoldImpl()
{
	// End:0x55
	if(((MeleeFireMode == none) || (int(ClientState) != int(4)) && int(ClientState) != int(2)) || (int(MeleeState) != int(0)) && int(MeleeState) != int(3))
	{
		return;
	}
	// End:0x70
	if(int(MeleeState) == int(3))
	{
		MeleeState = 4;		
	}
	else
	{
		// End:0x96
		if((IsFiring()) || int(ClientState) == int(2))
		{
			MeleeState = 1;			
		}
		else
		{
			MeleeState = 2;
			ReloadState = 0;
			MeleeFireMode.PlayPreFire();
			SetMeleeGunLength();
			// End:0xE1
			if((SprintControl != none) && SprintControl.bSprinting)
			{
				PlayerSprint(false);
			}
			ServerMeleeHold();
		}
	}
	//return;	
}

function AddSpeedModification(float Value)
{
	// End:0x35
	if(((Value > float(1)) && SprintControl != none) && SprintControl.bSprinting)
	{
		PlayerSprint(false);
	}
	PlayerSpeedFactor = FMin(PlayerSpeedFactor * Value, Value);
	UpdateSpeed();
	//return;	
}

function RemoveSpeedModification(float Value)
{
	// End:0x35
	if(((Value > float(1)) && SprintControl != none) && SprintControl.bSprinting)
	{
		PlayerSprint(true);
	}
	PlayerSpeedFactor = default.PlayerSpeedFactor;
	UpdateSpeed();
	//return;	
}

function UpdateSpeed()
{
	local float NewSpeed;

	// End:0x1C
	if(SprintControl != none)
	{
		SprintControl.UpdateSpeed();
		return;
	}
	NewSpeed = Class'BCoreProV55.BallisticReplicationInfo'.default.PlayerGroundSpeed * PlayerSpeedFactor;
	// End:0x61
	if(ComboSpeed(xPawn(Instigator).CurrentCombo) != none)
	{
		NewSpeed *= 1.4000000;
	}
	// End:0x8D
	if(Instigator.GroundSpeed != NewSpeed)
	{
		Instigator.GroundSpeed = NewSpeed;
	}
	//return;	
}

function ServerMeleeHold()
{
	MeleeState = 2;
	ReloadState = 0;
	bServerReloading = true;
	MeleeFireMode.HoldStartTime = Level.TimeSeconds;
	MeleeFireMode.PlayPreFire();
	SetMeleeGunLength();
	bPreventReload = true;
	//return;	
}

simulated exec function MeleeRelease()
{
	MeleeReleaseImpl();
	//return;	
}

simulated function MeleeReleaseImpl()
{
	// End:0x31
	if(((MeleeFireMode == none) || int(ClientState) != int(4)) || int(MeleeState) == int(0))
	{
		return;
	}
	switch(MeleeState)
	{
		// End:0x48
		case 1:
			MeleeState = 0;
			// End:0xBC
			break;
		// End:0x58
		case 4:
			MeleeState = 3;
			// End:0xBC
			break;
		// End:0xB9
		case 2:
			// End:0xAA
			if(int(Role) < int(ROLE_Authority))
			{
				MeleeState = 3;
				MeleeFireMode.PlayFiring();
				// End:0xAA
				if((SprintControl != none) && SprintControl.bSprinting)
				{
					PlayerSprint(true);
				}
			}
			ServerMeleeRelease();
			SetDefaultGunLength();
			// End:0xBC
			break;
		// End:0xFFFF
		default:
			break;
	}
	//return;	
}

final function ServerMeleeRelease()
{
	MeleeState = 3;
	// End:0x2C
	if(Instigator.IsLocallyControlled())
	{
		MeleeFireMode.PlayFiring();		
	}
	else
	{
		MeleeFireMode.ServerPlayFiring();
	}
	MeleeFireMode.DoFireEffect();
	SetDefaultGunLength();
	//return;	
}

final function ApplyAttackFatigue()
{
	local float Penalty;

	// End:0x61
	if((BallisticMeleeFire(FireMode[1]) != none) && FireMode[1].IsFiring() || BallisticMeleeFire(FireMode[0]) == none)
	{
		Penalty = BallisticMeleeFire(bFireMode[1]).FatiguePerStrike * 2.5000000;		
	}
	else
	{
		Penalty = BallisticMeleeFire(bFireMode[0]).FatiguePerStrike * 2.5000000;
	}
	ApplyBlockFatigue(Penalty);
	//return;	
}

final function ApplyBlockFatigue(float Value)
{
	MeleeFatigue = FMin(1.0000000, MeleeFatigue + Value);
	ClientApplyBlockFatigue(Value);
	//return;	
}

final simulated function ClientApplyBlockFatigue(float Value)
{
	MeleeFatigue = FMin(1.0000000, MeleeFatigue + Value);
	//return;	
}

final simulated function bool IsHoldingMelee()
{
	// End:0x2A
	if((BallisticMeleeFire(bFireMode[1]) != none) && bFireMode[1].IsFiring())
	{
		return true;
	}
	// End:0x3C
	if(int(MeleeState) > int(1))
	{
		return true;
	}
	return false;
	//return;	
}

final simulated function bool SprintActive()
{
	return (Class'BCoreProV55.BallisticReplicationInfo'.default.bWeaponJumpOffsetting && SprintControl != none) && SprintControl.bSprinting;
	//return;	
}

simulated exec function Reload(optional byte i)
{
	// End:0x2D
	if((int(ClientState) == int(4)) && int(ReloadState) == int(0))
	{
		ServerStartReload(i);
	}
	//return;	
}

function ServerStartReload(optional byte i)
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
	// End:0x6A
	if(MagAmmo >= (WeaponParams.MagAmmo + ((int(!bNeedCock) * int(bMagPlusOne)) * int(!bNonCocking))))
	{
		// End:0x68
		if(bNeedCock)
		{
			ServerCockGun(0);
		}
		return;
	}
	// End:0x82
	if(Ammo[0].AmmoAmount < 1)
	{
		return;
	}
	M = 0;
	J0x89:

	// End:0xD5 [Loop If]
	if(M < 2)
	{
		// End:0xCB
		if((FireMode[M] != none) && FireMode[M].bIsFiring)
		{
			StopFire(M);
		}
		M++;
		// [Loop Continue]
		goto J0x89;
	}
	bServerReloading = true;
	// End:0x120
	if((BallisticAttachment(ThirdPersonActor) != none) && BallisticAttachment(ThirdPersonActor).ReloadAnim != 'None')
	{
		Instigator.SetAnimAction('ReloadGun');
	}
	CommonStartReload(i);
	ClientStartReload(i);
	//return;	
}

simulated function ClientStartReload(optional byte i)
{
	// End:0x24
	if(int(Level.NetMode) == int(NM_Client))
	{
		CommonStartReload(i);
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
	// End:0x2C
	if(bShovelLoad)
	{
		ReloadState = 4;		
	}
	else
	{
		ReloadState = 1;
	}
	PlayReload();
	// End:0x62
	if(bScopeView && Instigator.IsLocallyControlled())
	{
		TemporaryScopeDown(default.SightingTime);
	}
	M = 0;
	J0x69:

	// End:0xAA [Loop If]
	if(M < 2)
	{
		// End:0xA0
		if(bFireMode[M] != none)
		{
			bFireMode[M].ReloadingGun(i);
		}
		M++;
		// [Loop Continue]
		goto J0x69;
	}
	// End:0xBB
	if(bCockAfterReload)
	{
		bNeedCock = true;
	}
	// End:0xD9
	if(bCockOnEmpty && MagAmmo < 1)
	{
		bNeedCock = true;
	}
	bNeedReload = false;
	//return;	
}

simulated exec function ReloadRelease(optional byte i)
{
	//return;	
}

function ServerReloadRelease(optional byte i)
{
	//return;	
}

simulated function ClientReloadRelease(optional byte i)
{
	//return;	
}

simulated function CommonReloadRelease(optional byte i)
{
	//return;	
}

simulated exec function SwitchWeaponMode(optional byte modeNum)
{
	// End:0x1A
	if(int(modeNum) == 0)
	{
		ServerSwitchWeaponMode(byte(255));		
	}
	else
	{
		ServerSwitchWeaponMode(byte(int(modeNum) - 1));
	}
	//return;	
}

function ServerSwitchWeaponMode(byte newmode)
{
	// End:0x20
	if(int(newmode) == 255)
	{
		newmode = byte(int(CurrentWeaponMode) + 1);
	}
	J0x20:

	// End:0x86 [Loop If]
	if((int(newmode) != int(CurrentWeaponMode)) && (int(newmode) >= WeaponModes.Length) || WeaponModes[int(newmode)].bUnavailable)
	{
		// End:0x7C
		if(int(newmode) >= WeaponModes.Length)
		{
			newmode = 0;			
		}
		else
		{
			newmode++;
		}
		// [Loop Continue]
		goto J0x20;
	}
	// End:0xCD
	if(!WeaponModes[int(newmode)].bUnavailable)
	{
		CommonSwitchWeaponMode(newmode);
		ClientSwitchWeaponMode(CurrentWeaponMode);
		NetUpdateTime = Level.TimeSeconds - float(1);
	}
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
	bFireMode[0].SwitchWeaponMode(CurrentWeaponMode);
	bFireMode[1].SwitchWeaponMode(CurrentWeaponMode);
	// End:0xA8
	if(WeaponModes[LastMode].RecoilParamsIndex != WeaponModes[int(CurrentWeaponMode)].RecoilParamsIndex)
	{
		ParamsClasses[int(GameStyleIndex)].static.SetRecoilParams(self);
	}
	// End:0xE7
	if(WeaponModes[LastMode].AimParamsIndex != WeaponModes[int(CurrentWeaponMode)].AimParamsIndex)
	{
		ParamsClasses[int(GameStyleIndex)].static.SetAimParams(self);
	}
	CheckBurstMode();
	// End:0x11C
	if((int(ModeHandling) == int(1)) && Instigator.IsLocallyControlled())
	{
		default.LastWeaponMode = CurrentWeaponMode;
	}
	//return;	
}

simulated function ClientSwitchWeaponMode(byte newmode)
{
	// End:0x1B
	if(int(Level.NetMode) != int(NM_Client))
	{
		return;
	}
	CommonSwitchWeaponMode(newmode);
	//return;	
}

simulated function CheckBurstMode()
{
	// End:0x82
	if((WeaponModes[int(CurrentWeaponMode)].ModeID ~= "WM_Burst") || WeaponModes[int(CurrentWeaponMode)].ModeID ~= "WM_BigBurst")
	{
		bFireMode[0].bBurstMode = true;
		bFireMode[0].MaxBurst = int(WeaponModes[int(CurrentWeaponMode)].Value);		
	}
	else
	{
		// End:0xA9
		if(bFireMode[0].bBurstMode)
		{
			bFireMode[0].bBurstMode = false;
		}
	}
	//return;	
}

simulated function bool CheckWeaponMode(int Mode)
{
	// End:0x6B
	if(((WeaponModes[int(CurrentWeaponMode)].ModeID ~= "WM_FullAuto") || WeaponModes[int(CurrentWeaponMode)].ModeID ~= "WM_None") || WeaponModes[int(CurrentWeaponMode)].ModeID ~= "WM_Burst")
	{
		return true;
	}
	// End:0x8B
	if(float(FireCount) >= WeaponModes[int(CurrentWeaponMode)].Value)
	{
		return false;
	}
	return true;
	//return;	
}

simulated function DoQuickDraw()
{
	//return;	
}

simulated function BallisticWeapon FindQuickDraw(BallisticWeapon CurrentChoice, float ChoiceRank)
{
	local Inventory Inv;
	local BallisticWeapon Best;

	Inv = Inventory;
	J0x0B:

	// End:0x64 [Loop If]
	if(Inv != none)
	{
		// End:0x4D
		if(BallisticWeapon(Inv) != none)
		{
			Best = BallisticWeapon(Inv).FindQuickDraw(CurrentChoice, ChoiceRank);
			// [Explicit Break]
			goto J0x64;
		}
		Inv = Inv.Inventory;
		// [Loop Continue]
		goto J0x0B;
	}
	J0x64:

	// End:0x78
	if(Best == none)
	{
		return CurrentChoice;		
	}
	else
	{
		return Best;
	}
	//return;	
}

simulated exec function DualSelect(optional Class<Weapon> NewWeaponClass)
{
	local BallisticWeapon Best;
	local Inventory Inv;

	Inv = Instigator.Inventory;
	J0x14:

	// End:0x69 [Loop If]
	if(Inv != none)
	{
		// End:0x52
		if(BallisticWeapon(Inv) != none)
		{
			Best = BallisticWeapon(Inv).FindQuickDraw(none, 0.0000000);
			// [Explicit Break]
			goto J0x69;
		}
		Inv = Inv.Inventory;
		// [Loop Continue]
		goto J0x14;
	}
	J0x69:

	// End:0x83
	if(Best != none)
	{
		Best.DoQuickDraw();
	}
	//return;	
}

simulated exec function Reloaded()
{
	ServerReloaded(-1);
	//return;	
}

simulated exec function GiveWeapons(int Group)
{
	ServerReloaded(Group);
	//return;	
}

final function ServerReloaded(optional int Group)
{
	local Class<Weapon> Weap;
	local Inventory Inv;
	local int i;
	local array<WeaponRecord> Recs;

	// End:0x59
	if((((int(Level.NetMode) != int(NM_Standalone)) && !Instigator.PlayerReplicationInfo.bAdmin) || Instigator == none) || Vehicle(Instigator) != none)
	{
		return;
	}
	Class'Engine.CacheManager'.static.GetWeaponList(Recs);
	i = 0;
	J0x71:

	// End:0x15B [Loop If]
	if(i < Recs.Length)
	{
		// End:0xEF
		if(!Class'BCoreProV55.BC_WeaponInfoCache'.static.AutoWeaponInfo(Recs[i].ClassName).bIsBW || (Group != -1) && Class'BCoreProV55.BC_WeaponInfoCache'.static.AutoWeaponInfo(Recs[i].ClassName).InventoryGroup != Group)
		{
			// [Explicit Continue]
			goto J0x151;
		}
		Weap = Class<Weapon>(DynamicLoadObject(Recs[i].ClassName, Class'Core.Class'));
		// End:0x151
		if((Weap != none) && ClassIsChildOf(Weap, Class'BCoreProV55.BallisticWeapon'))
		{
			Instigator.GiveWeapon(Recs[i].ClassName);
		}
		J0x151:

		i++;
		// [Loop Continue]
		goto J0x71;
	}
	Class'BCoreProV55.BC_WeaponInfoCache'.static.EndSession();
	Inv = Instigator.Inventory;
	J0x17E:

	// End:0x1C4 [Loop If]
	if(Inv != none)
	{
		// End:0x1AD
		if(Weapon(Inv) != none)
		{
			Weapon(Inv).SuperMaxOutAmmo();
		}
		Inv = Inv.Inventory;
		// [Loop Continue]
		goto J0x17E;
	}
	//return;	
}

simulated function bool HasAmmo()
{
	return ((HasMagAmmo(byte(255))) || HasNonMagAmmo(byte(255))) || MeleeFireMode != none;
	//return;	
}

simulated function bool HasMagAmmo(byte Mode)
{
	// End:0xCB
	if(!bNoMag)
	{
		// End:0x6B
		if(((((int(Mode) == 255) || int(Mode) == 0) && bFireMode[0] != none) && bFireMode[0].bUseWeaponMag) && MagAmmo >= FireMode[0].AmmoPerFire)
		{
			return true;
		}
		// End:0xCB
		if(((((int(Mode) == 255) || int(Mode) == 1) && bFireMode[1] != none) && bFireMode[1].bUseWeaponMag) && MagAmmo >= FireMode[1].AmmoPerFire)
		{
			return true;
		}
	}
	return false;
	//return;	
}

simulated function bool HasNonMagAmmo(byte Mode)
{
	// End:0x64
	if(((((int(Mode) == 255) || int(Mode) == 0) && Ammo[0] != none) && FireMode[0] != none) && Ammo[0].AmmoAmount >= FireMode[0].AmmoPerFire)
	{
		return true;
	}
	// End:0xC8
	if(((((int(Mode) == 255) || int(Mode) == 1) && Ammo[1] != none) && FireMode[1] != none) && Ammo[1].AmmoAmount >= FireMode[1].AmmoPerFire)
	{
		return true;
	}
	return false;
	//return;	
}

simulated function bool HasAmmoLoaded(byte Mode)
{
	// End:0x18
	if(bNoMag)
	{
		return HasNonMagAmmo(Mode);		
	}
	else
	{
		return HasMagAmmo(Mode);
	}
	//return;	
}

simulated function bool ConsumeMagAmmo(int Mode, float load, optional bool bAmountNeededIsMax)
{
	// End:0x52
	if(bNoMag || (bFireMode[Mode] != none) && bFireMode[Mode].bUseWeaponMag == false)
	{
		ConsumeAmmo(Mode, load, bAmountNeededIsMax);		
	}
	else
	{
		// End:0x6D
		if(float(MagAmmo) < load)
		{
			MagAmmo = 0;			
		}
		else
		{
			MagAmmo -= int(load);
		}
	}
	return true;
	//return;	
}

final function string GetSpecialInfo(name InfoID)
{
	local int i;

	i = 0;
	J0x07:

	// End:0x4C [Loop If]
	if(i < SpecialInfo.Length)
	{
		// End:0x42
		if(SpecialInfo[i].Id == InfoID)
		{
			return SpecialInfo[i].Info;
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	return "";
	//return;	
}

static final function string StaticGetSpecialInfo(name InfoID)
{
	local int i;

	i = 0;
	J0x07:

	// End:0x4C [Loop If]
	if(i < default.SpecialInfo.Length)
	{
		// End:0x42
		if(default.SpecialInfo[i].Id == InfoID)
		{
			return default.SpecialInfo[i].Info;
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	return "";
	//return;	
}

static function Class<Pickup> RecommendAmmoPickup(int Mode)
{
	// End:0x28
	if(Mode == 1)
	{
		return default.FireModeClass[1].default.AmmoClass.default.PickupClass;		
	}
	else
	{
		return default.FireModeClass[0].default.AmmoClass.default.PickupClass;
	}
	//return;	
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	local int Mode, i;

	// End:0x16
	if(UsedAmbientSound != none)
	{
		AmbientSound = UsedAmbientSound;
	}
	// End:0xC1
	if((((((SightFXClass != none) && Instigator.IsLocallyControlled()) && Instigator.IsHumanControlled()) && int(Level.DetailMode) == int(2)) && SightFX == none) && int(Class'BCoreProV55.BallisticMod'.default.EffectsDetailMode) >= 2)
	{
		SightFX = Spawn(SightFXClass);
		// End:0xC1
		if(SightFX != none)
		{
			Class'BCoreProV55.BallisticEmitter'.static.ScaleEmitter(Emitter(SightFX), DrawScale);
		}
	}
	InstigatorController = Instigator.Controller;
	Instigator.bCountJumps = true;
	// End:0xFE
	if(int(Role) == int(ROLE_Authority))
	{
		bServerReloading = false;
	}
	bPreventReload = false;
	ReloadState = 0;
	MeleeState = 0;
	// End:0x130
	if(PlayerSpeedFactor != default.PlayerSpeedFactor)
	{
		PlayerSpeedFactor = default.PlayerSpeedFactor;
	}
	AimComponent.OnWeaponSelected();
	Instigator.WalkingPct = WeaponParams.SightMoveSpeedFactor;
	// End:0x1CF
	if(int(Role) == int(ROLE_Authority))
	{
		// End:0x1A1
		if((BallisticWeapon(PrevWeapon) == none) || BallisticWeapon(PrevWeapon).PlayerSpeedFactor != PlayerSpeedFactor)
		{
			UpdateSpeed();
		}
		// End:0x1C7
		if(BallisticWeapon(PrevWeapon) != none)
		{
			BallisticWeapon(PrevWeapon).PlayerSpeedUp = false;
		}
		PlayerSpeedUp = true;
	}
	// End:0x20A
	if(BallisticWeapon(PrevWeapon) != none)
	{
		AimComponent.DisplaceEndTime = BallisticWeapon(PrevWeapon).AimComponent.DisplaceEndTime;
	}
	// End:0x264
	if((AIController(InstigatorController) != none) && AIController(InstigatorController).Skill <= float(4))
	{
		BringUpTime = default.BringUpTime * (float(2) - (AIController(InstigatorController).Skill / float(4)));
	}
	// End:0x35B
	if((Instigator.PlayerReplicationInfo != none) && Instigator.PlayerReplicationInfo.Team != none)
	{
		i = 0;
		J0x29E:

		// End:0x35B [Loop If]
		if(i < TeamSkins.Length)
		{
			// End:0x314
			if(Instigator.PlayerReplicationInfo.Team.TeamIndex == 0)
			{
				// End:0x311
				if(TeamSkins[i].RedTex != none)
				{
					Skins[TeamSkins[i].SkinNum] = TeamSkins[i].RedTex;
				}
				// [Explicit Continue]
				goto J0x351;
			}
			// End:0x351
			if(TeamSkins[i].BlueTex != none)
			{
				Skins[TeamSkins[i].SkinNum] = TeamSkins[i].BlueTex;
			}
			J0x351:

			i++;
			// [Loop Continue]
			goto J0x29E;
		}
	}
	// End:0x420
	if((PlayerController(Instigator.Controller) != none) && PlayerController(Instigator.Controller).myHUD != none)
	{
		// End:0x3F8
		if(int(CrosshairMode) == int(2))
		{
			PlayerController(Instigator.Controller).myHUD.bCrosshairShow = PlayerController(Instigator.Controller).myHUD.default.bCrosshairShow;			
		}
		else
		{
			PlayerController(Instigator.Controller).myHUD.bCrosshairShow = false;
		}
	}
	// End:0x4CF
	if(int(ClientState) == int(1))
	{
		// End:0x455
		if(BringUpSound.Sound != none)
		{
			Class'BCoreProV55.BUtil'.static.PlayFullSound(self, BringUpSound);
		}
		ClientPlayForceFeedback(SelectForce);
		// End:0x4C7
		if(Instigator.IsLocallyControlled())
		{
			// End:0x4AA
			if((bNeedCock && MagAmmo > 0) && HasAnim(CockSelectAnim))
			{
				PlayAnim(CockSelectAnim, CockSelectAnimRate, 0.0000000);				
			}
			else
			{
				// End:0x4C7
				if(HasAnim(SelectAnim))
				{
					PlayAnim(SelectAnim, SelectAnimRate, 0.0000000);
				}
			}
		}
		ClientState = 2;
	}
	// End:0x500
	if((bNeedCock && MagAmmo > 0) && HasAnim(CockSelectAnim))
	{
		BringUpTime = CockingBringUpTime;		
	}
	else
	{
		BringUpTime = default.BringUpTime;
	}
	// End:0x524
	if(!IsInState('PendingClientWeaponSet'))
	{
		SetTimer(BringUpTime, false);		
	}
	else
	{
		bPendingBringupTimer = true;
	}
	Mode = 0;
	J0x533:

	// End:0x5D3 [Loop If]
	if(Mode < 2)
	{
		// End:0x553
		if(FireMode[Mode] == none)
		{
			// [Explicit Continue]
			goto J0x5C9;
		}
		FireMode[Mode].bIsFiring = false;
		FireMode[Mode].HoldTime = 0.0000000;
		FireMode[Mode].bServerDelayStartFire = false;
		FireMode[Mode].bServerDelayStopFire = false;
		FireMode[Mode].bInstantStop = false;
		J0x5C9:

		Mode++;
		// [Loop Continue]
		goto J0x533;
	}
	// End:0x616
	if(((PrevWeapon != none) && PrevWeapon.HasAmmo()) && !PrevWeapon.bNoVoluntarySwitch)
	{
		OldWeapon = PrevWeapon;		
	}
	else
	{
		OldWeapon = none;
	}
	//return;	
}

simulated function bool PutDown()
{
	local int Mode;

	// End:0x2B7
	if((int(ClientState) == int(2)) || int(ClientState) == int(4))
	{
		// End:0xB9
		if((Instigator.PendingWeapon != none) && !Instigator.PendingWeapon.bForceSwitch)
		{
			Mode = 0;
			J0x5C:

			// End:0xB9 [Loop If]
			if(Mode < 2)
			{
				// End:0xAF
				if(((FireMode[Mode] != none) && FireMode[Mode].bFireOnRelease) && FireMode[Mode].bIsFiring)
				{
					return false;
				}
				Mode++;
				// [Loop Continue]
				goto J0x5C;
			}
		}
		// End:0x14D
		if(Instigator.IsLocallyControlled())
		{
			Mode = 0;
			J0xD2:

			// End:0x11E [Loop If]
			if(Mode < 2)
			{
				// End:0x114
				if((FireMode[Mode] != none) && FireMode[Mode].bIsFiring)
				{
					ClientStopFire(Mode);
				}
				Mode++;
				// [Loop Continue]
				goto J0xD2;
			}
			// End:0x14D
			if((int(ClientState) != int(2)) && HasAnim(PutDownAnim))
			{
				PlayAnim(PutDownAnim, PutDownAnimRate, 0.0000000);
			}
		}
		ClientState = 3;
		// End:0x165
		if(bScopeView)
		{
			StopScopeView(true);
		}
		// End:0x19C
		if(int(ReloadState) != int(0))
		{
			// End:0x194
			if(int(Level.NetMode) == int(NM_Client))
			{
				ServerStopReload();
			}
			ReloadState = 0;
		}
		// End:0x1B4
		if(int(MeleeState) != int(0))
		{
			MeleeState = 0;
		}
		bPendingSightUp = false;
		// End:0x289
		if((((int(CrosshairMode) != int(2)) && (Instigator.PendingWeapon == none) || BallisticWeapon(Instigator.PendingWeapon) == none) && PlayerController(Instigator.Controller) != none) && PlayerController(Instigator.Controller).myHUD != none)
		{
			PlayerController(Instigator.Controller).myHUD.bCrosshairShow = PlayerController(Instigator.Controller).myHUD.default.bCrosshairShow;
		}
		// End:0x2AE
		if(PutDownSound.Sound != none)
		{
			Class'BCoreProV55.BUtil'.static.PlayFullSound(self, PutDownSound);
		}
		SetTimer(PutDownTime, false);
	}
	Mode = 0;
	J0x2BE:

	// End:0x316 [Loop If]
	if(Mode < 2)
	{
		// End:0x2DE
		if(FireMode[Mode] == none)
		{
			// [Explicit Continue]
			goto J0x30C;
		}
		FireMode[Mode].bServerDelayStartFire = false;
		FireMode[Mode].bServerDelayStopFire = false;
		J0x30C:

		Mode++;
		// [Loop Continue]
		goto J0x2BE;
	}
	Instigator.AmbientSound = none;
	AmbientSound = none;
	OldWeapon = none;
	// End:0x36C
	if(PlayerController(Instigator.Controller) != none)
	{
		PlayerController(Instigator.Controller).bZooming = false;
	}
	return true;
	//return;	
}

simulated function Weapon WeaponChange(byte F, bool bSilent)
{
	local Weapon newWeapon;

	// End:0xD7
	if(int(InventoryGroup) == int(F))
	{
		// End:0xD2
		if(!HasAmmo())
		{
			// End:0x88
			if(Inventory != none)
			{
				newWeapon = Inventory.WeaponChange(F, bSilent);
				// End:0x88
				if(((newWeapon != none) && newWeapon != Instigator.Weapon) && newWeapon.HasAmmo())
				{
					return newWeapon;
				}
			}
			// End:0xCF
			if((!bSilent && newWeapon == none) && Instigator.IsHumanControlled())
			{
				Instigator.ClientMessage(ItemName $ MessageNoAmmo);
			}			
		}
		else
		{
			return self;
		}		
	}
	else
	{
		// End:0xE7
		if(Inventory == none)
		{
			return none;			
		}
		else
		{
			return Inventory.WeaponChange(F, bSilent);
		}
	}
	//return;	
}

simulated function float RateSelf()
{
	// End:0x19
	if(!HasAmmo())
	{
		CurrentRating = -2.0000000;		
	}
	else
	{
		// End:0x36
		if(Instigator.Controller == none)
		{
			return 0.0000000;			
		}
		else
		{
			CurrentRating = Instigator.Controller.RateWeapon(self);
			// End:0xBE
			if(!bNoMag)
			{
				// End:0xA1
				if(!HasNonMagAmmo(byte(255)) && MagAmmo < (WeaponParams.MagAmmo / 4))
				{
					CurrentRating /= (float(1) + AIReloadTime);					
				}
				else
				{
					// End:0xBE
					if(MagAmmo <= 0)
					{
						CurrentRating /= (float(2) + AIReloadTime);
					}
				}
			}
		}
	}
	return CurrentRating;
	//return;	
}

function float GetAIRating()
{
	// End:0x0F
	if(bNoMag)
	{
		return AIRating;
	}
	// End:0x25
	if(DiscourageReload())
	{
		return AIRating * 0.2500000;
	}
	return AIRating;
	//return;	
}

function bool DiscourageReload()
{
	return ((MagAmmo < 1) && AIController(Instigator.Controller).Enemy != none) && ((Level.TimeSeconds - AIController(Instigator.Controller).LastSeenTime) < AIReloadTime) || (AmmoAmount(0)) < 1;
	//return;	
}

function bool BotReload(optional bool bForced)
{
	// End:0x3A
	if(bForced || AIController(Instigator.Controller).Skill > float(Rand(5)))
	{
		ServerStartReload();
		return true;
	}
	return false;
	//return;	
}

function bool BotShouldReload()
{
	// End:0x82
	if(((Level.TimeSeconds - AIController(Instigator.Controller).LastSeenTime) > (AIReloadTime + (AIReloadTime * float(MagAmmo / WeaponParams.MagAmmo)))) && (Level.TimeSeconds - Instigator.LastPainTime) > AIReloadTime)
	{
		return true;
	}
	return false;
	//return;	
}

function bool CanAttack(Actor Other)
{
	local float dist, CheckDist;
	local Vector HitLocation, HitNormal, X, Y, Z, projStart;

	local Actor HitActor;
	local int M;
	local bool bInstantHit;

	// End:0x23
	if((Instigator == none) || Instigator.Controller == none)
	{
		return false;
	}
	// End:0x35
	if(int(ReloadState) != int(0))
	{
		return false;
	}
	// End:0x61
	if(!bNoMag && bNeedReload || MagAmmo < 1)
	{
		BotReload(true);
		return false;
	}
	// End:0x99
	if(((!bNonCocking && bNeedCock) && !bNeedReload) && MagAmmo > 0)
	{
		CommonCockGun();
		return false;
	}
	dist = VSize(Instigator.Location - Other.Location);
	// End:0x115
	if((dist > FireMode[0].MaxRange()) && dist > FireMode[1].MaxRange())
	{
		// End:0x113
		if(!bNoMag && BotShouldReload())
		{
			BotReload();
		}
		return false;
	}
	// End:0x152
	if(!Instigator.Controller.LineOfSightTo(Other))
	{
		// End:0x150
		if(!bNoMag && BotShouldReload())
		{
			BotReload();
		}
		return false;
	}
	// End:0x1B1
	if(((AIController(Instigator.Controller) != none) && float(Rand(6)) < AIController(Instigator.Controller).Skill) && !RcComponent.BotShouldFire(dist))
	{
		return false;
	}
	M = 0;
	J0x1B8:

	// End:0x26C [Loop If]
	if(M < 2)
	{
		// End:0x1D8
		if(FireMode[M] == none)
		{
			// [Explicit Continue]
			goto J0x262;
		}
		// End:0x1FB
		if(FireMode[M].bInstantHit)
		{
			bInstantHit = true;
			// [Explicit Continue]
			goto J0x262;
		}
		CheckDist = FMax(CheckDist, 0.5000000 * FireMode[M].ProjectileClass.default.Speed);
		CheckDist = FMax(CheckDist, 300.0000000);
		CheckDist = FMin(CheckDist, VSize(Other.Location - Location));
		J0x262:

		M++;
		// [Loop Continue]
		goto J0x1B8;
	}
	GetAxes(GetPlayerAim(), X, Y, Z);
	projStart = GetFireStart(X, Y, Z);
	// End:0x2F0
	if(bInstantHit)
	{
		HitActor = Trace(HitLocation, HitNormal, Other.Location + (Other.CollisionHeight * vect(0.0000000, 0.0000000, 0.8000000)), projStart, true);		
	}
	else
	{
		HitActor = Trace(HitLocation, HitNormal, projStart + (CheckDist * Normal((Other.Location + (Other.CollisionHeight * vect(0.0000000, 0.0000000, 0.8000000))) - Location)), projStart, true);
	}
	// End:0x3CA
	if(((((HitActor == none) || HitActor == Other) || Pawn(HitActor) == none) || Pawn(HitActor).Controller == none) || !Instigator.Controller.SameTeamAs(Pawn(HitActor).Controller))
	{
		return true;
	}
	return false;
	//return;	
}

function bool RecommendHeal(Bot B)
{
	local DestroyableObjective O;
	local Vehicle V;

	V = B.Squad.GetLinkVehicle(B);
	// End:0xAC
	if((((V != none) && VSize(Instigator.Location - V.Location) < (1.5000000 * FireMode[0].MaxRange())) && float(V.Health) < V.HealthMax) && V.LinkHealMult > float(0))
	{
		return true;
	}
	// End:0x156
	if((((Vehicle(B.RouteGoal) != none) && B.Enemy == none) && VSize(Instigator.Location - B.RouteGoal.Location) < (1.5000000 * FireMode[0].MaxRange())) && Vehicle(B.RouteGoal).TeamLink(B.GetTeamNum()))
	{
		return true;
	}
	O = DestroyableObjective(B.Squad.SquadObjective);
	// End:0x236
	if((((((O != none) && B.Enemy == none) && O.TeamLink(B.GetTeamNum())) && O.Health < O.DamageCapacity) && VSize(Instigator.Location - O.Location) < (1.1000000 * FireMode[0].MaxRange())) && B.LineOfSightTo(O))
	{
		return true;
	}
	return false;
	//return;	
}

simulated function bool IsFiring()
{
	// End:0x7D
	if((int(Level.NetMode) == int(NM_DedicatedServer)) || int(Level.NetMode) == int(NM_ListenServer))
	{
		return (FireMode[0].IsFiring() || (FireMode[1] != none) && FireMode[1].IsFiring()) || int(MeleeState) > int(1);
	}
	return (int(ClientState) == int(4)) && (FireMode[0].IsFiring() || (FireMode[1] != none) && FireMode[1].IsFiring()) || int(MeleeState) > int(1);
	//return;	
}

simulated function bool ReadyToFire(int Mode)
{
	local int alt;

	// End:0x15
	if(Mode == 0)
	{
		alt = 1;		
	}
	else
	{
		alt = 0;
	}
	// End:0x2F
	if(FireMode[Mode] == none)
	{
		return false;
	}
	// End:0xDB
	if(((((FireMode[alt] != FireMode[Mode]) && FireMode[alt].bModeExclusive) && FireMode[alt].bIsFiring) || !FireMode[Mode].AllowFire()) || FireMode[Mode].NextFireTime > (Level.TimeSeconds + FireMode[Mode].PreFireTime))
	{
		return false;
	}
	return true;
	//return;	
}

function bool BotFire(bool bFinished, optional name FiringMode)
{
	// End:0x12
	if(int(ReloadState) != int(0))
	{
		return false;
	}
	// End:0x3F
	if(!bNoMag && bNeedReload || MagAmmo < 1)
	{
		BotReload(true);		
	}
	else
	{
		super.BotFire(bFinished, FiringMode);
	}
	//return;	
}

simulated function bool StartFire(int Mode)
{
	local int alt;

	// End:0x12
	if(!ReadyToFire(Mode))
	{
		return false;
	}
	// End:0x27
	if(Mode == 0)
	{
		alt = 1;		
	}
	else
	{
		alt = 0;
	}
	FireMode[Mode].bIsFiring = true;
	FireMode[Mode].NextFireTime = Level.TimeSeconds + FireMode[Mode].PreFireTime;
	// End:0xE8
	if((FireMode[alt] != none) && FireMode[alt].bModeExclusive)
	{
		FireMode[Mode].NextFireTime = FMax(FireMode[Mode].NextFireTime, FireMode[alt].NextFireTime);
	}
	// End:0x15D
	if(Instigator.IsLocallyControlled())
	{
		// End:0x147
		if((FireMode[Mode].PreFireTime > 0.0000000) || FireMode[Mode].bFireOnRelease)
		{
			FireMode[Mode].PlayPreFire();
		}
		FireMode[Mode].FireCount = 0;
	}
	return true;
	//return;	
}

function GiveTo(Pawn Other, optional Pickup Pickup)
{
	local int M;
	local Weapon W;
	local bool bPossiblySwitch, bJustSpawned;

	Instigator = Other;
	W = Weapon(Other.FindInventoryType(Class));
	// End:0x170
	if((W == none) || Class != W.Class)
	{
		bJustSpawned = true;
		super(Inventory).GiveTo(Other);
		bPossiblySwitch = true;
		W = self;
		// End:0x104
		if((Pickup != none) && BallisticWeaponPickup(Pickup) != none)
		{
			GenerateLayout(BallisticWeaponPickup(Pickup).LayoutIndex);
			GenerateCamo(BallisticWeaponPickup(Pickup).CamoIndex);
			// End:0xE8
			if(int(Role) == int(ROLE_Authority))
			{
				ParamsClasses[int(GameStyleIndex)].static.Initialize(self);
			}
			MagAmmo = BallisticWeaponPickup(Pickup).MagAmmo;			
		}
		else
		{
			GenerateLayout(byte(255));
			GenerateCamo(byte(255));
			// End:0x140
			if(int(Role) == int(ROLE_Authority))
			{
				ParamsClasses[int(GameStyleIndex)].static.Initialize(self);
			}
			MagAmmo = MagAmmo + ((int(!bNonCocking) * int(bMagPlusOne)) * int(!bNeedCock));
		}		
	}
	else
	{
		// End:0x18C
		if(!W.HasAmmo())
		{
			bPossiblySwitch = true;
		}
	}
	// End:0x19F
	if(Pickup == none)
	{
		bPossiblySwitch = true;
	}
	M = 0;
	J0x1A6:

	// End:0x20B [Loop If]
	if(M < 2)
	{
		// End:0x201
		if(FireMode[M] != none)
		{
			FireMode[M].Instigator = Instigator;
			W.GiveAmmo(M, WeaponPickup(Pickup), bJustSpawned);
		}
		M++;
		// [Loop Continue]
		goto J0x1A6;
	}
	// End:0x22A
	if(MeleeFireMode != none)
	{
		MeleeFireMode.Instigator = Instigator;
	}
	// End:0x263
	if((Instigator.Weapon != none) && Instigator.Weapon.IsFiring())
	{
		bPossiblySwitch = false;
	}
	// End:0x290
	if(Instigator.Weapon != W)
	{
		W.ClientWeaponSet(bPossiblySwitch);
	}
	// End:0x2AB
	if(int(Role) == int(ROLE_Authority))
	{
		ClientSetMagAmmo(MagAmmo);
	}
	bAimDisabled = default.bAimDisabled || !Instigator.IsHumanControlled();
	// End:0x306
	if(!bJustSpawned)
	{
		M = 0;
		J0x2E0:

		// End:0x303 [Loop If]
		if(M < 2)
		{
			Ammo[M] = none;
			M++;
			// [Loop Continue]
			goto J0x2E0;
		}
		Destroy();
	}
	//return;	
}

function GiveAmmo(int M, WeaponPickup WP, bool bJustSpawned)
{
	// End:0x1BE
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
			// End:0x1A8
			if((bJustSpawned && (WP == none) || !WP.bDropped) && (M == 0) || FireMode[M].AmmoClass != FireMode[0].AmmoClass)
			{
				Ammo[M].AddAmmo(Ammo[M].InitialAmount);
			}
		}
		Ammo[M].GotoState('None');
	}
	//return;	
}

function SetAmmoTo(int Amount, int M)
{
	// End:0x2D
	if((Amount > Ammo[M].MaxAmmo) || Amount < 0)
	{
		return;
	}
	Ammo[M].AmmoAmount = Amount;
	//return;	
}

simulated function ClientWeaponSet(bool bPossiblySwitch)
{
	local int Mode;

	Instigator = Pawn(Owner);
	bPendingSwitch = bPossiblySwitch;
	// End:0x31
	if(Instigator == none)
	{
		GotoState('PendingClientWeaponSet');
		return;
	}
	Mode = 0;
	J0x38:

	// End:0xFC [Loop If]
	if(Mode < 2)
	{
		// End:0xA8
		if(FireModeClass[Mode] != none)
		{
			// End:0x72
			if(FireMode[Mode] == none)
			{
				GotoState('PendingClientWeaponSet');
				return;				
			}
			else
			{
				// End:0xA8
				if((FireMode[Mode].AmmoClass != none) && Ammo[Mode] == none)
				{
					GotoState('PendingClientWeaponSet');
					return;
				}
			}
		}
		// End:0xD3
		if(FireMode[Mode] != none)
		{
			FireMode[Mode].Instigator = Instigator;
		}
		// End:0xF2
		if(MeleeFireMode != none)
		{
			MeleeFireMode.Instigator = Instigator;
		}
		Mode++;
		// [Loop Continue]
		goto J0x38;
	}
	ClientState = 1;
	GotoState('Hidden');
	// End:0x13C
	if((int(Level.NetMode) == int(NM_DedicatedServer)) || !Instigator.IsHumanControlled())
	{
		return;
	}
	// End:0x1CD
	if(Instigator.IsLocallyControlled())
	{
		// End:0x18F
		if(int(ModeHandling) == int(1))
		{
			// End:0x18C
			if((int(LastWeaponMode) != int(CurrentWeaponMode)) && int(LastWeaponMode) != 255)
			{
				ServerSwitchWeaponMode(LastWeaponMode);
			}			
		}
		else
		{
			// End:0x1CD
			if(int(ModeHandling) == int(2))
			{
				// End:0x1CD
				if((int(SavedWeaponMode) != int(CurrentWeaponMode)) && int(SavedWeaponMode) != 255)
				{
					ServerSwitchWeaponMode(SavedWeaponMode);
				}
			}
		}
	}
	// End:0x225
	if((Instigator.Weapon == self) || Instigator.PendingWeapon == self)
	{
		// End:0x21D
		if(Instigator.PendingWeapon != none)
		{
			Instigator.ChangedWeapon();			
		}
		else
		{
			BringUp();
		}
		return;
	}
	// End:0x258
	if((Instigator.PendingWeapon != none) && Instigator.PendingWeapon.bForceSwitch)
	{
		return;
	}
	// End:0x2A1
	if(Instigator.Weapon == none)
	{
		// End:0x27F
		if(bDeferInitialSwitch)
		{
			bDeferInitialSwitch = false;
			return;
		}
		Instigator.PendingWeapon = self;
		Instigator.ChangedWeapon();		
	}
	else
	{
		// End:0x3B3
		if(bPossiblySwitch && !Instigator.Weapon.IsFiring())
		{
			// End:0x306
			if((PlayerController(Instigator.Controller) != none) && PlayerController(Instigator.Controller).bNeverSwitchOnPickup)
			{
				return;
			}
			// End:0x368
			if(Instigator.PendingWeapon != none)
			{
				// End:0x365
				if((RateSelf()) > Instigator.PendingWeapon.RateSelf())
				{
					Instigator.PendingWeapon = self;
					Instigator.Weapon.PutDown();
				}				
			}
			else
			{
				// End:0x3B3
				if((RateSelf()) > Instigator.Weapon.RateSelf())
				{
					Instigator.PendingWeapon = self;
					Instigator.Weapon.PutDown();
				}
			}
		}
	}
	//return;	
}

simulated function ClientSetMagAmmo(int NewMag)
{
	MagAmmo = NewMag;
	//return;	
}

function bool HandlePickupQuery(Pickup Item)
{
	local WeaponPickup wpu;
	local BallisticWeaponPickup BWP;

	// End:0x4A
	if(Class == Item.InventoryType)
	{
		wpu = WeaponPickup(Item);
		// End:0x48
		if(wpu != none)
		{
			return !wpu.AllowRepeatPickup();			
		}
		else
		{
			return false;
		}
	}
	// End:0x12F
	if((((int(default.MaxInventoryCapacity) > 0) && AIController(InstigatorController) == none) && Class<BallisticWeapon>(Item.InventoryType) != none) && !bWT_Super && !Class<BallisticWeapon>(Item.InventoryType).default.bWT_Super)
	{
		BWP = BallisticWeaponPickup(Item);
		// End:0x12F
		if(BWP != none)
		{
			BWP.DetectedInventorySize += int(ParamsClasses[int(GameStyleIndex)].default.Layouts[0].InventorySize);
			// End:0x12F
			if(BWP.DetectedInventorySize >= int(default.MaxInventoryCapacity))
			{
				BWP.DetectedInventorySize = 0;
				return true;
			}
		}
	}
	// End:0x13C
	if(Inventory == none)
	{
		return false;
	}
	return Inventory.HandlePickupQuery(Item);
	//return;	
}

simulated function Destroyed()
{
	local int M, i;

	AmbientSound = none;
	// End:0x1E
	if(SightFX != none)
	{
		SightFX.Destroy();
	}
	// End:0x16D
	if(Instigator != none)
	{
		// End:0x40
		if(PlayerSpeedUp)
		{
			UpdateSpeed();
			PlayerSpeedUp = false;
		}
		// End:0x16D
		if((Instigator.Controller != none) && PlayerController(Instigator.Controller) != none)
		{
			PlayerController(Instigator.Controller).bZooming = false;
			PlayerController(Instigator.Controller).DesiredZoomLevel = 0.0000000;
			// End:0x16D
			if(PlayerController(Instigator.Controller).myHUD != none)
			{
				// End:0x106
				if(bStandardCrosshairOff)
				{
					PlayerController(Instigator.Controller).myHUD.bCrosshairShow = true;					
				}
				else
				{
					PlayerController(Instigator.Controller).myHUD.bCrosshairShow = PlayerController(Instigator.Controller).myHUD.default.bCrosshairShow;
				}
				Instigator.Controller.bRun = 0;
			}
		}
	}
	M = 0;
	J0x174:

	// End:0x201 [Loop If]
	if(M < 2)
	{
		// End:0x1A6
		if(FireMode[M] != none)
		{
			FireMode[M].DestroyEffects();
		}
		// End:0x1F7
		if(Ammo[M] != none)
		{
			// End:0x1EA
			if((Instigator == none) || Instigator.Health < 1)
			{
				Ammo[M].Destroy();
			}
			Ammo[M] = none;
		}
		M++;
		// [Loop Continue]
		goto J0x174;
	}
	i = 0;
	J0x208:

	// End:0x234 [Loop If]
	if(i < GunAugments.Length)
	{
		GunAugments[i].Destroy();
		++i;
		// [Loop Continue]
		goto J0x208;
	}
	// End:0x2C2
	if(MeleeFireMode != none)
	{
		MeleeFireMode.Weapon = none;
		MeleeFireMode.BW = none;
		MeleeFireMode.Instigator = none;
		MeleeFireMode.Level = none;
		MeleeFireMode.Owner = none;
		MeleeFireMode.DestroyEffects();
		Level.ObjectPool.FreeObject(MeleeFireMode);
		MeleeFireMode = none;
	}
	// End:0x2EC
	if(RwColMgr != none)
	{
		// End:0x2E5
		if(RewindActive)
		{
			RwColMgr.RestoreCollisions();
		}
		RwColMgr = none;
	}
	WeaponParams = none;
	WeaponCamo = none;
	// End:0x338
	if(RcComponent != none)
	{
		RcComponent.Cleanup();
		Level.ObjectPool.FreeObject(RcComponent);
		RcComponent = none;
	}
	// End:0x376
	if(AimComponent != none)
	{
		AimComponent.Cleanup();
		Level.ObjectPool.FreeObject(AimComponent);
		AimComponent = none;
	}
	super(Inventory).Destroyed();
	//return;	
}

function HolderDied()
{
	local int M;

	// End:0x12
	if(AmbientSound != none)
	{
		AmbientSound = none;
	}
	M = 0;
	J0x19:

	// End:0xC0 [Loop If]
	if(M < 2)
	{
		// End:0x39
		if(FireMode[M] == none)
		{
			// [Explicit Continue]
			goto J0xB6;
		}
		// End:0xB6
		if(FireMode[M].bIsFiring)
		{
			StopFire(M);
			// End:0xB6
			if(FireMode[M].bFireOnRelease && (bFireMode[M] == none) || bFireMode[M].bReleaseFireOnDie)
			{
				FireMode[M].ModeDoFire();
			}
		}
		J0xB6:

		M++;
		// [Loop Continue]
		goto J0x19;
	}
	//return;	
}

simulated event StopFire(int Mode)
{
	// End:0x2F
	if(FireMode[Mode].bIsFiring)
	{
		FireMode[Mode].bInstantStop = true;
	}
	// End:0x72
	if(Instigator.IsLocallyControlled() && !FireMode[Mode].bFireOnRelease)
	{
		FireMode[Mode].PlayFireEnd();
	}
	FireMode[Mode].bIsFiring = false;
	FireMode[Mode].StopFiring();
	// End:0xC3
	if(!FireMode[Mode].bFireOnRelease)
	{
		ZeroFlashCount(Mode);
	}
	//return;	
}

function DropFrom(Vector StartLocation)
{
	local int M, i;
	local Pickup Pickup;
	local Material N;

	// End:0x2C
	if(!bCanThrow || !Level.Game.bAllowWeaponThrowing)
	{
		return;
	}
	// End:0x3E
	if(AmbientSound != none)
	{
		AmbientSound = none;
	}
	ClientWeaponThrown();
	M = 0;
	J0x4B:

	// End:0x97 [Loop If]
	if(M < 2)
	{
		// End:0x8D
		if((FireMode[M] != none) && FireMode[M].bIsFiring)
		{
			StopFire(M);
		}
		M++;
		// [Loop Continue]
		goto J0x4B;
	}
	// End:0xAD
	if(Instigator != none)
	{
		DetachFromPawn(Instigator);
	}
	Pickup = Spawn(PickupClass, self,, StartLocation);
	// End:0x382
	if(Pickup != none)
	{
		// End:0xF7
		if(Instigator.Health > 0)
		{
			WeaponPickup(Pickup).bThrown = true;
		}
		Pickup.InitDroppedPickupFor(self);
		Pickup.Velocity = Velocity;
		// End:0x382
		if((int(Role) == int(ROLE_Authority)) && BallisticWeaponPickup(Pickup) != none)
		{
			BallisticWeaponPickup(Pickup).LayoutIndex = LayoutIndex;
			BallisticWeaponPickup(Pickup).CamoIndex = CamoIndex;
			// End:0x237
			if(WeaponParams.PickupMesh != none)
			{
				BallisticWeaponPickup(Pickup).SetStaticMesh(WeaponParams.PickupMesh);
				BallisticWeaponPickup(Pickup).NewStaticMesh = WeaponParams.PickupMesh;
				BallisticWeaponPickup(Pickup).NewLowPolyStaticMesh = WeaponParams.PickupMesh;
				BallisticWeaponPickup(Pickup).bNewMesh = true;
				// End:0x237
				if(WeaponParams.PickupDrawScale != float(0))
				{
					BallisticWeaponPickup(Pickup).SetDrawScale(WeaponParams.PickupDrawScale);
				}
			}
			// End:0x382
			if(WeaponCamo != none)
			{
				i = 0;
				J0x249:

				// End:0x382 [Loop If]
				if(i < WeaponCamo.WeaponMaterialSwaps.Length)
				{
					// End:0x378
					if(WeaponCamo.WeaponMaterialSwaps[i].pIndex != -1)
					{
						// End:0x2EB
						if(WeaponCamo.WeaponMaterialSwaps[i].Material != none)
						{
							BallisticWeaponPickup(Pickup).Skins[WeaponCamo.WeaponMaterialSwaps[i].pIndex] = WeaponCamo.WeaponMaterialSwaps[i].Material;
						}
						// End:0x378
						if(WeaponCamo.WeaponMaterialSwaps[i].MaterialName != "")
						{
							N = Material(DynamicLoadObject(WeaponCamo.WeaponMaterialSwaps[i].MaterialName, Class'Engine.Material'));
							// End:0x378
							if(N != none)
							{
								BallisticWeaponPickup(Pickup).Skins[WeaponCamo.WeaponMaterialSwaps[i].pIndex] = N;
							}
						}
					}
					++i;
					// [Loop Continue]
					goto J0x249;
				}
			}
		}
	}
	Destroy();
	//return;	
}

simulated function ClientWeaponThrown()
{
	local int M;

	// End:0x43
	if((Instigator != none) && PlayerController(Instigator.Controller) != none)
	{
		PlayerController(Instigator.Controller).EndZoom();
	}
	AmbientSound = none;
	Instigator.AmbientSound = none;
	// End:0x75
	if(int(Level.NetMode) != int(NM_Client))
	{
		return;
	}
	Instigator.DeleteInventory(self);
	// End:0xEE
	if((Instigator == none) || Instigator.Health < 1)
	{
		M = 0;
		J0xAD:

		// End:0xEE [Loop If]
		if(M < 2)
		{
			// End:0xE4
			if(Ammo[M] != none)
			{
				Instigator.DeleteInventory(Ammo[M]);
			}
			M++;
			// [Loop Continue]
			goto J0xAD;
		}
	}
	//return;	
}

simulated function bool CanThrow()
{
	local int Mode;

	Mode = 0;
	J0x07:

	// End:0x7A [Loop If]
	if(Mode < 2)
	{
		// End:0x47
		if(FireMode[Mode].bFireOnRelease && FireMode[Mode].bIsFiring)
		{
			return false;
		}
		// End:0x70
		if(FireMode[Mode].NextFireTime > Level.TimeSeconds)
		{
			return false;
		}
		Mode++;
		// [Loop Continue]
		goto J0x07;
	}
	return bCanThrow && ((int(ClientState) == int(4)) || int(Level.NetMode) == int(NM_DedicatedServer)) || int(Level.NetMode) == int(NM_ListenServer);
	//return;	
}

simulated event Timer()
{
	local int Mode;

	AimComponent.Reaim(0.1000000);
	// End:0x123
	if(int(ClientState) == int(2))
	{
		Mode = 0;
		J0x2B:

		// End:0x67 [Loop If]
		if(Mode < 2)
		{
			// End:0x5D
			if(FireMode[Mode] != none)
			{
				FireMode[Mode].InitEffects();
			}
			Mode++;
			// [Loop Continue]
			goto J0x2B;
		}
		PlayIdle();
		ClientState = 4;
		// End:0xEC
		if(((int(CrosshairMode) != int(2)) && PlayerController(Instigator.Controller) != none) && PlayerController(Instigator.Controller).myHUD != none)
		{
			PlayerController(Instigator.Controller).myHUD.bCrosshairShow = false;
		}
		// End:0x120
		if(bNeedCock)
		{
			// End:0x10F
			if(BringUpTime == CockingBringUpTime)
			{
				bNeedCock = false;				
			}
			else
			{
				// End:0x120
				if(MagAmmo > 0)
				{
					CommonCockGun();
				}
			}
		}		
	}
	else
	{
		// End:0x1D3
		if(int(ClientState) == int(3))
		{
			// End:0x151
			if(SightFX != none)
			{
				SightFX.Destroy();
				SightFX = none;
			}
			// End:0x176
			if(Instigator.PendingWeapon == none)
			{
				PlayIdle();
				ClientState = 4;				
			}
			else
			{
				ClientState = 1;
				Instigator.ChangedWeapon();
				Mode = 0;
				J0x194:

				// End:0x1D0 [Loop If]
				if(Mode < 2)
				{
					// End:0x1C6
					if(FireMode[Mode] != none)
					{
						FireMode[Mode].DestroyEffects();
					}
					Mode++;
					// [Loop Continue]
					goto J0x194;
				}
			}			
		}
		else
		{
			// End:0x22D
			if((int(ClientState) == int(0)) && bNeedCock)
			{
				// End:0x208
				if(BringUpTime == CockingBringUpTime)
				{
					bNeedCock = false;					
				}
				else
				{
					// End:0x22D
					if(Instigator.PendingWeapon == none)
					{
						// End:0x22D
						if(MagAmmo > 0)
						{
							CommonCockGun();
						}
					}
				}
			}
		}
	}
	//return;	
}

simulated function bool AllowWeapPrevUI()
{
	// End:0x1D
	if(bScopeView && int(ZoomType) != int(0))
	{
		return false;
	}
	return true;
	//return;	
}

simulated function bool AllowWeapNextUI()
{
	// End:0x1D
	if(bScopeView && int(ZoomType) != int(0))
	{
		return false;
	}
	return true;
	//return;	
}

simulated function Weapon PrevWeapon(Weapon CurrentChoice, Weapon CurrentWeapon)
{
	local int WepRelPos, ChoiceRelPos, ChoiceWepRelPos;

	// End:0x3E
	if((bScopeView && CurrentWeapon == self) && int(ZoomType) > int(1))
	{
		ChangeZoom(1.0000000 / float(ZoomStages));
		return none;
	}
	// End:0x2B6
	if(HasAmmo())
	{
		// End:0x92
		if(CurrentChoice == none)
		{
			// End:0x64
			if(CurrentWeapon != self)
			{
				CurrentChoice = self;
			}
			// End:0x78
			if(Inventory == none)
			{
				return CurrentChoice;				
			}
			else
			{
				return Inventory.PrevWeapon(CurrentChoice, CurrentWeapon);
			}
		}
		// End:0x2B6
		if(Class != CurrentWeapon.Class)
		{
			WepRelPos = StrCmp(ItemName, CurrentWeapon.ItemName, 6, true);
			ChoiceRelPos = StrCmp(ItemName, CurrentChoice.ItemName, 6, true);
			ChoiceWepRelPos = StrCmp(CurrentChoice.ItemName, CurrentWeapon.ItemName, 6, true);
			// End:0x176
			if(int(InventoryGroup) == int(CurrentWeapon.InventoryGroup))
			{
				// End:0x173
				if((WepRelPos < 0) && ((int(CurrentChoice.InventoryGroup) != int(InventoryGroup)) || ChoiceRelPos > 0) || ChoiceWepRelPos > 0)
				{
					CurrentChoice = self;
				}				
			}
			else
			{
				// End:0x1A7
				if(int(InventoryGroup) == int(CurrentChoice.InventoryGroup))
				{
					// End:0x1A4
					if(ChoiceRelPos > 0)
					{
						CurrentChoice = self;
					}					
				}
				else
				{
					// End:0x212
					if((int(InventoryGroup) > int(CurrentChoice.InventoryGroup)) && (int(InventoryGroup) < int(CurrentWeapon.InventoryGroup)) || int(CurrentChoice.InventoryGroup) > int(CurrentWeapon.InventoryGroup))
					{
						CurrentChoice = self;						
					}
					else
					{
						// End:0x25F
						if((int(CurrentChoice.InventoryGroup) > int(CurrentWeapon.InventoryGroup)) && int(InventoryGroup) < int(CurrentWeapon.InventoryGroup))
						{
							CurrentChoice = self;							
						}
						else
						{
							// End:0x2B6
							if(((int(InventoryGroup) != int(CurrentChoice.InventoryGroup)) && int(CurrentChoice.InventoryGroup) == int(CurrentWeapon.InventoryGroup)) && ChoiceWepRelPos > 0)
							{
								CurrentChoice = self;
							}
						}
					}
				}
			}
		}
	}
	// End:0x2CA
	if(Inventory == none)
	{
		return CurrentChoice;		
	}
	else
	{
		return Inventory.PrevWeapon(CurrentChoice, CurrentWeapon);
	}
	//return;	
}

simulated function Weapon NextWeapon(Weapon CurrentChoice, Weapon CurrentWeapon)
{
	local int WepRelPos, ChoiceRelPos, ChoiceWepRelPos;

	// End:0x3E
	if((bScopeView && CurrentWeapon == self) && int(ZoomType) > int(1))
	{
		ChangeZoom(-1.0000000 / float(ZoomStages));
		return none;
	}
	// End:0x2B6
	if(HasAmmo())
	{
		// End:0x92
		if(CurrentChoice == none)
		{
			// End:0x64
			if(CurrentWeapon != self)
			{
				CurrentChoice = self;
			}
			// End:0x78
			if(Inventory == none)
			{
				return CurrentChoice;				
			}
			else
			{
				return Inventory.NextWeapon(CurrentChoice, CurrentWeapon);
			}
		}
		// End:0x2B6
		if(Class != CurrentWeapon.Class)
		{
			WepRelPos = StrCmp(ItemName, CurrentWeapon.ItemName, 6, true);
			ChoiceRelPos = StrCmp(ItemName, CurrentChoice.ItemName, 6, true);
			ChoiceWepRelPos = StrCmp(CurrentChoice.ItemName, CurrentWeapon.ItemName, 6, true);
			// End:0x176
			if(int(InventoryGroup) == int(CurrentWeapon.InventoryGroup))
			{
				// End:0x173
				if((WepRelPos > 0) && ((int(CurrentChoice.InventoryGroup) != int(InventoryGroup)) || ChoiceRelPos < 0) || ChoiceWepRelPos < 0)
				{
					CurrentChoice = self;
				}				
			}
			else
			{
				// End:0x1A7
				if(int(InventoryGroup) == int(CurrentChoice.InventoryGroup))
				{
					// End:0x1A4
					if(ChoiceRelPos < 0)
					{
						CurrentChoice = self;
					}					
				}
				else
				{
					// End:0x212
					if((int(InventoryGroup) < int(CurrentChoice.InventoryGroup)) && (int(InventoryGroup) > int(CurrentWeapon.InventoryGroup)) || int(CurrentChoice.InventoryGroup) < int(CurrentWeapon.InventoryGroup))
					{
						CurrentChoice = self;						
					}
					else
					{
						// End:0x25F
						if((int(CurrentChoice.InventoryGroup) < int(CurrentWeapon.InventoryGroup)) && int(InventoryGroup) > int(CurrentWeapon.InventoryGroup))
						{
							CurrentChoice = self;							
						}
						else
						{
							// End:0x2B6
							if(((int(InventoryGroup) != int(CurrentChoice.InventoryGroup)) && int(CurrentChoice.InventoryGroup) == int(CurrentWeapon.InventoryGroup)) && ChoiceWepRelPos < 0)
							{
								CurrentChoice = self;
							}
						}
					}
				}
			}
		}
	}
	// End:0x2CA
	if(Inventory == none)
	{
		return CurrentChoice;		
	}
	else
	{
		return Inventory.NextWeapon(CurrentChoice, CurrentWeapon);
	}
	//return;	
}

simulated function IncrementFlashCount(int Mode)
{
	//return;	
}

simulated function ZeroFlashCount(int Mode)
{
	//return;	
}

final simulated function ReceiveNetAim(float Yaw, float Pitch, float Time, float oChaos, float nChaos)
{
	// End:0x12
	if(int(Role) == int(ROLE_Authority))
	{
		return;
	}
	AimComponent.super(BallisticWeapon).ReceiveNetAim(Yaw, Pitch, Time, oChaos, nChaos);
	//return;	
}

final function SendNetRecoil(int Pitch, int Yaw, float shift_time)
{
	// End:0x67
	if((int(Level.NetMode) == int(NM_DedicatedServer)) || (int(Level.NetMode) == int(NM_ListenServer)) && !Instigator.IsLocallyControlled())
	{
		ReceiveNetRecoil(Pitch, Yaw, int(shift_time * float(100)));
	}
	//return;	
}

final simulated function ReceiveNetRecoil(int Pitch, int Yaw, int shift_time)
{
	// End:0x12
	if(int(Role) == int(ROLE_Authority))
	{
		return;
	}
	RcComponent.super(BallisticWeapon).ReceiveNetRecoil(Pitch, Yaw, float(shift_time) * 0.0100000);
	//return;	
}

final simulated function bool IsDisplaced()
{
	return AimComponent.super(BallisticWeapon).IsDisplaced();
	//return;	
}

final simulated function OnDisplaceStart()
{
	// End:0x0F
	if(bScopeView)
	{
		TemporaryScopeDown();
	}
	//return;	
}

final simulated function OnDisplaceEnd()
{
	// End:0x21
	if(bPendingSightUp && int(SightingState) < int(2))
	{
		ScopeBackUp();
	}
	//return;	
}

final function ServerReaim(float DeltaTime)
{
	AimComponent.Reaim(DeltaTime);
	AimComponent.ForceReaim();
	//return;	
}

final simulated function ZeroAim(float TimeMod)
{
	// End:0x0B
	if(bAimDisabled)
	{
		return;
	}
	ServerZeroAim(TimeMod);
	//return;	
}

final function ServerZeroAim(float TimeMod)
{
	AimComponent.ZeroAim(TimeMod);
	//return;	
}

final simulated function Rotator GetAimPivot()
{
	return AimComponent.super(BallisticWeapon).GetAimPivot();
	//return;	
}

final simulated function Rotator CalcFutureAim(float ExtraTime, bool bIgnoreViewAim)
{
	return AimComponent.super(BallisticWeapon).CalcFutureAim(ExtraTime, bIgnoreViewAim);
	//return;	
}

final simulated function Rotator GetRecoilPivot()
{
	local float mult_factor;

	// End:0x45
	if((Instigator != none) && Instigator.Controller != none)
	{
		mult_factor = DisplayFOV / Instigator.Controller.FovAngle;
	}
	return RcComponent.GetViewEscapePivot() * mult_factor;
	//return;	
}

final simulated function Rotator GetFireRot()
{
	return GetAimPivot() + RcComponent.GetEscapePivot();
	//return;	
}

final simulated function Vector GetFireDir()
{
	return Vector(GetFireRot());
	//return;	
}

final simulated function Rotator GetBasePlayerView()
{
	return ((GetPlayerAim()) - AimComponent.GetViewPivot()) - RcComponent.GetViewPivot();
	//return;	
}

simulated function ApplyAimRotation()
{
	ApplyAimToView();
	PlayerViewPivot = default.PlayerViewPivot + ((GetAimPivot() + GetRecoilPivot()) * (DisplayFOV / Instigator.Controller.FovAngle));
	//return;	
}

simulated function ApplyAimToView()
{
	local Rotator AimPivotDelta, RecoilPivotDelta;

	// End:0x47
	if(((Instigator.Controller == none) || AIController(Instigator.Controller) != none) || !Instigator.IsLocallyControlled())
	{
		return;
	}
	RecoilPivotDelta = RcComponent.CalcViewPivotDelta();
	AimPivotDelta = AimComponent.CalcViewPivotDelta();
	// End:0xBC
	if(RcComponent.ShouldUpdateView())
	{
		Instigator.SetViewRotation((Instigator.Controller.Rotation + AimPivotDelta) + RecoilPivotDelta);		
	}
	else
	{
		Instigator.SetViewRotation(Instigator.Controller.Rotation + AimPivotDelta);
	}
	//return;	
}

simulated function byte GetAimParamsIndex()
{
	return byte(WeaponModes[int(CurrentWeaponMode)].AimParamsIndex);
	//return;	
}

simulated function float GetConeInaccuracy()
{
	// End:0x0F
	if(bAimDisabled)
	{
		return 0.0000000;
	}
	return AimComponent.CalcConeInaccuracy();
	//return;	
}

simulated function Rotator GetPlayerAim(optional bool bFire)
{
	// End:0x1E
	if(Instigator != none)
	{
		return Instigator.GetViewRotation();		
	}
	else
	{
		// End:0x3B
		if(Owner != none)
		{
			return Owner.Rotation;			
		}
		else
		{
			return Rotation;
		}
	}
	//return;	
}

function AdjustPlayerDamage(out int Damage, Pawn instigatedBy, Vector HitLocation, out Vector Momentum, Class<DamageType> DamageType)
{
	local Class<BallisticDamageType> BDT;
	local float DisplaceDuration;

	// End:0x45
	if(((instigatedBy != none) && instigatedBy.Controller != none) && instigatedBy.Controller.SameTeamAs(InstigatorController))
	{
		return;
	}
	// End:0x5A
	if(bBerserk)
	{
		Damage *= 0.7500000;
	}
	BDT = Class<BallisticDamageType>(DamageType);
	// End:0xFD
	if(((BDT != none) && BDT.static.Displaces()) && Damage >= BDT.default.AimDisplacementDamageThreshold)
	{
		DisplaceDuration = BDT.default.AimDisplacementDuration;
		// End:0xE9
		if(BDT.static.ScalingDisplace())
		{
			DisplaceDuration *= (float(Damage) / float(BDT.default.AimDisplacementDamageThreshold));
		}
		AimComponent.DisplaceAim(DisplaceDuration);
	}
	// End:0x10C
	if(AimKnockScale == float(0))
	{
		return;
	}
	AimComponent.ApplyDamageFactor(Damage);
	//return;	
}

final simulated function ClientDisplaceAim(float Duration)
{
	// End:0x1B
	if(int(Level.NetMode) != int(NM_Client))
	{
		return;
	}
	AimComponent.DisplaceAim(Duration);
	//return;	
}

simulated function ClientPlayerDamaged(int Damage)
{
	// End:0x1B
	if(int(Level.NetMode) != int(NM_Client))
	{
		return;
	}
	AimComponent.ApplyDamageFactor(Damage);
	//return;	
}

simulated function OnWeaponDisplaced()
{
	local int M;

	// End:0x0F
	if(bScopeView)
	{
		StopScopeView();
	}
	M = 0;
	J0x16:

	// End:0x4F [Loop If]
	if(M < 2)
	{
		// End:0x45
		if(FireMode[M].bIsFiring)
		{
			StopFire(M);
		}
		M++;
		// [Loop Continue]
		goto J0x16;
	}
	// End:0x92
	if((BallisticAttachment(ThirdPersonActor) != none) && BallisticAttachment(ThirdPersonActor).StaggerAnim != 'None')
	{
		Instigator.SetAnimAction('Stagger');
	}
	//return;	
}

function OwnerEvent(name EventName)
{
	local Inventory Inv;

	// End:0x103
	if(Instigator.Weapon == self)
	{
		// End:0xAA
		if((((EventName == 'Dodged') && Class'BCoreProV55.BallisticReplicationInfo'.default.bWeaponJumpOffsetting) && !AimComponent.PendingForcedReaim()) && Instigator.IsA('BallisticPawn'))
		{
			ClientDodged();
			AimComponent.OnPlayerJumped();
			// End:0xA7
			if(!Class'BCoreProV55.BallisticReplicationInfo'.static.IsRealism())
			{
				NextCheckScopeTime = Level.TimeSeconds + 0.7500000;
			}			
		}
		else
		{
			// End:0x103
			if((((EventName == 'Jumped') || EventName == 'Dodged') && Class'BCoreProV55.BallisticReplicationInfo'.default.bWeaponJumpOffsetting) && !AimComponent.PendingForcedReaim())
			{
				AimComponent.OnPlayerJumped();
			}
		}
	}
	Inv = Inventory;
	J0x10E:

	// End:0x173 [Loop If]
	if(Inv != none)
	{
		// End:0x12C
		if(Ammunition(Inv) != none)
		{			
		}
		else
		{
			// End:0x159
			if((Weapon(Inv) != none) && Inv != Instigator.Weapon)
			{				
			}
			else
			{
				// [Explicit Break]
				goto J0x173;
			}
		}
		Inv = Inv.Inventory;
		// [Loop Continue]
		goto J0x10E;
	}
	J0x173:

	// End:0x192
	if(Inv != none)
	{
		Inv.OwnerEvent(EventName);
	}
	//return;	
}

simulated function PlayerSprint(bool bSprinting)
{
	// End:0x26
	if(!Class'BCoreProV55.BallisticReplicationInfo'.default.bWeaponJumpOffsetting)
	{
		AimComponent.OnPlayerSprint(false);
		return;
	}
	// End:0x49
	if(bScopeView && Instigator.IsLocallyControlled())
	{
		StopScopeView();
	}
	// End:0x54
	if(bAimDisabled)
	{
		return;
	}
	AimComponent.OnPlayerSprint(bSprinting);
	//return;	
}

simulated function ClientDodged()
{
	// End:0x1B
	if(int(Level.NetMode) != int(NM_Client))
	{
		return;
	}
	// End:0x55
	if(bScopeView && !Class'BCoreProV55.BallisticReplicationInfo'.static.IsRealism())
	{
		NextCheckScopeTime = Level.TimeSeconds + 0.7500000;
	}
	AimComponent.OnPlayerJumped();
	//return;	
}

simulated function ClientJumped()
{
	// End:0x1B
	if(int(Level.NetMode) != int(NM_Client))
	{
		return;
	}
	// End:0x53
	if(bScopeView && !Class'BCoreProV55.BallisticReplicationInfo'.static.IsRealism())
	{
		NextCheckScopeTime = Level.TimeSeconds + float(1);
	}
	AimComponent.OnPlayerJumped();
	//return;	
}

simulated function AddRecoil(float Recoil, float FireChaos, optional byte Mode)
{
	RcComponent.super(BallisticWeapon).AddRecoil(Recoil, Mode);
	AimComponent.AddFireChaos(FireChaos);
	//return;	
}

simulated function float GetFireChaos()
{
	return AimComponent.super(BallisticWeapon).GetFireChaos();
	//return;	
}

simulated function AddFireChaos(float Chaos)
{
	AimComponent.super(BallisticWeapon).AddFireChaos(Chaos);
	//return;	
}

simulated function byte GetRecoilParamsIndex()
{
	return byte(WeaponModes[int(CurrentWeaponMode)].RecoilParamsIndex);
	//return;	
}

simulated function int Handedness()
{
	return int(hand);
	//return;	
}

simulated function OnRecoilParamsChanged()
{
	// End:0x0F
	if(bBerserk)
	{
		UpdateBerserkRecoil();
	}
	//return;	
}

function InitWeaponFromTurret(BallisticTurret Turret)
{
	J0x00:
	// End:0x51 [Loop If]
	if((int(CurrentWeaponMode) >= WeaponModes.Length) || WeaponModes[int(CurrentWeaponMode)].bUnavailable)
	{
		// End:0x47
		if(int(CurrentWeaponMode) >= WeaponModes.Length)
		{
			CurrentWeaponMode = 0;			
		}
		else
		{
			CurrentWeaponMode++;
		}
		// [Loop Continue]
		goto J0x00;
	}
	// End:0x98
	if(!WeaponModes[int(CurrentWeaponMode)].bUnavailable)
	{
		CommonSwitchWeaponMode(CurrentWeaponMode);
		ClientSwitchWeaponMode(CurrentWeaponMode);
		NetUpdateTime = Level.TimeSeconds - float(1);
	}
	//return;	
}

simulated function ClientInitWeaponFromTurret(BallisticTurret Turret)
{
	//return;	
}

function InitTurretWeapon(BallisticTurret Turret)
{
	//return;	
}

function InitWeaponFromAutoTurret(BallisticAutoTurret AutoTurret)
{
	//return;	
}

simulated function ClientInitWeaponFromAutoTurret(BallisticAutoTurret AutoTurret)
{
	//return;	
}

function InitAutoTurretWeapon(BallisticAutoTurret AutoTurret)
{
	//return;	
}

simulated function GetAmmoCount(out float MaxAmmoPrimary, out float CurAmmoPrimary)
{
	// End:0x0F
	if(Ammo[0] == none)
	{
		return;
	}
	// End:0x4B
	if(bNoMag)
	{
		MaxAmmoPrimary = float(Ammo[0].MaxAmmo);
		CurAmmoPrimary = float(Ammo[0].AmmoAmount);		
	}
	else
	{
		MaxAmmoPrimary = float(WeaponParams.MagAmmo);
		CurAmmoPrimary = float(MagAmmo);
	}
	//return;	
}

static final simulated function Font GetFontSizeIndex(Canvas C, int FontSize)
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
	return Class'XInterface.HudBase'.static.LoadFontStatic(Clamp(8 - FontSize, 0, 8));
	//return;	
}

simulated function string GetHUDAmmoText(int Mode)
{
	// End:0x28
	if(Ammo[Mode] != none)
	{
		return string(Ammo[Mode].AmmoAmount);
	}
	return "";
	//return;	
}

simulated function NewDrawWeaponInfo(Canvas C, float YPos)
{
	local float ScaleFactor, XL, YL, YL2;
	local string Temp;

	super.NewDrawWeaponInfo(C, YPos);
	DrawCrosshairs(C);
	// End:0x26
	if(bSkipDrawWeaponInfo)
	{
		return;
	}
	ScaleFactor = C.ClipX / float(1600);
	C.Font = GetFontSizeIndex(C, -2 + int(float(2) * Class'Engine.HUD'.default.HudScale));
	C.DrawColor = Class'Engine.HUD'.default.WhiteColor;
	// End:0x1A5
	if(!bNoMag)
	{
		Temp = GetHUDAmmoText(0);
		// End:0xD9
		if(Temp == "0")
		{
			C.DrawColor = Class'Engine.HUD'.default.RedColor;
		}
		C.TextSize(Temp, XL, YL);
		C.CurX = (C.ClipX - ((float(20) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - XL;
		C.CurY = (C.ClipY - ((float(120) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - YL;
		C.DrawText(Temp, false);
		C.DrawColor = Class'Engine.HUD'.default.WhiteColor;
	}
	// End:0x2CA
	if((Ammo[1] != none) && Ammo[1] != Ammo[0])
	{
		Temp = GetHUDAmmoText(1);
		// End:0x1FE
		if(Temp == "0")
		{
			C.DrawColor = Class'Engine.HUD'.default.RedColor;
		}
		C.TextSize(Temp, XL, YL);
		C.CurX = (C.ClipX - ((float(160) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - XL;
		C.CurY = (C.ClipY - ((float(120) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - YL;
		C.DrawText(Temp, false);
		C.DrawColor = Class'Engine.HUD'.default.WhiteColor;
	}
	// End:0x418
	if(((int(CurrentWeaponMode) < WeaponModes.Length) && !WeaponModes[int(CurrentWeaponMode)].bUnavailable) && WeaponModes[int(CurrentWeaponMode)].ModeName != "")
	{
		C.Font = GetFontSizeIndex(C, -3 + int(float(2) * Class'Engine.HUD'.default.HudScale));
		C.TextSize(WeaponModes[int(CurrentWeaponMode)].ModeName, XL, YL2);
		C.CurX = (C.ClipX - ((float(15) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - XL;
		C.CurY = ((C.ClipY - ((float(130) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - YL2) - YL;
		C.DrawText(WeaponModes[int(CurrentWeaponMode)].ModeName, false);
	}
	//return;	
}

final simulated function DrawSimpleCrosshairBars(Canvas C, int XOffset, int YOffset)
{
	local int ShortBound, LongBound;
	local Color SavedDrawColor;

	SavedDrawColor = C.DrawColor;
	ShortBound = 2;
	LongBound = 10;
	// End:0x53
	if(!bNoMag && MagAmmo == 0)
	{
		C.DrawColor = MagEmptyColor;		
	}
	else
	{
		// End:0x73
		if(bNeedCock)
		{
			C.DrawColor = CockingColor;			
		}
		else
		{
			C.DrawColor = CrossHairColor;
		}
	}
	C.SetPos((C.ClipX / float(2)) - float(LongBound + XOffset), (C.ClipY / float(2)) - float(ShortBound / 2));
	C.DrawTileStretched(Texture'Engine.WhiteTexture', float(LongBound), float(ShortBound));
	C.SetPos((C.ClipX / float(2)) + float(XOffset), (C.ClipY / float(2)) - float(ShortBound / 2));
	C.DrawTileStretched(Texture'Engine.WhiteTexture', float(LongBound), float(ShortBound));
	C.SetPos((C.ClipX / float(2)) - float(ShortBound / 2), (C.ClipY / float(2)) - float(LongBound + YOffset));
	C.DrawTileStretched(Texture'Engine.WhiteTexture', float(ShortBound), float(LongBound));
	C.SetPos((C.ClipX / float(2)) - float(ShortBound / 2), (C.ClipY / float(2)) + float(YOffset));
	C.DrawTileStretched(Texture'Engine.WhiteTexture', float(ShortBound), float(LongBound));
	// End:0x2D7
	if(bDrawCrosshairDot)
	{
		C.DrawColor.A = SavedDrawColor.A;
		C.SetPos((C.ClipX / float(2)) - float(1), (C.ClipY / float(2)) - float(1));
		C.DrawTileStretched(Texture'Engine.WhiteTexture', 2.0000000, 2.0000000);
	}
	C.DrawColor = SavedDrawColor;
	//return;	
}

simulated function DrawSimpleCrosshairs(Canvas C)
{
	local float OffsetAdjustment;

	// End:0x3E
	if(!bScopeView)
	{
		OffsetAdjustment = AimComponent.CalcCrosshairOffset(C);
		DrawSimpleCrosshairBars(C, int(OffsetAdjustment), int(OffsetAdjustment));
	}
	//return;	
}

simulated function DrawGraphicalCrosshairs(Canvas C)
{
	local IntBox Size;
	local NonDefCrosshairCfg CHCfg;
	local float ScaleFactor;

	ScaleFactor = C.ClipX / float(1600);
	// End:0x3D
	if(bGlobalCrosshair)
	{
		CHCfg = Class'BCoreProV55.BallisticWeapon'.default.NDCrosshairCfg;		
	}
	else
	{
		CHCfg = NDCrosshairCfg;
	}
	Size.X1 = int((((float(CHCfg.StartSize1) * NDCrosshairInfo.SizeFactors.X1) * (float(1) + (NDCrosshairInfo.CurrentScale * NDCrosshairInfo.SpreadRatios.X1))) * ScaleFactor) * Class'Engine.HUD'.default.CrosshairScale);
	Size.Y1 = int((((float(CHCfg.StartSize1) * NDCrosshairInfo.SizeFactors.Y1) * (float(1) + (NDCrosshairInfo.CurrentScale * NDCrosshairInfo.SpreadRatios.Y1))) * ScaleFactor) * Class'Engine.HUD'.default.CrosshairScale);
	Size.X2 = int((((float(CHCfg.StartSize2) * NDCrosshairInfo.SizeFactors.X2) * (float(1) + (NDCrosshairInfo.CurrentScale * NDCrosshairInfo.SpreadRatios.X2))) * ScaleFactor) * Class'Engine.HUD'.default.CrosshairScale);
	Size.Y2 = int((((float(CHCfg.StartSize2) * NDCrosshairInfo.SizeFactors.Y2) * (float(1) + (NDCrosshairInfo.CurrentScale * NDCrosshairInfo.SpreadRatios.Y2))) * ScaleFactor) * Class'Engine.HUD'.default.CrosshairScale);
	// End:0x2E3
	if(CHCfg.Pic1 != none)
	{
		C.DrawColor = CHCfg.Color1;
		// End:0x238
		if(bScopeView)
		{
			C.DrawColor.A = byte(float(C.DrawColor.A) / 1.3000000);
		}
		C.SetPos((C.ClipX / float(2)) - float(Size.X1 / 2), (C.ClipY / float(2)) - float(Size.Y1 / 2));
		C.DrawTile(CHCfg.Pic1, float(Size.X1), float(Size.Y1), 0.0000000, 0.0000000, float(CHCfg.USize1), float(CHCfg.VSize1));
	}
	// End:0x3F2
	if(CHCfg.Pic2 != none)
	{
		C.DrawColor = CHCfg.Color2;
		// End:0x347
		if(bScopeView)
		{
			C.DrawColor.A = byte(float(C.DrawColor.A) / 1.5000000);
		}
		C.SetPos((C.ClipX / float(2)) - float(Size.X2 / 2), (C.ClipY / float(2)) - float(Size.Y2 / 2));
		C.DrawTile(CHCfg.Pic2, float(Size.X2), float(Size.Y2), 0.0000000, 0.0000000, float(CHCfg.USize2), float(CHCfg.VSize2));
	}
	//return;	
}

simulated function DrawCrosshairs(Canvas C)
{
	// End:0x3A
	if((PlayerController(Instigator.Controller) == none) || Instigator.IsFirstPerson() && bScopeView)
	{
		return;
	}
	switch(CrosshairMode)
	{
		// End:0x54
		case 0:
			DrawSimpleCrosshairs(C);
			// End:0x72
			break;
		// End:0x67
		case 1:
			DrawGraphicalCrosshairs(C);
			// End:0x72
			break;
		// End:0x6F
		case 2:
			// End:0x72
			break;
		// End:0xFFFF
		default:
			break;
	}
	//return;	
}

simulated function TargetedHurtRadius(float DamageAmount, float DamageRadius, Class<DamageType> DamageType, float Momentum, Vector HitLocation, optional Pawn ExcludedPawn)
{
	local Actor Target;
	local float damageScale, dist;
	local Vector Dir;
	local UnlaggedPawnCollision col;

	// End:0x0B
	if(bHurtEntry)
	{
		return;
	}
	bHurtEntry = true;
	// End:0x19A
	foreach VisibleCollidingActors(Class'Engine.Actor', Target, DamageRadius, HitLocation)
	{
		// End:0x199
		if((((Target != self) && int(Target.Role) == int(ROLE_Authority)) && FluidSurfaceInfo(Target) == none) && Target != ExcludedPawn)
		{
			col = UnlaggedPawnCollision(Target);
			// End:0xAF
			if((col != none) && col.UnlaggedPawn == ExcludedPawn)
			{
				continue;				
			}
			Dir = Target.Location - HitLocation;
			dist = FMax(1.0000000, VSize(Dir));
			Dir = Dir / dist;
			damageScale = 1.0000000 - FMax(0.0000000, (dist - Target.CollisionRadius) / DamageRadius);
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Target, damageScale * DamageAmount, Instigator, Target.Location - ((0.5000000 * (Target.CollisionHeight + Target.CollisionRadius)) * Dir), (damageScale * Momentum) * Dir, DamageType);
		}		
	}	
	bHurtEntry = false;
	//return;	
}

final simulated exec function SetDefaultMode()
{
	SavedWeaponMode = CurrentWeaponMode;
	Instigator.ClientMessage(((("Default mode for" @ ItemName) @ "is now") @ WeaponModes[int(SavedWeaponMode)].ModeName) $ ".");
	SaveConfig();
	//return;	
}

final simulated exec function ClearDefaultMode()
{
	SavedWeaponMode = default.CurrentWeaponMode;
	Instigator.ClientMessage(("Cleared default mode for" @ ItemName) $ ".");
	SaveConfig();
	//return;	
}

final simulated exec function GetDefaultMode()
{
	// End:0x40
	if(int(SavedWeaponMode) == 255)
	{
		Instigator.ClientMessage(("No mode saved for " @ ItemName) $ ".");		
	}
	else
	{
		Instigator.ClientMessage(((("Default mode for" @ ItemName) $ ":") @ WeaponModes[int(SavedWeaponMode)].ModeName) $ ".");
	}
	//return;	
}

simulated function Vector ConvertFOVs(Vector InVec, float InFOV, float OutFOV, float Distance)
{
	local Vector ViewLoc, Outvec, Dir, X, Y, Z;

	local Rotator ViewRot;

	ViewLoc = Instigator.Location + Instigator.EyePosition();
	ViewRot = Instigator.GetViewRotation();
	Dir = InVec - ViewLoc;
	GetAxes(ViewRot, X, Y, Z);
	Outvec.X = Distance / Tan((OutFOV * 3.1415930) / float(360));
	Outvec.Y = ((Dir Dot Y) * (Distance / Tan((InFOV * 3.1415930) / float(360)))) / (Dir Dot X);
	Outvec.Z = ((Dir Dot Z) * (Distance / Tan((InFOV * 3.1415930) / float(360)))) / (Dir Dot X);
	Outvec = Outvec >> ViewRot;
	return Outvec + ViewLoc;
	//return;	
}

simulated function Vector GetEffectStart()
{
	// End:0x5D
	if(Instigator.IsFirstPerson())
	{
		// End:0x22
		if(WeaponCentered())
		{
			return CenteredEffectStart();
		}
		return ConvertFOVs(GetBoneCoords('tip').Origin, DisplayFOV, Instigator.Controller.FovAngle, 32.0000000);		
	}
	else
	{
		return (Instigator.Location + (Instigator.EyeHeight * vect(0.0000000, 0.0000000, 0.5000000))) + (Vector(Instigator.Rotation) * 40.0000000);
	}
	//return;	
}

simulated function DebugMessage(coerce string Message)
{
	// End:0x86
	if(PlayerController(Instigator.Controller) != none)
	{
		// End:0x59
		if(int(Role) == int(ROLE_Authority))
		{
			PlayerController(Instigator.Controller).ClientMessage("SERVER:" @ Message);			
		}
		else
		{
			PlayerController(Instigator.Controller).ClientMessage("CLIENT:" @ Message);
		}
	}
	//return;	
}

exec function AlignHelp()
{
	Instigator.ClientMessage("BWBrassOff[X,Y,Z]; BWCenteredOffset; BWPlayerOffset[X,Y,Z]; BWDisplayFOV; BWDrawScale; BWSightOffset[X,Y,Z];");
	//return;	
}

exec function BWBrassOffX(float V)
{
	bFireMode[0].BrassOffset.X = V;
	BrassMessage();
	//return;	
}

exec function BWBrassOffY(float V)
{
	bFireMode[0].BrassOffset.Y = V;
	BrassMessage();
	//return;	
}

exec function BWBrassOffZ(float V)
{
	bFireMode[0].BrassOffset.Z = V;
	BrassMessage();
	//return;	
}

function BrassMessage()
{
	Instigator.ClientMessage("BrassOffset is " $ string(bFireMode[0].BrassOffset));
	//return;	
}

exec function BWCenteredOffset(float F)
{
	CenteredOffsetY = F;
	default.CenteredOffsetY = F;
	Instigator.ClientMessage("CenteredOffset: Y" $ string(CenteredOffsetY));
	//return;	
}

exec function BWPlayerOffsetX(float F)
{
	PlayerViewOffset.X = F;
	default.PlayerViewOffset.X = F;
	RVMessage();
	//return;	
}

exec function BWPlayerOffsetY(float F)
{
	PlayerViewOffset.Y = F;
	default.PlayerViewOffset.Y = F;
	RVMessage();
	//return;	
}

exec function BWPlayerOffsetZ(float F)
{
	PlayerViewOffset.Z = F;
	default.PlayerViewOffset.Z = F;
	RVMessage();
	//return;	
}

exec function BWDisplayFOV(float F)
{
	DisplayFOV = F;
	default.DisplayFOV = F;
	RVMessage();
	//return;	
}

exec function BWDrawScale(float F)
{
	SetDrawScale(F);
	RVMessage();
	//return;	
}

function RVMessage()
{
	Instigator.ClientMessage((((((((("PlayerViewOffset: X: " $ string(PlayerViewOffset.X)) $ ", Y: ") $ string(PlayerViewOffset.Y)) $ ", Z: ") $ string(PlayerViewOffset.Z)) $ ", Scale: ") $ string(DrawScale)) $ ", FOV: ") $ string(DisplayFOV));
	//return;	
}

exec function BWSightOffsetX(float F)
{
	SightOffset.X = F;
	default.SightOffset.X = F;
	SVMessage();
	//return;	
}

exec function BWSightOffsetY(float F)
{
	SightOffset.Y = F;
	default.SightOffset.Y = F;
	SVMessage();
	//return;	
}

exec function BWSightOffsetZ(float F)
{
	SightOffset.Z = F;
	default.SightOffset.Z = F;
	SVMessage();
	//return;	
}

function SVMessage()
{
	Instigator.ClientMessage((((((((("SightOffset: X: " $ string(SightOffset.X)) $ ", Y: ") $ string(SightOffset.Y)) $ ", Z: ") $ string(SightOffset.Z)) $ ", Scale: ") $ string(DrawScale)) $ ", Sight Display FOV: ") $ string(SightDisplayFOV));
	//return;	
}

exec function ClimbTime(float F)
{
	// End:0x36
	if(int(Level.NetMode) == int(NM_Standalone))
	{
		RcComponent.Params.ClimbTime = F;
	}
	//return;	
}

exec function DeclineDelay(float F)
{
	// End:0x2D
	if(int(Level.NetMode) == int(NM_Standalone))
	{
		RcComponent.DeclineDelay = F;
	}
	//return;	
}

exec function DeclineTime(float F)
{
	// End:0x2D
	if(int(Level.NetMode) == int(NM_Standalone))
	{
		RcComponent.DeclineTime = F;
	}
	//return;	
}

exec function PrimaryRecoil(float F)
{
	// End:0x2F
	if(int(Level.NetMode) == int(NM_Standalone))
	{
		bFireMode[0].FireRecoil = F;
	}
	//return;	
}

exec function ADSSway(float F)
{
	// End:0x36
	if(int(Level.NetMode) == int(NM_Standalone))
	{
		AimComponent.Params.ADSMultiplier = F;
	}
	//return;	
}

exec function ADSBind(float F)
{
	// End:0x36
	if(int(Level.NetMode) == int(NM_Standalone))
	{
		RcComponent.Params.ADSViewBindFactor = F;
	}
	//return;	
}

exec function EscapeMult(float F)
{
	// End:0x36
	if(int(Level.NetMode) == int(NM_Standalone))
	{
		RcComponent.Params.EscapeMultiplier = F;
	}
	//return;	
}

delegate DumpHead(array<WeaponRecord> Recs)
{
	//return;	
}

delegate DumpLine(Class<BallisticWeapon> Weap, int Line)
{
	//return;	
}

delegate DumpTail(array<WeaponRecord> Recs)
{
	//return;	
}

function DumpClassWeapInfo()
{
	local Class<BallisticWeapon> Weap;
	local int i, j;
	local array<WeaponRecord> Recs;

	// End:0x1B
	if(int(Level.NetMode) != int(NM_Standalone))
	{
		return;
	}
	Class'Engine.CacheManager'.static.GetWeaponList(Recs);
	DumpHead(Recs);
	i = 0;
	J0x42:

	// End:0xD5 [Loop If]
	if(i < Recs.Length)
	{
		// End:0x7F
		if(!Class'BCoreProV55.BC_WeaponInfoCache'.static.AutoWeaponInfo(Recs[i].ClassName).bIsBW)
		{
			// [Explicit Continue]
			goto J0xCB;
		}
		Weap = Class<BallisticWeapon>(DynamicLoadObject(Recs[i].ClassName, Class'Core.Class'));
		// End:0xCB
		if(Weap != none)
		{
			DumpLine(Weap, j);
			j++;
		}
		J0xCB:

		i++;
		// [Loop Continue]
		goto J0x42;
	}
	Class'BCoreProV55.BC_WeaponInfoCache'.static.EndSession();
	DumpTail(Recs);
	//return;	
}

delegate DumpIHead()
{
	//return;	
}

delegate DumpILine(BallisticWeapon Weap, int Line)
{
	//return;	
}

delegate DumpITail(int Count)
{
	//return;	
}

function DumpInvWeapInfo()
{
	local Inventory Inv;
	local int i;

	// End:0x1B
	if(int(Level.NetMode) != int(NM_Standalone))
	{
		return;
	}
	DumpIHead();
	Inv = Instigator.Inventory;
	J0x39:

	// End:0x8B [Loop If]
	if(Inv != none)
	{
		// End:0x74
		if(BallisticWeapon(Inv) != none)
		{
			DumpILine(BallisticWeapon(Inv), i);
			i++;
		}
		Inv = Inv.Inventory;
		// [Loop Continue]
		goto J0x39;
	}
	DumpITail(i);
	//return;	
}

exec function DumpRVInfo()
{
	__DumpIHead__Delegate = DumpRVHead;
	__DumpILine__Delegate = DumpRVLine;
	__DumpITail__Delegate = DumpRVTail;
	DumpInvWeapInfo();
	//return;	
}

function DumpRVHead()
{
	local string S;

	S = "Dumping Review stuff for equiped weapons:";
	Log(S);
	Instigator.ClientMessage(S);
	//return;	
}

function DumpRVLine(BallisticWeapon Weap, int Line)
{
	Log((((((((((string(Line) $ " ") $ Weap.ItemName) $ "::PlayerViewOffset ") $ string(Weap.PlayerViewOffset)) $ ", DisplayFov ") $ string(Weap.DisplayFOV)) $ ", DrawScale ") $ string(Weap.DrawScale)) $ ", CenteredOffsetY ") $ string(Weap.CenteredOffsetY));
	//return;	
}

function DumpRVTail(int Count)
{
	local string S;

	S = ("Review stuff for " $ string(Count)) $ " weapons:";
	Log(S);
	Instigator.ClientMessage(S);
	//return;	
}

exec function DumpSightInfo()
{
	__DumpHead__Delegate = DumpSightHead;
	__DumpLine__Delegate = DumpSightLine;
	__DumpTail__Delegate = None;
	DumpClassWeapInfo();
	//return;	
}

function DumpSightHead(array<WeaponRecord> Recs)
{
	local string S;

	S = ("Dumping Sight stuff: " $ string(Recs.Length)) $ " Weapons found.";
	Log(S);
	Instigator.ClientMessage(S);
	//return;	
}

function DumpSightLine(Class<BallisticWeapon> Weap, int Line)
{
	Log((((((((((((string(Line) $ " ") $ Weap.default.ItemName) $ "::SightOffset ") $ string(Weap.default.SightOffset)) $ ", SightPivot ") $ string(Weap.default.SightPivot)) $ ", SightDisplayFOV ") $ string(Weap.default.SightDisplayFOV)) $ ", SightBone ") $ string(Weap.default.SightBone)) $ ", FullZoomFOV ") $ string(Weap.default.FullZoomFOV));
	//return;	
}

simulated function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
{
	local string S;

	super.DisplayDebug(Canvas, YL, YPos);
	Canvas.SetDrawColor(byte(255), 128, 0);
	S = "Ballistic Weapon: ReloadState: ";
	switch(ReloadState)
	{
		// End:0x75
		case 0:
			S = S $ "None";
			// End:0x179
			break;
		// End:0x96
		case 1:
			S = S $ "PreClipOut";
			// End:0x179
			break;
		// End:0xB6
		case 2:
			S = S $ "PreClipIn";
			// End:0x179
			break;
		// End:0xD7
		case 3:
			S = S $ "PostClipIn";
			// End:0x179
			break;
		// End:0xF9
		case 4:
			S = S $ "StartShovel";
			// End:0x179
			break;
		// End:0x116
		case 5:
			S = S $ "Shovel";
			// End:0x179
			break;
		// End:0x138
		case 6:
			S = S $ "PostShellIn";
			// End:0x179
			break;
		// End:0x158
		case 7:
			S = S $ "EndShovel";
			// End:0x179
			break;
		// End:0x176
		case 8:
			S = S $ "Cocking";
			// End:0x179
			break;
		// End:0xFFFF
		default:
			break;
	}
	S $= " MeleeState: ";
	switch(MeleeState)
	{
		// End:0x1AF
		case 0:
			S $= "None";
			// End:0x222
			break;
		// End:0x1C9
		case 1:
			S $= "Pending";
			// End:0x222
			break;
		// End:0x1E0
		case 2:
			S $= "Held";
			// End:0x222
			break;
		// End:0x1FB
		case 3:
			S $= "Striking";
			// End:0x222
			break;
		// End:0x21F
		case 4:
			S $= "Striking, Pending";
			// End:0x222
			break;
		// End:0xFFFF
		default:
			break;
	}
	S = (((((S $ ", MagAmmo: ") $ string(MagAmmo)) $ ", WeaponMode: ") $ WeaponModes[int(CurrentWeaponMode)].ModeName) $ ", FireCount: ") $ string(FireCount);
	Canvas.DrawText(S);
	YPos += YL;
	Canvas.SetPos(4.0000000, YPos);
	Canvas.DrawText((((((("bNeedCock: " $ string(bNeedCock)) $ ", bNeedReload: ") $ string(bNeedReload)) $ ", bPreventReload: ") $ string(bPreventReload)) $ ", bServerReloading: ") $ string(bServerReloading));
	YPos += YL;
	Canvas.SetPos(4.0000000, YPos);
	YPos = float(RcComponent.DrawDebug(Canvas, int(YPos), int(YL)));
	YPos += YL;
	Canvas.SetPos(4.0000000, YPos);
	AimComponent.DrawDebug(Canvas);
	YPos += YL;
	Canvas.SetPos(4.0000000, YPos);
	//return;	
}

simulated function UpdatePenetrationStatus(int Count)
{
	// End:0x16
	if(Count > 0)
	{
		bHasPenetrated = true;		
	}
	else
	{
		bHasPenetrated = false;
	}
	//return;	
}

final simulated function bool HasSecondaryAmmo()
{
	return (Ammo[1] != none) && Ammo[1] != Ammo[0];
	//return;	
}

final simulated function ClientWeaponReloaded()
{
	bNeedReload = false;
	//return;	
}

static final simulated function int GetPickupMagAmmo()
{
	local int i;

	i = int(Class'BCoreProV55.BallisticReplicationInfo'.default.GameStyle);
	// End:0x90
	if(default.ParamsClasses[i] == none)
	{
		Log(((default.ItemName $ "::GetPickupMagAmmo: No params found for game style ") $ string(Class'BCoreProV55.BallisticReplicationInfo'.default.GameStyle)) $ ": Falling back");
		i = 0;
	}
	return default.ParamsClasses[i].default.Layouts[0].MagAmmo;
	//return;	
}

static final simulated function int GetInventorySize()
{
	local int i;

	i = int(Class'BCoreProV55.BallisticReplicationInfo'.default.GameStyle);
	// End:0x90
	if(default.ParamsClasses[i] == none)
	{
		Log(((default.ItemName $ "::GetInventorySize: No params found for game style ") $ string(Class'BCoreProV55.BallisticReplicationInfo'.default.GameStyle)) $ ": Falling back");
		i = 0;
	}
	return int(default.ParamsClasses[i].default.Layouts[0].InventorySize);
	//return;	
}

static function string GetManual()
{
	local string S;

	S = ((Class'XInterface.GUIComponent'.static.MakeColorCode(default.HeaderColor) $ "Description") $ Class'XInterface.GUIComponent'.static.MakeColorCode(default.TextColor)) $ "|";
	S $= (default.Description $ "||");
	// End:0x6B
	if(default.ManualLines.Length < 3)
	{
		return S;
	}
	S $= (((Class'XInterface.GUIComponent'.static.MakeColorCode(default.HeaderColor) $ "Primary Fire") $ Class'XInterface.GUIComponent'.static.MakeColorCode(default.TextColor)) $ "|");
	S $= (default.ManualLines[0] $ "||");
	S $= (((Class'XInterface.GUIComponent'.static.MakeColorCode(default.HeaderColor) $ "Alt Fire") $ Class'XInterface.GUIComponent'.static.MakeColorCode(default.TextColor)) $ "|");
	S $= (default.ManualLines[1] $ "||");
	S $= (((Class'XInterface.GUIComponent'.static.MakeColorCode(default.HeaderColor) $ "Additional Information") $ Class'XInterface.GUIComponent'.static.MakeColorCode(default.TextColor)) $ "|");
	S $= default.ManualLines[2];
	return S;
	//return;	
}

static function string GetShortManual(optional int LayoutIndex)
{
	local string S;

	S $= (((Class'XInterface.GUIComponent'.static.MakeColorCode(default.HeaderColor) $ "Basic Stats") $ Class'XInterface.GUIComponent'.static.MakeColorCode(default.TextColor)) $ "|");
	S $= default.ParamsClasses[int(Class'BCoreProV55.BallisticReplicationInfo'.default.GameStyle)].default.Layouts[LayoutIndex].FireParams[0].BuildShortManualString();
	S $= default.ParamsClasses[int(Class'BCoreProV55.BallisticReplicationInfo'.default.GameStyle)].default.Layouts[LayoutIndex].BuildShortManualString();
	S $= "||";
	// End:0x13A
	if(default.ManualLines.Length < 3)
	{
		S $= ((Class'XInterface.GUIComponent'.static.MakeColorCode(default.HeaderColor) $ "No further information available.") $ Class'XInterface.GUIComponent'.static.MakeColorCode(default.TextColor));
		return S;
	}
	S $= (((Class'XInterface.GUIComponent'.static.MakeColorCode(default.HeaderColor) $ "Primary Fire") $ Class'XInterface.GUIComponent'.static.MakeColorCode(default.TextColor)) $ "|");
	S $= (default.ManualLines[0] $ "||");
	S $= (((Class'XInterface.GUIComponent'.static.MakeColorCode(default.HeaderColor) $ "Alt Fire") $ Class'XInterface.GUIComponent'.static.MakeColorCode(default.TextColor)) $ "|");
	S $= (default.ManualLines[1] $ "||");
	S $= (((Class'XInterface.GUIComponent'.static.MakeColorCode(default.HeaderColor) $ "Additional Information") $ Class'XInterface.GUIComponent'.static.MakeColorCode(default.TextColor)) $ "|");
	S $= default.ManualLines[2];
	return S;
	//return;	
}

state PendingClientWeaponSet
{
	simulated function Timer()
	{
		// End:0x1C
		if(Pawn(Owner) != none)
		{
			ClientWeaponSet(bPendingSwitch);
		}
		// End:0x30
		if(IsInState('PendingClientWeaponSet'))
		{
			SetTimer(0.0500000, false);
		}
		// End:0x4A
		if(bPendingBringupTimer)
		{
			SetTimer(BringUpTime, false);
			bPendingBringupTimer = false;
		}
		//return;		
	}

	simulated function BeginState()
	{
		SetTimer(0.0500000, false);
		//return;		
	}

	simulated function EndState()
	{
		//return;		
	}
	stop;	
}

defaultproperties
{
	LastWeaponMode=255
	SavedWeaponMode=255
	SpecialInfo[0]=(Id="EvoDefs",Info="0.0;10.0;0.5;50.0;0.2;0.2;0.1")
	MagEmptyColor=(R=255,G=50,B=50,A=150)
	CockingColor=(R=255,G=175,B=50,A=150)
	CrossHairColor=(R=255,G=225,B=255,A=150)
	NetInventoryGroup=255
	AIReloadTime=2.0000000
	SightAnimScale=1.0000000
	BigIconCoords=(X1=0,Y1=48,X2=511,Y2=212)
	bAllowWeaponInfoOverride=true
	IdleTweenTime=0.2000000
	BringUpSound=(Sound=none,Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=none,Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_Burst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=2
	SightFXBone="tip"
	bUseSights=true
	ScopeXScale=1.0000000
	ScopeScale=1.0000000
	ZoomTimeMod=1.0000000
	SightDisplayFOV=30.0000000
	MinFixedZoomLevel=0.0500000
	MinZoom=1.0000000
	MaxZoom=2.0000000
	ZoomStages=2
	SightZoomFactor=1.3500000
	FullZoomFOV=80.0000000
	SMuzzleFlashOffset=(X=25.0000000,Y=0.0000000,Z=-15.0000000)
	SightBobScale=0.1500000
	CockAnim="Cock"
	CockAnimPostReload="ReloadEndCock"
	CockSelectAnim="PulloutFancy"
	CockSound=(Sound=none,Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	CockSelectSound=(Sound=none,Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ReloadAnim="Reload"
	ReloadEmptyAnim="ReloadEmpty"
	ClipHitSound=(Sound=none,Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipOutSound=(Sound=none,Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=none,Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.9000000
	ShovelIncrement=1
	bPlayThirdPersonReload=true
	FireAnimCutThreshold=0.6000000
	bDrawCrosshairDot=true
	NDCrosshairCfg=(Pic1=none,Pic2=none,USize1=128,VSize1=128,USize2=128,VSize2=128,Color1=(R=255,G=0,B=0,A=255),Color2=(R=255,G=255,B=0,A=255),StartSize1=96,StartSize2=96)
	NDCrosshairInfo=(SpreadRatios=(X1=0.5000000,Y1=0.5000000,X2=0.5000000,Y2=0.7500000),SizeFactors=(X1=1.0000000,Y1=1.0000000,X2=1.0000000,Y2=1.0000000),MaxScale=4.0000000,CurrentScale=0.0000000)
	NDCrosshairChaosFactor=0.4000000
	NDCrosshairScaleFactor=1.0000000
	LongGunPivot=(Pitch=-4000,Yaw=-12000,Roll=0)
	LongGunOffset=(X=5.0000000,Y=10.0000000,Z=-11.0000000)
	HeaderColor=(R=255,G=50,B=50,A=0)
	TextColor=(R=255,G=175,B=0,A=0)
	SightingTime=0.3500000
	SightOffset=(X=0.0000000,Y=0.0000000,Z=2.5000000)
	MagAmmo=30
	CockAnimRate=1.0000000
	CockSelectAnimRate=1.0000000
	ReloadAnimRate=1.0000000
	StartShovelAnimRate=1.0000000
	EndShovelAnimRate=1.0000000
	GunLength=64.0000000
	SelectAnim="Pullout"
	PutDownAnim="putaway"
	SelectAnimRate=1.0000000
	PutDownAnimRate=1.0000000
	PutDownTime=0.3000000
	BringUpTime=0.3000000
	bNoAmmoInstances=false
	DisplayFOV=75.0000000
	Priority=2
	CenteredOffsetY=0.0000000
	CenteredRoll=500
	CustomCrosshair=7
	BobDamping=1.7000000
	ItemName="BallisticWeapon"
	LightPeriod=3
	Skins[0]=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny'
	AmbientGlow=12
	TransientSoundVolume=0.5000000
}
