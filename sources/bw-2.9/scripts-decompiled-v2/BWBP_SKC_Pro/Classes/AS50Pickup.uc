class AS50Pickup extends BallisticWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.FSG50.FSG-Main');
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.FSG50.FSG-Misc');
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.FSG50.FSG-Scope');
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.FSG50.FSG-Stock');
	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.Brass.EmptyRifleRound');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.FSG50.FSG-Main');
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.FSG50.FSG-Misc');
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.FSG50.FSG-Scope');
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.FSG50.FSG-Stock');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.Brass.EmptyRifleRound');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.FSSG50.FSSG50PickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.FSSG50.FSSG50PickupLo');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.FSSG50.FSSG50AmmoPickup');
	//return;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BWBP_SKC_Static.FSSG50.FSSG50PickupLo'
	PickupDrawScale=0.7500000
	MaxDesireability=0.7500000
	InventoryType=Class'BWBP_SKC_Pro.AS50Rifle'
	RespawnTime=20.0000000
	PickupMessage="You picked up the FSSG-50 marksman rifle."
	PickupSound=Sound'BW_Core_WeaponSound.MRL.MRL-BigOn'
	StaticMesh=StaticMesh'BWBP_SKC_Static.FSSG50.FSSG50PickupHi'
	Physics=0
	DrawScale=0.4000000
	PrePivot=(X=0.0000000,Y=-15.0000000,Z=0.0000000)
	CollisionHeight=3.0000000
}
