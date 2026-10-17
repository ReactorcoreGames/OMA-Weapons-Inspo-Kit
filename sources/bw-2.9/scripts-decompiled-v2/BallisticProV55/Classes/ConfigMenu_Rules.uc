class ConfigMenu_Rules extends ConfigMenuBase
	editinlinenew
	instanced;

var() localized string GameTabLabel;
var() localized string GameTabHint;
var() localized string WeaponsTabLabel;
var() localized string WeaponsTabHint;
var() localized string PlayerTabLabel;
var() localized string PlayerTabHint;
var() localized string MovementTabLabel;
var() localized string MovementTabHint;
var() localized string PickupsTabLabel;
var() localized string PickupsTabHint;
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
	c_Tabs.AddTab(WeaponsTabLabel, "BallisticProV55.ConfigTab_WeaponRules",, WeaponsTabHint);
	c_Tabs.AddTab(PlayerTabLabel, "BallisticProV55.ConfigTab_PlayerRules",, PlayerTabHint);
	c_Tabs.AddTab(MovementTabLabel, "BallisticProV55.ConfigTab_MovementRules",, MovementTabHint);
	c_Tabs.AddTab(PickupsTabLabel, "BallisticProV55.ConfigTab_PickupRules",, PickupsTabHint);
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
	GameTabHint="General game rules and settings."
	WeaponsTabLabel="Weapons"
	WeaponsTabHint="Weapon rules and settings."
	PlayerTabLabel="Player"
	PlayerTabHint="Player character rules and settings."
	MovementTabLabel="Movement"
	MovementTabHint="Movement rules and settings."
	PickupsTabLabel="Pickups"
	PickupsTabHint="Pickup rules and settings."
	ConflictTabLabel="Inventory"
	ConflictTabHint="Change which weapons are used by the 'Ballistic Conflict' Mutator."
	LoadoutTabLabel="Loadout"
	LoadoutTabHint="Change how and which weapons are used by the 'Ballistic Loadout' mutator."
	LoadoutNewTabLabel="Evolution Loadout"
	LoadoutNewTabHint="Adjust the loadout and requirement settings for the 'Ballistic Evolution Loadout' mutator."
	SwapTabLabel="Pickup Swaps"
	SwapTabHint="Adjust how and which weapons are spawned by the 'Ballistic Weapons' mutator."
	ArenaTabLabel="Arena"
	HeaderCaption="Ballistic Configuration"
}
