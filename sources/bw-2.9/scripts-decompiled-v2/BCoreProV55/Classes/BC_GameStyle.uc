class BC_GameStyle extends Object
	abstract
	config(BallisticProV55);

enum EGameStyle
{
	GS_Pro,                         // 0
	GS_Classic,                     // 1
	GS_Realism,                     // 2
	GS_Tactical                     // 3
};

var BC_GameStyle.EGameStyle Index;
var string StyleName;
var() config float SwayScale;
var() config float RecoilScale;
var() config float RecoilShotScale;
var() config float ReloadScale;
var() config float damageScale;
var() config float VehicleDamageScale;
var() config int InventoryModeIndex;
var() config int MaxInventoryCapacity;
var() config bool bKillstreaks;
var() config bool bBrightPlayers;
var() float PlayerWalkSpeedFactor;
var() float PlayerCrouchSpeedFactor;
var() float PlayerAnimationGroundSpeed;
var() bool bRunInADS;
var() bool bForceViewShake;
var() float SightBobScale;
var() int ConflictWeaponSlots;
var() int ConflictEquipmentSlots;

static final function InitializeReplicationInfo(BallisticReplicationInfo rep)
{
	rep.GameStyle = default.Index;
	rep.AccuracyScale = default.SwayScale;
	rep.damageScale = default.damageScale;
	rep.VehicleDamageScale = default.VehicleDamageScale;
	rep.RecoilScale = default.RecoilScale;
	rep.RecoilShotScale = default.RecoilShotScale;
	rep.ReloadScale = default.ReloadScale;
	rep.MaxInventoryCapacity = default.MaxInventoryCapacity;
	rep.bKillstreaks = default.bKillstreaks;
	rep.PlayerWalkSpeedFactor = default.PlayerWalkSpeedFactor;
	rep.PlayerCrouchSpeedFactor = default.PlayerCrouchSpeedFactor;
	rep.PlayerAnimationGroundSpeed = default.PlayerAnimationGroundSpeed;
	FillReplicationInfo(rep);
	rep.BindDefaults();
	//return;	
}

protected static function FillReplicationInfo(BallisticReplicationInfo rep)
{
	//return;	
}

defaultproperties
{
	SwayScale=1.0000000
	RecoilScale=1.0000000
	RecoilShotScale=1.0000000
	ReloadScale=1.0000000
	damageScale=1.0000000
	VehicleDamageScale=1.0000000
	bKillstreaks=true
	PlayerWalkSpeedFactor=0.9000000
	PlayerCrouchSpeedFactor=0.4500000
	SightBobScale=1.0000000
	ConflictWeaponSlots=10
	ConflictEquipmentSlots=2
}
