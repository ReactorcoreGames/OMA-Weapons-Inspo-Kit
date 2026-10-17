class ConfigTab_VisualPrefs extends ConfigTabBase
	editinlinenew
	instanced;

var() automated moCheckBox ch_UseBrass;
var() automated moCheckBox ch_ImpStay;
var() automated moCheckBox ch_MSmoke;
var() automated moCheckBox ch_MotionBlur;
var() automated moComboBox co_WeaponDet;
var() automated moComboBox co_CamRate;
var() automated moComboBox co_EffectDet;
var() automated moFloatEdit fl_BrassTime;
var int OldWeaponDet;

function LoadSettings()
{
	local int i;

	ch_UseBrass.Checked(Class'BCoreProV55.BallisticMod'.default.bEjectBrass);
	ch_ImpStay.Checked(Class'BallisticProV55.AD_ImpactDecal'.default.bPermanentImpacts);
	ch_MSmoke.Checked(Class'BCoreProV55.BallisticMod'.default.bMuzzleSmoke);
	fl_BrassTime.SetValue(Class'BCoreProV55.BallisticBrass'.default.LifeTimeScale);
	ch_MotionBlur.Checked(Class'BCoreProV55.BallisticMod'.default.bUseMotionBlur);
	i = 0;
	J0x9C:

	// End:0xEA [Loop If]
	if(i < Class'BallisticProV55.Mut_Ballistic'.default.CamRateOptions.Length)
	{
		co_CamRate.AddItem(Class'BallisticProV55.Mut_Ballistic'.default.CamRateOptions[i],, string(i));
		i++;
		// [Loop Continue]
		goto J0x9C;
	}
	co_CamRate.ReadOnly(true);
	co_CamRate.SetIndex(int(Class'BallisticProV55.Mut_Ballistic'.default.CamUpdateRate));
	i = 1;
	J0x120:

	// End:0x163 [Loop If]
	if(i < 6)
	{
		co_EffectDet.AddItem(Class'GUI2K4.UT2K4Tab_DetailSettings'.default.DetailLevels[i],, string(i));
		i += 2;
		// [Loop Continue]
		goto J0x120;
	}
	co_EffectDet.ReadOnly(true);
	co_EffectDet.SetIndex(int(Class'BCoreProV55.BallisticMod'.default.EffectsDetailMode));
	i = 0;
	J0x199:

	// End:0x1D2 [Loop If]
	if(i < 9)
	{
		co_WeaponDet.AddItem(Class'GUI2K4.UT2K4Tab_DetailSettings'.default.DetailLevels[i]);
		i++;
		// [Loop Continue]
		goto J0x199;
	}
	co_WeaponDet.ReadOnly(true);
	OldWeaponDet = co_WeaponDet.FindIndex(ConfigMenu_Preferences(BaseMenu).GetDisplayString(PlayerOwner().ConsoleCommand("get ini:Engine.Engine.ViewportManager TextureDetailWeaponSkin")));
	co_WeaponDet.SilentSetIndex(OldWeaponDet);
	//return;	
}

function SaveSettings()
{
	// End:0x0D
	if(!bInitialized)
	{
		return;
	}
	Class'BallisticProV55.Mut_Ballistic'.default.CamUpdateRate = string(co_CamRate.GetIndex());
	Class'BCoreProV55.BallisticMod'.default.EffectsDetailMode = byte(co_EffectDet.GetIndex());
	Class'BCoreProV55.BallisticMod'.default.bEjectBrass = ch_UseBrass.IsChecked();
	Class'BallisticProV55.AD_ImpactDecal'.default.bPermanentImpacts = ch_ImpStay.IsChecked();
	Class'BCoreProV55.BallisticMod'.default.bMuzzleSmoke = ch_MSmoke.IsChecked();
	Class'BCoreProV55.BallisticBrass'.default.LifeTimeScale = fl_BrassTime.GetValue();
	Class'BCoreProV55.BallisticMod'.default.bUseMotionBlur = ch_MotionBlur.IsChecked();
	Class'BallisticProV55.Mut_Ballistic'.static.StaticSaveConfig();
	Class'BCoreProV55.BallisticMod'.static.StaticSaveConfig();
	Class'BallisticProV55.AD_ImpactDecal'.static.StaticSaveConfig();
	Class'BCoreProV55.BallisticBrass'.static.StaticSaveConfig();
	// End:0x1C3
	if(co_WeaponDet.GetIndex() != OldWeaponDet)
	{
		PlayerOwner().ConsoleCommand("set ini:Engine.Engine.ViewportManager TextureDetailWeaponSkin" @ ConfigMenu_Preferences(BaseMenu).DetailSettings[co_WeaponDet.GetIndex()]);
		PlayerOwner().ConsoleCommand("flush");
	}
	//return;	
}

function DefaultSettings()
{
	co_CamRate.SetIndex(1);
	co_EffectDet.SetIndex(2);
	co_WeaponDet.SilentSetIndex(OldWeaponDet);
	ch_UseBrass.Checked(true);
	fl_BrassTime.SetValue(1.0000000);
	ch_ImpStay.Checked(false);
	ch_MSmoke.Checked(true);
	ch_MotionBlur.Checked(false);
	//return;	
}

defaultproperties
{
	// Reference: moCheckBox'BallisticProV55.ConfigTab_VisualPrefs.ch_UseBrassCheck'
	begin object name="ch_UseBrassCheck" class=XInterface.moCheckBox
		ComponentJustification=0
		CaptionWidth=0.9000000
		Caption="Eject Brass"
		OnCreateComponent=ch_UseBrassCheck.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="Allow weapons to spew out shell casings and similar effects."
		WinTop=0.2500000
		WinLeft=0.2500000
		WinHeight=0.0400000
	end object
	ch_UseBrass=ch_UseBrassCheck
	// Reference: moCheckBox'BallisticProV55.ConfigTab_VisualPrefs.ch_ImpStayCheck'
	begin object name="ch_ImpStayCheck" class=XInterface.moCheckBox
		ComponentJustification=0
		CaptionWidth=0.9000000
		Caption="Permanent Impact Marks [!]"
		OnCreateComponent=ch_ImpStayCheck.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="Impact marks like bullet holes and explosion scorches stay forever. WARNING: This can kill performance on most machines!"
		WinTop=0.4000000
		WinLeft=0.2500000
		WinHeight=0.0400000
	end object
	ch_ImpStay=ch_ImpStayCheck
	// Reference: moCheckBox'BallisticProV55.ConfigTab_VisualPrefs.ch_MSmokeCheck'
	begin object name="ch_MSmokeCheck" class=XInterface.moCheckBox
		ComponentJustification=0
		CaptionWidth=0.9000000
		Caption="Muzzle Smoke"
		OnCreateComponent=ch_MSmokeCheck.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="Enable muzzle smoke emitting when firing guns."
		WinTop=0.3500000
		WinLeft=0.2500000
		WinHeight=0.0400000
	end object
	ch_MSmoke=ch_MSmokeCheck
	// Reference: moCheckBox'BallisticProV55.ConfigTab_VisualPrefs.ch_MotionBlurCheck'
	begin object name="ch_MotionBlurCheck" class=XInterface.moCheckBox
		ComponentJustification=0
		CaptionWidth=0.9000000
		Caption="Motion Blur [!]"
		OnCreateComponent=ch_MotionBlurCheck.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="Enable the use of motion blur effects. WARNING: This may have undesirable effects on some machines!"
		WinTop=0.4500000
		WinLeft=0.2500000
		WinHeight=0.0400000
	end object
	ch_MotionBlur=ch_MotionBlurCheck
	// Reference: moComboBox'BallisticProV55.ConfigTab_VisualPrefs.co_WeaponDetCombo'
	begin object name="co_WeaponDetCombo" class=XInterface.moComboBox
		ComponentJustification=0
		CaptionWidth=0.5500000
		Caption="Weapon Detail"
		OnCreateComponent=co_WeaponDetCombo.InternalOnCreateComponent
		IniOption="@Internal"
		IniDefault="High"
		Hint="Choose the detail level for weapon textures. This should be set after changing the 'Character Detail' setting in the options menu as it will override this setting."
		WinTop=0.1000000
		WinLeft=0.2500000
	end object
	co_WeaponDet=co_WeaponDetCombo
	// Reference: moComboBox'BallisticProV55.ConfigTab_VisualPrefs.co_CamRateCombo'
	begin object name="co_CamRateCombo" class=XInterface.moComboBox
		ComponentJustification=0
		CaptionWidth=0.5500000
		Caption="Camera Update Rate"
		OnCreateComponent=co_CamRateCombo.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="How fast camera view screens like the M50's LCD should update."
		WinTop=0.2000000
		WinLeft=0.2500000
	end object
	co_CamRate=co_CamRateCombo
	// Reference: moComboBox'BallisticProV55.ConfigTab_VisualPrefs.co_EffectDetCombo'
	begin object name="co_EffectDetCombo" class=XInterface.moComboBox
		ComponentJustification=0
		CaptionWidth=0.5500000
		Caption="Effects Quality"
		OnCreateComponent=co_EffectDetCombo.InternalOnCreateComponent
		IniOption="@Internal"
		IniDefault="High"
		Hint="Choose the quality level for Ballistic effects. Remember, if the 'World Detail' setting is lower, it will affect the quality of BW effects."
		WinTop=0.1500000
		WinLeft=0.2500000
	end object
	co_EffectDet=co_EffectDetCombo
	// Reference: moFloatEdit'BallisticProV55.ConfigTab_VisualPrefs.fl_BrassTimeFloat'
	begin object name="fl_BrassTimeFloat" class=XInterface.moFloatEdit
		MinValue=0.0000000
		MaxValue=100.0000000
		ComponentJustification=0
		CaptionWidth=0.7000000
		Caption="Brass Life Scale [!]"
		OnCreateComponent=fl_BrassTimeFloat.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="Scales the life time of ejected brass. 0 = Forever."
		WinTop=0.3000000
		WinLeft=0.2500000
		WinHeight=0.0400000
	end object
	fl_BrassTime=fl_BrassTimeFloat
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: moCheckBox'BallisticProV55.ConfigTab_VisualPrefs.ch_MotionBlurCheck'
begin object name="ch_MotionBlurCheck" class=XInterface.moCheckBox
	ComponentJustification=0
	CaptionWidth=0.9000000
	Caption="Motion Blur [!]"
	OnCreateComponent=ch_MotionBlurCheck.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="Enable the use of motion blur effects. WARNING: This may have undesirable effects on some machines!"
	WinTop=0.4500000
	WinLeft=0.2500000
	WinHeight=0.0400000
end object
// Reference: moCheckBox'BallisticProV55.ConfigTab_VisualPrefs.ch_ImpStayCheck'
begin object name="ch_ImpStayCheck" class=XInterface.moCheckBox
	ComponentJustification=0
	CaptionWidth=0.9000000
	Caption="Permanent Impact Marks [!]"
	OnCreateComponent=ch_ImpStayCheck.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="Impact marks like bullet holes and explosion scorches stay forever. WARNING: This can kill performance on most machines!"
	WinTop=0.4000000
	WinLeft=0.2500000
	WinHeight=0.0400000
end object
// Reference: moCheckBox'BallisticProV55.ConfigTab_VisualPrefs.ch_MSmokeCheck'
begin object name="ch_MSmokeCheck" class=XInterface.moCheckBox
	ComponentJustification=0
	CaptionWidth=0.9000000
	Caption="Muzzle Smoke"
	OnCreateComponent=ch_MSmokeCheck.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="Enable muzzle smoke emitting when firing guns."
	WinTop=0.3500000
	WinLeft=0.2500000
	WinHeight=0.0400000
end object
// Reference: moFloatEdit'BallisticProV55.ConfigTab_VisualPrefs.fl_BrassTimeFloat'
begin object name="fl_BrassTimeFloat" class=XInterface.moFloatEdit
	MinValue=0.0000000
	MaxValue=100.0000000
	ComponentJustification=0
	CaptionWidth=0.7000000
	Caption="Brass Life Scale [!]"
	OnCreateComponent=fl_BrassTimeFloat.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="Scales the life time of ejected brass. 0 = Forever."
	WinTop=0.3000000
	WinLeft=0.2500000
	WinHeight=0.0400000
end object
// Reference: moCheckBox'BallisticProV55.ConfigTab_VisualPrefs.ch_UseBrassCheck'
begin object name="ch_UseBrassCheck" class=XInterface.moCheckBox
	ComponentJustification=0
	CaptionWidth=0.9000000
	Caption="Eject Brass"
	OnCreateComponent=ch_UseBrassCheck.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="Allow weapons to spew out shell casings and similar effects."
	WinTop=0.2500000
	WinLeft=0.2500000
	WinHeight=0.0400000
end object
// Reference: moComboBox'BallisticProV55.ConfigTab_VisualPrefs.co_CamRateCombo'
begin object name="co_CamRateCombo" class=XInterface.moComboBox
	ComponentJustification=0
	CaptionWidth=0.5500000
	Caption="Camera Update Rate"
	OnCreateComponent=co_CamRateCombo.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="How fast camera view screens like the M50's LCD should update."
	WinTop=0.2000000
	WinLeft=0.2500000
end object
// Reference: moComboBox'BallisticProV55.ConfigTab_VisualPrefs.co_EffectDetCombo'
begin object name="co_EffectDetCombo" class=XInterface.moComboBox
	ComponentJustification=0
	CaptionWidth=0.5500000
	Caption="Effects Quality"
	OnCreateComponent=co_EffectDetCombo.InternalOnCreateComponent
	IniOption="@Internal"
	IniDefault="High"
	Hint="Choose the quality level for Ballistic effects. Remember, if the 'World Detail' setting is lower, it will affect the quality of BW effects."
	WinTop=0.1500000
	WinLeft=0.2500000
end object
// Reference: moComboBox'BallisticProV55.ConfigTab_VisualPrefs.co_WeaponDetCombo'
begin object name="co_WeaponDetCombo" class=XInterface.moComboBox
	ComponentJustification=0
	CaptionWidth=0.5500000
	Caption="Weapon Detail"
	OnCreateComponent=co_WeaponDetCombo.InternalOnCreateComponent
	IniOption="@Internal"
	IniDefault="High"
	Hint="Choose the detail level for weapon textures. This should be set after changing the 'Character Detail' setting in the options menu as it will override this setting."
	WinTop=0.1000000
	WinLeft=0.2500000
end object
