class BRINKPickup extends BallisticWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BWBP_SWC_Tex.BR1NK.BR1-Mat1-Main');
	L.AddPrecacheMaterial(Texture'BWBP_SWC_Tex.BR1NK.BR1-Mat2-Main');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_SWC_Static.BRINK.BRINKPickupHi');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_SWC_Static.BRINK.BRINKPickupLo');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	super(Actor).UpdatePrecacheMaterials();
	Level.AddPrecacheMaterial(Texture'BWBP_SWC_Tex.BR1NK.BR1-Mat1-Main');
	Level.AddPrecacheMaterial(Texture'BWBP_SWC_Tex.BR1NK.BR1-Mat2-Main');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	super(Actor).UpdatePrecacheStaticMeshes();
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SWC_Static.BRINK.BRINKPickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SWC_Static.BRINK.BRINKPickupLo');
	//return;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BWBP_SWC_Static.BRINK.BRINKPickupLo'
	InventoryType=Class'BWBP_SWC_Pro.BRINKAssaultRifle'
	RespawnTime=20.0000000
	PickupMessage="You picked up the BR1-NK Mod-2 LSW."
	PickupSound=Sound'BW_Core_WeaponSound.M50.M50Putaway'
	StaticMesh=StaticMesh'BWBP_SWC_Static.BRINK.BRINKPickupHi'
	Physics=0
	DrawScale=0.3000000
	CollisionHeight=4.0000000
}
