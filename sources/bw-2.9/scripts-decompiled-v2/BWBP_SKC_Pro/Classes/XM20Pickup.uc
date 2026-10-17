class XM20Pickup extends BallisticWeaponPickup;

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.XM20.XM20-Main');
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.XM20.XM20-Misc');
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.XM20.XM20-ScreenBase');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.XM20.XM20PickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.XM20.XM20PickupLo');
	//return;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BWBP_SKC_Static.XM20.XM20PickupLo'
	PickupDrawScale=1.0000000
	InventoryType=Class'BWBP_SKC_Pro.XM20Carbine'
	RespawnTime=20.0000000
	PickupMessage="You picked up the XM-20 Laser Carbine."
	PickupSound=Sound'BWBP_SKC_Sounds.LS14.Gauss-Pickup'
	StaticMesh=StaticMesh'BWBP_SKC_Static.XM20.XM20PickupHi'
	Physics=0
	DrawScale=1.1000000
	CollisionHeight=3.0000000
}
