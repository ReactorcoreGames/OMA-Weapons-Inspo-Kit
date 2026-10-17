class M353Pickup extends BallisticWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.M353.M353_Skin1');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.M353.M353_Skin2');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.M353.M353_Ammo');
	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.M353.M353MuzzleFlash');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.M353.M353_Skin1');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.M353.M353_Skin2');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.M353.M353_Ammo');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.M353.M353MuzzleFlash');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.Ammo.MachinegunBox');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.M353.M353PickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.M353.M353PickupLo');
	//return;	
}

defaultproperties
{
	bOnSide=false
	LowPolyStaticMesh=StaticMesh'BW_Core_WeaponStatic.M353.M353PickupLo'
	PickupDrawScale=0.7500000
	StandUp=(X=0.0000000,Y=0.8000000,Z=0.0000000)
	InventoryType=Class'BallisticProV55.M353Machinegun'
	RespawnTime=20.0000000
	PickupMessage="You picked up the M353 machinegun."
	PickupSound=Sound'BW_Core_WeaponSound.M353.M353-Putaway'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.M353.M353PickupHi'
	bOrientOnSlope=true
	Physics=0
	DrawScale=0.5000000
	CollisionHeight=12.0000000
}
