class L8GIPickup extends BallisticWeaponPickup;

simulated function UpdatePrecacheMaterials()
{
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	//return;	
}

defaultproperties
{
	bOnSide=false
	LowPolyStaticMesh=StaticMesh'BW_Core_WeaponStatic.Ammo.AmmoPackLo'
	PickupDrawScale=0.3500000
	bWeaponStay=false
	InventoryType=Class'BWBP_OP_Pro.L8GIAmmoPack'
	RespawnTime=20.0000000
	PickupMessage="You picked up the L8 GI Ammunition Pack"
	PickupSound=Sound'BW_Core_WeaponSound.Ammo.AmmoPackPickup'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.Ammo.AmmoPackHi'
	bOrientOnSlope=true
	Physics=0
	DrawScale=0.3500000
	CollisionRadius=16.0000000
	CollisionHeight=15.0000000
}
