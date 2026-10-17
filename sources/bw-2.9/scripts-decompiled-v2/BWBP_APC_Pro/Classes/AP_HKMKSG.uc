class AP_HKMKSG extends BallisticAmmoPickup;

simulated event PreBeginPlay()
{
	//return;	
}

defaultproperties
{
	AmmoAmount=12
	InventoryType=Class'BWBP_APC_Pro.Ammo_HKMKSG'
	PickupMessage="You picked up two HKMK shotgun shell sets."
	PickupSound=Sound'BW_Core_WeaponSound.Ammo.ShotBoxPickup'
	StaticMesh=StaticMesh'BWBP_SKC_Static.CYLO.CYLOPickupSG'
	DrawScale=1.2500000
	CollisionRadius=8.0000000
	CollisionHeight=5.2000000
}
