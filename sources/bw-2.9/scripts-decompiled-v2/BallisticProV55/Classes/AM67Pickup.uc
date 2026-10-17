class AM67Pickup extends BallisticHandgunPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.AM67.AM67Main');
	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.M806.PistolMuzzleFlash');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.AM67.AM67Main');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.M806.PistolMuzzleFlash');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.AM67.AM67Clips');
	//return;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BW_Core_WeaponStatic.AM67.PickupLD'
	PickupDrawScale=0.1900000
	InventoryType=Class'BallisticProV55.AM67Pistol'
	RespawnTime=10.0000000
	PickupMessage="You picked up the AM67 assault pistol."
	PickupSound=Sound'BW_Core_WeaponSound.M806.M806Putaway'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.AM67.PickupLD'
	Physics=0
	DrawScale=0.4000000
	PrePivot=(X=0.0000000,Y=-26.0000000,Z=0.0000000)
	CollisionHeight=4.0000000
}
