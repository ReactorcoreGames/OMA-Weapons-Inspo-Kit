class AP_LS14Rockets extends BallisticAmmoPickup;

simulated event PreBeginPlay()
{
	//return;	
}

defaultproperties
{
	AmmoAmount=6
	InventoryType=Class'BWBP_SKC_Pro.Ammo_LS14Rocket'
	PickupMessage="You picked up 6 LS-14 rockets."
	PickupSound=Sound'BW_Core_WeaponSound.Ammo.GrenadePickup'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.Ammo.M900Grenades'
	DrawScale=0.5000000
	CollisionRadius=8.0000000
	CollisionHeight=10.0000000
}
