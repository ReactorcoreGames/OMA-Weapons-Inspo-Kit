class AK91Pickup extends BallisticWeaponPickup;

var float HeatLevel;
var float HeatTime;

function InitDroppedPickupFor(Inventory Inv)
{
	super.InitDroppedPickupFor(none);
	// End:0x44
	if(AK91ChargeRifle(Inv) != none)
	{
		HeatLevel = AK91ChargeRifle(Inv).HeatLevel;
		HeatTime = Level.TimeSeconds;
	}
	//return;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BWBP_SKC_Static.AK91.AK91PickupLo'
	PickupDrawScale=0.2500000
	InventoryType=Class'BWBP_SKC_Pro.AK91ChargeRifle'
	RespawnTime=20.0000000
	PickupMessage="You picked up the AK-91 Charge Rifle"
	PickupSound=Sound'BW_Core_WeaponSound.M50.M50Putaway'
	StaticMesh=StaticMesh'BWBP_SKC_Static.AK91.AK91PickupHi'
	Physics=0
	DrawScale=0.2500000
	CollisionHeight=4.0000000
}
