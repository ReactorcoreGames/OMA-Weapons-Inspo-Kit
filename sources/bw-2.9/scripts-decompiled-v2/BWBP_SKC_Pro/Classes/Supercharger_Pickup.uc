class Supercharger_Pickup extends BallisticWeaponPickup;

var float HeatLevel;
var float HeatTime;

simulated function UpdatePrecacheMaterials()
{
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	//return;	
}

function InitDroppedPickupFor(Inventory Inv)
{
	super.InitDroppedPickupFor(Inv);
	// End:0x48
	if(Supercharger_AssaultWeapon(Inv) != none)
	{
		HeatLevel = Supercharger_AssaultWeapon(Inv).HeatLevel;
		HeatTime = Level.TimeSeconds;
	}
	//return;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BWBP_SKC_Static.SuperCharger.SuperChargerPickupLo'
	InventoryType=Class'BWBP_SKC_Pro.Supercharger_AssaultWeapon'
	RespawnTime=20.0000000
	PickupMessage="You picked up the Van Holt 500KW Supercharger"
	PickupSound=Sound'BW_Core_WeaponSound.M50.M50Putaway'
	StaticMesh=StaticMesh'BWBP_SKC_Static.SuperCharger.SuperChargerPickupHi'
	Physics=0
	DrawScale=0.0500000
	CollisionHeight=4.0000000
}
