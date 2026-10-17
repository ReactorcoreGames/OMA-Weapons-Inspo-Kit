class XK2Pickup extends BallisticHandgunPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.XK2.XK2Skin');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.XK2.XK2Skin');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.Ammo.XK2Clip');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.XK2.XK2PickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.XK2.XK2PickupLo');
	//return;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BW_Core_WeaponStatic.XK2.XK2PickupLo'
	PickupDrawScale=0.2500000
	InventoryType=Class'BallisticProV55.XK2SubMachinegun'
	RespawnTime=20.0000000
	PickupMessage="You picked up the XK2 submachine gun."
	PickupSound=Sound'BW_Core_WeaponSound.XK2.XK2-Putaway'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.XK2.XK2PickupHi'
	Physics=0
	DrawScale=0.2500000
	CollisionHeight=4.0000000
}
