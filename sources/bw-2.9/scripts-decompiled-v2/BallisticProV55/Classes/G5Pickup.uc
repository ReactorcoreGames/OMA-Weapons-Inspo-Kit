class G5Pickup extends BallisticWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.G5.G5Bazooka');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.G5.G5Rocket');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.G5.G5Scope');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.G5.G5Inner');
	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.G5.G5Rocket');
	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.G5.BazookaMuzzleFlash');
	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.G5.BazookaBackFlash');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.G5.G5Bazooka');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.G5.G5Rocket');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.G5.G5Scope');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.G5.G5Inner');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Particles.Explode2');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Particles.Shockwave');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.explosion1');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.explosion2');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.explosion3');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.Explosion4');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.G5.G5Rocket');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.G5.BazookaMuzzleFlash');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.G5.BazookaBackFlash');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.Ammo.G5Rockets');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.G5.G5PickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.G5.G5PickupLo');
	//return;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BW_Core_WeaponStatic.G5.G5PickupLo'
	PickupDrawScale=0.5000000
	InventoryType=Class'BallisticProV55.G5Bazooka'
	RespawnTime=60.0000000
	PickupMessage="You picked up the G5 missile launcher."
	PickupSound=Sound'BW_Core_WeaponSound.G5.G5-Putaway'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.G5.G5PickupHi'
	Physics=0
	DrawScale=0.4000000
	CollisionHeight=6.0000000
}
