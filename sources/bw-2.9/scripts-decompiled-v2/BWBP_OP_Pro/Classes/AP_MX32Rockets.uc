class AP_MX32Rockets extends BallisticAmmoPickup;

simulated event PreBeginPlay()
{
	//return;	
}

defaultproperties
{
	AmmoAmount=24
	InventoryType=Class'BWBP_OP_Pro.Ammo_MX32Rockets'
	PickupMessage="You picked up two packs of rockets for the MX-32."
	PickupSound=Sound'BW_Core_WeaponSound.Ammo.GrenadePickup'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.Ammo.M900Grenades'
	DrawScale=0.5000000
	CollisionRadius=8.0000000
	CollisionHeight=10.0000000
}
