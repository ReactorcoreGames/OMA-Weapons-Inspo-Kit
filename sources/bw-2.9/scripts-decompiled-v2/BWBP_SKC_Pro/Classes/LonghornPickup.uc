class LonghornPickup extends BallisticWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.Longhorn.Longhorn-Main');
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.Longhorn.Longhorn-Ammo');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.Longhorn.ClusterProj');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.Longhorn.GrenadeProj');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.Longhorn.LonghornBrass');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.Longhorn.Longhorn-Main');
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.Longhorn.Longhorn-Ammo');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.Longhorn.ClusterProj');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.Longhorn.GrenadeProj');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.Longhorn.LonghornAmmo');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.Longhorn.LonghornBrass');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.Longhorn.LonghornPickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.Longhorn.LonghornPickupLo');
	//return;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BWBP_SKC_Static.Longhorn.LonghornPickupLo'
	PickupDrawScale=0.0900000
	InventoryType=Class'BWBP_SKC_Pro.LonghornLauncher'
	RespawnTime=10.0000000
	PickupMessage="You picked up the Longhorn repeater."
	PickupSound=Sound'BW_Core_WeaponSound.M806.M806Putaway'
	StaticMesh=StaticMesh'BWBP_SKC_Static.Longhorn.LonghornPickupHi'
	Physics=0
	DrawScale=0.1100000
	CollisionHeight=4.0000000
}
