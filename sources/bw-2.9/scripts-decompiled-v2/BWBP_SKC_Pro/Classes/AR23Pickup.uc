class AR23Pickup extends BallisticWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.AR23.AR23-Main');
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.AR23.AR23-MainSpec');
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.AR23.AR23-Misc');
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.AR23.AR23-MiscSpec');
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.AR23.AR23-Holosight');
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.AR23.Muzzle_2D_View');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.AR23.AR23-Main');
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.AR23.AR23-MainSpec');
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.AR23.AR23-Misc');
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.AR23.AR23-MiscSpec');
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.AR23.AR23-Holosight');
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.AR23.Muzzle_2D_View');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.AR23.AR23_SM_Ammo');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.AR23.AR23PickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.AR23.AR23PickupLo');
	//return;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BWBP_SKC_Static.AR23.AR23PickupLo'
	PickupDrawScale=0.1300000
	InventoryType=Class'BWBP_SKC_Pro.AR23HeavyRifle'
	RespawnTime=20.0000000
	PickupMessage="You picked up the AR23 'Punisher' Heavy Rifle"
	PickupSound=Sound'BW_Core_WeaponSound.M50.M50Putaway'
	StaticMesh=StaticMesh'BWBP_SKC_Static.AR23.AR23PickupHi'
	Physics=0
	DrawScale=0.1200000
	CollisionHeight=4.0000000
}
