class ConflictLoadoutConfig extends Object
	config(BallisticProV55);

var globalconfig array<string> SavedInventory;
var globalconfig array<int> SavedLayout;
var globalconfig array<int> SavedCamo;
var globalconfig int InitialWeaponIndex;
var globalconfig bool HasPrompted;

static function UpdateSavedInventory(array<Item> Inventory)
{
	local int i;

	default.SavedInventory.Length = 0;
	default.SavedLayout.Length = 0;
	default.SavedCamo.Length = 0;
	i = 0;
	J0x1F:

	// End:0x8D [Loop If]
	if(i < Inventory.Length)
	{
		default.SavedInventory[i] = Inventory[i].ClassName;
		default.SavedLayout[i] = Inventory[i].LayoutIndex;
		default.SavedCamo[i] = Inventory[i].CamoIndex;
		i++;
		// [Loop Continue]
		goto J0x1F;
	}
	StaticSaveConfig();
	//return;	
}

static function UpdateSavedInitialIndex(int Index)
{
	default.InitialWeaponIndex = Index;
	StaticSaveConfig();
	//return;	
}

static function NotifyPrompted()
{
	default.HasPrompted = true;
	StaticSaveConfig();
	//return;	
}

static function string BuildSavedInventoryString()
{
	local string S;
	local int i;

	i = 0;
	J0x07:

	// End:0x5E [Loop If]
	if(i < default.SavedInventory.Length)
	{
		// End:0x37
		if(S == "")
		{
			S = default.SavedInventory[i];
			// [Explicit Continue]
			goto J0x54;
		}
		S = (S $ "|") $ default.SavedInventory[i];
		J0x54:

		i++;
		// [Loop Continue]
		goto J0x07;
	}
	return S;
	//return;	
}

static function string BuildSavedLayoutString()
{
	local string ls;
	local int i;

	i = 0;
	J0x07:

	// End:0x62 [Loop If]
	if(i < default.SavedLayout.Length)
	{
		// End:0x39
		if(ls == "")
		{
			ls = string(default.SavedLayout[i]);
			// [Explicit Continue]
			goto J0x58;
		}
		ls = (ls $ "|") $ string(default.SavedLayout[i]);
		J0x58:

		i++;
		// [Loop Continue]
		goto J0x07;
	}
	return ls;
	//return;	
}

static function string BuildSavedCamoString()
{
	local string cs;
	local int i;

	i = 0;
	J0x07:

	// End:0x62 [Loop If]
	if(i < default.SavedCamo.Length)
	{
		// End:0x39
		if(cs == "")
		{
			cs = string(default.SavedCamo[i]);
			// [Explicit Continue]
			goto J0x58;
		}
		cs = (cs $ "|") $ string(default.SavedCamo[i]);
		J0x58:

		i++;
		// [Loop Continue]
		goto J0x07;
	}
	return cs;
	//return;	
}

static function int GetSavedInitialWeaponIndex()
{
	return default.InitialWeaponIndex;
	//return;	
}

defaultproperties
{
	SavedInventory[0]="BallisticProV55.M50AssaultRifle"
	SavedInventory[1]="BallisticProV55.XMk5SubMachinegun"
	SavedInventory[2]="BallisticProV55.X4Knife"
	SavedInventory[3]="BallisticProV55.NRP57Grenade"
	SavedLayout[0]=0
	SavedLayout[1]=0
	SavedLayout[2]=0
	SavedLayout[3]=0
	SavedCamo[0]=0
	SavedCamo[1]=0
	SavedCamo[2]=0
	SavedCamo[3]=0
}
