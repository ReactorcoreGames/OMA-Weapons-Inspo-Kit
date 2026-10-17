class CX61Pickup extends BallisticWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BWBP_OP_Tex.CX61.CX61-Mag');
	L.AddPrecacheMaterial(Texture'BWBP_OP_Tex.CX61.CX61-Main');
	L.AddPrecacheMaterial(Texture'BWBP_OP_Tex.CX61.G28Cloud');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_OP_Static.CX61.CX61PickupHi');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_OP_Static.CX61.CX61PickupLo');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BWBP_OP_Tex.CX61.CX61-Mag');
	Level.AddPrecacheMaterial(Texture'BWBP_OP_Tex.CX61.CX61-Main');
	Level.AddPrecacheMaterial(Texture'BWBP_OP_Tex.CX61.G28Cloud');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_OP_Static.CX61.CX61PickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_OP_Static.CX61.CX61PickupLo');
	//return;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BWBP_OP_Static.CX61.CX61PickupLo'
	PickupDrawScale=0.5500000
	InventoryType=Class'BWBP_OP_Pro.CX61AssaultRifle'
	RespawnTime=20.0000000
	PickupMessage="You picked up the CX61 tactical rifle."
	PickupSound=Sound'BW_Core_WeaponSound.M50.M50Putaway'
	StaticMesh=StaticMesh'BWBP_OP_Static.CX61.CX61PickupHi'
	Physics=0
	DrawScale=0.5500000
	CollisionHeight=4.0000000
}
