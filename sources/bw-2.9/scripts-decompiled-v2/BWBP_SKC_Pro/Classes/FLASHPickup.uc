class FLASHPickup extends BallisticWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.Flash.FLASH-Main');
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.Flash.FLASH-Rocket');
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.Flash.FLASH-Scope');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.Flash.FLASH-Main');
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.Flash.FLASH-Rocket');
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.Flash.FLASH-Scope');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.Flash.FLASHAmmo');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.Flash.FLASHPickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.Flash.FLASHPickupLo');
	//return;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BWBP_SKC_Static.Flash.FLASHPickupLo'
	PickupDrawScale=0.6000000
	InventoryType=Class'BWBP_SKC_Pro.FLASHLauncher'
	RespawnTime=120.0000000
	PickupMessage="You picked up the AT40 'STREAK' incendiary rocket launcher."
	PickupSound=Sound'BW_Core_WeaponSound.G5.G5-Putaway'
	StaticMesh=StaticMesh'BWBP_SKC_Static.Flash.FLASHPickupHi'
	Physics=0
	DrawScale=0.6000000
	CollisionHeight=6.0000000
}
