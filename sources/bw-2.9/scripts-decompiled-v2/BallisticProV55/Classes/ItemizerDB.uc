class ItemizerDB extends Info
	config(Itemizer)
	exportstructs
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

struct ItemEntry
{
	var() config string MapName;
	var() config Class<Actor> ItemClass;
	var() config Vector Spot;
	var() config Rotator Angle;
	var() config string Group;
};

var() config array<ItemEntry> items;

function array<ItemEntry> GetItems(string MapName, string ItemGroup)
{
	local int i;
	local array<ItemEntry> IEs;

	i = 0;
	J0x07:

	// End:0x96 [Loop If]
	if(i < items.Length)
	{
		// End:0x8C
		if((items[i].MapName ~= MapName) && ((ItemGroup ~= "") || ItemGroup ~= items[i].Group) || items[i].Group ~= "")
		{
			IEs[IEs.Length] = items[i];
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	return IEs;
	//return;	
}

function RemoveAllFor(string MapName)
{
	local int i;

	i = 0;
	J0x07:

	// End:0x47 [Loop If]
	if(i < items.Length)
	{
		// End:0x3D
		if(items[i].MapName ~= MapName)
		{
			items.Remove(i, 1);
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	SaveConfig();
	//return;	
}

function AddItem(ItemEntry IE)
{
	items[items.Length] = IE;
	SaveConfig();
	//return;	
}

function bool RemoveItem(Actor Item, string MapName)
{
	local int i;

	i = 0;
	J0x07:

	// End:0x96 [Loop If]
	if(i < items.Length)
	{
		// End:0x8C
		if(((items[i].MapName ~= MapName) && items[i].ItemClass == Item.Class) && items[i].Spot == Item.Location)
		{
			items.Remove(i, 1);
			SaveConfig();
			return true;
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	return false;
	//return;	
}

function bool UpdateItem(string MapName, string ItemGroup, Class<Actor> ItemClass, Vector ItemLocation, ItemEntry IE)
{
	local int i;

	i = 0;
	J0x07:

	// End:0xA5 [Loop If]
	if(i < items.Length)
	{
		// End:0x9B
		if((((items[i].MapName ~= MapName) && items[i].Group ~= ItemGroup) && items[i].ItemClass == ItemClass) && items[i].Spot == ItemLocation)
		{
			items[i] = IE;
			SaveConfig();
			return true;
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	return false;
	//return;	
}

function ReplaceItems(array<ItemEntry> IEs, string MapName)
{
	local int i;

	i = 0;
	J0x07:

	// End:0x47 [Loop If]
	if(i < items.Length)
	{
		// End:0x3D
		if(items[i].MapName ~= MapName)
		{
			items.Remove(i, 1);
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	i = 0;
	J0x4E:

	// End:0x80 [Loop If]
	if(i < IEs.Length)
	{
		items[items.Length] = IEs[i];
		i++;
		// [Loop Continue]
		goto J0x4E;
	}
	SaveConfig();
	//return;	
}

static function int DBWeight(string MapName, string ItemGroup, Actor Control)
{
	local int i;

	i = 0;
	J0x07:

	// End:0x3E [Loop If]
	if(i < default.items.Length)
	{
		// End:0x34
		if(default.items[i].MapName ~= MapName)
		{
			return 2;
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	return 0;
	//return;	
}

static function ItemizerDB GetItemDB(string MapName, string ItemGroup, Actor A)
{
	local array<string> DBClassNames;
	local array< Class<ItemizerDB> > DBClasses;
	local Class<ItemizerDB> DBClass;
	local ItemizerDB IDB;
	local int i, Best, j;

	// End:0x0D
	if(A == none)
	{
		return none;
	}
	A.GetAllInt("BallisticProV55.ItemizerDB", DBClassNames);
	i = 0;
	J0x44:

	// End:0xEC [Loop If]
	if(i < DBClassNames.Length)
	{
		DBClass = Class<ItemizerDB>(DynamicLoadObject(DBClassNames[i], Class'Core.Class'));
		// End:0x95
		if(DBClass != none)
		{
			DBClasses[DBClasses.Length] = DBClass;
			// [Explicit Continue]
			goto J0xE2;
		}
		Log(("Itemizer: couldn't load bad database: " $ DBClassNames[i]) $ " found in int file");
		J0xE2:

		i++;
		// [Loop Continue]
		goto J0x44;
	}
	DBClass = none;
	Log(("Itemizer: " $ string(DBClasses.Length)) $ " good databases found.");
	i = 0;
	J0x12C:

	// End:0x19B [Loop If]
	if(i < DBClasses.Length)
	{
		j = DBClasses[i].static.DBWeight(MapName, ItemGroup, A);
		// End:0x191
		if(j > Best)
		{
			Best = j;
			DBClass = DBClasses[i];
		}
		i++;
		// [Loop Continue]
		goto J0x12C;
	}
	// End:0x23A
	if(DBClass == none)
	{
		Log(((((("Itemizer could not find Database for map " $ MapName) $ " with group ") $ ItemGroup) $ " playing ") $ string(A.Level.Game)) $ "! Using default...");
		DBClass = Class'BallisticProV55.ItemDB_Default';
	}
	IDB = A.Spawn(DBClass);
	return IDB;
	//return;	
}

static function ItemizerDB SpawnItems(string MapName, string ItemGroup, Actor mut, optional bool bCleanUp)
{
	local Actor A;
	local int i, j;
	local array<ItemEntry> IEs;
	local ItemizerDB IDB;

	IDB = GetItemDB(MapName, ItemGroup, mut);
	IEs = IDB.GetItems(MapName, ItemGroup);
	Log((((((((("Itemizer Initialized: DataBase: " $ string(IDB.Class)) $ ", Items in DB: ") $ string(IDB.items.Length)) $ ", MapName: ") $ MapName) $ ", Group: ") $ ItemGroup) $ ", Map/Group Items: ") $ string(IEs.Length));
	// End:0x1D9
	if(IEs.Length > 0)
	{
		i = 0;
		J0xF4:

		// End:0x164 [Loop If]
		if(i < IEs.Length)
		{
			A = mut.Spawn(IEs[i].ItemClass,,, IEs[i].Spot, IEs[i].Angle);
			// End:0x15A
			if(A != none)
			{
				j++;
			}
			i++;
			// [Loop Continue]
			goto J0xF4;
		}
		Log(((("Itemizer: Finished Spawning Items: " $ string(j)) $ " survived, ") $ string(IEs.Length - j)) $ " failed, destroyed or replaced");		
	}
	else
	{
		Log("Itemizer: Finished: No items to spawn");
	}
	// End:0x219
	if(bCleanUp)
	{
		IDB.Destroy();
		return none;
	}
	return IDB;
	//return;	
}

static function string GetMap(Actor A)
{
	local string S;
	local int i;

	S = A.Level.GetLocalURL();
	i = InStr(S, "/");
	// End:0x57
	if(i >= 0)
	{
		S = Right(S, (Len(S) - i) - 1);
	}
	i = InStr(S, "?");
	// End:0x84
	if(i >= 0)
	{
		S = Left(S, i);
	}
	i = InStr(S, ".ut2");
	// End:0xB4
	if(i >= 0)
	{
		S = Left(S, i);
	}
	return S;
	//return;	
}

