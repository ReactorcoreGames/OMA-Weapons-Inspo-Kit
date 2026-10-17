class MACPickup extends BallisticWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Artillery.Artillery_Main');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Artillery.Artillery_Glass');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Particles.Explode2');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Particles.Shockwave');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.explosion1');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.explosion2');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.explosion3');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.Explosion4');
	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.Artillery.Blast-FX');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Artillery.Artillery_Main');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Artillery.Artillery_Glass');
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
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.Artillery.ArtilleryPickup-HD');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.Artillery.ArtilleryPickup-LD');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.Artillery.Blast-FX');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.Artillery.Artillery-Ammo');
	//return;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BW_Core_WeaponStatic.Artillery.ArtilleryPickup-LD'
	PickupDrawScale=0.2500000
	InventoryType=Class'BallisticProV55.MACWeapon'
	RespawnTime=120.0000000
	PickupMessage="You picked up the Heavy Anti-Materiel Rifle."
	PickupSound=Sound'BW_Core_WeaponSound.G5.G5-Putaway'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.Artillery.ArtilleryPickup-HD'
	Physics=0
	DrawScale=0.2250000
	PrePivot=(X=0.0000000,Y=0.0000000,Z=-14.0000000)
	CollisionHeight=6.0000000
}
