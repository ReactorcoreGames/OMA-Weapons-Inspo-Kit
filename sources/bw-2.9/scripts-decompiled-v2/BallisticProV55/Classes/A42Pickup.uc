class A42Pickup extends BallisticHandgunPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.A42.A42_Exp');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.A42Scorch');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.GunFire.A73MuzzleFlash');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.GunFire.A42Projectile');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.GunFire.A42Projectile2');
	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.A42.A42Projectile');
	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.A42.A42MuzzleFlash');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.A42.A42_Exp');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.A42Scorch');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.GunFire.A73MuzzleFlash');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.GunFire.A42Projectile');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.GunFire.A42Projectile2');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.A42.A42Projectile');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.A42.A42MuzzleFlash');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.A42.A42PickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.A42.A42PickupLo');
	//return;	
}

function SetWeaponStay()
{
	bWeaponStay = false;
	//return;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BW_Core_WeaponStatic.A42.A42PickupLo'
	PickupDrawScale=0.1870000
	InventoryType=Class'BallisticProV55.A42SkrithPistol'
	RespawnTime=20.0000000
	PickupMessage="You picked up the A42 Skrith sidearm."
	PickupSound=Sound'BW_Core_WeaponSound.A42.A42-Putaway'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.A42.A42PickupHi'
	Physics=0
	DrawScale=0.2000000
	CollisionHeight=4.5000000
}
