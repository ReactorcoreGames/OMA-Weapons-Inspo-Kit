class PumaPickup extends BallisticWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.PUMA.PUMA2-Main');
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.PUMA.PUMA2-Back');
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.PUMA.PUMA-MainSpec');
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.PUMA.PUMA-BackSpec');
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.PUMA.PUMA-ScreenBasic');
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.PUMA.Puma-Shield');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.PUMA.PumaShield');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.PUMA.ShieldShard');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.Bulldog.Frag12Proj');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.PUMA.PUMA2-Main');
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.PUMA.PUMA2-Back');
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.PUMA.PUMA-MainSpec');
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.PUMA.PUMA-BackSpec');
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.PUMA.PUMA-ScreenBasic');
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.PUMA.Puma-Shield');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.PUMA.PUMAPickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.PUMA.PUMAPickupLo');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.PUMA.PUMA_SM_Ammo');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.PUMA.PumaShield');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.PUMA.ShieldShard');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.Bulldog.Frag12Proj');
	//return;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BWBP_SKC_Static.PUMA.PUMAPickupLo'
	PickupDrawScale=0.1100000
	InventoryType=Class'BWBP_SKC_Pro.PumaRepeater'
	RespawnTime=20.0000000
	PickupMessage="You picked up the PUMA-77 Repeater"
	PickupSound=Sound'BWBP_SKC_Sounds.PUMA.PUMA-Pickup'
	StaticMesh=StaticMesh'BWBP_SKC_Static.PUMA.PUMAPickupHi'
	Physics=0
	DrawScale=0.1500000
	CollisionHeight=4.0000000
}
