class BX5Pickup extends BallisticWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.BX5.BX5Skin');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Particles.Explode2');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Particles.Shockwave');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.explosion1');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.explosion2');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.explosion3');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.Explosion4');
	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.Effects.VBlast');
	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.Effects.HBlast');
	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.BX5.MineSBase2');
	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.BX5.MineSProj2');
	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.BX5.MineV2');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.BX5.BX5Skin');
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
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.Effects.VBlast');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.Effects.HBlast');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.BX5.MineSBase2');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.BX5.MineSProj2');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.BX5.MineV2');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.BX5.MinePickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.BX5.MinePickupLo');
	//return;	
}

defaultproperties
{
	bOnSide=false
	LowPolyStaticMesh=StaticMesh'BW_Core_WeaponStatic.BX5.MinePickupLo'
	PickupDrawScale=0.3000000
	bWeaponStay=false
	InventoryType=Class'BallisticProV55.BX5Mine'
	RespawnTime=20.0000000
	PickupMessage="You picked up the BX5-SM land mine."
	PickupSound=Sound'BW_Core_WeaponSound.BX5.BX5-Putaway'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.BX5.MinePickupHi'
	bOrientOnSlope=true
	Physics=0
	DrawScale=0.5500000
	CollisionHeight=5.6000000
}
