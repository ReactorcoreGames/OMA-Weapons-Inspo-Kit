class FM13Pickup extends BallisticWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BWBP_OP_Tex.FM13.DragonMain');
	L.AddPrecacheMaterial(Texture'BWBP_OP_Tex.FM13.DragonMiscMain');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_OP_Static.Dragon.DragonPickupHi');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_OP_Static.Dragon.DragonPickupLo');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BWBP_OP_Tex.FM13.DragonMain');
	Level.AddPrecacheMaterial(Texture'BWBP_OP_Tex.FM13.DragonMiscMain');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_OP_Static.Dragon.DragonPickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_OP_Static.Dragon.DragonPickupLo');
	//return;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BWBP_OP_Static.Dragon.DragonPickupLo'
	InventoryType=Class'BWBP_OP_Pro.FM13Shotgun'
	RespawnTime=20.0000000
	PickupMessage="You picked up the FM13 Dragon shotgun."
	PickupSound=Sound'BW_Core_WeaponSound.M763.M763Putaway'
	StaticMesh=StaticMesh'BWBP_OP_Static.Dragon.DragonPickupHi'
	Physics=0
	DrawScale=0.1500000
	CollisionHeight=3.0000000
}
