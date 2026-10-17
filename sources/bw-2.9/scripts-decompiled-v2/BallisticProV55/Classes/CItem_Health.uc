class CItem_Health extends ConflictItem;

static function bool ApplyItem(Pawn Other)
{
	Other.GiveHealth(25, int(Other.SuperHealthMax));
	return true;
	//return;	
}

static function ResetPlayer(Pawn Other)
{
	Other.Health = Other.default.Health;
	//return;	
}

defaultproperties
{
	ItemName="Health"
	ItemAmount="+25"
	Description="Extra Health.|Provides 25 bonus starting health."
	Icon=Texture'BW_Core_WeaponTex.ui.Icon_Health'
}
