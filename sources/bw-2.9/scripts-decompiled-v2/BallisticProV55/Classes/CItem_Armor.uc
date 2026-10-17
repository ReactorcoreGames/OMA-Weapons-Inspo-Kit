class CItem_Armor extends ConflictItem;

static function bool ApplyItem(Pawn Other)
{
	Other.AddShieldStrength(25);
	return true;
	//return;	
}

static function ResetPlayer(Pawn Other)
{
	Other.ShieldStrength = Other.default.ShieldStrength;
	//return;	
}

defaultproperties
{
	ItemName="Armor"
	ItemAmount="+25"
	Description="Extra Armor.|Provides 25 additional starting armor."
	Icon=Texture'BW_Core_WeaponTex.ui.Icon_Armor'
}
