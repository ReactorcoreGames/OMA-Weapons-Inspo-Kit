class BallisticReplicationInfo extends ReplicationInfo
	config(BallisticProV55)
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

struct GeneralRep
{
	var BC_GameStyle.EGameStyle GameStyle;
	var float AccuracyScale;
	var float RecoilScale;
	var float RecoilShotScale;
	var float ReloadScale;
	var float damageScale;
	var float VehicleDamageScale;
	var bool bWeaponJumpOffsetting;
	var bool bLongWeaponOffsetting;
	var bool bNoReloading;
	var bool bNoRandomCamo;
	var int MaxInventoryCapacity;
	var bool bAlternativePickups;
	var bool bUniversalMineLights;
};

struct PawnRep
{
	var bool bBrightPlayers;
	var int StartingHealth;
	var int PlayerHealthMax;
	var int PlayerSuperHealthMax;
	var int StartingShield;
	var int PlayerShieldMax;
};

struct MoveRep
{
	var bool bPlayerDeceleration;
	var bool bAllowDodging;
	var bool bAllowDoubleJump;
	var() config bool bAllowCrouchSliding;
	var float PlayerWalkSpeedFactor;
	var float PlayerCrouchSpeedFactor;
	var float PlayerAnimationGroundSpeed;
	var float PlayerStrafeScale;
	var float PlayerBackpedalScale;
	var float PlayerGroundSpeed;
	var float PlayerAirSpeed;
	var float PlayerAccelRate;
	var float PlayerJumpZ;
	var float PlayerDodgeSpeedFactor;
	var float PlayerDodgeZ;
};

struct SprintRep
{
	var() config bool bEnableSprint;
	var() config int StaminaChargeRate;
	var() config int StaminaDrainRate;
	var() config float StaminaRechargeDelay;
	var() config float SprintSpeedFactor;
	var() config float JumpDrain;
};

var BC_GameStyle.EGameStyle GameStyle;
var float AccuracyScale;
var float RecoilScale;
var float RecoilShotScale;
var float ReloadScale;
var float damageScale;
var float VehicleDamageScale;
var bool bWeaponJumpOffsetting;
var bool bLongWeaponOffsetting;
var bool bNoReloading;
var bool bNoRandomCamo;
var int MaxInventoryCapacity;
var bool bAlternativePickups;
var bool bUniversalMineLights;
var bool bBrightPlayers;
var int StartingHealth;
var int PlayerHealthMax;
var int PlayerSuperHealthMax;
var int StartingShield;
var int PlayerShieldMax;
var bool bPlayerDeceleration;
var bool bAllowDodging;
var bool bAllowDoubleJump;
var float PlayerWalkSpeedFactor;
var float PlayerCrouchSpeedFactor;
var float PlayerAnimationGroundSpeed;
var float PlayerStrafeScale;
var float PlayerBackpedalScale;
var float PlayerGroundSpeed;
var float PlayerAirSpeed;
var float PlayerAccelRate;
var float PlayerJumpZ;
var float PlayerDodgeSpeedFactor;
var float PlayerDodgeZ;
var() config bool bEnableSprint;
var() config int StaminaChargeRate;
var() config int StaminaDrainRate;
var() config float StaminaRechargeDelay;
var() config float SprintSpeedFactor;
var() config float JumpDrain;
var() config bool bAllowCrouchSliding;
var bool bHealthRegeneration;
var bool bShieldRegeneration;
var int HealthKillReward;
var int KillRewardHealthMax;
var int ShieldKillReward;
var int KillRewardShieldMax;
var bool bKillstreaks;
var GeneralRep GRep;
var PawnRep PRep;
var MoveRep MRep;
var SprintRep SRep;

replication
{
	// Pos:0x000
	reliable if((int(Role) == int(ROLE_Authority)) && bNetInitial)
		GRep, MRep, 
		PRep, SRep;
}

final function BindToReplication()
{
	Log("BallisticReplicationInfo: BindToReplication");
	GRep.GameStyle = GameStyle;
	GRep.AccuracyScale = AccuracyScale;
	GRep.RecoilScale = RecoilScale;
	GRep.RecoilShotScale = RecoilShotScale;
	GRep.ReloadScale = ReloadScale;
	GRep.damageScale = damageScale;
	GRep.VehicleDamageScale = VehicleDamageScale;
	GRep.bWeaponJumpOffsetting = bWeaponJumpOffsetting;
	GRep.bLongWeaponOffsetting = bLongWeaponOffsetting;
	GRep.bNoReloading = bNoReloading;
	GRep.bNoRandomCamo = bNoRandomCamo;
	GRep.MaxInventoryCapacity = MaxInventoryCapacity;
	GRep.bAlternativePickups = bAlternativePickups;
	GRep.bUniversalMineLights = bUniversalMineLights;
	PRep.bBrightPlayers = bBrightPlayers;
	PRep.StartingHealth = StartingHealth;
	PRep.PlayerHealthMax = PlayerHealthMax;
	PRep.PlayerSuperHealthMax = PlayerSuperHealthMax;
	PRep.StartingShield = StartingShield;
	PRep.PlayerShieldMax = PlayerShieldMax;
	MRep.bPlayerDeceleration = bPlayerDeceleration;
	MRep.bAllowDodging = bAllowDodging;
	MRep.bAllowDoubleJump = bAllowDoubleJump;
	MRep.bAllowCrouchSliding = bAllowCrouchSliding;
	MRep.PlayerWalkSpeedFactor = PlayerWalkSpeedFactor;
	MRep.PlayerCrouchSpeedFactor = PlayerCrouchSpeedFactor;
	MRep.PlayerAnimationGroundSpeed = PlayerAnimationGroundSpeed;
	MRep.PlayerStrafeScale = PlayerStrafeScale;
	MRep.PlayerBackpedalScale = PlayerBackpedalScale;
	MRep.PlayerGroundSpeed = PlayerGroundSpeed;
	MRep.PlayerAirSpeed = PlayerAirSpeed;
	MRep.PlayerAccelRate = PlayerAccelRate;
	MRep.PlayerJumpZ = PlayerJumpZ;
	MRep.PlayerDodgeSpeedFactor = PlayerDodgeSpeedFactor;
	MRep.PlayerDodgeZ = PlayerDodgeZ;
	SRep.bEnableSprint = true;
	SRep.StaminaChargeRate = StaminaChargeRate;
	SRep.StaminaDrainRate = StaminaDrainRate;
	SRep.StaminaRechargeDelay = StaminaRechargeDelay;
	SRep.SprintSpeedFactor = SprintSpeedFactor;
	SRep.JumpDrain = JumpDrain;
	//return;	
}

simulated function PostNetBeginPlay()
{
	// End:0x12
	if(int(Role) == int(ROLE_Authority))
	{
		return;
	}
	BindFromReplication();
	BindDefaults();
	//return;	
}

final simulated function BindFromReplication()
{
	Log("BallisticReplicationInfo: BindFromReplication");
	GameStyle = GRep.GameStyle;
	AccuracyScale = GRep.AccuracyScale;
	RecoilScale = GRep.RecoilScale;
	RecoilShotScale = GRep.RecoilShotScale;
	ReloadScale = GRep.ReloadScale;
	damageScale = GRep.damageScale;
	VehicleDamageScale = GRep.VehicleDamageScale;
	bWeaponJumpOffsetting = GRep.bWeaponJumpOffsetting;
	bLongWeaponOffsetting = GRep.bLongWeaponOffsetting;
	bNoReloading = GRep.bNoReloading;
	bNoRandomCamo = GRep.bNoRandomCamo;
	MaxInventoryCapacity = GRep.MaxInventoryCapacity;
	bAlternativePickups = GRep.bAlternativePickups;
	bUniversalMineLights = GRep.bUniversalMineLights;
	bBrightPlayers = PRep.bBrightPlayers;
	StartingHealth = PRep.StartingHealth;
	PlayerHealthMax = PRep.PlayerHealthMax;
	PlayerSuperHealthMax = PRep.PlayerSuperHealthMax;
	StartingShield = PRep.StartingShield;
	PlayerShieldMax = PRep.PlayerShieldMax;
	bPlayerDeceleration = MRep.bPlayerDeceleration;
	bAllowDodging = MRep.bAllowDodging;
	bAllowDoubleJump = MRep.bAllowDoubleJump;
	bAllowCrouchSliding = MRep.bAllowCrouchSliding;
	PlayerWalkSpeedFactor = MRep.PlayerWalkSpeedFactor;
	PlayerCrouchSpeedFactor = MRep.PlayerCrouchSpeedFactor;
	PlayerAnimationGroundSpeed = MRep.PlayerAnimationGroundSpeed;
	PlayerStrafeScale = MRep.PlayerStrafeScale;
	PlayerBackpedalScale = MRep.PlayerBackpedalScale;
	PlayerGroundSpeed = MRep.PlayerGroundSpeed;
	PlayerAirSpeed = MRep.PlayerAirSpeed;
	PlayerAccelRate = MRep.PlayerAccelRate;
	PlayerJumpZ = MRep.PlayerJumpZ;
	PlayerDodgeSpeedFactor = MRep.PlayerDodgeSpeedFactor;
	PlayerDodgeZ = MRep.PlayerDodgeZ;
	bEnableSprint = true;
	StaminaChargeRate = SRep.StaminaChargeRate;
	StaminaDrainRate = SRep.StaminaDrainRate;
	StaminaRechargeDelay = SRep.StaminaRechargeDelay;
	SprintSpeedFactor = SRep.SprintSpeedFactor;
	JumpDrain = SRep.JumpDrain;
	//return;	
}

final simulated function BindDefaults()
{
	Class.default.GameStyle = GameStyle;
	Class.default.AccuracyScale = AccuracyScale;
	Class.default.RecoilScale = RecoilScale;
	Class.default.RecoilShotScale = RecoilShotScale;
	Class.default.ReloadScale = ReloadScale;
	Class.default.damageScale = damageScale;
	Class.default.VehicleDamageScale = VehicleDamageScale;
	Class.default.bWeaponJumpOffsetting = bWeaponJumpOffsetting;
	Class.default.bLongWeaponOffsetting = bLongWeaponOffsetting;
	Class.default.bNoReloading = bNoReloading;
	Class.default.bNoRandomCamo = bNoRandomCamo;
	Class.default.MaxInventoryCapacity = MaxInventoryCapacity;
	Class.default.bAlternativePickups = bAlternativePickups;
	Class.default.bUniversalMineLights = bUniversalMineLights;
	Class.default.bBrightPlayers = bBrightPlayers;
	Class.default.StartingHealth = StartingHealth;
	Class.default.PlayerHealthMax = PlayerHealthMax;
	Class.default.PlayerSuperHealthMax = PlayerSuperHealthMax;
	Class.default.StartingShield = StartingShield;
	Class.default.PlayerShieldMax = PlayerShieldMax;
	Class.default.bPlayerDeceleration = bPlayerDeceleration;
	Class.default.bAllowDodging = bAllowDodging;
	Class.default.bAllowDoubleJump = bAllowDoubleJump;
	Class.default.bAllowCrouchSliding = bAllowCrouchSliding;
	Class.default.PlayerWalkSpeedFactor = PlayerWalkSpeedFactor;
	Class.default.PlayerCrouchSpeedFactor = PlayerCrouchSpeedFactor;
	Class.default.PlayerAnimationGroundSpeed = PlayerAnimationGroundSpeed;
	Class.default.PlayerStrafeScale = PlayerStrafeScale;
	Class.default.PlayerBackpedalScale = PlayerBackpedalScale;
	Class.default.PlayerGroundSpeed = PlayerGroundSpeed;
	Class.default.PlayerAirSpeed = PlayerAirSpeed;
	Class.default.PlayerAccelRate = PlayerAccelRate;
	Class.default.PlayerJumpZ = PlayerJumpZ;
	Class.default.PlayerDodgeSpeedFactor = PlayerDodgeSpeedFactor;
	Class.default.PlayerDodgeZ = PlayerDodgeZ;
	Class.default.bEnableSprint = true;
	Class.default.StaminaChargeRate = StaminaChargeRate;
	Class.default.StaminaDrainRate = StaminaDrainRate;
	Class.default.StaminaRechargeDelay = StaminaRechargeDelay;
	Class.default.SprintSpeedFactor = SprintSpeedFactor;
	Class.default.JumpDrain = JumpDrain;
	Class.default.bHealthRegeneration = bHealthRegeneration;
	Class.default.bShieldRegeneration = bShieldRegeneration;
	Class.default.HealthKillReward = HealthKillReward;
	Class.default.KillRewardHealthMax = KillRewardHealthMax;
	Class.default.ShieldKillReward = ShieldKillReward;
	Class.default.KillRewardShieldMax = KillRewardShieldMax;
	Class.default.bKillstreaks = bKillstreaks;
	Log("BallisticReplicationInfo: BindDefaults");
	Log("Accuracy Scale: " $ string(AccuracyScale));
	Log("Recoil Scale: " $ string(RecoilScale));
	Log("Recoil Shot Scale: " $ string(RecoilShotScale));
	Log("Reload Scale: " $ string(ReloadScale));
	Log("Sprint/Jump Weapon Offsetting: " $ string(bWeaponJumpOffsetting));
	Log("Long Weapon Offsetting: " $ string(bLongWeaponOffsetting));
	Log("Reloading: " $ string(!bNoReloading));
	Log("Camo Randomizer: " $ string(!bNoRandomCamo));
	Log("Bright Players: " $ string(bBrightPlayers));
	Log("Dodging: " $ string(bAllowDodging));
	Log("Double Jumping: " $ string(bAllowDoubleJump));
	// End:0x56E
	if(int(Role) == int(ROLE_Authority))
	{
		BindToReplication();
	}
	//return;	
}

static function BallisticReplicationInfo GetInstance(Actor A)
{
	local BallisticReplicationInfo BRI;

	// End:0x2C
	foreach A.DynamicActors(Class'BCoreProV55.BallisticReplicationInfo', BRI)
	{
		// End:0x2B
		if(A != none)
		{			
			return BRI;
		}		
	}	
	return none;
	//return;	
}

static final function bool IsArena()
{
	return int(default.GameStyle) == int(0);
	//return;	
}

static final function bool IsClassic()
{
	return int(default.GameStyle) == int(1);
	//return;	
}

static final function bool IsRealism()
{
	return int(default.GameStyle) == int(2);
	//return;	
}

static final function bool IsTactical()
{
	return int(default.GameStyle) == int(3);
	//return;	
}

static final function bool IsClassicOrRealism()
{
	return IsClassic() || IsRealism();
	//return;	
}

static final function bool IsArenaOrTactical()
{
	return IsArena() || IsTactical();
	//return;	
}

defaultproperties
{
	AccuracyScale=1.0000000
	RecoilScale=1.0000000
	RecoilShotScale=1.0000000
	ReloadScale=1.0000000
	damageScale=1.0000000
	VehicleDamageScale=1.0000000
	bWeaponJumpOffsetting=true
	bNoRandomCamo=true
	bUniversalMineLights=true
	bBrightPlayers=true
	StartingHealth=100
	PlayerHealthMax=100
	PlayerSuperHealthMax=200
	StartingShield=100
	PlayerShieldMax=200
	bAllowDodging=true
	bAllowDoubleJump=true
	PlayerWalkSpeedFactor=0.9000000
	PlayerCrouchSpeedFactor=0.4500000
	PlayerAnimationGroundSpeed=440.0000000
	PlayerStrafeScale=1.0000000
	PlayerBackpedalScale=1.0000000
	PlayerGroundSpeed=440.0000000
	PlayerAirSpeed=440.0000000
	PlayerAccelRate=2048.0000000
	PlayerJumpZ=340.0000000
	PlayerDodgeSpeedFactor=1.5000000
	PlayerDodgeZ=210.0000000
}
