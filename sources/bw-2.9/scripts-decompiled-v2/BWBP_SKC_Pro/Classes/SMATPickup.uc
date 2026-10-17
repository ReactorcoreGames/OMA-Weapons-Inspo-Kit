class SMATPickup extends BallisticWeaponPickup;

simulated function UpdatePrecacheMaterials()
{
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	//return;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BWBP_SKC_Static.SMAT.SMATPickupLo'
	PickupDrawScale=0.5000000
	InventoryType=Class'BWBP_SKC_Pro.SMATLauncher'
	RespawnTime=20.0000000
	PickupMessage="You picked up the SM-AT/AA Recoilless Rifle"
	PickupSound=Sound'BW_Core_WeaponSound.G5.G5-Putaway'
	StaticMesh=StaticMesh'BWBP_SKC_Static.SMAT.SMATPickupHi'
	Physics=0
	DrawScale=0.4400000
	CollisionHeight=6.0000000
}
