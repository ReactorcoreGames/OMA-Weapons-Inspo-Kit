class MX32Pickup extends BallisticWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BWBP_OP_Tex.MX32.MX32-Main-D');
	L.AddPrecacheMaterial(Texture'BWBP_OP_Tex.MX32.MX32-Attach-D');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_OP_Static.MX32.MX32PickupHi');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_OP_Static.MX32.MX32PickupLo');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BWBP_OP_Tex.MX32.MX32-Main-D');
	Level.AddPrecacheMaterial(Texture'BWBP_OP_Tex.MX32.MX32-Attach-D');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_OP_Static.MX32.MX32PickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_OP_Static.MX32.MX32PickupLo');
	//return;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BWBP_OP_Static.MX32.MX32PickupLo'
	InventoryType=Class'BWBP_OP_Pro.MX32Weapon'
	RespawnTime=20.0000000
	PickupMessage="You picked up the MX-32 Rocket Machine Gun."
	PickupSound=Sound'BW_Core_WeaponSound.M50.M50Putaway'
	StaticMesh=StaticMesh'BWBP_OP_Static.MX32.MX32PickupHi'
	Physics=0
	DrawScale=0.1000000
	CollisionHeight=4.0000000
}
