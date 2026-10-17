class AP_XMK5Clip extends BallisticAmmoPickup;

function Inventory SpawnCopy(Pawn Other)
{
	local Inventory Copy, Copy2;

	InventoryType = Class'BallisticProV55.Ammo_XMK5Darts';
	AmmoAmount = 3;
	Copy = super.SpawnCopy(Other);
	AmmoAmount = default.AmmoAmount;
	InventoryType = default.InventoryType;
	Copy2 = super.SpawnCopy(Other);
	Ammo_XMK5Clip(Copy2).Darts = Ammo_XMK5Darts(Copy);
	Ammo_XMK5Darts(Copy).Bullets = Ammo_XMK5Clip(Copy2);
	return Copy2;
	//return;	
}

defaultproperties
{
	AmmoAmount=80
	InventoryType=Class'BallisticProV55.Ammo_XMK5Clip'
	PickupMessage="You picked up XMk5 SMG rounds and darts."
	PickupSound=Sound'BW_Core_WeaponSound.Ammo.ClipPickup'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.OA-SMG.OA-SMG_Ammo'
	DrawScale=0.4000000
	CollisionRadius=8.0000000
	CollisionHeight=5.2000000
}
