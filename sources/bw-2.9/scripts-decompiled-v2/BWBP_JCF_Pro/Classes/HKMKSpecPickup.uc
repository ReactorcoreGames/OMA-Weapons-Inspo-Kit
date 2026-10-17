class HKMKSpecPickup extends BallisticHandgunPickup;

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
	PickupDrawScale=0.4000000
	InventoryType=Class'BWBP_JCF_Pro.HKMKSpecPistol'
	RespawnTime=20.0000000
	PickupMessage="You picked up the HKM-26 pistol."
	PickupSound=Sound'BW_Core_WeaponSound.XK2.XK2-Putaway'
	Physics=0
	DrawScale=0.4000000
	CollisionHeight=4.0000000
}
