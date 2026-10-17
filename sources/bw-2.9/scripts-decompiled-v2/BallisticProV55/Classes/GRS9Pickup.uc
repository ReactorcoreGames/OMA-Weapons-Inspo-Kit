class GRS9Pickup extends BallisticHandgunPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Brass.Cart_Silver');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Glock.Glock_Main');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Glock.Glock_SpecMask');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Glock.LaserBeam');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Brass.Cart_Silver');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Glock.Glock_Main');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Glock.Glock_SpecMask');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Glock.LaserBeam');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.Glock.Glock-LD');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.Glock.Glock-HD');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.Glock.Glock-Ammo');
	//return;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BW_Core_WeaponStatic.Glock.Glock-LD'
	PickupDrawScale=0.1600000
	InventoryType=Class'BallisticProV55.GRS9Pistol'
	RespawnTime=10.0000000
	PickupMessage="You picked up the GRS-9 pistol."
	PickupSound=Sound'BW_Core_WeaponSound.M806.M806Putaway'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.Glock.Glock-HD'
	Physics=0
	DrawScale=0.3400000
	PrePivot=(X=0.0000000,Y=-40.0000000,Z=0.0000000)
	CollisionHeight=4.0000000
}
