class MAG78Pickup extends BallisticWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Shader'BWBP_OP_Tex.Longsword.ChainsawLongswordShiny');
	L.AddPrecacheMaterial(TexScaler'BWBP_OP_Tex.Longsword.LongswordChainScaler');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.KnifeCut');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.KnifeCutWood');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Shader'BWBP_OP_Tex.Longsword.ChainsawLongswordShiny');
	Level.AddPrecacheMaterial(TexScaler'BWBP_OP_Tex.Longsword.LongswordChainScaler');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.KnifeCut');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.KnifeCutWood');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_OP_Static.MAGsaw.MAGsawPickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_OP_Static.MAGsaw.MAGsawPickupLo');
	//return;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BWBP_OP_Static.MAGsaw.MAGsawPickupLo'
	InventoryType=Class'BWBP_OP_Pro.MAG78Longsword'
	RespawnTime=10.0000000
	PickupMessage="You picked up the MAG-SAW longsword."
	PickupSound=Sound'BW_Core_WeaponSound.EKS43.EKS-Putaway'
	StaticMesh=StaticMesh'BWBP_OP_Static.MAGsaw.MAGsawPickupHi'
	Physics=0
	DrawScale=0.7000000
	CollisionHeight=3.5000000
}
