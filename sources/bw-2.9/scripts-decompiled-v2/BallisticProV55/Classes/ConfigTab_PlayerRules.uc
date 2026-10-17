class ConfigTab_PlayerRules extends ConfigTabBase
	editinlinenew
	instanced;

var() automated moNumericEdit ne_StartingHealth;
var() automated moNumericEdit ne_PlayerHealthMax;
var() automated moNumericEdit ne_PlayerSuperHealthMax;
var() automated moCheckBox ch_HealthRegen;
var() automated moNumericEdit ne_HeathKillReward;
var() automated moNumericEdit ne_KillRewardHealthMax;
var() automated moNumericEdit ne_StartingShield;
var() automated moNumericEdit ne_PlayerShieldMax;
var() automated moCheckBox ch_ShieldRegen;
var() automated moNumericEdit ne_ShieldKillReward;
var() automated moNumericEdit ne_KillRewardShieldMax;

function LoadSettings()
{
	local Class<BC_GameStyle_Config> game_style;

	game_style = BaseMenu.GetConfigStyle();
	// End:0x161
	if(game_style != none)
	{
		ne_StartingHealth.SetValue(game_style.default.StartingHealth);
		ne_PlayerHealthMax.SetValue(game_style.default.PlayerHealthMax);
		ne_PlayerSuperHealthMax.SetValue(game_style.default.PlayerSuperHealthMax);
		ch_HealthRegen.Checked(game_style.default.bHealthRegeneration);
		ne_HeathKillReward.SetValue(game_style.default.HealthKillReward);
		ne_KillRewardHealthMax.SetValue(game_style.default.KillRewardHealthMax);
		ne_StartingShield.SetValue(game_style.default.StartingShield);
		ne_PlayerShieldMax.SetValue(game_style.default.PlayerShieldMax);
		ch_ShieldRegen.Checked(game_style.default.bShieldRegeneration);
		ne_ShieldKillReward.SetValue(game_style.default.ShieldKillReward);
		ne_KillRewardShieldMax.SetValue(game_style.default.KillRewardShieldMax);
	}
	//return;	
}

function DefaultSettings()
{
	ne_StartingHealth.SetValue(100);
	ne_PlayerHealthMax.SetValue(100);
	ne_PlayerSuperHealthMax.SetValue(199);
	ch_HealthRegen.Checked(false);
	ne_HeathKillReward.SetValue(0);
	ne_KillRewardHealthMax.SetValue(0);
	ne_StartingShield.SetValue(0);
	ne_PlayerShieldMax.SetValue(150);
	ch_ShieldRegen.Checked(false);
	ne_ShieldKillReward.SetValue(0);
	ne_KillRewardShieldMax.SetValue(0);
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
	// End:0x188
	if(game_style != none)
	{
		game_style.default.StartingHealth = ne_StartingHealth.GetValue();
		game_style.default.PlayerHealthMax = ne_PlayerHealthMax.GetValue();
		game_style.default.PlayerSuperHealthMax = ne_PlayerSuperHealthMax.GetValue();
		game_style.default.bHealthRegeneration = ch_HealthRegen.IsChecked();
		game_style.default.HealthKillReward = ne_HeathKillReward.GetValue();
		game_style.default.KillRewardHealthMax = ne_KillRewardHealthMax.GetValue();
		game_style.default.StartingShield = ne_StartingShield.GetValue();
		game_style.default.PlayerShieldMax = ne_PlayerShieldMax.GetValue();
		game_style.default.bShieldRegeneration = ch_ShieldRegen.IsChecked();
		game_style.default.ShieldKillReward = ne_ShieldKillReward.GetValue();
		game_style.default.KillRewardShieldMax = ne_KillRewardShieldMax.GetValue();
		game_style.static.StaticSaveConfig();
	}
	//return;	
}

defaultproperties
{
	// Reference: moNumericEdit'BallisticProV55.ConfigTab_PlayerRules.ne_StartingHealthEdit'
	begin object name="ne_StartingHealthEdit" class=XInterface.moNumericEdit
		MinValue=1
		MaxValue=999
		ComponentWidth=0.1750000
		Caption="Starting Health"
		OnCreateComponent=ne_StartingHealthEdit.InternalOnCreateComponent
		Hint="Health value assigned to players on spawn."
		WinTop=0.1000000
		WinLeft=0.2500000
		WinHeight=0.0400000
	end object
	ne_StartingHealth=ne_StartingHealthEdit
	// Reference: moNumericEdit'BallisticProV55.ConfigTab_PlayerRules.ne_PlayerHealthMaxEdit'
	begin object name="ne_PlayerHealthMaxEdit" class=XInterface.moNumericEdit
		MinValue=1
		MaxValue=999
		ComponentWidth=0.1750000
		Caption="Health Cap"
		OnCreateComponent=ne_StartingHealthEdit.InternalOnCreateComponent
		Hint="Maximum health a player may have, without overhealing."
		WinTop=0.1500000
		WinLeft=0.2500000
		WinHeight=0.0400000
	end object
	ne_PlayerHealthMax=ne_PlayerHealthMaxEdit
	// Reference: moNumericEdit'BallisticProV55.ConfigTab_PlayerRules.ne_PlayerSuperHealthMaxEdit'
	begin object name="ne_PlayerSuperHealthMaxEdit" class=XInterface.moNumericEdit
		MinValue=1
		MaxValue=999
		ComponentWidth=0.1750000
		Caption="Super Health Cap"
		OnCreateComponent=ne_StartingHealthEdit.InternalOnCreateComponent
		Hint="Maximum health a player may have, with overhealing."
		WinTop=0.2000000
		WinLeft=0.2500000
		WinHeight=0.0400000
	end object
	ne_PlayerSuperHealthMax=ne_PlayerSuperHealthMaxEdit
	// Reference: moCheckBox'BallisticProV55.ConfigTab_PlayerRules.ch_HealthRegenCheck'
	begin object name="ch_HealthRegenCheck" class=XInterface.moCheckBox
		ComponentJustification=0
		CaptionWidth=0.9000000
		Caption="Health Regeneration"
		OnCreateComponent=ch_HealthRegenCheck.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="Enables health regeneration."
		WinTop=0.2500000
		WinLeft=0.2500000
		WinHeight=0.0400000
	end object
	ch_HealthRegen=ch_HealthRegenCheck
	// Reference: moNumericEdit'BallisticProV55.ConfigTab_PlayerRules.ne_HeathKillRewardE'
	begin object name="ne_HeathKillRewardE" class=XInterface.moNumericEdit
		MinValue=0
		MaxValue=999
		ComponentWidth=0.1750000
		Caption="Health Kill Reward"
		OnCreateComponent=ne_HeathKillRewardE.InternalOnCreateComponent
		Hint="Health received for killing an enemy."
		WinTop=0.3000000
		WinLeft=0.2500000
		WinHeight=0.0400000
	end object
	ne_HeathKillReward=ne_HeathKillRewardE
	// Reference: moNumericEdit'BallisticProV55.ConfigTab_PlayerRules.ne_KillRewardHealthMaxE'
	begin object name="ne_KillRewardHealthMaxE" class=XInterface.moNumericEdit
		MinValue=0
		MaxValue=999
		ComponentWidth=0.1750000
		Caption="Health Kill Reward Cap"
		OnCreateComponent=ne_KillRewardHealthMaxE.InternalOnCreateComponent
		Hint="The maximum health value that can be reached through health kill rewards. 0 uses the player's maximum health value."
		WinTop=0.3500000
		WinLeft=0.2500000
		WinHeight=0.0400000
	end object
	ne_KillRewardHealthMax=ne_KillRewardHealthMaxE
	// Reference: moNumericEdit'BallisticProV55.ConfigTab_PlayerRules.ne_StartingShieldC'
	begin object name="ne_StartingShieldC" class=XInterface.moNumericEdit
		MinValue=0
		MaxValue=999
		ComponentWidth=0.1750000
		Caption="Starting Shields"
		OnCreateComponent=ne_StartingShieldC.InternalOnCreateComponent
		Hint="Shield value assigned to players on spawn."
		WinTop=0.4500000
		WinLeft=0.2500000
		WinHeight=0.0400000
	end object
	ne_StartingShield=ne_StartingShieldC
	// Reference: moNumericEdit'BallisticProV55.ConfigTab_PlayerRules.ne_PlayerShieldMaxC'
	begin object name="ne_PlayerShieldMaxC" class=XInterface.moNumericEdit
		MinValue=1
		MaxValue=999
		ComponentWidth=0.1750000
		Caption="Shield Cap"
		OnCreateComponent=ne_PlayerShieldMaxC.InternalOnCreateComponent
		Hint="Maximum shield value a player may have."
		WinTop=0.5000000
		WinLeft=0.2500000
		WinHeight=0.0400000
	end object
	ne_PlayerShieldMax=ne_PlayerShieldMaxC
	// Reference: moCheckBox'BallisticProV55.ConfigTab_PlayerRules.ch_ShieldRegenCheck'
	begin object name="ch_ShieldRegenCheck" class=XInterface.moCheckBox
		ComponentJustification=0
		CaptionWidth=0.9000000
		Caption="Shield Regeneration"
		OnCreateComponent=ch_ShieldRegenCheck.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="Enables shield regeneration."
		WinTop=0.5500000
		WinLeft=0.2500000
		WinHeight=0.0400000
	end object
	ch_ShieldRegen=ch_ShieldRegenCheck
	// Reference: moNumericEdit'BallisticProV55.ConfigTab_PlayerRules.ne_ShieldKillRewardC'
	begin object name="ne_ShieldKillRewardC" class=XInterface.moNumericEdit
		MinValue=0
		MaxValue=999
		ComponentWidth=0.1750000
		Caption="Shield Kill Reward"
		OnCreateComponent=ne_ShieldKillRewardC.InternalOnCreateComponent
		Hint="Shields received for killing an enemy."
		WinTop=0.6000000
		WinLeft=0.2500000
		WinHeight=0.0400000
	end object
	ne_ShieldKillReward=ne_ShieldKillRewardC
	// Reference: moNumericEdit'BallisticProV55.ConfigTab_PlayerRules.ne_KillRewardShieldMaxC'
	begin object name="ne_KillRewardShieldMaxC" class=XInterface.moNumericEdit
		MinValue=0
		MaxValue=999
		ComponentWidth=0.1750000
		Caption="Shield Kill Reward Cap"
		OnCreateComponent=ne_KillRewardShieldMaxC.InternalOnCreateComponent
		Hint="The maximum shield value that can be reached through shield kill rewards. 0 uses the player's maximum shield value."
		WinTop=0.6500000
		WinLeft=0.2500000
		WinHeight=0.0400000
	end object
	ne_KillRewardShieldMax=ne_KillRewardShieldMaxC
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: moNumericEdit'BallisticProV55.ConfigTab_PlayerRules.ne_StartingHealthEdit'
begin object name="ne_StartingHealthEdit" class=XInterface.moNumericEdit
	MinValue=1
	MaxValue=999
	ComponentWidth=0.1750000
	Caption="Starting Health"
	OnCreateComponent=ne_StartingHealthEdit.InternalOnCreateComponent
	Hint="Health value assigned to players on spawn."
	WinTop=0.1000000
	WinLeft=0.2500000
	WinHeight=0.0400000
end object
// Reference: moNumericEdit'BallisticProV55.ConfigTab_PlayerRules.ne_KillRewardShieldMaxC'
begin object name="ne_KillRewardShieldMaxC" class=XInterface.moNumericEdit
	MinValue=0
	MaxValue=999
	ComponentWidth=0.1750000
	Caption="Shield Kill Reward Cap"
	OnCreateComponent=ne_KillRewardShieldMaxC.InternalOnCreateComponent
	Hint="The maximum shield value that can be reached through shield kill rewards. 0 uses the player's maximum shield value."
	WinTop=0.6500000
	WinLeft=0.2500000
	WinHeight=0.0400000
end object
// Reference: moNumericEdit'BallisticProV55.ConfigTab_PlayerRules.ne_ShieldKillRewardC'
begin object name="ne_ShieldKillRewardC" class=XInterface.moNumericEdit
	MinValue=0
	MaxValue=999
	ComponentWidth=0.1750000
	Caption="Shield Kill Reward"
	OnCreateComponent=ne_ShieldKillRewardC.InternalOnCreateComponent
	Hint="Shields received for killing an enemy."
	WinTop=0.6000000
	WinLeft=0.2500000
	WinHeight=0.0400000
end object
// Reference: moCheckBox'BallisticProV55.ConfigTab_PlayerRules.ch_ShieldRegenCheck'
begin object name="ch_ShieldRegenCheck" class=XInterface.moCheckBox
	ComponentJustification=0
	CaptionWidth=0.9000000
	Caption="Shield Regeneration"
	OnCreateComponent=ch_ShieldRegenCheck.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="Enables shield regeneration."
	WinTop=0.5500000
	WinLeft=0.2500000
	WinHeight=0.0400000
end object
// Reference: moNumericEdit'BallisticProV55.ConfigTab_PlayerRules.ne_PlayerShieldMaxC'
begin object name="ne_PlayerShieldMaxC" class=XInterface.moNumericEdit
	MinValue=1
	MaxValue=999
	ComponentWidth=0.1750000
	Caption="Shield Cap"
	OnCreateComponent=ne_PlayerShieldMaxC.InternalOnCreateComponent
	Hint="Maximum shield value a player may have."
	WinTop=0.5000000
	WinLeft=0.2500000
	WinHeight=0.0400000
end object
// Reference: moNumericEdit'BallisticProV55.ConfigTab_PlayerRules.ne_StartingShieldC'
begin object name="ne_StartingShieldC" class=XInterface.moNumericEdit
	MinValue=0
	MaxValue=999
	ComponentWidth=0.1750000
	Caption="Starting Shields"
	OnCreateComponent=ne_StartingShieldC.InternalOnCreateComponent
	Hint="Shield value assigned to players on spawn."
	WinTop=0.4500000
	WinLeft=0.2500000
	WinHeight=0.0400000
end object
// Reference: moNumericEdit'BallisticProV55.ConfigTab_PlayerRules.ne_KillRewardHealthMaxE'
begin object name="ne_KillRewardHealthMaxE" class=XInterface.moNumericEdit
	MinValue=0
	MaxValue=999
	ComponentWidth=0.1750000
	Caption="Health Kill Reward Cap"
	OnCreateComponent=ne_KillRewardHealthMaxE.InternalOnCreateComponent
	Hint="The maximum health value that can be reached through health kill rewards. 0 uses the player's maximum health value."
	WinTop=0.3500000
	WinLeft=0.2500000
	WinHeight=0.0400000
end object
// Reference: moNumericEdit'BallisticProV55.ConfigTab_PlayerRules.ne_HeathKillRewardE'
begin object name="ne_HeathKillRewardE" class=XInterface.moNumericEdit
	MinValue=0
	MaxValue=999
	ComponentWidth=0.1750000
	Caption="Health Kill Reward"
	OnCreateComponent=ne_HeathKillRewardE.InternalOnCreateComponent
	Hint="Health received for killing an enemy."
	WinTop=0.3000000
	WinLeft=0.2500000
	WinHeight=0.0400000
end object
// Reference: moCheckBox'BallisticProV55.ConfigTab_PlayerRules.ch_HealthRegenCheck'
begin object name="ch_HealthRegenCheck" class=XInterface.moCheckBox
	ComponentJustification=0
	CaptionWidth=0.9000000
	Caption="Health Regeneration"
	OnCreateComponent=ch_HealthRegenCheck.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="Enables health regeneration."
	WinTop=0.2500000
	WinLeft=0.2500000
	WinHeight=0.0400000
end object
// Reference: moNumericEdit'BallisticProV55.ConfigTab_PlayerRules.ne_PlayerHealthMaxEdit'
begin object name="ne_PlayerHealthMaxEdit" class=XInterface.moNumericEdit
	MinValue=1
	MaxValue=999
	ComponentWidth=0.1750000
	Caption="Health Cap"
	OnCreateComponent=ne_StartingHealthEdit.InternalOnCreateComponent
	Hint="Maximum health a player may have, without overhealing."
	WinTop=0.1500000
	WinLeft=0.2500000
	WinHeight=0.0400000
end object
// Reference: moNumericEdit'BallisticProV55.ConfigTab_PlayerRules.ne_PlayerSuperHealthMaxEdit'
begin object name="ne_PlayerSuperHealthMaxEdit" class=XInterface.moNumericEdit
	MinValue=1
	MaxValue=999
	ComponentWidth=0.1750000
	Caption="Super Health Cap"
	OnCreateComponent=ne_StartingHealthEdit.InternalOnCreateComponent
	Hint="Maximum health a player may have, with overhealing."
	WinTop=0.2000000
	WinLeft=0.2500000
	WinHeight=0.0400000
end object
