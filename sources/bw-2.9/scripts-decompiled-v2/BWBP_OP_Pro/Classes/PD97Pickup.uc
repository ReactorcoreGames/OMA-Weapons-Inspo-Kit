class PD97Pickup extends BallisticHandgunPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BWBP_OP_Tex.Bloodhound.BloodhoundMain');
	L.AddPrecacheMaterial(Texture'BWBP_OP_Tex.Bloodhound.BloodhoundAmmo');
	L.AddPrecacheMaterial(Texture'BWBP_OP_Tex.Bloodhound.BloodhoundAcc');
	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.OA-SMG.OA-SMG_Dart');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BWBP_OP_Tex.Bloodhound.BloodhoundMain');
	Level.AddPrecacheMaterial(Texture'BWBP_OP_Tex.Bloodhound.BloodhoundAmmo');
	Level.AddPrecacheMaterial(Texture'BWBP_OP_Tex.Bloodhound.BloodhoundAcc');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_OP_Static.PD97.PD97PickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_OP_Static.PD97.PD97PickupLo');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.OA-SMG.OA-SMG_Dart');
	//return;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BWBP_OP_Static.PD97.PD97PickupLo'
	PickupDrawScale=1.6500000
	InventoryType=Class'BWBP_OP_Pro.PD97Bloodhound'
	RespawnTime=10.0000000
	PickupMessage="You picked up the PD-97 'Bloodhound' pistol."
	PickupSound=Sound'BW_Core_WeaponSound.M806.M806Putaway'
	StaticMesh=StaticMesh'BWBP_OP_Static.PD97.PD97PickupHi'
	Physics=0
	DrawScale=2.5000000
	CollisionHeight=4.0000000
}
