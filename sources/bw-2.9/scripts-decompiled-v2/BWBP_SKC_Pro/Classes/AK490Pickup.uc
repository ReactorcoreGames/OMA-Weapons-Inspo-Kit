class AK490Pickup extends BallisticWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.AK490.AK490-Main');
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.AK490.AK490-Misc');
	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.Brass.EmptyRifleRound');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.AK490.AK490-Main');
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.AK490.AK490-Misc');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.Brass.EmptyRifleRound');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.AK490.AK490PickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.AK490.AK490PickupLo');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.AK490.AK490AmmoPickup');
	//return;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BWBP_SKC_Static.AK490.AK490PickupLo'
	PickupDrawScale=0.1400000
	InventoryType=Class'BWBP_SKC_Pro.AK490BattleRifle'
	RespawnTime=20.0000000
	PickupMessage="You picked up the AK-490 battle rifle."
	PickupSound=Sound'BW_Core_WeaponSound.M50.M50Putaway'
	StaticMesh=StaticMesh'BWBP_SKC_Static.AK490.AK490PickupHi'
	Physics=0
	DrawScale=0.1300000
	CollisionHeight=4.0000000
}
