class AP_STANAGShockwave extends BallisticAmmoPickup;

function Inventory SpawnCopy(Pawn Other)
{
	local Inventory Copy, Copy2;

	InventoryType = Class'BWBP_SWC_Pro.Ammo_BRINKGrenades';
	AmmoAmount = 2;
	Copy = super.SpawnCopy(Other);
	AmmoAmount = default.AmmoAmount;
	InventoryType = default.InventoryType;
	Copy2 = super.SpawnCopy(Other);
	Ammo_545mmSTANAG(Copy2).Grenades = Ammo_BRINKGrenades(Copy);
	Ammo_BRINKGrenades(Copy).Bullets = Ammo_545mmSTANAG(Copy2);
	return Copy2;
	//return;	
}

defaultproperties
{
	AmmoAmount=120
	InventoryType=Class'BWBP_SWC_Pro.Ammo_545mmSTANAG'
	PickupMessage="You picked up two BR1-NK magazines."
	PickupSound=Sound'BW_Core_WeaponSound.Ammo.ClipPickup'
	StaticMesh=StaticMesh'BWBP_SWC_Static.BRINK.BRINKClip'
	DrawScale=0.1000000
	PrePivot=(X=0.0000000,Y=0.0000000,Z=5.0000000)
	CollisionRadius=8.0000000
	CollisionHeight=5.2000000
}
