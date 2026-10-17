class M75Pickup extends BallisticWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.M75.M75Clip');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.M75.M75Pack');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.M75.M75PartA');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.M75.M75PartB');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.M75.M75Scope');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.GunFire.M75MuzzleFlash');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.GunFire.RailCoreWave');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.GunFire.RailCoreWaveCap');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.GunFire.RailShock');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.GunFire.RailSmokeCore');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.GunFire.RailSpiralSmoke');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.RailImpact');
	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.M75.M75MuzzleFlash');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.M75.M75Clip');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.M75.M75Pack');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.M75.M75PartA');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.M75.M75PartB');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.M75.M75Scope');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.GunFire.M75MuzzleFlash');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.GunFire.RailCoreWave');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.GunFire.RailCoreWaveCap');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.GunFire.RailShock');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.GunFire.RailSmokeCore');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.GunFire.RailSpiralSmoke');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.RailImpact');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.M75.M75MuzzleFlash');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.Ammo.M75Clip');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.M75.M75Hi');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.M75.M75Lo');
	//return;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BW_Core_WeaponStatic.M75.M75Lo'
	PickupDrawScale=0.3000000
	StandUp=(X=0.0000000,Y=0.8000000,Z=0.0000000)
	InventoryType=Class'BallisticProV55.M75Railgun'
	RespawnTime=20.0000000
	PickupMessage="You picked up the M75 railgun."
	PickupSound=Sound'BW_Core_WeaponSound.M75.M75Putaway'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.M75.M75Hi'
	Physics=0
	DrawScale=0.1200000
	CollisionHeight=3.0000000
}
