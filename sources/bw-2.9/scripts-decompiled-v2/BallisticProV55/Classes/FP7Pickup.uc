class FP7Pickup extends BallisticWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.FP7.FP7Grenade');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Particles.FlameParts');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Particles.BlazingSubdivide');
	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.Brass.FP7Clip');
	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.FP7.FP7Proj');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.FP7.FP7Grenade');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Particles.FlameParts');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Particles.BlazingSubdivide');
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
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.Brass.FP7Clip');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.FP7.FP7Proj');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.FP7.FP7PickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.FP7.FP7PickupLo');
	//return;	
}

defaultproperties
{
	bOnSide=false
	LowPolyStaticMesh=StaticMesh'BW_Core_WeaponStatic.FP7.FP7PickupLo'
	PickupDrawScale=0.5000000
	bWeaponStay=false
	InventoryType=Class'BallisticProV55.FP7Grenade'
	RespawnTime=20.0000000
	PickupMessage="You picked up the FP7 grenade."
	PickupSound=Sound'BW_Core_WeaponSound.Ammo.GrenadePickup'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.FP7.FP7PickupHi'
	bOrientOnSlope=true
	Physics=0
	DrawScale=0.9000000
	CollisionHeight=5.6000000
}
