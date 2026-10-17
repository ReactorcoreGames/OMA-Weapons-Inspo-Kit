class HMCPickup extends BallisticWeaponPickup;

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.HMC.HMC117Pickup_LD');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.HMC.HMC117Pickup');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.BackPack.HVPCBackPackLarge');
	//return;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BWBP_SKC_Static.HMC.HMC117Pickup_LD'
	PickupDrawScale=0.1000000
	InventoryType=Class'BWBP_SKC_Pro.HMCBeamCannon'
	PickupMessage="You picked up the HMC-117 photon cannon."
	PickupSound=Sound'BW_Core_WeaponSound.RX22A.RX22A-Putaway'
	StaticMesh=StaticMesh'BWBP_SKC_Static.HMC.HMC117Pickup'
	Physics=0
	DrawScale=0.0800000
	CollisionHeight=5.0000000
}
