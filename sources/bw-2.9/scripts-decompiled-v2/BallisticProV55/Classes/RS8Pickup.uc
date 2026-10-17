class RS8Pickup extends BallisticHandgunPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Shader'BW_Core_WeaponTex.RS8.RS8-Shiney');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Shader'BW_Core_WeaponTex.RS8.RS8-Shiney');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.RS8.RS8PickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.RS8.RS8PickupLo');
	//return;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BW_Core_WeaponStatic.RS8.RS8PickupLo'
	PickupDrawScale=0.2100000
	InventoryType=Class'BallisticProV55.RS8Pistol'
	RespawnTime=20.0000000
	PickupMessage="You picked up the RS8 pistol."
	PickupSound=Sound'BW_Core_WeaponSound.XK2.XK2-Putaway'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.RS8.RS8PickupHi'
	Physics=0
	DrawScale=0.5500000
	PrePivot=(X=0.0000000,Y=-18.0000000,Z=0.0000000)
	CollisionHeight=4.0000000
}
