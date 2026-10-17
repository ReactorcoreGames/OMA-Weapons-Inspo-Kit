class RGPXPickup extends BallisticWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BWBP_JCF_Tex.RGP-X350.RGP_Launcher_D');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_JCF_Static.RGP-X350.RGP-X350PickupHi');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_JCF_Static.RGP-X350.RGP-X350PickupLo');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	super(Actor).UpdatePrecacheMaterials();
	Level.AddPrecacheMaterial(Texture'BWBP_JCF_Tex.RGP-X350.RGP_Launcher_D');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	super(Actor).UpdatePrecacheStaticMeshes();
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_JCF_Static.RGP-X350.RGP-X350PickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_JCF_Static.RGP-X350.RGP-X350PickupLo');
	//return;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BWBP_JCF_Static.RGP-X350.RGP-X350PickupLo'
	PickupDrawScale=0.3000000
	InventoryType=Class'BWBP_JCF_Pro.RGPXBazooka'
	RespawnTime=60.0000000
	PickupMessage="You picked up the RGK-350 H-V Flak Bazooka."
	PickupSound=Sound'BW_Core_WeaponSound.G5.G5-Putaway'
	StaticMesh=StaticMesh'BWBP_JCF_Static.RGP-X350.RGP-X350PickupHi'
	Physics=0
	DrawScale=0.3000000
	CollisionHeight=6.0000000
}
