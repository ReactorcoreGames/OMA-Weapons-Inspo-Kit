class MK781Pickup extends BallisticWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.M1014.M1014-Main');
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.M1014.M1014-Misc');
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.M1014.M1014-SpecMap');
	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.Brass.EmptyShell');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.M1014.M1014-Main');
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.M1014.M1014-Misc');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.Shell_Concrete');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.M1014.M1014PickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.M1014.M1014PickupLo');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.M763.M763MuzzleFlash');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.M763.M763Flash1');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.Brass.EmptyShell');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.Ammo.M763ShellBox');
	//return;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BWBP_SKC_Static.M1014.M1014PickupLo'
	PickupDrawScale=1.0000000
	InventoryType=Class'BWBP_SKC_Pro.MK781Shotgun'
	RespawnTime=20.0000000
	PickupMessage="You picked up the MK781 combat shotgun."
	PickupSound=Sound'BW_Core_WeaponSound.M763.M763Putaway'
	StaticMesh=StaticMesh'BWBP_SKC_Static.M1014.M1014PickupHi'
	Physics=0
	DrawScale=0.4100000
	CollisionHeight=3.0000000
}
