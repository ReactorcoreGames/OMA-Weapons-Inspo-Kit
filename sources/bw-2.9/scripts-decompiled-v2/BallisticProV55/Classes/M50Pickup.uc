class M50Pickup extends BallisticWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.M50.M50SkinA');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.M50.M50SkinB');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.M50.M50Laser');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.M50.M50Gren');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.M50.M50Camera');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.M50.M900Grenade');
	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.M900.M900Grenade');
	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.M900.M900MuzzleFlash');
	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.Brass.EmptyRifleRound');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.M50.M50SkinA');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.M50.M50SkinB');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.M50.M50Laser');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.M50.M50Gren');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.M50.M50Camera');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.M50.M900Grenade');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.M900.M900Grenade');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.M900.M900MuzzleFlash');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.Brass.EmptyRifleRound');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.Ammo.M50Magazine');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.M50.M50PickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.M50.M50PickupLo');
	//return;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BW_Core_WeaponStatic.M50.M50PickupLo'
	InventoryType=Class'BallisticProV55.M50AssaultRifle'
	RespawnTime=20.0000000
	PickupMessage="You picked up the M50 assault rifle."
	PickupSound=Sound'BW_Core_WeaponSound.M50.M50Putaway'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.M50.M50PickupHi'
	Physics=0
	DrawScale=0.3000000
	CollisionHeight=4.0000000
}
