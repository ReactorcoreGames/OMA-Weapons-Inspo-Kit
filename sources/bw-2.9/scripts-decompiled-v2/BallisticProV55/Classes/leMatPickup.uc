class leMatPickup extends BallisticHandgunPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.leMat.leMat_Main');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.leMat.leMat_Shield');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.leMat.leMat_Speed');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.leMat.leMat_Main');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.leMat.leMat_Shield');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.leMat.leMat_Speed');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.leMat.leMatAmmo');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.leMat.leMatPickupLo');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.leMat.leMatPickupHi');
	//return;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BW_Core_WeaponStatic.leMat.leMatPickupLo'
	PickupDrawScale=0.2700000
	InventoryType=Class'BallisticProV55.leMatRevolver'
	RespawnTime=10.0000000
	PickupMessage="You picked up the Wilson 41 revolver."
	PickupSound=Sound'BW_Core_WeaponSound.M806.M806Putaway'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.leMat.leMatPickupHi'
	Physics=0
	DrawScale=0.3300000
	CollisionHeight=4.0000000
}
