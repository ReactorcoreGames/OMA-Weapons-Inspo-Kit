class ICISPickup extends BallisticWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.Stim.Stim-Main');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.KnifeCut');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.KnifeCutWood');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.Stim.Stim-Main');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.KnifeCut');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.KnifeCutWood');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.Stim.StimpackPickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.Stim.StimpackPickupLo');
	//return;	
}

defaultproperties
{
	bOnSide=false
	LowPolyStaticMesh=StaticMesh'BWBP_SKC_Static.Stim.StimpackPickupLo'
	PickupDrawScale=0.2700000
	InventoryType=Class'BWBP_SKC_Pro.ICISStimpack'
	RespawnTime=10.0000000
	PickupMessage="You picked up the FMD ICIS-25 Stimulant Autoinjector"
	PickupSound=Sound'BW_Core_WeaponSound.Knife.KnifePutaway'
	StaticMesh=StaticMesh'BWBP_SKC_Static.Stim.StimpackPickupHi'
	Physics=0
	DrawScale=0.3000000
	CollisionHeight=4.0000000
}
