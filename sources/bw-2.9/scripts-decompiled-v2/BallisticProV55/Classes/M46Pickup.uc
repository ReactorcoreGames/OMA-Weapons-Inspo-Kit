class M46Pickup extends BallisticWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.OA-AR.OA-AR_Clip');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.OA-AR.OA-AR_Grenade');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.OA-AR.OA-AR_GrenadeLauncher');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.OA-AR.OA-AR_Scope');
	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.OA-AR.OA-AR_Grenade');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.OA-AR.OA-AR_Clip');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.OA-AR.OA-AR_Grenade');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.OA-AR.OA-AR_GrenadeLauncher');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.OA-AR.OA-AR_Scope');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.OA-AR.OA-AR_Grenade');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.OA-AR.OA-AR_Ammo');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.OA-AR.OA-AR_PickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.OA-AR.OA-AR_PickupLo');
	//return;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BW_Core_WeaponStatic.OA-AR.OA-AR_PickupLo'
	PickupDrawScale=0.4000000
	InventoryType=Class'BallisticProV55.M46AssaultRifle'
	RespawnTime=20.0000000
	PickupMessage="You picked up the M46A1 scoped combat rifle."
	PickupSound=Sound'BW_Core_WeaponSound.M50.M50Putaway'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.OA-AR.OA-AR_PickupHi'
	Physics=0
	DrawScale=0.4000000
	CollisionHeight=4.0000000
}
