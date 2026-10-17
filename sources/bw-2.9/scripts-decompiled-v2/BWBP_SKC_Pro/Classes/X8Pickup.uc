class X8Pickup extends BallisticWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.AK490.Knife-Misc');
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.AK490.AK490-Misc');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.KnifeCutWood');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.X8.X8Proj');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.AK490.Knife-Misc');
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.AK490.AK490-Misc');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.KnifeCutWood');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.X8.X8PickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.X8.X8PickupLo');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.X8.X8Proj');
	//return;	
}

defaultproperties
{
	bOnSide=false
	LowPolyStaticMesh=StaticMesh'BWBP_SKC_Static.X8.X8PickupLo'
	PickupDrawScale=0.2700000
	InventoryType=Class'BWBP_SKC_Pro.X8Knife'
	RespawnTime=10.0000000
	PickupMessage="You picked up the X8 ballistic knife."
	PickupSound=Sound'BW_Core_WeaponSound.Knife.KnifePutaway'
	StaticMesh=StaticMesh'BWBP_SKC_Static.X8.X8PickupHi'
	Physics=0
	DrawScale=0.3000000
	CollisionHeight=4.0000000
}
