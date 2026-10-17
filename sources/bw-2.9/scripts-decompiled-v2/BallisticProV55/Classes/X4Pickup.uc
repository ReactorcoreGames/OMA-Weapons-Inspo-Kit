class X4Pickup extends BallisticWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.X3.KnifeA1');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.KnifeCut');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.KnifeCutWood');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.X4.X4_PickupLo');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.X4.X4_PickupHi');
	//return;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BW_Core_WeaponStatic.X4.X4_PickupLo'
	PickupDrawScale=0.3000000
	InventoryType=Class'BallisticProV55.X4Knife'
	RespawnTime=10.0000000
	PickupMessage="You picked up the X4 knife."
	PickupSound=Sound'BW_Core_WeaponSound.Knife.KnifePutaway'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.X4.X4_PickupHi'
	Physics=0
	DrawScale=0.2000000
	CollisionHeight=4.0000000
}
