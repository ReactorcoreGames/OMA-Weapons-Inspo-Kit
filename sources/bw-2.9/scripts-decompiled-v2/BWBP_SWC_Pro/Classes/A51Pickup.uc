class A51Pickup extends BallisticWeaponPickup;

simulated function UpdatePrecacheStaticMeshes()
{
	//return;	
}

defaultproperties
{
	bOnSide=false
	PickupDrawScale=0.5000000
	bWeaponStay=false
	InventoryType=Class'BWBP_SWC_Pro.A51Grenade'
	RespawnTime=20.0000000
	PickupMessage="You picked up the AD-51 Reptile Corossive Grenade"
	PickupSound=Sound'BW_Core_WeaponSound.Ammo.GrenadePickup'
	bOrientOnSlope=true
	Physics=0
	CollisionHeight=5.6000000
}
