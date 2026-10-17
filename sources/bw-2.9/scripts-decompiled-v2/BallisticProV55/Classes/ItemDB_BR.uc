class ItemDB_BR extends ItemizerDB
	config(ItemDB_BR)
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

static function int DBWeight(string MapName, string ItemGroup, Actor Control)
{
	// End:0x16
	if(Left(MapName, 3) ~= "BR-")
	{
		return 10;
	}
	return 0;
	//return;	
}

