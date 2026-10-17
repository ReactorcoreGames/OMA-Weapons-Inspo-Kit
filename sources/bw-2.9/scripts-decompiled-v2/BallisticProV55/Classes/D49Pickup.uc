class D49Pickup extends BallisticHandgunPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.D49.D49RevolverSkin');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.D49.D49ShellsSkin');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.D49.D49RevolverSkin');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.D49.D49ShellsSkin');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.D49.D49AmmoBox');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.D49.D49PickupLo');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.D49.D49PickupHi');
	//return;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BW_Core_WeaponStatic.D49.D49PickupLo'
	PickupDrawScale=0.3000000
	InventoryType=Class'BallisticProV55.D49Revolver'
	RespawnTime=10.0000000
	PickupMessage="You picked up the D49 revolver."
	PickupSound=Sound'BW_Core_WeaponSound.M806.M806Putaway'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.D49.D49PickupHi'
	Physics=0
	DrawScale=0.4000000
	CollisionHeight=4.0000000
}
