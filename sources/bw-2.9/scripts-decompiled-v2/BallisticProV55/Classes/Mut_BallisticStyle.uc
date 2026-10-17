class Mut_BallisticStyle extends Mutator
	abstract
	hidedropdown
	cacheexempt
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

struct InventoryMode
{
	var string Name;
	var string MutatorClassName;
};

var BC_GameStyle.EGameStyle OverrideStyle;
var() InventoryMode InventoryModes[6];

simulated function PreBeginPlay()
{
	Class'BCoreProV55.BallisticGameStyles'.default.CurrentStyle = OverrideStyle;
	Log("Mut_BallisticStyle: Overriding game style with " $ string(GetEnum(Enum'BCoreProV55.BC_GameStyle.EGameStyle', int(Class'BCoreProV55.BallisticGameStyles'.default.CurrentStyle))));
	// End:0x1B6
	if(Class'BCoreProV55.BallisticGameStyles'.static.GetLocalStyle().default.InventoryModeIndex < 6)
	{
		Log("Mut_BallisticStyle: Spawning mutator " $ InventoryModes[Class'BCoreProV55.BallisticGameStyles'.static.GetLocalStyle().default.InventoryModeIndex].MutatorClassName);
		// End:0x177
		if(Level.Game.bTeamGame && InventoryModes[Class'BCoreProV55.BallisticGameStyles'.static.GetLocalStyle().default.InventoryModeIndex].MutatorClassName == "BallisticProV55.Mut_Outfitting")
		{
			Level.Game.AddMutator("BallisticProV55.Mut_TeamOutfitting");			
		}
		else
		{
			Level.Game.AddMutator(InventoryModes[Class'BCoreProV55.BallisticGameStyles'.static.GetLocalStyle().default.InventoryModeIndex].MutatorClassName, false);
		}		
	}
	else
	{
		Log("Mut_BallisticStyle: No default inventory mode assigned. Applying style override only.");
	}
	//return;	
}

defaultproperties
{
	InventoryModes[0]=(Name="Inventory",MutatorClassName="BallisticProV55.Mut_ConflictLoadout")
	InventoryModes[1]=(Name="Loadout",MutatorClassName="BallisticProV55.Mut_Outfitting")
	InventoryModes[2]=(Name="Evolution",MutatorClassName="BallisticProV55.Mut_Loadout")
	InventoryModes[3]=(Name="Pickups",MutatorClassName="BallisticProV55.Mut_BallisticSwap")
	InventoryModes[4]=(Name="Arena",MutatorClassName="BallisticProV55.Mut_BallisticArena")
	InventoryModes[5]=(Name="Melee Only",MutatorClassName="BallisticProV55.Mut_BallisticMelee")
	ConfigMenuClassName="BallisticProV55.ConfigMenu_Rules"
	GroupName="Ballistic"
	FriendlyName="BallisticPro: Weapons"
	Description="Replaces all the original weapons and items in the game with new, realistic Ballistic weapons and items. Adds reloading, fire modes, special weapon functions, real accuracy, realistic damage, special features like laser sights and tactical cameras, new effects and much much more...||http://www.runestorm.com"
}
