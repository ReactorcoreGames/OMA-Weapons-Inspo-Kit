class ConfigTab_GameRules extends ConfigTabBase
	editinlinenew
	instanced;

var() automated moComboBox co_InventoryMode;
var() automated moCheckBox ch_BrightPlayers;
var() automated moCheckBox ch_ForceBWPawn;
var() automated moCheckBox ch_PreCacheWeapons;
var() automated moCheckBox ch_KillStreaks;
var() automated GUIButton bn_ClientSettings;
var() localized string ArenaLOHint;
var() localized string SwapLOHint;
var() localized string LoadoutLOHint;
var() localized string InventoryLOHint;
var() localized string MeleeLOHint;

function LoadSettings()
{
	local Class<BC_GameStyle> game_style;

	co_InventoryMode.AddItem("Inventory",, string(0));
	co_InventoryMode.AddItem("Loadout",, string(1));
	co_InventoryMode.AddItem("Evolution Loadout",, string(2));
	co_InventoryMode.AddItem("Pickups",, string(3));
	co_InventoryMode.AddItem("Arena",, string(4));
	co_InventoryMode.AddItem("Melee",, string(5));
	co_InventoryMode.ReadOnly(true);
	ch_PreCacheWeapons.Checked(Class'BallisticProV55.Mut_Ballistic'.default.bPreloadMeshes);
	ch_ForceBWPawn.Checked(Class'BallisticProV55.Mut_Ballistic'.default.bForceBallisticPawn);
	game_style = BaseMenu.GetGameStyle();
	// End:0x164
	if(game_style == none)
	{
		Log("ConfigTab_GameRules: Couldn't load: No compatible style found");		
	}
	else
	{
		co_InventoryMode.SetIndex(game_style.default.InventoryModeIndex);
		ch_KillStreaks.Checked(game_style.default.bKillstreaks);
		ch_BrightPlayers.Checked(game_style.default.bBrightPlayers);
	}
	//return;	
}

function SaveSettings()
{
	local Class<BC_GameStyle> game_style;

	// End:0x0D
	if(!bInitialized)
	{
		return;
	}
	Class'BallisticProV55.Mut_Ballistic'.default.bPreloadMeshes = ch_PreCacheWeapons.IsChecked();
	Class'BallisticProV55.Mut_Ballistic'.default.bForceBallisticPawn = ch_ForceBWPawn.IsChecked();
	Class'BallisticProV55.Mut_Ballistic'.static.StaticSaveConfig();
	game_style = BaseMenu.GetGameStyle();
	// End:0xBE
	if(game_style == none)
	{
		Log("ConfigTab_GameRules: Couldn't save: No compatible style found");		
	}
	else
	{
		game_style.default.InventoryModeIndex = co_InventoryMode.GetIndex();
		game_style.default.bBrightPlayers = ch_BrightPlayers.IsChecked();
		game_style.default.bKillstreaks = ch_KillStreaks.IsChecked();
		game_style.static.StaticSaveConfig();
	}
	//return;	
}

function DefaultSettings()
{
	co_InventoryMode.SetIndex(0);
	ch_BrightPlayers.Checked(false);
	ch_ForceBWPawn.Checked(false);
	ch_PreCacheWeapons.Checked(true);
	ch_KillStreaks.Checked(false);
	//return;	
}

function bool InternalOnClick(GUIComponent Sender)
{
	// End:0x48
	if(Sender == bn_ClientSettings)
	{
		Controller.OpenMenu("BallisticProV55.ConfigMenu_Preferences");
		return true;
	}
	return false;
	//return;	
}

defaultproperties
{
	// Reference: moComboBox'BallisticProV55.ConfigTab_GameRules.co_InventoryModeCombo'
	begin object name="co_InventoryModeCombo" class=XInterface.moComboBox
		ComponentJustification=0
		CaptionWidth=0.5500000
		Caption="Weapon Spawning"
		OnCreateComponent=co_InventoryModeCombo.InternalOnCreateComponent
		IniOption="@Internal"
		IniDefault="High"
		Hint="Determines the Weapon Spawns of Ballistic Weapons"
		WinTop=0.1000000
		WinLeft=0.2500000
		WinHeight=0.0400000
	end object
	co_InventoryMode=co_InventoryModeCombo
	// Reference: moCheckBox'BallisticProV55.ConfigTab_GameRules.ch_BrightPlayersCheck'
	begin object name="ch_BrightPlayersCheck" class=XInterface.moCheckBox
		ComponentJustification=0
		CaptionWidth=0.9000000
		Caption="Bright Players"
		OnCreateComponent=ch_BrightPlayersCheck.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="Makes players glow in the dark like normal UT2004. Only affects BW gametypes - standard gametypes have bright players already."
		WinTop=0.2000000
		WinLeft=0.2500000
		WinHeight=0.0400000
	end object
	ch_BrightPlayers=ch_BrightPlayersCheck
	// Reference: moCheckBox'BallisticProV55.ConfigTab_GameRules.ch_ForceBWPawnCheck'
	begin object name="ch_ForceBWPawnCheck" class=XInterface.moCheckBox
		ComponentJustification=0
		CaptionWidth=0.9000000
		Caption="Force Ballistic Pawn"
		OnCreateComponent=ch_ForceBWPawnCheck.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="BW mutators will try to force the Ballistic pawn even when game specific pawn is used.||WARNING: Can cause severe problems in some gametypes."
		WinTop=0.2500000
		WinLeft=0.2500000
		WinHeight=0.0400000
	end object
	ch_ForceBWPawn=ch_ForceBWPawnCheck
	// Reference: moCheckBox'BallisticProV55.ConfigTab_GameRules.ch_PreCacheCheck'
	begin object name="ch_PreCacheCheck" class=XInterface.moCheckBox
		ComponentJustification=0
		CaptionWidth=0.9000000
		Caption="Precache Weapons"
		OnCreateComponent=ch_PreCacheCheck.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="Precache weapons at the start of the match."
		WinTop=0.1500000
		WinLeft=0.2500000
		WinHeight=0.0400000
	end object
	ch_PreCacheWeapons=ch_PreCacheCheck
	// Reference: moCheckBox'BallisticProV55.ConfigTab_GameRules.ch_KillStreaksCheck'
	begin object name="ch_KillStreaksCheck" class=XInterface.moCheckBox
		ComponentJustification=0
		CaptionWidth=0.9000000
		Caption="Killstreaks"
		OnCreateComponent=ch_KillStreaksCheck.InternalOnCreateComponent
		IniOption="@Internal"
		Hint="Enables killstreaks. Configured via the Loadout tab."
		WinTop=0.3000000
		WinLeft=0.2500000
		WinHeight=0.0400000
	end object
	ch_KillStreaks=ch_KillStreaksCheck
	// Reference: GUIButton'BallisticProV55.ConfigTab_GameRules.ClientSettingsButton'
	begin object name="ClientSettingsButton" class=XInterface.GUIButton
		Caption="Preferences"
		Hint="Edit preferences."
		WinTop=0.4500000
		WinLeft=0.2500000
		WinWidth=0.5000000
		WinHeight=0.1000000
		TabOrder=0
		OnClick=ConfigTab_GameRules.InternalOnClick
		OnKeyEvent=ClientSettingsButton.InternalOnKeyEvent
	end object
	bn_ClientSettings=ClientSettingsButton
	ArenaLOHint="Arena gives everyoen one weapon, with the option of multiple/random weapons."
	SwapLOHint="Pickup spawns weapons in their map pickup spots."
	LoadoutLOHint="Loadout allows choosing starting weapons from 5 customizable categories."
	InventoryLOHint="Inventory allows choosing starting weapons based on a limited inventory space."
	MeleeLOHint="Only melee weapons spawn. Break some bones!"
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: GUIButton'BallisticProV55.ConfigTab_GameRules.ClientSettingsButton'
begin object name="ClientSettingsButton" class=XInterface.GUIButton
	Caption="Preferences"
	Hint="Edit preferences."
	WinTop=0.4500000
	WinLeft=0.2500000
	WinWidth=0.5000000
	WinHeight=0.1000000
	TabOrder=0
	OnClick=ConfigTab_GameRules.InternalOnClick
	OnKeyEvent=ClientSettingsButton.InternalOnKeyEvent
end object
// Reference: moCheckBox'BallisticProV55.ConfigTab_GameRules.ch_KillStreaksCheck'
begin object name="ch_KillStreaksCheck" class=XInterface.moCheckBox
	ComponentJustification=0
	CaptionWidth=0.9000000
	Caption="Killstreaks"
	OnCreateComponent=ch_KillStreaksCheck.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="Enables killstreaks. Configured via the Loadout tab."
	WinTop=0.3000000
	WinLeft=0.2500000
	WinHeight=0.0400000
end object
// Reference: moCheckBox'BallisticProV55.ConfigTab_GameRules.ch_ForceBWPawnCheck'
begin object name="ch_ForceBWPawnCheck" class=XInterface.moCheckBox
	ComponentJustification=0
	CaptionWidth=0.9000000
	Caption="Force Ballistic Pawn"
	OnCreateComponent=ch_ForceBWPawnCheck.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="BW mutators will try to force the Ballistic pawn even when game specific pawn is used.||WARNING: Can cause severe problems in some gametypes."
	WinTop=0.2500000
	WinLeft=0.2500000
	WinHeight=0.0400000
end object
// Reference: moCheckBox'BallisticProV55.ConfigTab_GameRules.ch_BrightPlayersCheck'
begin object name="ch_BrightPlayersCheck" class=XInterface.moCheckBox
	ComponentJustification=0
	CaptionWidth=0.9000000
	Caption="Bright Players"
	OnCreateComponent=ch_BrightPlayersCheck.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="Makes players glow in the dark like normal UT2004. Only affects BW gametypes - standard gametypes have bright players already."
	WinTop=0.2000000
	WinLeft=0.2500000
	WinHeight=0.0400000
end object
// Reference: moCheckBox'BallisticProV55.ConfigTab_GameRules.ch_PreCacheCheck'
begin object name="ch_PreCacheCheck" class=XInterface.moCheckBox
	ComponentJustification=0
	CaptionWidth=0.9000000
	Caption="Precache Weapons"
	OnCreateComponent=ch_PreCacheCheck.InternalOnCreateComponent
	IniOption="@Internal"
	Hint="Precache weapons at the start of the match."
	WinTop=0.1500000
	WinLeft=0.2500000
	WinHeight=0.0400000
end object
// Reference: moComboBox'BallisticProV55.ConfigTab_GameRules.co_InventoryModeCombo'
begin object name="co_InventoryModeCombo" class=XInterface.moComboBox
	ComponentJustification=0
	CaptionWidth=0.5500000
	Caption="Weapon Spawning"
	OnCreateComponent=co_InventoryModeCombo.InternalOnCreateComponent
	IniOption="@Internal"
	IniDefault="High"
	Hint="Determines the Weapon Spawns of Ballistic Weapons"
	WinTop=0.1000000
	WinLeft=0.2500000
	WinHeight=0.0400000
end object
