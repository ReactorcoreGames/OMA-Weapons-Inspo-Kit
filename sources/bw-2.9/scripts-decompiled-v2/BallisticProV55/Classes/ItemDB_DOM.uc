class ItemDB_DOM extends ItemizerDB
	config(ItemDB_DOM)
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

static function int DBWeight(string MapName, string ItemGroup, Actor Control)
{
	// End:0x17
	if(Left(MapName, 4) ~= "DOM-")
	{
		return 10;
	}
	return 0;
	//return;	
}

