class AP_A49Clip extends BallisticAmmoPickup;

auto state Pickup
{
	function BeginState()
	{
		AmmoAmount = default.AmmoAmount + (-10 + Rand(25));
		super.BeginState();
		//return;		
	}
	stop;	
}

defaultproperties
{
	AmmoAmount=80
	InventoryType=Class'BallisticProV55.Ammo_Cells'
	PickupMessage="You picked up an energy cell"
	PickupSound=Sound'BW_Core_WeaponSound.Ammo.A73CellPickup'
	StaticMesh=StaticMesh'BWBP_SKC_Static.A49.A49Ammo'
	DrawScale=0.3000000
	CollisionRadius=8.0000000
	CollisionHeight=4.8000000
}
