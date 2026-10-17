class SARPickup extends BallisticWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.SAR.SARSkin');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.SAR.SARSkin');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.SAR.SARClips');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.SAR.SARPickup-Hi');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.SAR.SARPickup-Lo');
	//return;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BW_Core_WeaponStatic.SAR.SARPickup-Lo'
	PickupDrawScale=0.1400000
	InventoryType=Class'BallisticProV55.SARAssaultRifle'
	RespawnTime=20.0000000
	PickupMessage="You picked up the Sub-Assault Rifle 12."
	PickupSound=Sound'BW_Core_WeaponSound.XK2.XK2-Putaway'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.SAR.SARPickup-Hi'
	Physics=0
	DrawScale=0.2200000
	CollisionHeight=4.0000000
}
