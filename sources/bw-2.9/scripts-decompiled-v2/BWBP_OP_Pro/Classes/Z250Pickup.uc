class Z250Pickup extends BallisticWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	//return;	
}

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
	bOnSide=false
	LowPolyStaticMesh=StaticMesh'BWBP_OP_Static.Z250.Z250PickupLo'
	PickupDrawScale=0.8000000
	InventoryType=Class'BWBP_OP_Pro.Z250Minigun'
	RespawnTime=20.0000000
	PickupMessage="You picked up the Z250 minigun."
	PickupSound=Sound'BW_Core_WeaponSound.XMV-850.XMV-Putaway'
	StaticMesh=StaticMesh'BWBP_OP_Static.Z250.Z250PickupHi'
	bOrientOnSlope=true
	Physics=0
	DrawScale=0.8000000
	PrePivot=(X=0.0000000,Y=0.0000000,Z=15.0000000)
	CollisionHeight=8.0000000
}
