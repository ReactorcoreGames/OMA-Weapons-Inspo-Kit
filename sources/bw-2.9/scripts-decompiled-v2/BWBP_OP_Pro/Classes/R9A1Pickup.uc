class R9A1Pickup extends BallisticWeaponPickup;

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
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_OP_Static.R9A1.R9A1PickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_OP_Static.R9A1.R9A1PickupLo');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.USSR.USSRClips');
	//return;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BWBP_OP_Static.R9A1.R9A1PickupLo'
	PickupDrawScale=0.2400000
	InventoryType=Class'BWBP_OP_Pro.R9A1RangerRifle'
	RespawnTime=20.0000000
	PickupMessage="You picked up the R9A1 ranger rifle."
	PickupSound=Sound'BW_Core_WeaponSound.R78.R78Putaway'
	StaticMesh=StaticMesh'BWBP_OP_Static.R9A1.R9A1PickupHi'
	Physics=0
	DrawScale=0.1800000
	CollisionHeight=3.0000000
}
