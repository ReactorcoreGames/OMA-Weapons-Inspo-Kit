class A500Pickup extends BallisticWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Reptile.AcidBlast01');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Reptile.AcidDrops01');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Reptile.AcidSplash01');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Reptile.AcidSplat_Large');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Reptile.AcidSplat_Small');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Reptile.Reptile_Main');
	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.Reptile.Reptile_MuzzleFlash');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Reptile.AcidBlast01');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Reptile.AcidDrops01');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Reptile.AcidSplash01');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Reptile.AcidSplat_Large');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Reptile.AcidSplat_Small');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Reptile.Reptile_Main');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.Reptile.Reptile_MuzzleFlash');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.Reptile.Reptile_Ammo');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.Reptile.Reptile_PickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.Reptile.Reptile_PickupLo');
	//return;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BW_Core_WeaponStatic.Reptile.Reptile_PickupLo'
	PickupDrawScale=0.2500000
	InventoryType=Class'BallisticProV55.A500Reptile'
	RespawnTime=20.0000000
	PickupMessage="You picked up the A500 'Reptile' acid gun."
	PickupSound=Sound'BW_Core_WeaponSound.A73.A73Putaway'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.Reptile.Reptile_PickupHi'
	Physics=0
	DrawScale=0.2200000
	CollisionHeight=4.5000000
}
