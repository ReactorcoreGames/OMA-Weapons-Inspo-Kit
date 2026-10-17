class SkrithStaffPickup extends BallisticWeaponPickup;

simulated function UpdatePrecacheMaterials()
{
	//return;	
}

defaultproperties
{
	InventoryType=Class'BWBP_SWC_Pro.SkrithStaff'
	RespawnTime=20.0000000
	PickupMessage="You picked up the Skrith Shillelagh"
	PickupSound=Sound'BW_Core_WeaponSound.A73.A73Putaway'
	Physics=0
	DrawScale=0.1000000
	CollisionHeight=4.5000000
}
