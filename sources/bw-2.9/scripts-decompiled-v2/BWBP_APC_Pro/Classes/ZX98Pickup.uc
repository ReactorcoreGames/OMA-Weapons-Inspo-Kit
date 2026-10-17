class ZX98Pickup extends BallisticWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BWBP_APC_Tex.Ar.ARScopeMain');
	L.AddPrecacheMaterial(Texture'BWBP_APC_Tex.Ar.ARMain');
	L.AddPrecacheMaterial(Texture'BWBP_APC_Tex.Ar.ARClipMain');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_APC_Static.ZX98.ZX98PickupHi');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_APC_Static.ZX98.ZX98PickupLo');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BWBP_APC_Tex.Ar.ARScopeMain');
	Level.AddPrecacheMaterial(Texture'BWBP_APC_Tex.Ar.ARMain');
	Level.AddPrecacheMaterial(Texture'BWBP_APC_Tex.Ar.ARClipMain');
	super(Actor).UpdatePrecacheMaterials();
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_APC_Static.ZX98.ZX98PickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_APC_Static.ZX98.ZX98PickupLo');
	super(Actor).UpdatePrecacheStaticMeshes();
	//return;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BWBP_APC_Static.ZX98.ZX98PickupLo'
	InventoryType=Class'BWBP_APC_Pro.ZX98AssaultRifle'
	RespawnTime=20.0000000
	PickupMessage="You picked up the ZX98 Reaper Gauss Minigun."
	PickupSound=Sound'BW_Core_WeaponSound.M50.M50Putaway'
	StaticMesh=StaticMesh'BWBP_APC_Static.ZX98.ZX98PickupHi'
	Physics=0
	DrawScale=0.2500000
	CollisionHeight=4.0000000
}
