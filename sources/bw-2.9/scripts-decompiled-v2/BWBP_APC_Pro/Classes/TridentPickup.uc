class TridentPickup extends BallisticWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BWBP_APC_Tex.CruMG.MGMain');
	L.AddPrecacheMaterial(Texture'BWBP_APC_Tex.CruMG.MGAmmoMain');
	L.AddPrecacheMaterial(Texture'BWBP_APC_Tex.CruMG.MGSkullMain');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_APC_Static.CruMG.CruMGPickupHi');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_APC_Static.CruMG.CruMGPickupLo');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BWBP_APC_Tex.CruMG.MGMain');
	Level.AddPrecacheMaterial(Texture'BWBP_APC_Tex.CruMG.MGAmmoMain');
	Level.AddPrecacheMaterial(Texture'BWBP_APC_Tex.CruMG.MGSkullMain');
	super(Actor).UpdatePrecacheMaterials();
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_APC_Static.CruMG.CruMGPickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_APC_Static.CruMG.CruMGPickupLo');
	super(Actor).UpdatePrecacheStaticMeshes();
	//return;	
}

defaultproperties
{
	bOnSide=false
	LowPolyStaticMesh=StaticMesh'BWBP_APC_Static.CruMG.CruMGPickupLo'
	InventoryType=Class'BWBP_APC_Pro.TridentMachinegun'
	RespawnTime=20.0000000
	PickupMessage="You picked up the Trident Splitter Machinegun."
	PickupSound=Sound'BW_Core_WeaponSound.M50.M50Putaway'
	StaticMesh=StaticMesh'BWBP_APC_Static.CruMG.CruMGPickupHi'
	Physics=0
	DrawScale=0.4000000
	CollisionHeight=4.0000000
}
