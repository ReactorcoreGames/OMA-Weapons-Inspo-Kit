class RCS715Pickup extends BallisticWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BWBP_OP_Tex.AssaultShotgun.AA12Diffuse');
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.CYLO.Reflex');
	L.AddPrecacheMaterial(Texture'BWBP_OP_Tex.AssaultShotgun.AA12GrenadeDiffuse');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_OP_Static.AssaultShotgun.AA12PickupHi');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_OP_Static.AssaultShotgun.AA12PickupLo');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BWBP_OP_Tex.AssaultShotgun.AA12Diffuse');
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.CYLO.Reflex');
	Level.AddPrecacheMaterial(Texture'BWBP_OP_Tex.AssaultShotgun.AA12GrenadeDiffuse');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_OP_Static.AssaultShotgun.AA12PickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_OP_Static.AssaultShotgun.AA12PickupLo');
	//return;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BWBP_OP_Static.AssaultShotgun.AA12PickupLo'
	PickupDrawScale=0.1000000
	InventoryType=Class'BWBP_OP_Pro.RCS715Shotgun'
	RespawnTime=20.0000000
	PickupMessage="You picked up the RCS-715 Assault Shotgun."
	PickupSound=Sound'BW_Core_WeaponSound.M763.M763Putaway'
	StaticMesh=StaticMesh'BWBP_OP_Static.AssaultShotgun.AA12PickupHi'
	Physics=0
	DrawScale=0.1000000
	CollisionHeight=3.0000000
}
