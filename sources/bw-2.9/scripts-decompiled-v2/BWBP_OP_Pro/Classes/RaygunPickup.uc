class RaygunPickup extends BallisticWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	//return;	
}

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
	LowPolyStaticMesh=StaticMesh'BWBP_OP_Static.Raygun.RaygunPickupLo'
	InventoryType=Class'BWBP_OP_Pro.Raygun'
	RespawnTime=20.0000000
	PickupMessage="You picked up the E58 Raygun."
	PickupSound=Sound'BW_Core_WeaponSound.A73.A73Putaway'
	StaticMesh=StaticMesh'BWBP_OP_Static.Raygun.RaygunPickupHi'
	Physics=0
	DrawScale=2.5000000
	CollisionHeight=4.5000000
}
