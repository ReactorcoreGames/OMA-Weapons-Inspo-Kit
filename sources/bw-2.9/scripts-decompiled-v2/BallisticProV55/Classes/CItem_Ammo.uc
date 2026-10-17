class CItem_Ammo extends ConflictItem;

static function bool AddAmmoBonus(Pawn Other, out float AmmoBonus)
{
	AmmoBonus += 0.5000000;
	return true;
	//return;	
}

defaultproperties
{
	ItemName="Ammo"
	ItemAmount="+50%"
	Description="Extra Ammo.|Provides 50% extra starting ammo for all selected weapons."
	Icon=Texture'BW_Core_WeaponTex.ui.Icon_Ammo'
	bBonusAmmo=true
}
