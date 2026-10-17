class ConflictItem extends Actor
	notplaceable;

var() localized string ItemName;
var() localized string ItemAmount;
var() localized string Description;
var() int Size;
var() Material Icon;
var() bool bBonusAmmo;

static function bool ApplyItem(Pawn Other)
{
	return true;
	//return;	
}

static function PostApply(Pawn Other)
{
	//return;	
}

static function ResetPlayer(Pawn Other)
{
	//return;	
}

static function bool AddAmmoBonus(Pawn Other, out float AmmoBonus)
{
	return false;
	//return;	
}

defaultproperties
{
	ItemName="DefaultItem"
	ItemAmount="0.0"
	Description="Default Item|Does shit all..."
	Size=10
}
