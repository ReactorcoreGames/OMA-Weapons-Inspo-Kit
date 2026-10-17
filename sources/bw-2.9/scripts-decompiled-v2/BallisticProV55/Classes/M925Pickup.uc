class M925Pickup extends BallisticWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.M925.M925Main');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.M925.M925Small');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.M925.M925AmmoBox');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.M925.M925HeatShield');
	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.M925.M925MuzzleFlash');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.M925.M925Main');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.M925.M925Small');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.M925.M925AmmoBox');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.M925.M925HeatShield');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.M925.M925MuzzleFlash');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.Ammo.M925AmmoBox');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.M925.M925PickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.M925.M925PickupLo');
	//return;	
}

defaultproperties
{
	bOnSide=false
	LowPolyStaticMesh=StaticMesh'BW_Core_WeaponStatic.M925.M925PickupLo'
	PickupDrawScale=0.2500000
	StandUp=(X=0.0000000,Y=0.8000000,Z=0.0000000)
	InventoryType=Class'BallisticProV55.M925Machinegun'
	RespawnTime=20.0000000
	PickupMessage="You picked up the M925 machinegun."
	PickupSound=Sound'BW_Core_WeaponSound.M925.M925-Putaway'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.M925.M925PickupHi'
	bOrientOnSlope=true
	Physics=0
	DrawScale=0.1600000
	TransientSoundVolume=0.6000000
	CollisionHeight=8.0000000
}
