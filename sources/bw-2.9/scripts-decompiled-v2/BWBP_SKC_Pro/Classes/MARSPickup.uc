class MARSPickup extends BallisticWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.MARS.F2000-Main');
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.MARS.F2000-Misc');
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.MARS.F2000-Scope');
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.MARS.F2000-ScopeLensAlt');
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.MARS.MARS-SpecScope');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.MARS.F2000-Main');
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.MARS.F2000-Misc');
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.MARS.F2000-Scope');
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.MARS.F2000-ScopeLensAlt');
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.MARS.MARS-SpecScope');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.MARS.MARS2PickupHi');
	//return;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BWBP_SKC_Static.MARS.MARS2PickupLo'
	InventoryType=Class'BWBP_SKC_Pro.MARSAssaultRifle'
	RespawnTime=20.0000000
	PickupMessage="You picked up the MARS-2 assault rifle."
	PickupSound=Sound'BW_Core_WeaponSound.M50.M50Putaway'
	StaticMesh=StaticMesh'BWBP_SKC_Static.MARS.MARS2PickupHi'
	Physics=0
	DrawScale=0.1500000
	CollisionHeight=4.0000000
}
