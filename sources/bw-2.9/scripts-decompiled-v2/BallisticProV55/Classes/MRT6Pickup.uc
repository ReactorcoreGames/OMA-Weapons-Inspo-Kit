class MRT6Pickup extends BallisticHandgunPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.MRT6.MRT6Skin');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.Shell_Concrete');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.Shell_Metal');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.Shell_Wood');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Brass.Cart_Shotgun2');
	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.MRT6.MRT6MuzzleFlash');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.MRT6.MRT6Skin');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.Shell_Concrete');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.Shell_Metal');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.Shell_Wood');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Brass.Cart_Shotgun2');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.MRT6.MRT6MuzzleFlash');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.Ammo.MRT6Clip');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.MRT6.MRT6PickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.MRT6.MRT6PickupLo');
	//return;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BW_Core_WeaponStatic.MRT6.MRT6PickupLo'
	PickupDrawScale=0.4500000
	InventoryType=Class'BallisticProV55.MRT6Shotgun'
	RespawnTime=20.0000000
	PickupMessage="You picked up the MRT-6 shotgun."
	PickupSound=Sound'BW_Core_WeaponSound.MRT6.MRT6Putaway'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.MRT6.MRT6PickupHi'
	Physics=0
	DrawScale=0.8000000
	CollisionHeight=3.5000000
}
