class AH104Pickup extends BallisticHandgunPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.AH104.AH104-Main');
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.AH104.AH104-Misc');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.AH104.AH104-Main');
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.AH104.AH104-Misc');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.AH104.AH104PickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.AH104.AH104PickupLo');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.AH104.AH104_SM_Ammo');
	//return;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BWBP_SKC_Static.AH104.AH104PickupLo'
	PickupDrawScale=0.1000000
	InventoryType=Class'BWBP_SKC_Pro.AH104Pistol'
	RespawnTime=10.0000000
	PickupMessage="You picked up the AH104 Handcannon"
	PickupSound=Sound'BW_Core_WeaponSound.M806.M806Putaway'
	StaticMesh=StaticMesh'BWBP_SKC_Static.AH104.AH104PickupHi'
	Physics=0
	DrawScale=0.1500000
	PrePivot=(X=0.0000000,Y=-26.0000000,Z=0.0000000)
	CollisionHeight=4.0000000
}
