class ConfigTab_MovementRules extends ConfigTabBase
	editinlinenew
	instanced;

var() automated moNumericEdit ne_PlayerGroundSpeed;
var() automated moNumericEdit ne_PlayerAccelRate;
var() automated moCheckBox cb_bPlayerDeceleration;
var() automated moFloatEdit fe_PlayerStrafeScale;
var() automated moFloatEdit fe_PlayerBackpedalScale;
var() automated moCheckBox ch_AllowDodging;
var() automated moCheckBox ch_AllowDoubleJump;
var() automated moCheckBox cb_AllowCrouchSliding;
var() automated moCheckBox cb_bUseSprint;
var() automated moNumericEdit ne_StaminaDrainRate;
var() automated moNumericEdit ne_StaminaChargeRate;
var() automated moFloatEdit fe_InitSpeedFactor;
var() automated moFloatEdit fe_JumpDrain;
var() automated moFloatEdit fe_StaminaRechargeDelay;

function LoadSettings()
{
	local Class<BC_GameStyle_Config> game_style;

	game_style = BaseMenu.GetConfigStyle();
	// End:0x1BF
	if(game_style != none)
	{
		ne_PlayerGroundSpeed.SetValue(int(game_style.default.PlayerGroundSpeed));
		ne_PlayerAccelRate.SetValue(int(game_style.default.PlayerAccelRate));
		cb_bPlayerDeceleration.Checked(game_style.default.bPlayerDeceleration);
		fe_PlayerStrafeScale.SetValue(game_style.default.PlayerStrafeScale);
		fe_PlayerBackpedalScale.SetValue(game_style.default.PlayerBackpedalScale);
		ch_AllowDodging.Checked(game_style.default.bAllowDodging);
		ch_AllowDoubleJump.Checked(game_style.default.bAllowDoubleJump);
		cb_AllowCrouchSliding.Checked(game_style.default.bAllowCrouchSliding);
		cb_bUseSprint.Checked(game_style.default.bEnableSprint);
		ne_StaminaDrainRate.SetValue(game_style.default.StaminaDrainRate);
		ne_StaminaChargeRate.SetValue(game_style.default.StaminaChargeRate);
		fe_InitSpeedFactor.SetValue(game_style.default.SprintSpeedFactor);
		fe_JumpDrain.SetValue(game_style.default.JumpDrain);
		fe_StaminaRechargeDelay.SetValue(game_style.default.StaminaRechargeDelay);
	}
	//return;	
}

function DefaultSettings()
{
	ne_PlayerGroundSpeed.SetValue(360);
	ne_PlayerAccelRate.SetValue(2048);
	cb_bPlayerDeceleration.Checked(false);
	fe_PlayerStrafeScale.SetValue(1.0000000);
	fe_PlayerBackpedalScale.SetValue(1.0000000);
	ch_AllowDodging.Checked(true);
	ch_AllowDoubleJump.Checked(true);
	cb_AllowCrouchSliding.Checked(true);
	cb_bUseSprint.Checked(true);
	ne_StaminaDrainRate.SetValue(25);
	ne_StaminaChargeRate.SetValue(25);
	fe_InitSpeedFactor.SetValue(1.3500000);
	fe_JumpDrain.SetValue(2.0000000);
	fe_StaminaRechargeDelay.SetValue(1.5000000);
	//return;	
}

function SaveSettings()
{
	local Class<BC_GameStyle_Config> game_style;

	// End:0x0D
	if(!bInitialized)
	{
		return;
	}
	game_style = BaseMenu.GetConfigStyle();
	// End:0x209
	if(game_style != none)
	{
		game_style.default.PlayerGroundSpeed = float(ne_PlayerGroundSpeed.GetValue());
		game_style.default.PlayerAirSpeed = float(ne_PlayerGroundSpeed.GetValue());
		game_style.default.PlayerAccelRate = float(ne_PlayerAccelRate.GetValue());
		game_style.default.bPlayerDeceleration = cb_bPlayerDeceleration.IsChecked();
		game_style.default.PlayerStrafeScale = fe_PlayerStrafeScale.GetValue();
		game_style.default.PlayerBackpedalScale = fe_PlayerBackpedalScale.GetValue();
		game_style.default.bAllowDodging = ch_AllowDodging.IsChecked();
		game_style.default.bAllowDoubleJump = ch_AllowDoubleJump.IsChecked();
		game_style.default.bAllowCrouchSliding = cb_AllowCrouchSliding.IsChecked();
		game_style.default.bEnableSprint = cb_bUseSprint.IsChecked();
		game_style.default.StaminaDrainRate = ne_StaminaDrainRate.GetValue();
		game_style.default.StaminaChargeRate = ne_StaminaChargeRate.GetValue();
		game_style.default.StaminaRechargeDelay = fe_StaminaRechargeDelay.GetValue();
		game_style.default.SprintSpeedFactor = fe_InitSpeedFactor.GetValue();
		game_style.default.JumpDrain = fe_JumpDrain.GetValue();
		game_style.static.StaticSaveConfig();
	}
	//return;	
}

defaultproperties
{
	// Reference: moNumericEdit'BallisticProV55.ConfigTab_MovementRules.ne_PlayerGroundSpeedC'
	begin object name="ne_PlayerGroundSpeedC" class=XInterface.moNumericEdit
		MinValue=160
		MaxValue=1000
		Step=20
		ComponentWidth=0.1750000
		Caption="Movement Speed"
		OnCreateComponent=ne_PlayerGroundSpeedC.InternalOnCreateComponent
		Hint="Player ground and air speed. 160 - 1000. 440 is UT2004 default."
		WinTop=0.1000000
		WinLeft=0.2500000
		WinHeight=0.0400000
	end object
	ne_PlayerGroundSpeed=ne_PlayerGroundSpeedC
	// Reference: moNumericEdit'BallisticProV55.ConfigTab_MovementRules.ne_PlayerAccelRateC'
	begin object name="ne_PlayerAccelRateC" class=XInterface.moNumericEdit
		MinValue=1024
		MaxValue=4096
		Step=256
		ComponentWidth=0.1750000
		Caption="Acceleration Rate"
		OnCreateComponent=ne_PlayerAccelRateC.InternalOnCreateComponent
		Hint="Scales player acceleration. 1024 - 4096. UT2004 is 2048."
		WinTop=0.1500000
		WinLeft=0.2500000
		WinHeight=0.0400000
	end object
	ne_PlayerAccelRate=ne_PlayerAccelRateC
	// Reference: moCheckBox'BallisticProV55.ConfigTab_MovementRules.cb_bPlayerDecelerationC'
	begin object name="cb_bPlayerDecelerationC" class=XInterface.moCheckBox
		ComponentWidth=0.1750000
		Caption="Player Deceleration"
		OnCreateComponent=cb_bPlayerDecelerationC.InternalOnCreateComponent
		Hint="Players will decelerate gradually when movement stops."
		WinTop=0.2000000
		WinLeft=0.2500000
		WinHeight=0.0400000
	end object
	cb_bPlayerDeceleration=cb_bPlayerDecelerationC
	// Reference: moFloatEdit'BallisticProV55.ConfigTab_MovementRules.fe_PlayerStrafeScaleC'
	begin object name="fe_PlayerStrafeScaleC" class=XInterface.moFloatEdit
		MinValue=0.8000000
		MaxValue=1.0000000
		ComponentWidth=0.1750000
		Caption="Strafe Speed Multiplier"
		OnCreateComponent=fe_PlayerStrafeScaleC.InternalOnCreateComponent
		Hint="Scale for strafe speed. 0.7 - 1."
		WinTop=0.2500000
		WinLeft=0.2500000
		WinHeight=0.0400000
	end object
	fe_PlayerStrafeScale=fe_PlayerStrafeScaleC
	// Reference: moFloatEdit'BallisticProV55.ConfigTab_MovementRules.fe_PlayerBackpedalScaleC'
	begin object name="fe_PlayerBackpedalScaleC" class=XInterface.moFloatEdit
		MinValue=0.5000000
		MaxValue=1.0000000
		ComponentWidth=0.1750000
		Caption="Backpedal Speed Multiplier"
		OnCreateComponent=fe_PlayerBackpedalScaleC.InternalOnCreateComponent
		Hint="Scale for backpedal speed. 0.5 - 1."
		WinTop=0.3000000
		WinLeft=0.2500000
		WinHeight=0.0400000
	end object
	fe_PlayerBackpedalScale=fe_PlayerBackpedalScaleC
	// Reference: moCheckBox'BallisticProV55.ConfigTab_MovementRules.ch_AllowDodgingCheck'
	begin object name="ch_AllowDodgingCheck" class=XInterface.moCheckBox
		ComponentJustification=0
		CaptionWidth=0.9000000
		Caption="Dodging"
		OnCreateComponent=ch_AllowDodgingCheck.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="Enables dodging for all players."
		WinTop=0.3500000
		WinLeft=0.2500000
		WinHeight=0.0400000
	end object
	ch_AllowDodging=ch_AllowDodgingCheck
	// Reference: moCheckBox'BallisticProV55.ConfigTab_MovementRules.ch_AllowDoubleJumpCheck'
	begin object name="ch_AllowDoubleJumpCheck" class=XInterface.moCheckBox
		ComponentJustification=0
		CaptionWidth=0.9000000
		Caption="Double Jump"
		OnCreateComponent=ch_AllowDoubleJumpCheck.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="Enables double jump."
		WinTop=0.4000000
		WinLeft=0.2500000
		WinHeight=0.0400000
	end object
	ch_AllowDoubleJump=ch_AllowDoubleJumpCheck
	// Reference: moCheckBox'BallisticProV55.ConfigTab_MovementRules.cb_AllowCrouchSlidingC'
	begin object name="cb_AllowCrouchSlidingC" class=XInterface.moCheckBox
		ComponentWidth=0.1750000
		Caption="Enable Crouch Sliding"
		OnCreateComponent=cb_AllowCrouchSlidingC.InternalOnCreateComponent
		Hint="Enables crouch sliding."
		WinTop=0.5000000
		WinLeft=0.2500000
		WinHeight=0.0400000
	end object
	cb_AllowCrouchSliding=cb_AllowCrouchSlidingC
	// Reference: moCheckBox'BallisticProV55.ConfigTab_MovementRules.cb_bUseSprintC'
	begin object name="cb_bUseSprintC" class=XInterface.moCheckBox
		ComponentWidth=0.1750000
		Caption="Enable Sprint"
		OnCreateComponent=cb_bUseSprintC.InternalOnCreateComponent
		Hint="Enables sprint."
		WinTop=0.5500000
		WinLeft=0.2500000
		WinHeight=0.0400000
	end object
	cb_bUseSprint=cb_bUseSprintC
	// Reference: moNumericEdit'BallisticProV55.ConfigTab_MovementRules.ne_StaminaDrainRateC'
	begin object name="ne_StaminaDrainRateC" class=XInterface.moNumericEdit
		MinValue=0
		MaxValue=35
		Step=5
		ComponentWidth=0.1750000
		Caption="Stamina Drain % Per Second"
		OnCreateComponent=ne_StaminaDrainRateC.InternalOnCreateComponent
		Hint="Percentage of stamina to drain every second when sprinting."
		WinTop=0.6000000
		WinLeft=0.2500000
		WinHeight=0.0400000
	end object
	ne_StaminaDrainRate=ne_StaminaDrainRateC
	// Reference: moNumericEdit'BallisticProV55.ConfigTab_MovementRules.ne_StaminaChargeRateC'
	begin object name="ne_StaminaChargeRateC" class=XInterface.moNumericEdit
		MinValue=0
		MaxValue=35
		Step=5
		ComponentWidth=0.1750000
		Caption="Stamina Regen % Per Second"
		OnCreateComponent=ne_StaminaChargeRateC.InternalOnCreateComponent
		Hint="Percentage of stamina to regenerate every second when not sprinting."
		WinTop=0.6500000
		WinLeft=0.2500000
		WinHeight=0.0400000
	end object
	ne_StaminaChargeRate=ne_StaminaChargeRateC
	// Reference: moFloatEdit'BallisticProV55.ConfigTab_MovementRules.fe_InitSpeedFactorC'
	begin object name="fe_InitSpeedFactorC" class=XInterface.moFloatEdit
		MinValue=1.1000000
		MaxValue=2.5000000
		Step=0.0500000
		ComponentWidth=0.1750000
		Caption="Sprint Speed Multiplier"
		OnCreateComponent=fe_InitSpeedFactorC.InternalOnCreateComponent
		Hint="The speed multiplier during sprint."
		WinTop=0.7000000
		WinLeft=0.2500000
		WinHeight=0.0400000
	end object
	fe_InitSpeedFactor=fe_InitSpeedFactorC
	// Reference: moFloatEdit'BallisticProV55.ConfigTab_MovementRules.fe_JumpDrainC'
	begin object name="fe_JumpDrainC" class=XInterface.moFloatEdit
		MinValue=0.0000000
		MaxValue=10.0000000
		ComponentWidth=0.1750000
		Caption="Jump/Slide Drain"
		OnCreateComponent=fe_JumpDrainC.InternalOnCreateComponent
		Hint="The amount of stamina we lose when we jump or slide."
		WinTop=0.7500000
		WinLeft=0.2500000
		WinHeight=0.0400000
	end object
	fe_JumpDrain=fe_JumpDrainC
	// Reference: moFloatEdit'BallisticProV55.ConfigTab_MovementRules.fe_StaminaRechargeDelayC'
	begin object name="fe_StaminaRechargeDelayC" class=XInterface.moFloatEdit
		MinValue=0.0000000
		MaxValue=5.0000000
		ComponentWidth=0.1750000
		Caption="Stamina Recharge Delay"
		OnCreateComponent=fe_StaminaRechargeDelayC.InternalOnCreateComponent
		Hint="The delay before stamina starts to recharge."
		WinTop=0.8000000
		WinLeft=0.2500000
		WinHeight=0.0400000
	end object
	fe_StaminaRechargeDelay=fe_StaminaRechargeDelayC
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: moFloatEdit'BallisticProV55.ConfigTab_MovementRules.fe_StaminaRechargeDelayC'
begin object name="fe_StaminaRechargeDelayC" class=XInterface.moFloatEdit
	MinValue=0.0000000
	MaxValue=5.0000000
	ComponentWidth=0.1750000
	Caption="Stamina Recharge Delay"
	OnCreateComponent=fe_StaminaRechargeDelayC.InternalOnCreateComponent
	Hint="The delay before stamina starts to recharge."
	WinTop=0.8000000
	WinLeft=0.2500000
	WinHeight=0.0400000
end object
// Reference: moFloatEdit'BallisticProV55.ConfigTab_MovementRules.fe_JumpDrainC'
begin object name="fe_JumpDrainC" class=XInterface.moFloatEdit
	MinValue=0.0000000
	MaxValue=10.0000000
	ComponentWidth=0.1750000
	Caption="Jump/Slide Drain"
	OnCreateComponent=fe_JumpDrainC.InternalOnCreateComponent
	Hint="The amount of stamina we lose when we jump or slide."
	WinTop=0.7500000
	WinLeft=0.2500000
	WinHeight=0.0400000
end object
// Reference: moFloatEdit'BallisticProV55.ConfigTab_MovementRules.fe_InitSpeedFactorC'
begin object name="fe_InitSpeedFactorC" class=XInterface.moFloatEdit
	MinValue=1.1000000
	MaxValue=2.5000000
	Step=0.0500000
	ComponentWidth=0.1750000
	Caption="Sprint Speed Multiplier"
	OnCreateComponent=fe_InitSpeedFactorC.InternalOnCreateComponent
	Hint="The speed multiplier during sprint."
	WinTop=0.7000000
	WinLeft=0.2500000
	WinHeight=0.0400000
end object
// Reference: moNumericEdit'BallisticProV55.ConfigTab_MovementRules.ne_StaminaChargeRateC'
begin object name="ne_StaminaChargeRateC" class=XInterface.moNumericEdit
	MinValue=0
	MaxValue=35
	Step=5
	ComponentWidth=0.1750000
	Caption="Stamina Regen % Per Second"
	OnCreateComponent=ne_StaminaChargeRateC.InternalOnCreateComponent
	Hint="Percentage of stamina to regenerate every second when not sprinting."
	WinTop=0.6500000
	WinLeft=0.2500000
	WinHeight=0.0400000
end object
// Reference: moNumericEdit'BallisticProV55.ConfigTab_MovementRules.ne_StaminaDrainRateC'
begin object name="ne_StaminaDrainRateC" class=XInterface.moNumericEdit
	MinValue=0
	MaxValue=35
	Step=5
	ComponentWidth=0.1750000
	Caption="Stamina Drain % Per Second"
	OnCreateComponent=ne_StaminaDrainRateC.InternalOnCreateComponent
	Hint="Percentage of stamina to drain every second when sprinting."
	WinTop=0.6000000
	WinLeft=0.2500000
	WinHeight=0.0400000
end object
// Reference: moCheckBox'BallisticProV55.ConfigTab_MovementRules.cb_bUseSprintC'
begin object name="cb_bUseSprintC" class=XInterface.moCheckBox
	ComponentWidth=0.1750000
	Caption="Enable Sprint"
	OnCreateComponent=cb_bUseSprintC.InternalOnCreateComponent
	Hint="Enables sprint."
	WinTop=0.5500000
	WinLeft=0.2500000
	WinHeight=0.0400000
end object
// Reference: moCheckBox'BallisticProV55.ConfigTab_MovementRules.cb_AllowCrouchSlidingC'
begin object name="cb_AllowCrouchSlidingC" class=XInterface.moCheckBox
	ComponentWidth=0.1750000
	Caption="Enable Crouch Sliding"
	OnCreateComponent=cb_AllowCrouchSlidingC.InternalOnCreateComponent
	Hint="Enables crouch sliding."
	WinTop=0.5000000
	WinLeft=0.2500000
	WinHeight=0.0400000
end object
// Reference: moCheckBox'BallisticProV55.ConfigTab_MovementRules.ch_AllowDoubleJumpCheck'
begin object name="ch_AllowDoubleJumpCheck" class=XInterface.moCheckBox
	ComponentJustification=0
	CaptionWidth=0.9000000
	Caption="Double Jump"
	OnCreateComponent=ch_AllowDoubleJumpCheck.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="Enables double jump."
	WinTop=0.4000000
	WinLeft=0.2500000
	WinHeight=0.0400000
end object
// Reference: moCheckBox'BallisticProV55.ConfigTab_MovementRules.ch_AllowDodgingCheck'
begin object name="ch_AllowDodgingCheck" class=XInterface.moCheckBox
	ComponentJustification=0
	CaptionWidth=0.9000000
	Caption="Dodging"
	OnCreateComponent=ch_AllowDodgingCheck.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="Enables dodging for all players."
	WinTop=0.3500000
	WinLeft=0.2500000
	WinHeight=0.0400000
end object
// Reference: moFloatEdit'BallisticProV55.ConfigTab_MovementRules.fe_PlayerBackpedalScaleC'
begin object name="fe_PlayerBackpedalScaleC" class=XInterface.moFloatEdit
	MinValue=0.5000000
	MaxValue=1.0000000
	ComponentWidth=0.1750000
	Caption="Backpedal Speed Multiplier"
	OnCreateComponent=fe_PlayerBackpedalScaleC.InternalOnCreateComponent
	Hint="Scale for backpedal speed. 0.5 - 1."
	WinTop=0.3000000
	WinLeft=0.2500000
	WinHeight=0.0400000
end object
// Reference: moFloatEdit'BallisticProV55.ConfigTab_MovementRules.fe_PlayerStrafeScaleC'
begin object name="fe_PlayerStrafeScaleC" class=XInterface.moFloatEdit
	MinValue=0.8000000
	MaxValue=1.0000000
	ComponentWidth=0.1750000
	Caption="Strafe Speed Multiplier"
	OnCreateComponent=fe_PlayerStrafeScaleC.InternalOnCreateComponent
	Hint="Scale for strafe speed. 0.7 - 1."
	WinTop=0.2500000
	WinLeft=0.2500000
	WinHeight=0.0400000
end object
// Reference: moCheckBox'BallisticProV55.ConfigTab_MovementRules.cb_bPlayerDecelerationC'
begin object name="cb_bPlayerDecelerationC" class=XInterface.moCheckBox
	ComponentWidth=0.1750000
	Caption="Player Deceleration"
	OnCreateComponent=cb_bPlayerDecelerationC.InternalOnCreateComponent
	Hint="Players will decelerate gradually when movement stops."
	WinTop=0.2000000
	WinLeft=0.2500000
	WinHeight=0.0400000
end object
// Reference: moNumericEdit'BallisticProV55.ConfigTab_MovementRules.ne_PlayerAccelRateC'
begin object name="ne_PlayerAccelRateC" class=XInterface.moNumericEdit
	MinValue=1024
	MaxValue=4096
	Step=256
	ComponentWidth=0.1750000
	Caption="Acceleration Rate"
	OnCreateComponent=ne_PlayerAccelRateC.InternalOnCreateComponent
	Hint="Scales player acceleration. 1024 - 4096. UT2004 is 2048."
	WinTop=0.1500000
	WinLeft=0.2500000
	WinHeight=0.0400000
end object
// Reference: moNumericEdit'BallisticProV55.ConfigTab_MovementRules.ne_PlayerGroundSpeedC'
begin object name="ne_PlayerGroundSpeedC" class=XInterface.moNumericEdit
	MinValue=160
	MaxValue=1000
	Step=20
	ComponentWidth=0.1750000
	Caption="Movement Speed"
	OnCreateComponent=ne_PlayerGroundSpeedC.InternalOnCreateComponent
	Hint="Player ground and air speed. 160 - 1000. 440 is UT2004 default."
	WinTop=0.1000000
	WinLeft=0.2500000
	WinHeight=0.0400000
end object
