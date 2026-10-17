class CX85Pickup extends BallisticWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BWBP_OP_Tex.CX85.CX85-ColorFront');
	L.AddPrecacheMaterial(Texture'BWBP_OP_Tex.CX85.CX85-ColorBack');
	L.AddPrecacheMaterial(Texture'BWBP_OP_Tex.CX85.CX85-Mag');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_OP_Static.CX85.CX85PickupHi');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_OP_Static.CX85.CX85PickupLo');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BWBP_OP_Tex.CX85.CX85-ColorFront');
	Level.AddPrecacheMaterial(Texture'BWBP_OP_Tex.CX85.CX85-ColorBack');
	Level.AddPrecacheMaterial(Texture'BWBP_OP_Tex.CX85.CX85-Mag');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_OP_Static.CX85.CX85PickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_OP_Static.CX85.CX85PickupLo');
	//return;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BWBP_OP_Static.CX85.CX85PickupLo'
	InventoryType=Class'BWBP_OP_Pro.CX85AssaultWeapon'
	RespawnTime=20.0000000
	PickupMessage="You picked up the CX85 assault weapon."
	PickupSound=Sound'BW_Core_WeaponSound.M50.M50Putaway'
	StaticMesh=StaticMesh'BWBP_OP_Static.CX85.CX85PickupHi'
	Physics=0
	DrawScale=2.0000000
	CollisionHeight=4.0000000
}
