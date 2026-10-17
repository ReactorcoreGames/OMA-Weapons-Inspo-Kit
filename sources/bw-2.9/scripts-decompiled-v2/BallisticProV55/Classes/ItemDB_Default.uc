class ItemDB_Default extends ItemizerDB
	config(Itemizer)
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

static function int DBWeight(string MapName, string ItemGroup, Actor Control)
{
	return 1;
	//return;	
}

