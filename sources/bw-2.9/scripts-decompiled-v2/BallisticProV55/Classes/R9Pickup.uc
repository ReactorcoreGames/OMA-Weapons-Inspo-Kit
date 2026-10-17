class R9Pickup extends BallisticWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.R9.USSRSkin');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.R9.USSRSkin');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.USSR.USSRPickup-Hi');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.USSR.USSRPickup-Lo');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.USSR.USSRClips');
	//return;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BW_Core_WeaponStatic.USSR.USSRPickup-Lo'
	PickupDrawScale=0.2400000
	InventoryType=Class'BallisticProV55.R9RangerRifle'
	RespawnTime=20.0000000
	PickupMessage="You picked up the R9 ranger rifle."
	PickupSound=Sound'BW_Core_WeaponSound.R78.R78Putaway'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.USSR.USSRPickup-Hi'
	Physics=0
	DrawScale=0.3500000
	CollisionHeight=3.0000000
}
