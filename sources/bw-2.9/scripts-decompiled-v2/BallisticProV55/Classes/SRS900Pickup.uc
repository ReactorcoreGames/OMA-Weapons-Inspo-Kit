class SRS900Pickup extends BallisticWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.SRS900.SRS900Main');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.SRS900.SRS900Scope');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.SRS900.SRS900Ammo');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.SRS900.SRS900Main');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.SRS900.SRS900Scope');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.SRS900.SRS900Ammo');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.Brass.EmptyRifleRound');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.SRS900.SRS900Clip');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.SRS900.SRS900PickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.SRS900.SRS900PickupLo');
	//return;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BW_Core_WeaponStatic.SRS900.SRS900PickupLo'
	PickupDrawScale=0.5000000
	InventoryType=Class'BallisticProV55.SRS900Rifle'
	RespawnTime=20.0000000
	PickupMessage="You picked up the SRS-900 battle rifle."
	PickupSound=Sound'BW_Core_WeaponSound.R78.R78Putaway'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.SRS900.SRS900PickupHi'
	Physics=0
	DrawScale=0.3800000
	CollisionHeight=3.0000000
}
