class M2020GaussPickup extends BallisticWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.M2020.M2020-Main');
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.M2020.M2020-Secondary');
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.M2020.M2020-SpecMask');
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.M2020.M2020-Screen');
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.M2020.M2020-Numbers');
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.M2020.M2020-FlareX1');
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.M2020.M2020-ScreenOff');
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.M2020.M2020-EnergyMaskAlt');
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.M2020.M2020-EnergyMask');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.M2020.M2020-Main');
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.M2020.M2020-Secondary');
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.M2020.M2020-SpecMask');
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.M2020.M2020-Screen');
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.M2020.M2020-Numbers');
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.M2020.M2020-FlareX1');
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.M2020.M2020-ScreenOff');
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.M2020.M2020-EnergyMaskAlt');
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.M2020.M2020-EnergyMask');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.M2020.M2020PickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.M2020.M2020PickupLo');
	//return;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BWBP_SKC_Static.M2020.M2020PickupLo'
	InventoryType=Class'BWBP_SKC_Pro.M2020GaussDMR'
	RespawnTime=20.0000000
	PickupMessage="You picked up the M2020 Gauss rifle."
	PickupSound=Sound'BW_Core_WeaponSound.M50.M50Putaway'
	StaticMesh=StaticMesh'BWBP_SKC_Static.M2020.M2020PickupHi'
	Physics=0
	DrawScale=0.5300000
	CollisionHeight=4.0000000
}
