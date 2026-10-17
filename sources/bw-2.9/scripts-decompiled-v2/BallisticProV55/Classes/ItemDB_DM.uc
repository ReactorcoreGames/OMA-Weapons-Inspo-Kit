class ItemDB_DM extends ItemizerDB
	config(ItemDB_DM)
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

static function int DBWeight(string MapName, string ItemGroup, Actor Control)
{
	// End:0x16
	if(Left(MapName, 3) ~= "DM-")
	{
		return 10;
	}
	return 0;
	//return;	
}

