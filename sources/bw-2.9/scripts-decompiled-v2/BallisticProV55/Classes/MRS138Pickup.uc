class MRS138Pickup extends BallisticWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Shader'BW_Core_WeaponTex.MRS138.MRS138Shiney');
	L.AddPrecacheMaterial(Shader'BW_Core_WeaponTex.MRS138.MRS138HeatShiney');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.MRS138.MRS138Shell');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Shader'BW_Core_WeaponTex.MRS138.MRS138Shiney');
	Level.AddPrecacheMaterial(Shader'BW_Core_WeaponTex.MRS138.MRS138HeatShiney');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.MRS138.MRS138Shell');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.MRS138.MRS138PickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.MRS138.MRS138PickupLo');
	//return;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BW_Core_WeaponStatic.MRS138.MRS138PickupLo'
	PickupDrawScale=0.1900000
	InventoryType=Class'BallisticProV55.MRS138Shotgun'
	RespawnTime=20.0000000
	PickupMessage="You picked up the MRS-138 tactical shotgun."
	PickupSound=Sound'BW_Core_WeaponSound.M763.M763Putaway'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.MRS138.MRS138PickupHi'
	Physics=0
	DrawScale=0.2000000
	PrePivot=(X=0.0000000,Y=-18.0000000,Z=0.0000000)
	CollisionHeight=3.0000000
}
