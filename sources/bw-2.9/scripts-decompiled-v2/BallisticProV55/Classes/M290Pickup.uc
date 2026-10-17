class M290Pickup extends BallisticWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.M290.M290Shotgun');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.M290.M290Shotgun');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.Shell_Concrete');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.Shell_Metal');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.Shell_Wood');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.Brass.EmptyShell');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.Ammo.M763ShellBox');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.M290.M290PickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.M290.M290PickupLo');
	//return;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BW_Core_WeaponStatic.M290.M290PickupLo'
	PickupDrawScale=0.2000000
	InventoryType=Class'BallisticProV55.M290Shotgun'
	RespawnTime=120.0000000
	PickupMessage="You picked up the M290 shotgun."
	PickupSound=Sound'BW_Core_WeaponSound.M290.M290Putaway'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.M290.M290PickupHi'
	Physics=0
	DrawScale=0.1500000
	CollisionHeight=3.5000000
}
