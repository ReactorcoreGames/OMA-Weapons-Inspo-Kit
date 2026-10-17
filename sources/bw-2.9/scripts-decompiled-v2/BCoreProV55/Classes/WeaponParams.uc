class WeaponParams extends Object;

enum EZoomType
{
	ZT_Irons,                       // 0
	ZT_Fixed,                       // 1
	ZT_Logarithmic,                 // 2
	ZT_Minimum,                     // 3
	ZT_Smooth                       // 4
};

struct MaterialSwap
{
	var() Material Material;
	var() string MaterialName;
	var() int Index;
	var() int pIndex;
	var() int AIndex;
};

struct BoneScale
{
	var() name BoneName;
	var() int Slot;
	var() float Scale;
};

struct GunAugment
{
	var() Class<BallisticGunAugment> GunAugmentClass;
	var() name BoneName;
	var() float Scale;
	var() Vector AugmentOffset;
	var() Rotator AugmentRot;
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

var() int Weight;
var() string LayoutName;
var() string LayoutDescription;
var() string LayoutTags;
var() float PlayerSpeedFactor;
var() float PlayerJumpFactor;
var() byte InventorySize;
var() byte MaxInventoryCount;
var() int WeaponPrice;
var() float CockAnimRate;
var() float ReloadAnimRate;
var() float SightMoveSpeedFactor;
var() float SightingTime;
var() int SightDisplayFOV;
var() Vector SightOffset;
var() Rotator SightPivot;
var() WeaponParams.EZoomType ZoomType;
var() Material ScopeViewTex;
var() float ScopeScale;
var() float MinZoom;
var() float MaxZoom;
var() int ZoomStages;
var() bool bAdjustHands;
var() Rotator WristAdjust;
var() Rotator RootAdjust;
var() array<MaterialSwap> WeaponMaterialSwaps;
var() array<BoneScale> WeaponBoneScales;
var() array<MaterialSwap> AttachmentMaterialSwaps;
var() Vector ViewOffset;
var() Rotator ViewPivot;
var() string WeaponName;
var() Mesh LayoutMesh;
var() Mesh AttachmentMesh;
var() StaticMesh PickupMesh;
var() float PickupDrawScale;
var() array<GunAugment> GunAugments;
var() array<int> AllowedCamos;
var() float DisplaceDurationMult;
var() int MagAmmo;
var() bool bMagPlusOne;
var() bool bNeedCock;
var() bool bDualBlocked;
var() bool bDualMixing;
var() int InitialWeaponMode;
var() array<WeaponModeType> WeaponModes;
var() editinline array<editinline RecoilParams> RecoilParams;
var() editinline array<editinline AimParams> AimParams;
var() editinline array<editinline FireParams> FireParams;
var() editinline array<editinline FireParams> AltFireParams;
var bool bNoaltfire;

final function FireModeStats GetFireStats()
{
	local FireModeStats FS;

	// End:0x1E
	if(FireParams.Length > 0)
	{
		return FireParams[0].GetStats();
	}
	return FS;
	//return;	
}

final function FireModeStats GetAltFireStats()
{
	local FireModeStats FS;

	// End:0x1E
	if(AltFireParams.Length > 0)
	{
		return AltFireParams[0].GetStats();
	}
	return FS;
	//return;	
}

final function string BuildShortManualString()
{
	local string S;

	S = ("Mag Ammo: " $ string(MagAmmo)) $ "|";
	S $= (("ADS Speed: " $ string(SightingTime)) $ " seconds|");
	return S;
	//return;	
}

defaultproperties
{
	PlayerSpeedFactor=1.0000000
	PlayerJumpFactor=1.0000000
	InventorySize=6
	WeaponPrice=100
	CockAnimRate=1.0000000
	ReloadAnimRate=1.0000000
	SightMoveSpeedFactor=0.9000000
	SightingTime=0.3500000
	ScopeScale=1.0000000
	DisplaceDurationMult=1.0000000
	MagAmmo=30
}
