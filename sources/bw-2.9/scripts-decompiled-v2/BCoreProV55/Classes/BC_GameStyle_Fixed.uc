class BC_GameStyle_Fixed extends BC_GameStyle
	abstract
	config(BallisticProV55);

var() bool bWeaponJumpOffsetting;
var() bool bLongWeaponOffsetting;
var() bool bNoReloading;
var() bool bAlternativePickups;
var() bool bUniversalMineLights;
var() bool bHealthRegeneration;
var() int StartingHealth;
var() int PlayerHealthMax;
var() int PlayerSuperHealthMax;
var() bool bShieldRegeneration;
var() int StartingShield;
var() int PlayerShieldMax;
var() bool bPlayerDeceleration;
var() bool bAllowDodging;
var() bool bAllowDoubleJump;
var() bool bAllowCrouchSliding;
var() float PlayerStrafeScale;
var() float PlayerBackpedalScale;
var() float PlayerGroundSpeed;
var() float PlayerAirSpeed;
var() float PlayerAccelRate;
var() float PlayerJumpZ;
var() float PlayerDodgeSpeedFactor;
var() float PlayerDodgeZ;
var() bool bEnableSprint;
var() int StaminaChargeRate;
var() int StaminaDrainRate;
var() float StaminaRechargeDelay;
var() float SprintSpeedFactor;
var() float JumpDrain;
var() int HealthKillReward;
var() int KillRewardHealthMax;
var() int ShieldKillReward;
var() int KillRewardShieldMax;

protected static function FillReplicationInfo(BallisticReplicationInfo rep)
{
	rep.bWeaponJumpOffsetting = default.bWeaponJumpOffsetting;
	rep.bLongWeaponOffsetting = default.bLongWeaponOffsetting;
	rep.bNoReloading = default.bNoReloading;
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
}
