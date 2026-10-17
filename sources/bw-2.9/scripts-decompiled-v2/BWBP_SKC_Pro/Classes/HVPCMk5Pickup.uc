class HVPCMk5Pickup extends BallisticWeaponPickup;

var float HeatLevel;
var float HeatTime;

function InitDroppedPickupFor(Inventory Inv)
{
	super.InitDroppedPickupFor(Inv);
	// End:0x48
	if(HVPCMk5PlasmaCannon(Inv) != none)
	{
		HeatLevel = HVPCMk5PlasmaCannon(Inv).HeatLevel;
		HeatTime = Level.TimeSeconds;
	}
	//return;	
}

defaultproperties
{
	bOnSide=false
	LowPolyStaticMesh=StaticMesh'BWBP_SKC_Static.HVPC.HVPCPickupLo'
	PickupDrawScale=0.1000000
	InventoryType=Class'BWBP_SKC_Pro.HVPCMk5PlasmaCannon'
	RespawnTime=20.0000000
	PickupMessage="You got the High-Voltage Plasma Cannon Mk5"
	PickupSound=Sound'BW_Core_WeaponSound.LightningGun.LG-Putaway'
	StaticMesh=StaticMesh'BWBP_SKC_Static.HVPC.HVPCPickupHi'
	Physics=0
	DrawScale=0.1000000
	PrePivot=(X=0.0000000,Y=0.0000000,Z=-3.0000000)
	CollisionHeight=4.5000000
}
