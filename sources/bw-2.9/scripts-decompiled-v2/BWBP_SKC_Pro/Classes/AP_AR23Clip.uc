class AP_AR23Clip extends BallisticAmmoPickup;

function Inventory SpawnCopy(Pawn Other)
{
	local Inventory Copy, Copy2;

	InventoryType = Class'BWBP_SKC_Pro.Ammo_AR23Grenades';
	AmmoAmount = 1;
	Copy = super.SpawnCopy(Other);
	AmmoAmount = default.AmmoAmount;
	InventoryType = default.InventoryType;
	Copy2 = super.SpawnCopy(Other);
	Ammo_AR23Bullets(Copy2).Grenades = Ammo_AR23Grenades(Copy);
	Ammo_AR23Grenades(Copy).Bullets = Ammo_AR23Bullets(Copy2);
	return Copy2;
	//return;	
}

defaultproperties
{
	AmmoAmount=54
	InventoryType=Class'BWBP_SKC_Pro.Ammo_AR23Bullets'
	PickupMessage="You picked up three AR23 magazines."
	PickupSound=Sound'BW_Core_WeaponSound.Ammo.ClipPickup'
	StaticMesh=StaticMesh'BWBP_SKC_Static.AR23.AR23_SM_Ammo'
	DrawScale=0.1300000
	CollisionRadius=8.0000000
	CollisionHeight=5.2000000
}
