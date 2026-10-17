class MJ51Pickup extends BallisticWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BWBP_APC_Tex.M4A1.M4-Main');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_APC_Static.MJ51.MJ51PickupHi');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_APC_Static.MJ51.MJ51PickupLo');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BWBP_APC_Tex.M4A1.M4-Main');
	super(Actor).UpdatePrecacheMaterials();
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_APC_Static.MJ51.MJ51PickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_APC_Static.MJ51.MJ51PickupLo');
	super(Actor).UpdatePrecacheStaticMeshes();
	//return;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BWBP_APC_Static.MJ51.MJ51PickupLo'
	InventoryType=Class'BWBP_APC_Pro.MJ51Carbine'
	RespawnTime=20.0000000
	PickupMessage="You picked up the MJ51 Carbine"
	PickupSound=Sound'BW_Core_WeaponSound.M50.M50Putaway'
	StaticMesh=StaticMesh'BWBP_APC_Static.MJ51.MJ51PickupHi'
	Physics=0
	DrawScale=0.2600000
	CollisionHeight=4.0000000
}
