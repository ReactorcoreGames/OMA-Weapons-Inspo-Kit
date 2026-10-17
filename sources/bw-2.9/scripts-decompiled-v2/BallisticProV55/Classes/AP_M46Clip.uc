class AP_M46Clip extends BallisticAmmoPickup;

function Inventory SpawnCopy(Pawn Other)
{
	local Inventory Copy, Copy2;

	InventoryType = Class'BallisticProV55.Ammo_M46Grenades';
	AmmoAmount = 1;
	Copy = super.SpawnCopy(Other);
	AmmoAmount = default.AmmoAmount;
	InventoryType = default.InventoryType;
	Copy2 = super.SpawnCopy(Other);
	Ammo_M46Clip(Copy2).Grenades = Ammo_M46Grenades(Copy);
	Ammo_M46Grenades(Copy).Bullets = Ammo_M46Clip(Copy2);
	return Copy2;
	//return;	
}

defaultproperties
{
	AmmoAmount=50
	InventoryType=Class'BallisticProV55.Ammo_M46Clip'
	PickupMessage="You picked up assorted M46 battle rifle ammunition."
	PickupSound=Sound'BW_Core_WeaponSound.Ammo.ClipPickup'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.OA-AR.OA-AR_Ammo'
	DrawScale=0.4000000
	CollisionRadius=8.0000000
	CollisionHeight=5.2000000
}
