class FP9Pickup extends BallisticWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.FP9A5.FP9Bomb');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.FP9A5.FP9Detonator');
	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.FP9.FP9Proj');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.FP9A5.FP9Bomb');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.FP9A5.FP9Detonator');
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
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.FP9.FP9Proj');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.FP9.FP9PickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.FP9.FP9PickupLo');
	//return;	
}

defaultproperties
{
	bOnSide=false
	LowPolyStaticMesh=StaticMesh'BW_Core_WeaponStatic.FP9.FP9PickupLo'
	PickupDrawScale=0.3700000
	bWeaponStay=false
	InventoryType=Class'BallisticProV55.FP9Explosive'
	RespawnTime=20.0000000
	PickupMessage="You picked up the FP9A5 explosive device."
	PickupSound=Sound'BW_Core_WeaponSound.FP9A5.FP9-Putaway'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.FP9.FP9PickupHi'
	bOrientOnSlope=true
	Physics=0
	DrawScale=0.4300000
	CollisionHeight=5.6000000
}
