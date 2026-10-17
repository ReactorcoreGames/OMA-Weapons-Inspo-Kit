class AP_BloodhoundDrum extends BallisticAmmoPickup;

function Inventory SpawnCopy(Pawn Other)
{
	local Inventory Copy, Copy2;

	InventoryType = Class'BWBP_OP_Pro.Ammo_BloodhoundTazer';
	AmmoAmount = 5;
	Copy = super.SpawnCopy(Other);
	AmmoAmount = default.AmmoAmount;
	InventoryType = default.InventoryType;
	Copy2 = super.SpawnCopy(Other);
	Ammo_BloodhoundDarts(Copy2).Tazers = Ammo_BloodhoundTazer(Copy);
	Ammo_BloodhoundTazer(Copy).Bullets = Ammo_BloodhoundDarts(Copy2);
	return Copy2;
	//return;	
}

defaultproperties
{
	AmmoAmount=10
	InventoryType=Class'BWBP_OP_Pro.Ammo_BloodhoundDarts'
	PickupMessage="You got a drum of PD-97 Bloodhound darts."
	PickupSound=Sound'BW_Core_WeaponSound.Ammo.ClipPickup'
	StaticMesh=StaticMesh'BWBP_OP_Static.PD97.PD97Ammo'
	DrawScale=1.4000000
	CollisionRadius=8.0000000
	CollisionHeight=5.2000000
}
