class Fifty9Pickup extends BallisticHandgunPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Fifty9.Fifty9Skin');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Fifty9.Fifty9Skin');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.Ammo.XK2Clip');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.Fifty9.Fifty9PickupLD');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.Fifty9.Fifty9PickupHD');
	//return;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BW_Core_WeaponStatic.Fifty9.Fifty9PickupLD'
	PickupDrawScale=0.3500000
	InventoryType=Class'BallisticProV55.Fifty9MachinePistol'
	RespawnTime=20.0000000
	PickupMessage="You picked up the Fifty-9 machine pistol."
	PickupSound=Sound'BW_Core_WeaponSound.XK2.XK2-Putaway'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.Fifty9.Fifty9PickupHD'
	Physics=0
	DrawScale=0.3800000
	PrePivot=(X=0.0000000,Y=-16.0000000,Z=0.0000000)
	CollisionHeight=4.0000000
}
