class LS14Pickup extends BallisticWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.LS14.LS14-Main');
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.LS14.LS14-Spec');
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.LS14.LS14-Impact');
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.LS14.ElectroBolt');
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.LS14.PlasmaMuzzleFlash2');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.LaserCarbine.PlasmaMuzzleFlash');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.LS14.LS14-Main');
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.LS14.LS14-Spec');
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.LS14.LS14-Impact');
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.LS14.ElectroBolt');
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.LS14.PlasmaMuzzleFlash2');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.LaserCarbine.LaserCarbinePickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.LaserCarbine.LaserCarbinePickupLo');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.LaserCarbine.PlasmaMuzzleFlash');
	//return;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BWBP_SKC_Static.LaserCarbine.LaserCarbinePickupLo'
	PickupDrawScale=1.1000000
	InventoryType=Class'BWBP_SKC_Pro.LS14Carbine'
	RespawnTime=20.0000000
	PickupMessage="You picked up the LS-14 laser carbine."
	PickupSound=Sound'BWBP_SKC_Sounds.LS14.Gauss-Pickup'
	StaticMesh=StaticMesh'BWBP_SKC_Static.LaserCarbine.LaserCarbinePickupHi'
	Physics=0
	CollisionHeight=3.0000000
}
