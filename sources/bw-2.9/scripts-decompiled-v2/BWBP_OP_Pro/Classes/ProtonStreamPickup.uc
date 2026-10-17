class ProtonStreamPickup extends BallisticWeaponPickup;

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
	LowPolyStaticMesh=StaticMesh'BWBP_OP_Static.ProtonPack.ProtonPackPickupLo'
	PickupDrawScale=0.7500000
	InventoryType=Class'BWBP_OP_Pro.ProtonStreamer'
	RespawnTime=20.0000000
	PickupMessage="You picked up the E90-N particle accelerator."
	PickupSound=Sound'BW_Core_WeaponSound.M50.M50Putaway'
	StaticMesh=StaticMesh'BWBP_OP_Static.ProtonPack.ProtonPackPickupHi'
	Physics=0
	DrawScale=0.7500000
	CollisionHeight=4.5000000
}
