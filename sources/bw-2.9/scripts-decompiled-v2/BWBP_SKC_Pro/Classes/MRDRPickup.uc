class MRDRPickup extends BallisticHandgunPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.MRDR.MRDR-Main');
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.MRDR.MRDR-Spec');
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.MRDR.MRDRMuzzleFlash');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.MRDR.MRDR-Main');
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.MRDR.MRDR-Spec');
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.MRDR.MRDRMuzzleFlash');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.MRDR.MRDR88AmmoPickup');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.MRDR.MRDRPickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.MRDR.MRDRPickupLo');
	//return;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BWBP_SKC_Static.MRDR.MRDRPickupLo'
	PickupDrawScale=0.2500000
	InventoryType=Class'BWBP_SKC_Pro.MRDRMachinePistol'
	RespawnTime=20.0000000
	PickupMessage="You picked up the MR-DR88 machine pistol."
	PickupSound=Sound'BW_Core_WeaponSound.XK2.XK2-Putaway'
	StaticMesh=StaticMesh'BWBP_SKC_Static.MRDR.MRDRPickupHi'
	Physics=0
	DrawScale=0.4200000
	PrePivot=(X=0.0000000,Y=-16.0000000,Z=0.0000000)
	CollisionHeight=4.0000000
}
