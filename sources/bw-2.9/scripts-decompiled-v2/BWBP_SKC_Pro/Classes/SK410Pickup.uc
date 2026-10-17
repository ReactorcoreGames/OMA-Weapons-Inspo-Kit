class SK410Pickup extends BallisticWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.SK410.SK410-Main');
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.SK410.SK410-Misc');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.Shell_Concrete');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.Shell_Metal');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.Shell_Wood');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.M763Bash');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.M763BashWood');
	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.M763.M763MuzzleFlash');
	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.M763.M763Flash1');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.SK410.SK410-Main');
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.SK410.SK410-Misc');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.Shell_Concrete');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.Shell_Metal');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.Shell_Wood');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.M763Bash');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.M763BashWood');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.M763.M763MuzzleFlash');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.M763.M763Flash1');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.Brass.EmptyShell');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.SK410.SK410Ammo');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.SK410.SK410PickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.SK410.SK410PickupLo');
	//return;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BWBP_SKC_Static.SK410.SK410PickupLo'
	PickupDrawScale=0.4000000
	InventoryType=Class'BWBP_SKC_Pro.SK410Shotgun'
	RespawnTime=20.0000000
	PickupMessage="You picked up the SK-410 assault shotgun."
	PickupSound=Sound'BW_Core_WeaponSound.M763.M763Putaway'
	StaticMesh=StaticMesh'BWBP_SKC_Static.SK410.SK410PickupHi'
	Physics=0
	DrawScale=0.6500000
	CollisionHeight=3.0000000
}
