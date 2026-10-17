class ItemDB_Ballistic extends ItemizerDB
	config(ItemDB_Ballistic)
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

static function int DBWeight(string MapName, string ItemGroup, Actor Control)
{
	// End:0x18
	if(ItemGroup ~= "Ballistic")
	{
		return 20;
	}
	return 0;
	//return;	
}

