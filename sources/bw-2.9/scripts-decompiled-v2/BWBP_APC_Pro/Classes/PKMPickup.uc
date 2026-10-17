class PKMPickup extends BallisticWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BWBP_APC_Tex.PKM.PKM_Main');
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.AK490.AK490-Misc');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_APC_Static.PKMA.PKMAPickupHi');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_APC_Static.PKMA.PKMAPickupLo');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BWBP_APC_Tex.PKM.PKM_Main');
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.AK490.AK490-Misc');
	super(Actor).UpdatePrecacheMaterials();
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_APC_Static.PKMA.PKMAPickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_APC_Static.PKMA.PKMAPickupLo');
	super(Actor).UpdatePrecacheStaticMeshes();
	//return;	
}

defaultproperties
{
	bOnSide=false
	LowPolyStaticMesh=StaticMesh'BWBP_APC_Static.PKMA.PKMAPickupLo'
	PickupDrawScale=0.7500000
	InventoryType=Class'BWBP_APC_Pro.PKMMachinegun'
	RespawnTime=20.0000000
	PickupMessage="You picked up the PKMA machinegun."
	PickupSound=Sound'BW_Core_WeaponSound.M353.M353-Putaway'
	StaticMesh=StaticMesh'BWBP_APC_Static.PKMA.PKMAPickupHi'
	Physics=0
	DrawScale=0.5800000
	CollisionHeight=12.0000000
}
