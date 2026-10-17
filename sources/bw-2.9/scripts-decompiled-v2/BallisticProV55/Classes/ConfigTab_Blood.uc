class ConfigTab_Blood extends ConfigTabBase
	editinlinenew
	instanced;

var() automated moCheckBox ch_BloodDrags;
var() automated moCheckBox ch_BloodImpacts;
var() automated moCheckBox ch_BloodPools;
var() automated moCheckBox ch_BloodSplats;
var() automated moCheckBox ch_BloodExplodes;
var() automated moCheckBox ch_BloodFX;
var() automated moCheckBox ch_Stmups;
var() automated moCheckBox ch_Chunks;
var() automated moCheckBox ch_ScreenFX;
var() automated moFloatEdit fl_BloodTimeScale;
var() automated moSlider sl_GibMulti;

function LoadSettings()
{
	ch_BloodDrags.Checked(Class'BallisticProV55.BWBloodControl'.default.bUseBloodDrags);
	ch_BloodImpacts.Checked(Class'BallisticProV55.BWBloodControl'.default.bUseBloodImpacts);
	ch_BloodPools.Checked(Class'BallisticProV55.BWBloodControl'.default.bUseBloodPools);
	ch_BloodSplats.Checked(Class'BCoreProV55.BloodManager'.default.bUseBloodSplats);
	ch_BloodExplodes.Checked(Class'BCoreProV55.BloodManager'.default.bUseBloodExplodes);
	fl_BloodTimeScale.SetValue(Class'BCoreProV55.AD_BloodDecal'.default.StayScale);
	ch_BloodFX.Checked(Class'BCoreProV55.BloodManager'.default.bUseBloodEffects);
	ch_Stmups.Checked(Class'BCoreProV55.BloodManager'.default.bUseStumps);
	ch_Chunks.Checked(Class'BCoreProV55.BloodManager'.default.bUseChunks);
	ch_ScreenFX.Checked(Class'BCoreProV55.BloodManager'.default.bUseScreenFX);
	sl_GibMulti.SetValue(float(Class'BCoreProV55.BloodManager'.default.GibMultiplier));
	//return;	
}

function SaveSettings()
{
	// End:0x0D
	if(!bInitialized)
	{
		return;
	}
	Class'BallisticProV55.BWBloodControl'.default.bUseBloodDrags = ch_BloodDrags.IsChecked();
	Class'BallisticProV55.BWBloodControl'.default.bUseBloodImpacts = ch_BloodImpacts.IsChecked();
	Class'BallisticProV55.BWBloodControl'.default.bUseBloodPools = ch_BloodPools.IsChecked();
	Class'BCoreProV55.BloodManager'.default.bUseBloodSplats = ch_BloodSplats.IsChecked();
	Class'BCoreProV55.BallisticGib'.default.bUseBloodSplats = ch_BloodSplats.IsChecked();
	Class'BCoreProV55.BloodManager'.default.bUseBloodExplodes = ch_BloodExplodes.IsChecked();
	Class'BCoreProV55.AD_BloodDecal'.default.StayScale = fl_BloodTimeScale.GetValue();
	Class'BCoreProV55.BloodManager'.default.bUseBloodEffects = ch_BloodFX.IsChecked();
	Class'BCoreProV55.BloodManager'.default.bUseStumps = ch_Stmups.IsChecked();
	Class'BCoreProV55.BloodManager'.default.bUseChunks = ch_Chunks.IsChecked();
	Class'BCoreProV55.BloodManager'.default.bUseScreenFX = ch_ScreenFX.IsChecked();
	Class'BCoreProV55.BloodManager'.default.GibMultiplier = int(sl_GibMulti.GetValue());
	Class'BallisticProV55.BWBloodControl'.static.StaticSaveConfig();
	Class'BCoreProV55.BloodManager'.static.StaticSaveConfig();
	Class'BCoreProV55.BallisticGib'.static.StaticSaveConfig();
	Class'BCoreProV55.AD_BloodDecal'.static.StaticSaveConfig();
	Class'BallisticProV55.Mut_Ballistic'.static.StaticSaveConfig();
	//return;	
}

function DefaultSettings()
{
	ch_BloodDrags.Checked(true);
	ch_BloodImpacts.Checked(true);
	ch_BloodPools.Checked(true);
	ch_BloodSplats.Checked(true);
	ch_BloodExplodes.Checked(true);
	fl_BloodTimeScale.SetValue(1.0000000);
	ch_BloodFX.Checked(false);
	ch_Stmups.Checked(true);
	ch_Chunks.Checked(true);
	ch_ScreenFX.Checked(false);
	sl_GibMulti.SetValue(1.0000000);
	//return;	
}

defaultproperties
{
	// Reference: moCheckBox'BallisticProV55.ConfigTab_Blood.ch_BloodDragsCheck'
	begin object name="ch_BloodDragsCheck" class=XInterface.moCheckBox
		ComponentJustification=0
		CaptionWidth=0.9000000
		Caption="Cadaver Drag Trails"
		OnCreateComponent=ch_BloodDragsCheck.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="Toggles dead bodies leaving blood trails when they slide across surfaces."
		WinTop=0.1500000
		WinLeft=0.2500000
		WinHeight=0.0400000
	end object
	ch_BloodDrags=ch_BloodDragsCheck
	// Reference: moCheckBox'BallisticProV55.ConfigTab_Blood.ch_BloodImpactsCheck'
	begin object name="ch_BloodImpactsCheck" class=XInterface.moCheckBox
		ComponentJustification=0
		CaptionWidth=0.9000000
		Caption="Corpse Impact Blood"
		OnCreateComponent=ch_BloodImpactsCheck.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="Toggles blood marks caused by bodies impacting with surfaces at high speed."
		WinTop=0.2000000
		WinLeft=0.2500000
		WinHeight=0.0400000
	end object
	ch_BloodImpacts=ch_BloodImpactsCheck
	// Reference: moCheckBox'BallisticProV55.ConfigTab_Blood.ch_BloodPoolsCheck'
	begin object name="ch_BloodPoolsCheck" class=XInterface.moCheckBox
		ComponentJustification=0
		CaptionWidth=0.9000000
		Caption="Blood Pools"
		OnCreateComponent=ch_BloodPoolsCheck.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="Toggles dead bodies leaving pools when they are stationary."
		WinTop=0.2500000
		WinLeft=0.2500000
		WinHeight=0.0400000
	end object
	ch_BloodPools=ch_BloodPoolsCheck
	// Reference: moCheckBox'BallisticProV55.ConfigTab_Blood.ch_BloodSplatsCheck'
	begin object name="ch_BloodSplatsCheck" class=XInterface.moCheckBox
		ComponentJustification=0
		CaptionWidth=0.9000000
		Caption="Injury Blood Marks"
		OnCreateComponent=ch_BloodSplatsCheck.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="Toggles blood spatter marks appearing on surfaces when players are damaged."
		WinTop=0.3000000
		WinLeft=0.2500000
		WinHeight=0.0400000
	end object
	ch_BloodSplats=ch_BloodSplatsCheck
	// Reference: moCheckBox'BallisticProV55.ConfigTab_Blood.ch_BloodExplodesCheck'
	begin object name="ch_BloodExplodesCheck" class=XInterface.moCheckBox
		ComponentJustification=0
		CaptionWidth=0.9000000
		Caption="Explosion Blood"
		OnCreateComponent=ch_BloodExplodesCheck.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="Toggles horrendous blood effects when players are blown up."
		WinTop=0.3500000
		WinLeft=0.2500000
		WinHeight=0.0400000
	end object
	ch_BloodExplodes=ch_BloodExplodesCheck
	// Reference: moCheckBox'BallisticProV55.ConfigTab_Blood.ch_BloodFXCheck'
	begin object name="ch_BloodFXCheck" class=XInterface.moCheckBox
		ComponentJustification=0
		CaptionWidth=0.9000000
		Caption="Blood Particle Effects"
		OnCreateComponent=ch_BloodFXCheck.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="Toggles blood effects when damaging players."
		WinTop=0.1000000
		WinLeft=0.2500000
		WinHeight=0.0400000
	end object
	ch_BloodFX=ch_BloodFXCheck
	// Reference: moCheckBox'BallisticProV55.ConfigTab_Blood.ch_StmupsCheck'
	begin object name="ch_StmupsCheck" class=XInterface.moCheckBox
		ComponentJustification=0
		CaptionWidth=0.9000000
		Caption="Sever Stumps"
		OnCreateComponent=ch_StmupsCheck.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="Toggles spawning of stumps on severed limbs."
		WinTop=0.4500000
		WinLeft=0.2500000
		WinHeight=0.0400000
	end object
	ch_Stmups=ch_StmupsCheck
	// Reference: moCheckBox'BallisticProV55.ConfigTab_Blood.ch_ChunksCheck'
	begin object name="ch_ChunksCheck" class=XInterface.moCheckBox
		ComponentJustification=0
		CaptionWidth=0.9000000
		Caption="Gore Chunks"
		OnCreateComponent=ch_ChunksCheck.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="Toggles gibs for dismemberment."
		WinTop=0.4000000
		WinLeft=0.2500000
		WinHeight=0.0400000
	end object
	ch_Chunks=ch_ChunksCheck
	// Reference: moCheckBox'BallisticProV55.ConfigTab_Blood.ch_ScreenFXCheck'
	begin object name="ch_ScreenFXCheck" class=XInterface.moCheckBox
		ComponentJustification=0
		CaptionWidth=0.9000000
		Caption="Screen Blood"
		OnCreateComponent=ch_ScreenFXCheck.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="Toggles blood splashes and effects applied to the screen."
		WinTop=0.5000000
		WinLeft=0.2500000
		WinHeight=0.0400000
	end object
	ch_ScreenFX=ch_ScreenFXCheck
	// Reference: moFloatEdit'BallisticProV55.ConfigTab_Blood.fl_BloodTimeScaleFloat'
	begin object name="fl_BloodTimeScaleFloat" class=XInterface.moFloatEdit
		MinValue=0.0000000
		MaxValue=100.0000000
		ComponentJustification=0
		CaptionWidth=0.7000000
		Caption="Blood Stay Scale [!]"
		OnCreateComponent=fl_BloodTimeScaleFloat.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="Scales the life time of blood effects. 0 = Forever."
		WinTop=0.5500000
		WinLeft=0.2500000
		WinHeight=0.0400000
	end object
	fl_BloodTimeScale=fl_BloodTimeScaleFloat
	// Reference: moSlider'BallisticProV55.ConfigTab_Blood.sl_GibMultiSlider'
	begin object name="sl_GibMultiSlider" class=XInterface.moSlider
		MaxValue=20.0000000
		bIntSlider=true
		Caption="Gib Multiplier [!]"
		OnCreateComponent=sl_GibMultiSlider.InternalOnCreateComponent
		Hint="Multiplies number of gibs spawned. 1 = Normal, 0 = None. WARNING: Higher than 1 may kill performance!"
		WinTop=0.6000000
		WinLeft=0.2500000
		WinHeight=0.0400000
	end object
	sl_GibMulti=sl_GibMultiSlider
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: moSlider'BallisticProV55.ConfigTab_Blood.sl_GibMultiSlider'
begin object name="sl_GibMultiSlider" class=XInterface.moSlider
	MaxValue=20.0000000
	bIntSlider=true
	Caption="Gib Multiplier [!]"
	OnCreateComponent=sl_GibMultiSlider.InternalOnCreateComponent
	Hint="Multiplies number of gibs spawned. 1 = Normal, 0 = None. WARNING: Higher than 1 may kill performance!"
	WinTop=0.6000000
	WinLeft=0.2500000
	WinHeight=0.0400000
end object
// Reference: moFloatEdit'BallisticProV55.ConfigTab_Blood.fl_BloodTimeScaleFloat'
begin object name="fl_BloodTimeScaleFloat" class=XInterface.moFloatEdit
	MinValue=0.0000000
	MaxValue=100.0000000
	ComponentJustification=0
	CaptionWidth=0.7000000
	Caption="Blood Stay Scale [!]"
	OnCreateComponent=fl_BloodTimeScaleFloat.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="Scales the life time of blood effects. 0 = Forever."
	WinTop=0.5500000
	WinLeft=0.2500000
	WinHeight=0.0400000
end object
// Reference: moCheckBox'BallisticProV55.ConfigTab_Blood.ch_ScreenFXCheck'
begin object name="ch_ScreenFXCheck" class=XInterface.moCheckBox
	ComponentJustification=0
	CaptionWidth=0.9000000
	Caption="Screen Blood"
	OnCreateComponent=ch_ScreenFXCheck.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="Toggles blood splashes and effects applied to the screen."
	WinTop=0.5000000
	WinLeft=0.2500000
	WinHeight=0.0400000
end object
// Reference: moCheckBox'BallisticProV55.ConfigTab_Blood.ch_StmupsCheck'
begin object name="ch_StmupsCheck" class=XInterface.moCheckBox
	ComponentJustification=0
	CaptionWidth=0.9000000
	Caption="Sever Stumps"
	OnCreateComponent=ch_StmupsCheck.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="Toggles spawning of stumps on severed limbs."
	WinTop=0.4500000
	WinLeft=0.2500000
	WinHeight=0.0400000
end object
// Reference: moCheckBox'BallisticProV55.ConfigTab_Blood.ch_ChunksCheck'
begin object name="ch_ChunksCheck" class=XInterface.moCheckBox
	ComponentJustification=0
	CaptionWidth=0.9000000
	Caption="Gore Chunks"
	OnCreateComponent=ch_ChunksCheck.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="Toggles gibs for dismemberment."
	WinTop=0.4000000
	WinLeft=0.2500000
	WinHeight=0.0400000
end object
// Reference: moCheckBox'BallisticProV55.ConfigTab_Blood.ch_BloodExplodesCheck'
begin object name="ch_BloodExplodesCheck" class=XInterface.moCheckBox
	ComponentJustification=0
	CaptionWidth=0.9000000
	Caption="Explosion Blood"
	OnCreateComponent=ch_BloodExplodesCheck.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="Toggles horrendous blood effects when players are blown up."
	WinTop=0.3500000
	WinLeft=0.2500000
	WinHeight=0.0400000
end object
// Reference: moCheckBox'BallisticProV55.ConfigTab_Blood.ch_BloodSplatsCheck'
begin object name="ch_BloodSplatsCheck" class=XInterface.moCheckBox
	ComponentJustification=0
	CaptionWidth=0.9000000
	Caption="Injury Blood Marks"
	OnCreateComponent=ch_BloodSplatsCheck.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="Toggles blood spatter marks appearing on surfaces when players are damaged."
	WinTop=0.3000000
	WinLeft=0.2500000
	WinHeight=0.0400000
end object
// Reference: moCheckBox'BallisticProV55.ConfigTab_Blood.ch_BloodPoolsCheck'
begin object name="ch_BloodPoolsCheck" class=XInterface.moCheckBox
	ComponentJustification=0
	CaptionWidth=0.9000000
	Caption="Blood Pools"
	OnCreateComponent=ch_BloodPoolsCheck.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="Toggles dead bodies leaving pools when they are stationary."
	WinTop=0.2500000
	WinLeft=0.2500000
	WinHeight=0.0400000
end object
// Reference: moCheckBox'BallisticProV55.ConfigTab_Blood.ch_BloodImpactsCheck'
begin object name="ch_BloodImpactsCheck" class=XInterface.moCheckBox
	ComponentJustification=0
	CaptionWidth=0.9000000
	Caption="Corpse Impact Blood"
	OnCreateComponent=ch_BloodImpactsCheck.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="Toggles blood marks caused by bodies impacting with surfaces at high speed."
	WinTop=0.2000000
	WinLeft=0.2500000
	WinHeight=0.0400000
end object
// Reference: moCheckBox'BallisticProV55.ConfigTab_Blood.ch_BloodDragsCheck'
begin object name="ch_BloodDragsCheck" class=XInterface.moCheckBox
	ComponentJustification=0
	CaptionWidth=0.9000000
	Caption="Cadaver Drag Trails"
	OnCreateComponent=ch_BloodDragsCheck.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="Toggles dead bodies leaving blood trails when they slide across surfaces."
	WinTop=0.1500000
	WinLeft=0.2500000
	WinHeight=0.0400000
end object
// Reference: moCheckBox'BallisticProV55.ConfigTab_Blood.ch_BloodFXCheck'
begin object name="ch_BloodFXCheck" class=XInterface.moCheckBox
	ComponentJustification=0
	CaptionWidth=0.9000000
	Caption="Blood Particle Effects"
	OnCreateComponent=ch_BloodFXCheck.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="Toggles blood effects when damaging players."
	WinTop=0.1000000
	WinLeft=0.2500000
	WinHeight=0.0400000
end object
