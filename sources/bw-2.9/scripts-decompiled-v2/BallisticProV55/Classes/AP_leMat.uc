class AP_leMat extends BallisticAmmoPickup;

function Inventory SpawnCopy(Pawn Other)
{
	local Inventory Copy, Copy2;

	InventoryType = Class'BallisticProV55.Ammo_16GaugeleMat';
	AmmoAmount = 5;
	Copy = super.SpawnCopy(Other);
	AmmoAmount = default.AmmoAmount;
	InventoryType = default.InventoryType;
	Copy2 = super.SpawnCopy(Other);
	Ammo_leMat(Copy2).Shells = Ammo_16GaugeleMat(Copy);
	Ammo_16GaugeleMat(Copy).Bullets = Ammo_leMat(Copy2);
	return Copy2;
	//return;	
}

defaultproperties
{
	AmmoAmount=18
	InventoryType=Class'BallisticProV55.Ammo_leMat'
	PickupMessage="You picked up assorted Wilson 41 ammunition."
	PickupSound=Sound'BW_Core_WeaponSound.Ammo.ShotBoxPickup'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.leMat.leMatAmmo'
	DrawScale=0.2500000
	PrePivot=(X=0.0000000,Y=0.0000000,Z=-30.0000000)
	CollisionRadius=8.0000000
	CollisionHeight=4.5000000
}
