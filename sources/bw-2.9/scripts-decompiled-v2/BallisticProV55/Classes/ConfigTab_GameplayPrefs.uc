class ConfigTab_GameplayPrefs extends ConfigTabBase
	editinlinenew
	instanced;

var() automated moComboBox co_Crosshairs;
var() automated moComboBox co_ADSHandling;
var() automated moComboBox co_ModeMemory;
var() automated moFloatEdit fl_ZoomTimeMod;
var() automated moCheckBox ch_Crosshairdot;
var() automated moCheckBox ch_WeaponUI;
var() automated moCheckBox ch_SimpleDeathMessages;
var() automated moCheckBox ch_LessDisruptiveFlash;

function LoadSettings()
{
	co_Crosshairs.AddItem("Simple",, string(0));
	co_Crosshairs.AddItem("Graphical",, string(1));
	co_Crosshairs.AddItem("UT2004",, string(2));
	co_Crosshairs.ReadOnly(true);
	co_Crosshairs.SetIndex(int(Class'BCoreProV55.BallisticWeapon'.default.CrosshairMode));
	ch_Crosshairdot.Checked(Class'BCoreProV55.BallisticWeapon'.default.bDrawCrosshairDot);
	co_ADSHandling.AddItem("Default",, string(0));
	co_ADSHandling.AddItem("Hold",, string(1));
	co_ADSHandling.AddItem("Toggle",, string(2));
	co_ADSHandling.ReadOnly(true);
	co_ADSHandling.SetIndex(int(Class'BCoreProV55.BallisticWeapon'.default.ScopeHandling));
	co_ModeMemory.AddItem("None",, string(0));
	co_ModeMemory.AddItem("Last Mode",, string(1));
	co_ModeMemory.AddItem("Saved Mode",, string(2));
	co_ModeMemory.ReadOnly(true);
	co_ModeMemory.SetIndex(int(Class'BCoreProV55.BallisticWeapon'.default.ModeHandling));
	fl_ZoomTimeMod.SetValue(Class'BallisticProV55.BallisticPlayer'.default.ZoomTimeMod);
	ch_WeaponUI.Checked(Class'BallisticProV55.BallisticPlayer'.default.bUseWeaponUI);
	ch_SimpleDeathMessages.Checked(Class'BCoreProV55.BallisticDamageType'.default.bSimpleDeathMessages);
	ch_LessDisruptiveFlash.Checked(Class'BCoreProV55.BallisticDamageType'.default.bLessDisruptiveFlash);
	//return;	
}

function SaveSettings()
{
	// End:0x0D
	if(!bInitialized)
	{
		return;
	}
	Class'BCoreProV55.BallisticWeapon'.default.CrosshairMode = byte(co_Crosshairs.GetIndex());
	Class'BCoreProV55.BallisticWeapon'.default.bDrawCrosshairDot = ch_Crosshairdot.IsChecked();
	Class'BCoreProV55.BallisticWeapon'.default.ScopeHandling = byte(co_ADSHandling.GetIndex());
	Class'BCoreProV55.BallisticWeapon'.default.ModeHandling = byte(co_ModeMemory.GetIndex());
	Class'BallisticProV55.BallisticPlayer'.default.ZoomTimeMod = fl_ZoomTimeMod.GetValue();
	Class'BCoreProV55.BallisticWeapon'.default.ZoomTimeMod = fl_ZoomTimeMod.GetValue();
	Class'BallisticProV55.BallisticPlayer'.default.bUseWeaponUI = ch_WeaponUI.IsChecked();
	Class'BCoreProV55.BallisticDamageType'.default.bSimpleDeathMessages = ch_SimpleDeathMessages.IsChecked();
	Class'BCoreProV55.BallisticDamageType'.default.bLessDisruptiveFlash = ch_LessDisruptiveFlash.IsChecked();
	Class'BCoreProV55.BallisticWeapon'.static.StaticSaveConfig();
	Class'BCoreProV55.BallisticDamageType'.static.StaticSaveConfig();
	Class'BallisticProV55.BallisticPlayer'.static.StaticSaveConfig();
	//return;	
}

function DefaultSettings()
{
	co_Crosshairs.SetIndex(0);
	ch_Crosshairdot.Checked(true);
	co_ADSHandling.SetIndex(0);
	co_ModeMemory.SetIndex(0);
	fl_ZoomTimeMod.SetValue(1.5000000);
	ch_WeaponUI.Checked(false);
	ch_SimpleDeathMessages.Checked(false);
	//return;	
}

defaultproperties
{
	// Reference: moComboBox'BallisticProV55.ConfigTab_GameplayPrefs.co_CrosshairCombo'
	begin object name="co_CrosshairCombo" class=XInterface.moComboBox
		ComponentJustification=0
		CaptionWidth=0.5500000
		Caption="Crosshair Type"
		OnCreateComponent=co_CrosshairCombo.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="Which crosshairs to use.||Simple: Draws simple crosshairs which show hipfire inaccuracy and change color to indicate when a weapon needs reloading or cocking.||Graphical: Draws custom, configurable graphical crosshairs for each weapon.||UT2004: Uses your Unreal Tournament 2004 crosshairs for each weapon."
		WinTop=0.1000000
		WinLeft=0.2500000
	end object
	co_Crosshairs=co_CrosshairCombo
	// Reference: moComboBox'BallisticProV55.ConfigTab_GameplayPrefs.co_ADSHandlingCombo'
	begin object name="co_ADSHandlingCombo" class=XInterface.moComboBox
		ComponentJustification=0
		CaptionWidth=0.5500000
		Caption="Aim Down Sight Handling"
		OnCreateComponent=co_ADSHandlingCombo.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="How the ADS key should function.||Default: Hold to raise the weapon into scope. Weapon stays in scope until key is pressed again.||Hold: Hold key to ADS. Release to lower.||Toggle: Press key to ADS. Press again to lower."
		WinTop=0.2000000
		WinLeft=0.2500000
	end object
	co_ADSHandling=co_ADSHandlingCombo
	// Reference: moComboBox'BallisticProV55.ConfigTab_GameplayPrefs.co_ModeCombo'
	begin object name="co_ModeCombo" class=XInterface.moComboBox
		ComponentJustification=0
		CaptionWidth=0.5500000
		Caption="Weapon Mode Memory"
		OnCreateComponent=co_ModeCombo.InternalOnCreateComponent
		IniOption="@Internal"
		IniDefault="High"
		Hint="Controls how Ballistic handles the initial weapon mode when a weapon is spawned. ||None - the set default mode is always used.||Last - the last used mode is used. ||Saved - uses the mode saved by the SetDefaultMode command.||Reset it with ClearDefaultMode and get its name with GetDefaultMode."
		WinTop=0.2500000
		WinLeft=0.2500000
	end object
	co_ModeMemory=co_ModeCombo
	// Reference: moFloatEdit'BallisticProV55.ConfigTab_GameplayPrefs.fl_ZoomTimeModFloat'
	begin object name="fl_ZoomTimeModFloat" class=XInterface.moFloatEdit
		MinValue=1.0000000
		MaxValue=5.0000000
		ComponentJustification=0
		CaptionWidth=0.7000000
		Caption="Zoom Time Mod"
		OnCreateComponent=fl_ZoomTimeModFloat.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="Multiplier for the rate of change of zoom levels. 1 to 4."
		WinTop=0.3000000
		WinLeft=0.2500000
		WinHeight=0.0400000
	end object
	fl_ZoomTimeMod=fl_ZoomTimeModFloat
	// Reference: moCheckBox'BallisticProV55.ConfigTab_GameplayPrefs.ch_CrosshairdotCheck'
	begin object name="ch_CrosshairdotCheck" class=XInterface.moCheckBox
		ComponentJustification=0
		CaptionWidth=0.9000000
		Caption="Show dot in crosshair"
		OnCreateComponent=ch_CrosshairdotCheck.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="Add a dot to the center of the dynamic crosshair."
		WinTop=0.1500000
		WinLeft=0.2500000
		WinHeight=0.0400000
	end object
	ch_Crosshairdot=ch_CrosshairdotCheck
	// Reference: moCheckBox'BallisticProV55.ConfigTab_GameplayPrefs.ch_WeaponUICheck'
	begin object name="ch_WeaponUICheck" class=XInterface.moCheckBox
		ComponentJustification=0
		CaptionWidth=0.9000000
		Caption="Weapon Selection UI"
		OnCreateComponent=ch_WeaponUICheck.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="Enable the selection UI when changing weapons."
		WinTop=0.3500000
		WinLeft=0.2500000
		WinHeight=0.0400000
	end object
	ch_WeaponUI=ch_WeaponUICheck
	// Reference: moCheckBox'BallisticProV55.ConfigTab_GameplayPrefs.ch_SimpleDeathMessagesCheck'
	begin object name="ch_SimpleDeathMessagesCheck" class=XInterface.moCheckBox
		ComponentJustification=0
		CaptionWidth=0.9000000
		Caption="Simplify Death Messages"
		OnCreateComponent=ch_SimpleDeathMessagesCheck.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="Renders death messages as Killer [Weapon] Killed"
		WinTop=0.4000000
		WinLeft=0.2500000
		WinHeight=0.0400000
	end object
	ch_SimpleDeathMessages=ch_SimpleDeathMessagesCheck
	// Reference: moCheckBox'BallisticProV55.ConfigTab_GameplayPrefs.ch_LessDisruptiveFlashCheck'
	begin object name="ch_LessDisruptiveFlashCheck" class=XInterface.moCheckBox
		ComponentJustification=0
		CaptionWidth=0.9000000
		Caption="Reduce Flash Intensity"
		OnCreateComponent=ch_LessDisruptiveFlashCheck.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="Changes white blinding flashes to black"
		WinTop=0.4500000
		WinLeft=0.2500000
		WinHeight=0.0400000
	end object
	ch_LessDisruptiveFlash=ch_LessDisruptiveFlashCheck
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: moCheckBox'BallisticProV55.ConfigTab_GameplayPrefs.ch_LessDisruptiveFlashCheck'
begin object name="ch_LessDisruptiveFlashCheck" class=XInterface.moCheckBox
	ComponentJustification=0
	CaptionWidth=0.9000000
	Caption="Reduce Flash Intensity"
	OnCreateComponent=ch_LessDisruptiveFlashCheck.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="Changes white blinding flashes to black"
	WinTop=0.4500000
	WinLeft=0.2500000
	WinHeight=0.0400000
end object
// Reference: moCheckBox'BallisticProV55.ConfigTab_GameplayPrefs.ch_SimpleDeathMessagesCheck'
begin object name="ch_SimpleDeathMessagesCheck" class=XInterface.moCheckBox
	ComponentJustification=0
	CaptionWidth=0.9000000
	Caption="Simplify Death Messages"
	OnCreateComponent=ch_SimpleDeathMessagesCheck.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="Renders death messages as Killer [Weapon] Killed"
	WinTop=0.4000000
	WinLeft=0.2500000
	WinHeight=0.0400000
end object
// Reference: moCheckBox'BallisticProV55.ConfigTab_GameplayPrefs.ch_WeaponUICheck'
begin object name="ch_WeaponUICheck" class=XInterface.moCheckBox
	ComponentJustification=0
	CaptionWidth=0.9000000
	Caption="Weapon Selection UI"
	OnCreateComponent=ch_WeaponUICheck.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="Enable the selection UI when changing weapons."
	WinTop=0.3500000
	WinLeft=0.2500000
	WinHeight=0.0400000
end object
// Reference: moFloatEdit'BallisticProV55.ConfigTab_GameplayPrefs.fl_ZoomTimeModFloat'
begin object name="fl_ZoomTimeModFloat" class=XInterface.moFloatEdit
	MinValue=1.0000000
	MaxValue=5.0000000
	ComponentJustification=0
	CaptionWidth=0.7000000
	Caption="Zoom Time Mod"
	OnCreateComponent=fl_ZoomTimeModFloat.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="Multiplier for the rate of change of zoom levels. 1 to 4."
	WinTop=0.3000000
	WinLeft=0.2500000
	WinHeight=0.0400000
end object
// Reference: moComboBox'BallisticProV55.ConfigTab_GameplayPrefs.co_ModeCombo'
begin object name="co_ModeCombo" class=XInterface.moComboBox
	ComponentJustification=0
	CaptionWidth=0.5500000
	Caption="Weapon Mode Memory"
	OnCreateComponent=co_ModeCombo.InternalOnCreateComponent
	IniOption="@Internal"
	IniDefault="High"
	Hint="Controls how Ballistic handles the initial weapon mode when a weapon is spawned. ||None - the set default mode is always used.||Last - the last used mode is used. ||Saved - uses the mode saved by the SetDefaultMode command.||Reset it with ClearDefaultMode and get its name with GetDefaultMode."
	WinTop=0.2500000
	WinLeft=0.2500000
end object
// Reference: moComboBox'BallisticProV55.ConfigTab_GameplayPrefs.co_ADSHandlingCombo'
begin object name="co_ADSHandlingCombo" class=XInterface.moComboBox
	ComponentJustification=0
	CaptionWidth=0.5500000
	Caption="Aim Down Sight Handling"
	OnCreateComponent=co_ADSHandlingCombo.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="How the ADS key should function.||Default: Hold to raise the weapon into scope. Weapon stays in scope until key is pressed again.||Hold: Hold key to ADS. Release to lower.||Toggle: Press key to ADS. Press again to lower."
	WinTop=0.2000000
	WinLeft=0.2500000
end object
// Reference: moCheckBox'BallisticProV55.ConfigTab_GameplayPrefs.ch_CrosshairdotCheck'
begin object name="ch_CrosshairdotCheck" class=XInterface.moCheckBox
	ComponentJustification=0
	CaptionWidth=0.9000000
	Caption="Show dot in crosshair"
	OnCreateComponent=ch_CrosshairdotCheck.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="Add a dot to the center of the dynamic crosshair."
	WinTop=0.1500000
	WinLeft=0.2500000
	WinHeight=0.0400000
end object
// Reference: moComboBox'BallisticProV55.ConfigTab_GameplayPrefs.co_CrosshairCombo'
begin object name="co_CrosshairCombo" class=XInterface.moComboBox
	ComponentJustification=0
	CaptionWidth=0.5500000
	Caption="Crosshair Type"
	OnCreateComponent=co_CrosshairCombo.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="Which crosshairs to use.||Simple: Draws simple crosshairs which show hipfire inaccuracy and change color to indicate when a weapon needs reloading or cocking.||Graphical: Draws custom, configurable graphical crosshairs for each weapon.||UT2004: Uses your Unreal Tournament 2004 crosshairs for each weapon."
	WinTop=0.1000000
	WinLeft=0.2500000
end object
