class PS9mPickup extends BallisticHandgunPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.Stealth.Stealth-Main');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.Stealth.Stealth-Main');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.PS9M.PS9MPickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.PS9M.PS9MPickupLo');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.PS9M.PS9MAmmo');
	//return;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BWBP_SKC_Static.PS9M.PS9MPickupLo'
	PickupDrawScale=0.1900000
	InventoryType=Class'BWBP_SKC_Pro.PS9mPistol'
	RespawnTime=20.0000000
	PickupMessage="You picked up the PS-9m stealth pistol."
	PickupSound=Sound'BWBP_SKC_Sounds.Stealth.Stealth-Pickup'
	StaticMesh=StaticMesh'BWBP_SKC_Static.PS9M.PS9MPickupHi'
	Physics=0
	DrawScale=0.2200000
	CollisionHeight=4.0000000
}
