class AmmoCrateLocalMessage extends PickupMessagePlus
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

static function int GetFontSize(int Switch, PlayerReplicationInfo RelatedPRI1, PlayerReplicationInfo RelatedPRI2, PlayerReplicationInfo LocalPlayer)
{
	return default.FontSize;
	//return;	
}

static function string GetRelatedString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
	return GetString(Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
	//return;	
}

static function string GetString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
	return "You resupplied at an ammo crate.";
	//return;	
}

defaultproperties
{
	StackMode=2
	PosY=0.7300000
}
