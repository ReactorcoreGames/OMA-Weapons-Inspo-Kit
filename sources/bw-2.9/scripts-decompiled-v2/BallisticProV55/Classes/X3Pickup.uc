class X3Pickup extends BallisticWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.X3.KnifeA1');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.KnifeCut');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.KnifeCutWood');
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
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.X3.X3PickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.X3.X3PickupLo');
	//return;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BW_Core_WeaponStatic.X3.X3PickupLo'
	PickupDrawScale=0.2500000
	InventoryType=Class'BallisticProV55.X3Knife'
	RespawnTime=10.0000000
	PickupMessage="You picked up the X3 combat knife."
	PickupSound=Sound'BW_Core_WeaponSound.Knife.KnifePutaway'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.X3.X3PickupHi'
	Physics=0
	DrawScale=0.4500000
	CollisionHeight=4.0000000
}
