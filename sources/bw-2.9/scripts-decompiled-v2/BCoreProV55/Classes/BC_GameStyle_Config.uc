class BC_GameStyle_Config extends BC_GameStyle
	abstract
	config(BallisticProV55);

var() config bool bWeaponJumpOffsetting;
var() config bool bLongWeaponOffsetting;
var() config bool bNoReloading;
var() config bool bNoRandomCamo;
var() config bool bAlternativePickups;
var() config bool bUniversalMineLights;
var() config bool bHealthRegeneration;
var() config int StartingHealth;
var() config int PlayerHealthMax;
var() config int PlayerSuperHealthMax;
var() config bool bShieldRegeneration;
var() config int StartingShield;
var() config int PlayerShieldMax;
var() config bool bPlayerDeceleration;
var() config bool bAllowDodging;
var() config bool bAllowDoubleJump;
var() config bool bAllowCrouchSliding;
var() config float PlayerStrafeScale;
var() config float PlayerBackpedalScale;
var() config float PlayerGroundSpeed;
var() config float PlayerAirSpeed;
var() config float PlayerAccelRate;
var() config float PlayerJumpZ;
var() config float PlayerDodgeSpeedFactor;
var() config float PlayerDodgeZ;
var() config bool bEnableSprint;
var() config int StaminaChargeRate;
var() config int StaminaDrainRate;
var() config float StaminaRechargeDelay;
var() config float SprintSpeedFactor;
var() config float JumpDrain;
var() config int HealthKillReward;
var() config int KillRewardHealthMax;
var() config int ShieldKillReward;
var() config int KillRewardShieldMax;

protected static function FillReplicationInfo(BallisticReplicationInfo rep)
{
	rep.bWeaponJumpOffsetting = default.bWeaponJumpOffsetting;
	rep.bLongWeaponOffsetting = default.bLongWeaponOffsetting;
	rep.bNoReloading = default.bNoReloading;
	rep.bNoRandomCamo = default.bNoRandomCamo;
	rep.bAlternativePickups = default.bAlternativePickups;
	rep.bBrightPlayers = default.bBrightPlayers;
	rep.bUniversalMineLights = default.bUniversalMineLights;
	rep.bHealthRegeneration = default.bHealthRegeneration;
	rep.StartingHealth = default.StartingHealth;
	rep.PlayerHealthMax = default.PlayerHealthMax;
	rep.PlayerSuperHealthMax = default.PlayerSuperHealthMax;
	rep.bShieldRegeneration = default.bShieldRegeneration;
	rep.StartingShield = default.StartingShield;
	rep.PlayerShieldMax = default.PlayerShieldMax;
	rep.bPlayerDeceleration = default.bPlayerDeceleration;
	rep.bAllowDodging = default.bAllowDodging;
	rep.bAllowDoubleJump = default.bAllowDoubleJump;
	rep.bAllowCrouchSliding = default.bAllowCrouchSliding;
	rep.PlayerStrafeScale = default.PlayerStrafeScale;
	rep.PlayerBackpedalScale = default.PlayerBackpedalScale;
	rep.PlayerGroundSpeed = default.PlayerGroundSpeed;
	rep.PlayerAirSpeed = default.PlayerAirSpeed;
	rep.PlayerAccelRate = default.PlayerAccelRate;
	rep.PlayerJumpZ = default.PlayerJumpZ;
	rep.PlayerDodgeSpeedFactor = default.PlayerDodgeSpeedFactor;
	rep.PlayerDodgeZ = default.PlayerDodgeZ;
	rep.bEnableSprint = default.bEnableSprint;
	rep.StaminaChargeRate = default.StaminaChargeRate;
	rep.StaminaDrainRate = default.StaminaDrainRate;
	rep.StaminaRechargeDelay = default.StaminaRechargeDelay;
	rep.SprintSpeedFactor = default.SprintSpeedFactor;
	rep.JumpDrain = default.JumpDrain;
	rep.HealthKillReward = default.HealthKillReward;
	rep.KillRewardHealthMax = default.KillRewardHealthMax;
	rep.ShieldKillReward = default.ShieldKillReward;
	rep.KillRewardShieldMax = default.KillRewardShieldMax;
	//return;	
}

defaultproperties
{
	bWeaponJumpOffsetting=true
	bLongWeaponOffsetting=true
}
