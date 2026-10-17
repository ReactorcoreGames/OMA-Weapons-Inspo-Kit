class AP_CYLOSG extends BallisticAmmoPickup;

simulated event PreBeginPlay()
{
	//return;	
}

defaultproperties
{
	AmmoAmount=8
	InventoryType=Class'BWBP_SKC_Pro.Ammo_CYLOSG'
	PickupMessage="You picked a CYLO shotgun tube."
	PickupSound=Sound'BW_Core_WeaponSound.Ammo.ShotBoxPickup'
	StaticMesh=StaticMesh'BWBP_SKC_Static.CYLO.CYLOPickupSG'
	DrawScale=1.2500000
	CollisionRadius=8.0000000
	CollisionHeight=5.2000000
}
