class XMK5Pickup extends BallisticWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.OA-SMG.OA-SMG_Clip');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.OA-SMG.OA-SMG_Dart');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.OA-SMG.OA-SMG_Darter');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.OA-SMG.OA-SMG_Shield');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.OA-SMG.OA-SMG_Sight');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.OA-SMG.OA-SMG_Sight_SI');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.OA-SMG.OA-SMG_Main');
	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.OA-AR.OA-AR_Grenade');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.OA-SMG.OA-SMG_Clip');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.OA-SMG.OA-SMG_Dart');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.OA-SMG.OA-SMG_Darter');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.OA-SMG.OA-SMG_Shield');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.OA-SMG.OA-SMG_Sight');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.OA-SMG.OA-SMG_Sight_SI');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.OA-SMG.OA-SMG_Main');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.OA-AR.OA-AR_Grenade');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.OA-AR.OA-AR_Ammo');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.OA-AR.OA-AR_PickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.OA-AR.OA-AR_PickupLo');
	//return;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BW_Core_WeaponStatic.OA-SMG.OA-SMG_PickupLo'
	PickupDrawScale=0.5000000
	InventoryType=Class'BallisticProV55.XMK5SubMachinegun'
	RespawnTime=20.0000000
	PickupMessage="You picked up the XMk5 submachine gun."
	PickupSound=Sound'BW_Core_WeaponSound.M50.M50Putaway'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.OA-SMG.OA-SMG_PickupHi'
	Physics=0
	DrawScale=0.4000000
	CollisionHeight=4.0000000
}
