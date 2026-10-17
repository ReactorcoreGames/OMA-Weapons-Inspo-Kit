class TyphonPDWPickup extends BallisticWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.Typhon.Typhon-Main');
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.Typhon.Typhon-SpecMap');
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.Typhon.Typhon-Misc');
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.Typhon.Typhon-Mag');
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.Typhon.Typhon-SpecMapMag');
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.Typhon.Cart_Puma');
	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.A42.A42MuzzleFlash');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.Typhon.Typhon-Main');
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.Typhon.Typhon-SpecMap');
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.Typhon.Typhon-Misc');
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.Typhon.Typhon-Mag');
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.Typhon.Typhon-SpecMapMag');
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.Typhon.Cart_Puma');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.Typhon.TyphonPickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.Typhon.TyphonPickupLo');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.PUMA.PumaShield');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.PUMA.ShieldShard');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.A42.A42MuzzleFlash');
	//return;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BWBP_SKC_Static.Typhon.TyphonPickupLo'
	PickupDrawScale=0.2000000
	InventoryType=Class'BWBP_SKC_Pro.TyphonPDW'
	RespawnTime=10.0000000
	PickupMessage="You picked up the LRX-5 'Typhon' Pulse PDW."
	PickupSound=Sound'BWBP_SKC_Sounds.PUMA.PUMA-Pickup'
	StaticMesh=StaticMesh'BWBP_SKC_Static.Typhon.TyphonPickupHi'
	Physics=0
	DrawScale=0.1800000
	CollisionHeight=4.0000000
}
