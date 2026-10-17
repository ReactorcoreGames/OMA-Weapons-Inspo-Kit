class AP_CX85Mag extends BallisticAmmoPickup;

function Inventory SpawnCopy(Pawn Other)
{
	local Inventory Copy, Copy2;

	InventoryType = Class'BWBP_OP_Pro.Ammo_CX85Darts';
	AmmoAmount = 6;
	Copy = super.SpawnCopy(Other);
	AmmoAmount = default.AmmoAmount;
	InventoryType = default.InventoryType;
	Copy2 = super.SpawnCopy(Other);
	Ammo_CX85Darts(Copy).Bullets = Ammo_556mm(Copy2);
	return Copy2;
	//return;	
}

defaultproperties
{
	AmmoAmount=90
	InventoryType=Class'BallisticProV55.Ammo_556mm'
	PickupMessage="You got two CX85 magazines."
	PickupSound=Sound'BW_Core_WeaponSound.Ammo.ClipPickup'
	StaticMesh=StaticMesh'BWBP_OP_Static.CX85.CX85Ammo'
	DrawScale=0.8000000
	CollisionRadius=8.0000000
	CollisionHeight=5.2000000
}
