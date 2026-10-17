class BlackOpsWristBladePickup extends BallisticWeaponPickup;

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.BlkOpsBlade.BlkOpsBlade');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.KnifeCut');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.KnifeCutWood');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.X5W.X5WPickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.X5W.X5WPickupLo');
	//return;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BWBP_SKC_Static.X5W.X5WPickupLo'
	PickupDrawScale=0.5000000
	InventoryType=Class'BWBP_SKC_Pro.BlackOpsWristBlade'
	RespawnTime=10.0000000
	PickupMessage="You picked up the X5W Black Ops Blade"
	PickupSound=Sound'BW_Core_WeaponSound.EKS43.EKS-Putaway'
	StaticMesh=StaticMesh'BWBP_SKC_Static.X5W.X5WPickupHi'
	Physics=0
	DrawScale=0.6000000
	CollisionHeight=4.0000000
}
