class NRP57Pickup extends BallisticWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.NRP57.Grenade');
	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.Brass.GrenadeClip');
	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.NRP57.Pineapple');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.NRP57.Grenade');
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
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.Brass.GrenadeClip');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.NRP57.Pineapple');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.NRP57.NRP57PickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.NRP57.NRP57PickupLo');
	//return;	
}

defaultproperties
{
	bOnSide=false
	LowPolyStaticMesh=StaticMesh'BW_Core_WeaponStatic.NRP57.NRP57PickupLo'
	PickupDrawScale=0.2000000
	bWeaponStay=false
	InventoryType=Class'BallisticProV55.NRP57Grenade'
	RespawnTime=20.0000000
	PickupMessage="You picked up the NRP-57 grenade."
	PickupSound=Sound'BW_Core_WeaponSound.Ammo.GrenadePickup'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.NRP57.NRP57PickupHi'
	bOrientOnSlope=true
	Physics=0
	DrawScale=0.4000000
	CollisionHeight=5.6000000
}
