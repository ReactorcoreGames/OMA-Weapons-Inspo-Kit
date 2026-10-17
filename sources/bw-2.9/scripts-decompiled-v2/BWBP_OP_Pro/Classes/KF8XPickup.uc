class KF8XPickup extends BallisticWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BWBP_OP_Tex.XBow.XBow_diff');
	L.AddPrecacheMaterial(Texture'BWBP_OP_Tex.XBow.XBow_spec');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BWBP_OP_Tex.XBow.XBow_diff');
	Level.AddPrecacheMaterial(Texture'BWBP_OP_Tex.XBow.XBow_spec');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_OP_Static.XBow.XBowPickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_OP_Static.XBow.XBowPickupLo');
	//return;	
}

defaultproperties
{
	bOnSide=false
	LowPolyStaticMesh=StaticMesh'BWBP_OP_Static.XBow.XBowPickupLo'
	InventoryType=Class'BWBP_OP_Pro.KF8XCrossbow'
	RespawnTime=20.0000000
	PickupMessage="You picked up the KF8X stealth crossbow."
	PickupSound=Sound'BW_Core_WeaponSound.M50.M50Putaway'
	StaticMesh=StaticMesh'BWBP_OP_Static.XBow.XBowPickupHi'
	Physics=0
	DrawScale=0.2500000
	CollisionHeight=4.0000000
}
