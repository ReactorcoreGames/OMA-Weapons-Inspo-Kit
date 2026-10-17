class AH250Pickup extends BallisticHandgunPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.Eagle.Eagle-SightReticleGreen');
	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.M925.M925MuzzleFlash');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.Eagle.Eagle-SightReticleGreen');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.M925.M925MuzzleFlash');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.DesertEagle.DEaglePickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.DesertEagle.DEaglePickupLo');
	//return;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BWBP_SKC_Static.DesertEagle.DEaglePickupLo'
	PickupDrawScale=1.0000000
	InventoryType=Class'BWBP_SKC_Pro.AH250Pistol'
	RespawnTime=20.0000000
	PickupMessage="You picked up the AH250 'Hawk' scoped pistol."
	PickupSound=Sound'BW_Core_WeaponSound.MRT6.MRT6Pullout'
	StaticMesh=StaticMesh'BWBP_SKC_Static.DesertEagle.DEaglePickupHi'
	Physics=0
	DrawScale=1.4000000
	CollisionHeight=4.0000000
}
