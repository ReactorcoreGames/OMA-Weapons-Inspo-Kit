class ConfigTab_WeaponRules extends ConfigTabBase
	editinlinenew
	instanced;

var() automated moSlider sl_Sway;
var() automated moSlider sl_Recoil;
var() automated moSlider sl_Reload;
var() automated moFloatEdit fl_Damage;
var() automated moFloatEdit fl_VDamage;
var() automated moCheckBox ch_WeaponJumpOffsetting;
var() automated moCheckBox ch_LongWeaponOffsetting;
var() automated moCheckBox ch_NoReloading;
var() automated moCheckBox ch_NoRandomCamo;
var() automated moNumericEdit int_MaxInventoryCapacity;
var() automated moEditBox eb_ItemGroup;
var() automated moCheckBox ch_UseItemizer;

function LoadSettings()
{
	local Class<BC_GameStyle_Config> game_style;

	game_style = BaseMenu.GetConfigStyle();
	// End:0x146
	if(game_style != none)
	{
		sl_Sway.SetValue(game_style.default.SwayScale);
		sl_Recoil.SetValue(game_style.default.RecoilScale);
		sl_Reload.SetValue(game_style.default.ReloadScale);
		fl_Damage.SetValue(game_style.default.damageScale);
		fl_VDamage.SetValue(game_style.default.VehicleDamageScale);
		ch_WeaponJumpOffsetting.Checked(game_style.default.bWeaponJumpOffsetting);
		ch_LongWeaponOffsetting.Checked(game_style.default.bLongWeaponOffsetting);
		int_MaxInventoryCapacity.SetValue(game_style.default.MaxInventoryCapacity);
		ch_NoReloading.Checked(game_style.default.bNoReloading);
		ch_NoRandomCamo.Checked(game_style.default.bNoRandomCamo);
	}
	ch_UseItemizer.Checked(Class'BallisticProV55.Mut_Ballistic'.default.bUseItemizer);
	eb_ItemGroup.SetText(Class'BallisticProV55.Mut_Ballistic'.default.ItemGroup);
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
	// End:0x16C
	if(game_style != none)
	{
		game_style.default.SwayScale = sl_Sway.GetValue();
		game_style.default.RecoilScale = sl_Recoil.GetValue();
		game_style.default.ReloadScale = sl_Reload.GetValue();
		game_style.default.damageScale = fl_Damage.GetValue();
		game_style.default.VehicleDamageScale = fl_VDamage.GetValue();
		game_style.default.bWeaponJumpOffsetting = ch_WeaponJumpOffsetting.IsChecked();
		game_style.default.bLongWeaponOffsetting = ch_LongWeaponOffsetting.IsChecked();
		game_style.default.bNoReloading = ch_NoReloading.IsChecked();
		game_style.default.bNoRandomCamo = ch_NoRandomCamo.IsChecked();
		game_style.default.MaxInventoryCapacity = int_MaxInventoryCapacity.GetValue();
		game_style.static.StaticSaveConfig();
	}
	Class'BallisticProV55.Rules_Ballistic'.static.StaticSaveConfig();
	Class'BallisticProV55.Mut_Ballistic'.default.ItemGroup = eb_ItemGroup.GetText();
	Class'BallisticProV55.Mut_Ballistic'.default.bUseItemizer = ch_UseItemizer.IsChecked();
	Class'BallisticProV55.Mut_Ballistic'.static.StaticSaveConfig();
	//return;	
}

function DefaultSettings()
{
	sl_Sway.SetValue(1.0000000);
	sl_Recoil.SetValue(1.0000000);
	fl_Damage.SetValue(1.0000000);
	fl_VDamage.SetValue(1.0000000);
	ch_WeaponJumpOffsetting.Checked(false);
	ch_LongWeaponOffsetting.Checked(false);
	ch_NoReloading.Checked(false);
	int_MaxInventoryCapacity.SetValue(0);
	ch_UseItemizer.Checked(true);
	eb_ItemGroup.SetText("Ballistic");
	//return;	
}

defaultproperties
{
	// Reference: moSlider'BallisticProV55.ConfigTab_WeaponRules.sl_SwaySlider'
	begin object name="sl_SwaySlider" class=XInterface.moSlider
		MaxValue=2.0000000
		Caption="Sway Scale"
		OnCreateComponent=sl_SwaySlider.InternalOnCreateComponent
		Hint="Scales the degree of sway of weapons."
		WinTop=0.1000000
		WinLeft=0.2500000
		WinHeight=0.0400000
	end object
	sl_Sway=sl_SwaySlider
	// Reference: moSlider'BallisticProV55.ConfigTab_WeaponRules.sl_RecoilSlider'
	begin object name="sl_RecoilSlider" class=XInterface.moSlider
		MaxValue=2.0000000
		Caption="Recoil Scale"
		OnCreateComponent=sl_RecoilSlider.InternalOnCreateComponent
		Hint="Scales the recoil pattern of weapons."
		WinTop=0.1500000
		WinLeft=0.2500000
		WinHeight=0.0400000
	end object
	sl_Recoil=sl_RecoilSlider
	// Reference: moSlider'BallisticProV55.ConfigTab_WeaponRules.sl_ReloadSlider'
	begin object name="sl_ReloadSlider" class=XInterface.moSlider
		MaxValue=3.0000000
		MinValue=0.5000000
		Caption="Reload Scale"
		OnCreateComponent=sl_RecoilSlider.InternalOnCreateComponent
		Hint="Scales the reload speed of weapons."
		WinTop=0.2000000
		WinLeft=0.2500000
		WinHeight=0.0400000
	end object
	sl_Reload=sl_ReloadSlider
	// Reference: moFloatEdit'BallisticProV55.ConfigTab_WeaponRules.fl_DamageFloat'
	begin object name="fl_DamageFloat" class=XInterface.moFloatEdit
		MinValue=0.0000000
		MaxValue=100.0000000
		ComponentJustification=0
		CaptionWidth=0.7000000
		Caption="Damage Scale"
		OnCreateComponent=fl_DamageFloat.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="Scales the amount of damage done to non vehicles."
		WinTop=0.2500000
		WinLeft=0.2500000
		WinHeight=0.0400000
	end object
	fl_Damage=fl_DamageFloat
	// Reference: moFloatEdit'BallisticProV55.ConfigTab_WeaponRules.fl_VDamageFloat'
	begin object name="fl_VDamageFloat" class=XInterface.moFloatEdit
		MinValue=0.0000000
		MaxValue=100.0000000
		ComponentJustification=0
		CaptionWidth=0.7000000
		Caption="Vehicle Damage Scale"
		OnCreateComponent=fl_VDamageFloat.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="Scales the amount of damage done to vehicles."
		WinTop=0.3000000
		WinLeft=0.2500000
		WinHeight=0.0400000
	end object
	fl_VDamage=fl_VDamageFloat
	// Reference: moCheckBox'BallisticProV55.ConfigTab_WeaponRules.ch_SprintAimCheck'
	begin object name="ch_SprintAimCheck" class=XInterface.moCheckBox
		ComponentJustification=0
		CaptionWidth=0.9000000
		Caption="Weapon Sprint/Jump Offsetting"
		OnCreateComponent=ch_SprintAimCheck.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="Causes weapons to offset when jumping or sprinting."
		WinTop=0.3500000
		WinLeft=0.2500000
		WinHeight=0.0400000
	end object
	ch_WeaponJumpOffsetting=ch_SprintAimCheck
	// Reference: moCheckBox'BallisticProV55.ConfigTab_WeaponRules.ch_LongWeaponOffsettingCheck'
	begin object name="ch_LongWeaponOffsettingCheck" class=XInterface.moCheckBox
		ComponentJustification=0
		CaptionWidth=0.9000000
		Caption="Long Weapon Offsetting"
		OnCreateComponent=ch_LongWeaponOffsettingCheck.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="Causes weapons to offset when too close to a wall or other surface."
		WinTop=0.4000000
		WinLeft=0.2500000
		WinHeight=0.0400000
	end object
	ch_LongWeaponOffsetting=ch_LongWeaponOffsettingCheck
	// Reference: moCheckBox'BallisticProV55.ConfigTab_WeaponRules.ch_NoReloadingCheck'
	begin object name="ch_NoReloadingCheck" class=XInterface.moCheckBox
		ComponentJustification=0
		CaptionWidth=0.9000000
		Caption="Disable Reloading"
		OnCreateComponent=ch_NoReloadingCheck.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="Disables reloading."
		WinTop=0.4500000
		WinLeft=0.2500000
		WinHeight=0.0400000
	end object
	ch_NoReloading=ch_NoReloadingCheck
	// Reference: moCheckBox'BallisticProV55.ConfigTab_WeaponRules.ch_NoRandomCamoCheck'
	begin object name="ch_NoRandomCamoCheck" class=XInterface.moCheckBox
		ComponentJustification=0
		CaptionWidth=0.9000000
		Caption="Disable Random Camos and Layouts"
		OnCreateComponent=ch_NoRandomCamoCheck.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="Generated guns will come with the basic variant."
		WinTop=0.5000000
		WinLeft=0.2500000
		WinHeight=0.0400000
	end object
	ch_NoRandomCamo=ch_NoRandomCamoCheck
	// Reference: moNumericEdit'BallisticProV55.ConfigTab_WeaponRules.int_MaxWepsInt'
	begin object name="int_MaxWepsInt" class=XInterface.moNumericEdit
		MinValue=0
		MaxValue=999
		ComponentJustification=0
		CaptionWidth=0.8000000
		Caption="Player Inventory Capacity"
		OnCreateComponent=int_MaxWepsInt.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="Sets the player's maximum inventory capacity. 0 is infinite."
		WinTop=0.5500000
		WinLeft=0.2500000
		WinHeight=0.0400000
	end object
	int_MaxInventoryCapacity=int_MaxWepsInt
	// Reference: moEditBox'BallisticProV55.ConfigTab_WeaponRules.eb_ItemGroupEdit'
	begin object name="eb_ItemGroupEdit" class=XInterface.moEditBox
		CaptionWidth=0.2500000
		Caption="Itemizer Group"
		OnCreateComponent=eb_ItemGroupEdit.InternalOnCreateComponent
		Hint="The name of the Itemizer layout you want to use. Defaults to 'Ballistic'."
		WinTop=0.6500000
		WinLeft=0.2500000
		WinHeight=0.0600000
	end object
	eb_ItemGroup=eb_ItemGroupEdit
	// Reference: moCheckBox'BallisticProV55.ConfigTab_WeaponRules.UseItemizerCheck'
	begin object name="UseItemizerCheck" class=XInterface.moCheckBox
		ComponentJustification=0
		CaptionWidth=0.9000000
		Caption="Use itemizer"
		OnCreateComponent=UseItemizerCheck.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="Use the Itemizer to spawn aditional pickups in maps."
		WinTop=0.6000000
		WinLeft=0.2500000
		WinHeight=0.0400000
	end object
	ch_UseItemizer=UseItemizerCheck
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: moSlider'BallisticProV55.ConfigTab_WeaponRules.sl_RecoilSlider'
begin object name="sl_RecoilSlider" class=XInterface.moSlider
	MaxValue=2.0000000
	Caption="Recoil Scale"
	OnCreateComponent=sl_RecoilSlider.InternalOnCreateComponent
	Hint="Scales the recoil pattern of weapons."
	WinTop=0.1500000
	WinLeft=0.2500000
	WinHeight=0.0400000
end object
// Reference: moEditBox'BallisticProV55.ConfigTab_WeaponRules.eb_ItemGroupEdit'
begin object name="eb_ItemGroupEdit" class=XInterface.moEditBox
	CaptionWidth=0.2500000
	Caption="Itemizer Group"
	OnCreateComponent=eb_ItemGroupEdit.InternalOnCreateComponent
	Hint="The name of the Itemizer layout you want to use. Defaults to 'Ballistic'."
	WinTop=0.6500000
	WinLeft=0.2500000
	WinHeight=0.0600000
end object
// Reference: moCheckBox'BallisticProV55.ConfigTab_WeaponRules.UseItemizerCheck'
begin object name="UseItemizerCheck" class=XInterface.moCheckBox
	ComponentJustification=0
	CaptionWidth=0.9000000
	Caption="Use itemizer"
	OnCreateComponent=UseItemizerCheck.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="Use the Itemizer to spawn aditional pickups in maps."
	WinTop=0.6000000
	WinLeft=0.2500000
	WinHeight=0.0400000
end object
// Reference: moNumericEdit'BallisticProV55.ConfigTab_WeaponRules.int_MaxWepsInt'
begin object name="int_MaxWepsInt" class=XInterface.moNumericEdit
	MinValue=0
	MaxValue=999
	ComponentJustification=0
	CaptionWidth=0.8000000
	Caption="Player Inventory Capacity"
	OnCreateComponent=int_MaxWepsInt.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="Sets the player's maximum inventory capacity. 0 is infinite."
	WinTop=0.5500000
	WinLeft=0.2500000
	WinHeight=0.0400000
end object
// Reference: moCheckBox'BallisticProV55.ConfigTab_WeaponRules.ch_NoRandomCamoCheck'
begin object name="ch_NoRandomCamoCheck" class=XInterface.moCheckBox
	ComponentJustification=0
	CaptionWidth=0.9000000
	Caption="Disable Random Camos and Layouts"
	OnCreateComponent=ch_NoRandomCamoCheck.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="Generated guns will come with the basic variant."
	WinTop=0.5000000
	WinLeft=0.2500000
	WinHeight=0.0400000
end object
// Reference: moCheckBox'BallisticProV55.ConfigTab_WeaponRules.ch_NoReloadingCheck'
begin object name="ch_NoReloadingCheck" class=XInterface.moCheckBox
	ComponentJustification=0
	CaptionWidth=0.9000000
	Caption="Disable Reloading"
	OnCreateComponent=ch_NoReloadingCheck.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="Disables reloading."
	WinTop=0.4500000
	WinLeft=0.2500000
	WinHeight=0.0400000
end object
// Reference: moCheckBox'BallisticProV55.ConfigTab_WeaponRules.ch_LongWeaponOffsettingCheck'
begin object name="ch_LongWeaponOffsettingCheck" class=XInterface.moCheckBox
	ComponentJustification=0
	CaptionWidth=0.9000000
	Caption="Long Weapon Offsetting"
	OnCreateComponent=ch_LongWeaponOffsettingCheck.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="Causes weapons to offset when too close to a wall or other surface."
	WinTop=0.4000000
	WinLeft=0.2500000
	WinHeight=0.0400000
end object
// Reference: moCheckBox'BallisticProV55.ConfigTab_WeaponRules.ch_SprintAimCheck'
begin object name="ch_SprintAimCheck" class=XInterface.moCheckBox
	ComponentJustification=0
	CaptionWidth=0.9000000
	Caption="Weapon Sprint/Jump Offsetting"
	OnCreateComponent=ch_SprintAimCheck.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="Causes weapons to offset when jumping or sprinting."
	WinTop=0.3500000
	WinLeft=0.2500000
	WinHeight=0.0400000
end object
// Reference: moFloatEdit'BallisticProV55.ConfigTab_WeaponRules.fl_VDamageFloat'
begin object name="fl_VDamageFloat" class=XInterface.moFloatEdit
	MinValue=0.0000000
	MaxValue=100.0000000
	ComponentJustification=0
	CaptionWidth=0.7000000
	Caption="Vehicle Damage Scale"
	OnCreateComponent=fl_VDamageFloat.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="Scales the amount of damage done to vehicles."
	WinTop=0.3000000
	WinLeft=0.2500000
	WinHeight=0.0400000
end object
// Reference: moFloatEdit'BallisticProV55.ConfigTab_WeaponRules.fl_DamageFloat'
begin object name="fl_DamageFloat" class=XInterface.moFloatEdit
	MinValue=0.0000000
	MaxValue=100.0000000
	ComponentJustification=0
	CaptionWidth=0.7000000
	Caption="Damage Scale"
	OnCreateComponent=fl_DamageFloat.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="Scales the amount of damage done to non vehicles."
	WinTop=0.2500000
	WinLeft=0.2500000
	WinHeight=0.0400000
end object
// Reference: moSlider'BallisticProV55.ConfigTab_WeaponRules.sl_SwaySlider'
begin object name="sl_SwaySlider" class=XInterface.moSlider
	MaxValue=2.0000000
	Caption="Sway Scale"
	OnCreateComponent=sl_SwaySlider.InternalOnCreateComponent
	Hint="Scales the degree of sway of weapons."
	WinTop=0.1000000
	WinLeft=0.2500000
	WinHeight=0.0400000
end object
// Reference: moSlider'BallisticProV55.ConfigTab_WeaponRules.sl_ReloadSlider'
begin object name="sl_ReloadSlider" class=XInterface.moSlider
	MaxValue=3.0000000
	MinValue=0.5000000
	Caption="Reload Scale"
	OnCreateComponent=sl_RecoilSlider.InternalOnCreateComponent
	Hint="Scales the reload speed of weapons."
	WinTop=0.2000000
	WinLeft=0.2500000
	WinHeight=0.0400000
end object
