class ConfigTab_PickupRules extends ConfigTabBase
	editinlinenew
	instanced;

var() automated moFloatEdit fl_NadePct;
var() automated moCheckBox ch_BrightPickups;
var() automated moCheckBox ch_PickupsChange;
var() automated moCheckBox ch_SpawnUnique;
var() automated moCheckBox ch_LeaveSuper;
var() automated moCheckBox ch_KillRogueWPs;
var() automated moCheckBox chk_bRemoveAmmoPacks;
var() automated moCheckBox chk_bRemoveUDamage;
var() automated moCheckBox chk_bRemoveShieldPack;
var() automated moCheckBox chk_bRemoveSuperShieldPack;
var() automated moCheckBox chk_bRemoveBandages;
var() automated moCheckBox chk_bRemoveHealthPack;
var() automated moCheckBox chk_bRemoveSuperHealthPack;
var() automated moCheckBox chk_bRemoveAdrenaline;
var() automated moCheckBox chk_AlternativePickups;

function LoadSettings()
{
	local Class<BC_GameStyle_Config> game_style;

	fl_NadePct.SetValue(float(Class'BallisticProV55.Mut_BallisticSwap'.default.NadeReplacePercent));
	ch_BrightPickups.Checked(Class'BallisticProV55.Mut_Ballistic'.default.bBrightPickups);
	ch_PickupsChange.Checked(Class'BallisticProV55.Mut_Ballistic'.default.bPickupsChange);
	ch_SpawnUnique.Checked(Class'BallisticProV55.Mut_Ballistic'.default.bSpawnUniqueItems);
	ch_KillRogueWPs.Checked(Class'BallisticProV55.Mut_Ballistic'.default.bKillRogueWeaponPickups);
	ch_LeaveSuper.Checked(Class'BallisticProV55.Mut_Ballistic'.default.bLeaveSuper);
	chk_bRemoveAmmoPacks.Checked(Class'BallisticProV55.Mut_Pickups'.default.bRemoveAmmoPacks);
	chk_bRemoveUDamage.Checked(Class'BallisticProV55.Mut_Pickups'.default.bRemoveUDamage);
	chk_bRemoveShieldPack.Checked(Class'BallisticProV55.Mut_Pickups'.default.bRemoveShieldPack);
	chk_bRemoveSuperShieldPack.Checked(Class'BallisticProV55.Mut_Pickups'.default.bRemoveSuperShieldPack);
	chk_bRemoveBandages.Checked(Class'BallisticProV55.Mut_Pickups'.default.bRemoveBandages);
	chk_bRemoveHealthPack.Checked(Class'BallisticProV55.Mut_Pickups'.default.bRemoveHealthPack);
	chk_bRemoveSuperHealthPack.Checked(Class'BallisticProV55.Mut_Pickups'.default.bRemoveSuperHealthPack);
	chk_bRemoveAdrenaline.Checked(Class'BallisticProV55.Mut_Pickups'.default.bRemoveAdrenaline);
	game_style = BaseMenu.GetConfigStyle();
	// End:0x1E3
	if(game_style != none)
	{
		chk_AlternativePickups.Checked(game_style.default.bAlternativePickups);
	}
	//return;	
}

function DefaultSettings()
{
	chk_bRemoveAmmoPacks.Checked(true);
	chk_bRemoveUDamage.Checked(true);
	chk_bRemoveShieldPack.Checked(true);
	chk_bRemoveSuperShieldPack.Checked(true);
	chk_bRemoveBandages.Checked(true);
	chk_bRemoveHealthPack.Checked(true);
	chk_bRemoveSuperHealthPack.Checked(true);
	chk_bRemoveAdrenaline.Checked(true);
	chk_AlternativePickups.Checked(true);
	fl_NadePct.SetValue(15.0000000);
	ch_BrightPickups.Checked(false);
	ch_PickupsChange.Checked(true);
	ch_SpawnUnique.Checked(true);
	ch_KillRogueWPs.Checked(false);
	ch_LeaveSuper.Checked(false);
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
	Class'BallisticProV55.Mut_BallisticSwap'.default.NadeReplacePercent = int(fl_NadePct.GetValue());
	Class'BallisticProV55.Mut_Ballistic'.default.bBrightPickups = ch_BrightPickups.IsChecked();
	Class'BallisticProV55.Mut_Ballistic'.default.bPickupsChange = ch_PickupsChange.IsChecked();
	Class'BallisticProV55.Mut_Ballistic'.default.bSpawnUniqueItems = ch_SpawnUnique.IsChecked();
	Class'BallisticProV55.Mut_Ballistic'.default.bKillRogueWeaponPickups = ch_KillRogueWPs.IsChecked();
	Class'BallisticProV55.Mut_Ballistic'.default.bLeaveSuper = ch_LeaveSuper.IsChecked();
	Class'BallisticProV55.Mut_BallisticSwap'.static.StaticSaveConfig();
	Class'BallisticProV55.Mut_Ballistic'.static.StaticSaveConfig();
	Class'BallisticProV55.Mut_Pickups'.default.bRemoveAmmoPacks = chk_bRemoveAmmoPacks.IsChecked();
	Class'BallisticProV55.Mut_Pickups'.default.bRemoveUDamage = chk_bRemoveUDamage.IsChecked();
	Class'BallisticProV55.Mut_Pickups'.default.bRemoveShieldPack = chk_bRemoveShieldPack.IsChecked();
	Class'BallisticProV55.Mut_Pickups'.default.bRemoveSuperShieldPack = chk_bRemoveSuperShieldPack.IsChecked();
	Class'BallisticProV55.Mut_Pickups'.default.bRemoveBandages = chk_bRemoveBandages.IsChecked();
	Class'BallisticProV55.Mut_Pickups'.default.bRemoveHealthPack = chk_bRemoveHealthPack.IsChecked();
	Class'BallisticProV55.Mut_Pickups'.default.bRemoveSuperHealthPack = chk_bRemoveSuperHealthPack.IsChecked();
	Class'BallisticProV55.Mut_Pickups'.default.bRemoveAdrenaline = chk_bRemoveAdrenaline.IsChecked();
	Class'BallisticProV55.Mut_Pickups'.static.StaticSaveConfig();
	game_style = BaseMenu.GetConfigStyle();
	// End:0x23B
	if(game_style != none)
	{
		game_style.default.bAlternativePickups = chk_AlternativePickups.IsChecked();
		game_style.static.StaticSaveConfig();
	}
	//return;	
}

defaultproperties
{
	// Reference: moFloatEdit'BallisticProV55.ConfigTab_PickupRules.fl_NadePctFloat'
	begin object name="fl_NadePctFloat" class=XInterface.moFloatEdit
		MinValue=1.0000000
		MaxValue=100.0000000
		ComponentJustification=0
		CaptionWidth=0.8000000
		Caption="Ammo to Grenades Swap %"
		OnCreateComponent=fl_NadePctFloat.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="Percentage chance of replacing an ammo pickup with a grenade."
		WinTop=0.1000000
		WinLeft=0.2500000
		WinHeight=0.0400000
	end object
	fl_NadePct=fl_NadePctFloat
	// Reference: moCheckBox'BallisticProV55.ConfigTab_PickupRules.ch_BrightPickupsCheck'
	begin object name="ch_BrightPickupsCheck" class=XInterface.moCheckBox
		ComponentJustification=0
		CaptionWidth=0.9000000
		Caption="Bright Pickups"
		OnCreateComponent=ch_BrightPickupsCheck.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="Enable to make pickups bright and easier to see. Does not affect multiplayer."
		WinTop=0.1500000
		WinLeft=0.2500000
		WinHeight=0.0400000
	end object
	ch_BrightPickups=ch_BrightPickupsCheck
	// Reference: moCheckBox'BallisticProV55.ConfigTab_PickupRules.ch_PickupsChangeCheck'
	begin object name="ch_PickupsChangeCheck" class=XInterface.moCheckBox
		ComponentJustification=0
		CaptionWidth=0.9000000
		Caption="Pickups Change"
		OnCreateComponent=ch_PickupsChangeCheck.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="Pickups randomly change after they have been picked up."
		WinTop=0.2000000
		WinLeft=0.2500000
		WinHeight=0.0400000
	end object
	ch_PickupsChange=ch_PickupsChangeCheck
	// Reference: moCheckBox'BallisticProV55.ConfigTab_PickupRules.ch_SpawnUniqueCheck'
	begin object name="ch_SpawnUniqueCheck" class=XInterface.moCheckBox
		ComponentJustification=0
		CaptionWidth=0.9000000
		Caption="Prefer Unique Pickups"
		OnCreateComponent=ch_SpawnUniqueCheck.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="Game will prefer to spawn pickups that are the least common at the time."
		WinTop=0.2500000
		WinLeft=0.2500000
		WinHeight=0.0400000
	end object
	ch_SpawnUnique=ch_SpawnUniqueCheck
	// Reference: moCheckBox'BallisticProV55.ConfigTab_PickupRules.ch_LeaveSuperCheck'
	begin object name="ch_LeaveSuperCheck" class=XInterface.moCheckBox
		ComponentJustification=0
		CaptionWidth=0.9000000
		Caption="Keep Super Weapons"
		OnCreateComponent=ch_LeaveSuperCheck.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="Enable to leave super weapons in."
		WinTop=0.3500000
		WinLeft=0.2500000
		WinHeight=0.0400000
	end object
	ch_LeaveSuper=ch_LeaveSuperCheck
	// Reference: moCheckBox'BallisticProV55.ConfigTab_PickupRules.ch_KillRogueWPsCheck'
	begin object name="ch_KillRogueWPsCheck" class=XInterface.moCheckBox
		ComponentJustification=0
		CaptionWidth=0.9000000
		Caption="No Rogue Weapon Pickups"
		OnCreateComponent=ch_KillRogueWPsCheck.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="BW mutators will remove/replace unlisted weapon pickups. (e.g. In-map Instagib rifles)"
		WinTop=0.3000000
		WinLeft=0.2500000
		WinHeight=0.0400000
	end object
	ch_KillRogueWPs=ch_KillRogueWPsCheck
	// Reference: moCheckBox'BallisticProV55.ConfigTab_PickupRules.chk_bRemoveAmmoPacksC'
	begin object name="chk_bRemoveAmmoPacksC" class=XInterface.moCheckBox
		ComponentJustification=0
		CaptionWidth=0.9000000
		Caption="Remove ammo packs"
		OnCreateComponent=chk_bRemoveAmmoPacksC.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="Removes all ammo packs from the game."
		WinTop=0.4500000
		WinLeft=0.2500000
		WinHeight=0.0400000
	end object
	chk_bRemoveAmmoPacks=chk_bRemoveAmmoPacksC
	// Reference: moCheckBox'BallisticProV55.ConfigTab_PickupRules.chk_bRemoveUDamageC'
	begin object name="chk_bRemoveUDamageC" class=XInterface.moCheckBox
		ComponentJustification=0
		CaptionWidth=0.9000000
		Caption="Remove damage amplifiers"
		OnCreateComponent=chk_bRemoveUDamageC.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="Removes all damage amplifiers from the game."
		WinTop=0.5000000
		WinLeft=0.2500000
		WinHeight=0.0400000
	end object
	chk_bRemoveUDamage=chk_bRemoveUDamageC
	// Reference: moCheckBox'BallisticProV55.ConfigTab_PickupRules.bRemoveShieldPackC'
	begin object name="bRemoveShieldPackC" class=XInterface.moCheckBox
		ComponentJustification=0
		CaptionWidth=0.9000000
		Caption="Remove armors"
		OnCreateComponent=bRemoveShieldPackC.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="Removes all armors from the game except super armor."
		WinTop=0.5500000
		WinLeft=0.2500000
		WinHeight=0.0400000
	end object
	chk_bRemoveShieldPack=bRemoveShieldPackC
	// Reference: moCheckBox'BallisticProV55.ConfigTab_PickupRules.bRemoveSuperShieldPackC'
	begin object name="bRemoveSuperShieldPackC" class=XInterface.moCheckBox
		ComponentJustification=0
		CaptionWidth=0.9000000
		Caption="Remove super armors"
		OnCreateComponent=bRemoveSuperShieldPackC.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="Removes all super armors from the game."
		WinTop=0.6000000
		WinLeft=0.2500000
		WinHeight=0.0400000
	end object
	chk_bRemoveSuperShieldPack=bRemoveSuperShieldPackC
	// Reference: moCheckBox'BallisticProV55.ConfigTab_PickupRules.chk_bRemoveBandagesC'
	begin object name="chk_bRemoveBandagesC" class=XInterface.moCheckBox
		ComponentJustification=0
		CaptionWidth=0.9000000
		Caption="Remove bandages"
		OnCreateComponent=chk_bRemoveBandagesC.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="Removes all bandages from the game."
		WinTop=0.6500000
		WinLeft=0.2500000
		WinHeight=0.0400000
	end object
	chk_bRemoveBandages=chk_bRemoveBandagesC
	// Reference: moCheckBox'BallisticProV55.ConfigTab_PickupRules.chk_bRemoveHealthPackC'
	begin object name="chk_bRemoveHealthPackC" class=XInterface.moCheckBox
		ComponentJustification=0
		CaptionWidth=0.9000000
		Caption="Remove health packs"
		OnCreateComponent=chk_bRemoveHealthPackC.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="Removes all health packs from the game."
		WinTop=0.7000000
		WinLeft=0.2500000
		WinHeight=0.0400000
	end object
	chk_bRemoveHealthPack=chk_bRemoveHealthPackC
	// Reference: moCheckBox'BallisticProV55.ConfigTab_PickupRules.chk_bRemoveSuperHealthPackC'
	begin object name="chk_bRemoveSuperHealthPackC" class=XInterface.moCheckBox
		ComponentJustification=0
		CaptionWidth=0.9000000
		Caption="Remove super health packs"
		OnCreateComponent=chk_bRemoveSuperHealthPackC.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="Removes all super health packs from the game."
		WinTop=0.7500000
		WinLeft=0.2500000
		WinHeight=0.0400000
	end object
	chk_bRemoveSuperHealthPack=chk_bRemoveSuperHealthPackC
	// Reference: moCheckBox'BallisticProV55.ConfigTab_PickupRules.chk_bRemoveAdrenalineC'
	begin object name="chk_bRemoveAdrenalineC" class=XInterface.moCheckBox
		ComponentJustification=0
		CaptionWidth=0.9000000
		Caption="Remove adrenaline"
		OnCreateComponent=chk_bRemoveAdrenalineC.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="Removes all adrenaline from the game."
		WinTop=0.8000000
		WinLeft=0.2500000
		WinHeight=0.0400000
	end object
	chk_bRemoveAdrenaline=chk_bRemoveAdrenalineC
	// Reference: moCheckBox'BallisticProV55.ConfigTab_PickupRules.chk_AlternativePickupsC'
	begin object name="chk_AlternativePickupsC" class=XInterface.moCheckBox
		ComponentJustification=0
		CaptionWidth=0.9000000
		Caption="Manual Pickups"
		OnCreateComponent=chk_AlternativePickupsC.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="Press the use key to pickup weapons."
		WinTop=0.8500000
		WinLeft=0.2500000
		WinHeight=0.0400000
	end object
	chk_AlternativePickups=chk_AlternativePickupsC
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: moCheckBox'BallisticProV55.ConfigTab_PickupRules.chk_AlternativePickupsC'
begin object name="chk_AlternativePickupsC" class=XInterface.moCheckBox
	ComponentJustification=0
	CaptionWidth=0.9000000
	Caption="Manual Pickups"
	OnCreateComponent=chk_AlternativePickupsC.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="Press the use key to pickup weapons."
	WinTop=0.8500000
	WinLeft=0.2500000
	WinHeight=0.0400000
end object
// Reference: moCheckBox'BallisticProV55.ConfigTab_PickupRules.chk_bRemoveAdrenalineC'
begin object name="chk_bRemoveAdrenalineC" class=XInterface.moCheckBox
	ComponentJustification=0
	CaptionWidth=0.9000000
	Caption="Remove adrenaline"
	OnCreateComponent=chk_bRemoveAdrenalineC.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="Removes all adrenaline from the game."
	WinTop=0.8000000
	WinLeft=0.2500000
	WinHeight=0.0400000
end object
// Reference: moCheckBox'BallisticProV55.ConfigTab_PickupRules.chk_bRemoveSuperHealthPackC'
begin object name="chk_bRemoveSuperHealthPackC" class=XInterface.moCheckBox
	ComponentJustification=0
	CaptionWidth=0.9000000
	Caption="Remove super health packs"
	OnCreateComponent=chk_bRemoveSuperHealthPackC.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="Removes all super health packs from the game."
	WinTop=0.7500000
	WinLeft=0.2500000
	WinHeight=0.0400000
end object
// Reference: moCheckBox'BallisticProV55.ConfigTab_PickupRules.chk_bRemoveHealthPackC'
begin object name="chk_bRemoveHealthPackC" class=XInterface.moCheckBox
	ComponentJustification=0
	CaptionWidth=0.9000000
	Caption="Remove health packs"
	OnCreateComponent=chk_bRemoveHealthPackC.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="Removes all health packs from the game."
	WinTop=0.7000000
	WinLeft=0.2500000
	WinHeight=0.0400000
end object
// Reference: moCheckBox'BallisticProV55.ConfigTab_PickupRules.chk_bRemoveBandagesC'
begin object name="chk_bRemoveBandagesC" class=XInterface.moCheckBox
	ComponentJustification=0
	CaptionWidth=0.9000000
	Caption="Remove bandages"
	OnCreateComponent=chk_bRemoveBandagesC.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="Removes all bandages from the game."
	WinTop=0.6500000
	WinLeft=0.2500000
	WinHeight=0.0400000
end object
// Reference: moCheckBox'BallisticProV55.ConfigTab_PickupRules.bRemoveSuperShieldPackC'
begin object name="bRemoveSuperShieldPackC" class=XInterface.moCheckBox
	ComponentJustification=0
	CaptionWidth=0.9000000
	Caption="Remove super armors"
	OnCreateComponent=bRemoveSuperShieldPackC.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="Removes all super armors from the game."
	WinTop=0.6000000
	WinLeft=0.2500000
	WinHeight=0.0400000
end object
// Reference: moCheckBox'BallisticProV55.ConfigTab_PickupRules.bRemoveShieldPackC'
begin object name="bRemoveShieldPackC" class=XInterface.moCheckBox
	ComponentJustification=0
	CaptionWidth=0.9000000
	Caption="Remove armors"
	OnCreateComponent=bRemoveShieldPackC.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="Removes all armors from the game except super armor."
	WinTop=0.5500000
	WinLeft=0.2500000
	WinHeight=0.0400000
end object
// Reference: moCheckBox'BallisticProV55.ConfigTab_PickupRules.chk_bRemoveUDamageC'
begin object name="chk_bRemoveUDamageC" class=XInterface.moCheckBox
	ComponentJustification=0
	CaptionWidth=0.9000000
	Caption="Remove damage amplifiers"
	OnCreateComponent=chk_bRemoveUDamageC.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="Removes all damage amplifiers from the game."
	WinTop=0.5000000
	WinLeft=0.2500000
	WinHeight=0.0400000
end object
// Reference: moCheckBox'BallisticProV55.ConfigTab_PickupRules.chk_bRemoveAmmoPacksC'
begin object name="chk_bRemoveAmmoPacksC" class=XInterface.moCheckBox
	ComponentJustification=0
	CaptionWidth=0.9000000
	Caption="Remove ammo packs"
	OnCreateComponent=chk_bRemoveAmmoPacksC.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="Removes all ammo packs from the game."
	WinTop=0.4500000
	WinLeft=0.2500000
	WinHeight=0.0400000
end object
// Reference: moCheckBox'BallisticProV55.ConfigTab_PickupRules.ch_LeaveSuperCheck'
begin object name="ch_LeaveSuperCheck" class=XInterface.moCheckBox
	ComponentJustification=0
	CaptionWidth=0.9000000
	Caption="Keep Super Weapons"
	OnCreateComponent=ch_LeaveSuperCheck.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="Enable to leave super weapons in."
	WinTop=0.3500000
	WinLeft=0.2500000
	WinHeight=0.0400000
end object
// Reference: moCheckBox'BallisticProV55.ConfigTab_PickupRules.ch_KillRogueWPsCheck'
begin object name="ch_KillRogueWPsCheck" class=XInterface.moCheckBox
	ComponentJustification=0
	CaptionWidth=0.9000000
	Caption="No Rogue Weapon Pickups"
	OnCreateComponent=ch_KillRogueWPsCheck.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="BW mutators will remove/replace unlisted weapon pickups. (e.g. In-map Instagib rifles)"
	WinTop=0.3000000
	WinLeft=0.2500000
	WinHeight=0.0400000
end object
// Reference: moCheckBox'BallisticProV55.ConfigTab_PickupRules.ch_SpawnUniqueCheck'
begin object name="ch_SpawnUniqueCheck" class=XInterface.moCheckBox
	ComponentJustification=0
	CaptionWidth=0.9000000
	Caption="Prefer Unique Pickups"
	OnCreateComponent=ch_SpawnUniqueCheck.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="Game will prefer to spawn pickups that are the least common at the time."
	WinTop=0.2500000
	WinLeft=0.2500000
	WinHeight=0.0400000
end object
// Reference: moCheckBox'BallisticProV55.ConfigTab_PickupRules.ch_PickupsChangeCheck'
begin object name="ch_PickupsChangeCheck" class=XInterface.moCheckBox
	ComponentJustification=0
	CaptionWidth=0.9000000
	Caption="Pickups Change"
	OnCreateComponent=ch_PickupsChangeCheck.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="Pickups randomly change after they have been picked up."
	WinTop=0.2000000
	WinLeft=0.2500000
	WinHeight=0.0400000
end object
// Reference: moCheckBox'BallisticProV55.ConfigTab_PickupRules.ch_BrightPickupsCheck'
begin object name="ch_BrightPickupsCheck" class=XInterface.moCheckBox
	ComponentJustification=0
	CaptionWidth=0.9000000
	Caption="Bright Pickups"
	OnCreateComponent=ch_BrightPickupsCheck.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="Enable to make pickups bright and easier to see. Does not affect multiplayer."
	WinTop=0.1500000
	WinLeft=0.2500000
	WinHeight=0.0400000
end object
// Reference: moFloatEdit'BallisticProV55.ConfigTab_PickupRules.fl_NadePctFloat'
begin object name="fl_NadePctFloat" class=XInterface.moFloatEdit
	MinValue=1.0000000
	MaxValue=100.0000000
	ComponentJustification=0
	CaptionWidth=0.8000000
	Caption="Ammo to Grenades Swap %"
	OnCreateComponent=fl_NadePctFloat.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="Percentage chance of replacing an ammo pickup with a grenade."
	WinTop=0.1000000
	WinLeft=0.2500000
	WinHeight=0.0400000
end object
