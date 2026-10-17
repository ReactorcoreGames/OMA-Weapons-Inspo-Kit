class ItemDB_AS extends ItemizerDB
	config(ItemDB_AS)
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

static function int DBWeight(string MapName, string ItemGroup, Actor Control)
{
	// End:0x16
	if(Left(MapName, 3) ~= "AS-")
	{
		return 10;
	}
	return 0;
	//return;	
}

