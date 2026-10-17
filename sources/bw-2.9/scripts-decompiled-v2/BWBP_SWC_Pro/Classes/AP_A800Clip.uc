class AP_A800Clip extends BallisticAmmoPickup;

auto state Pickup
{
	function BeginState()
	{
		AmmoAmount = default.AmmoAmount + (-20 + Rand(40));
		super.BeginState();
		//return;		
	}
	stop;	
}

defaultproperties
{
	AmmoAmount=200
	InventoryType=Class'BWBP_SWC_Pro.Ammo_A800Cells'
	PickupMessage="You picked up a Skrith energy cell"
	PickupSound=Sound'BW_Core_WeaponSound.Ammo.A73CellPickup'
	StaticMesh=StaticMesh'BWBP_SWC_Static.SkrithHyperBlaster.SkrithHyperBlasterCell'
	DrawScale=0.3000000
	CollisionRadius=8.0000000
	CollisionHeight=4.8000000
}
