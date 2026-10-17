class ConfigMenu_Inventory extends ConfigMenuBase
	editinlinenew
	instanced;

var() localized string GameTabLabel;
var() localized string GameTabHint;
var() localized string ConflictTabLabel;
var() localized string ConflictTabHint;
var() localized string LoadoutTabLabel;
var() localized string LoadoutTabHint;
var() localized string LoadoutNewTabLabel;
var() localized string LoadoutNewTabHint;
var() localized string SwapTabLabel;
var() localized string SwapTabHint;
var() localized string ArenaTabLabel;
var() localized string ArenaTabHint;

function AddTabs()
{
	c_Tabs.AddTab(GameTabLabel, "BallisticProV55.ConfigTab_GameRules",, GameTabHint);
	c_Tabs.AddTab(ConflictTabLabel, "BallisticProV55.ConfigTab_ConflictLoadout",, ConflictTabHint);
	c_Tabs.AddTab(LoadoutTabLabel, "BallisticProV55.ConfigTab_Outfitting",, LoadoutTabHint);
	c_Tabs.AddTab(LoadoutNewTabLabel, "BallisticProV55.ConfigTab_Loadout",, LoadoutNewTabHint);
	c_Tabs.AddTab(SwapTabLabel, "BallisticProV55.ConfigTab_Swappings",, SwapTabHint);
	c_Tabs.AddTab(ArenaTabLabel, "BallisticProV55.ConfigTab_Arena",, ArenaTabHint);
	//return;	
}

defaultproperties
{
	GameTabLabel="Game"
	GameTabHint="Adjust rules and settings that affect the behaviour of the game."
	ConflictTabLabel="Inventory"
	ConflictTabHint="Change which weapons are used by the 'Ballistic Conflict' Mutator."
	LoadoutTabLabel="Loadout"
	LoadoutTabHint="Change how and which weapons are used by the 'Ballistic Loadout' mutator."
	LoadoutNewTabLabel="Evolution Loadout"
	LoadoutNewTabHint="Adjust the loadout and requirement settings for the 'Ballistic Evolution Loadout' mutator."
	SwapTabLabel="Pickup Swap"
	SwapTabHint="Adjust how and which weapons are spawned by the 'Ballistic Weapons' mutator."
	ArenaTabLabel="Arena"
	HeaderCaption="Ballistic Configuration"
}
