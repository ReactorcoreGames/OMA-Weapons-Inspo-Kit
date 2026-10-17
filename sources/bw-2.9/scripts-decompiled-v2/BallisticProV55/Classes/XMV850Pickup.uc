class XMV850Pickup extends BallisticWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.XMV850.XMV850_Main');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.XMV850.XMV850_Barrels');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.XMV850.XMV850_BackPack');
	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.XMV850.XMv850backpack');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.XMV850.XMV850_Main');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.XMV850.XMV850_Barrels');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.XMV850.XMV850_BackPack');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.XMV850.XMV850PickupLD');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.XMV850.XMV850PickupHD');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.XMV850.XMv850backpack');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.XMV850.XMV850AmmoPickup');
	//return;	
}

defaultproperties
{
	bOnSide=false
	LowPolyStaticMesh=StaticMesh'BW_Core_WeaponStatic.XMV850.XMV850PickupLD'
	PickupDrawScale=0.3500000
	InventoryType=Class'BallisticProV55.XMV850Minigun'
	RespawnTime=20.0000000
	PickupMessage="You picked up the XMV-850 minigun."
	PickupSound=Sound'BW_Core_WeaponSound.XMV-850.XMV-Putaway'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.XMV850.XMV850PickupHD'
	bOrientOnSlope=true
	Physics=0
	DrawScale=0.3000000
	PrePivot=(X=0.0000000,Y=0.0000000,Z=35.0000000)
	CollisionHeight=8.0000000
}
