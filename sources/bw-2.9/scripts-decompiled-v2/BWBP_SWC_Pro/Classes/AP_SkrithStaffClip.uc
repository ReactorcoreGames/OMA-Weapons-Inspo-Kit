class AP_SkrithStaffClip extends BallisticAmmoPickup;

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
	AmmoAmount=120
	InventoryType=Class'BWBP_SWC_Pro.Ammo_SSCells'
	PickupMessage="You picked up an energy cell"
	PickupSound=Sound'BW_Core_WeaponSound.Ammo.A73CellPickup'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.Ammo.A73Clip'
	DrawScale=0.3000000
	Skins[0]=Texture'BW_Core_WeaponTex.A73RedLayout.A73BAmmoSkin'
	Skins[1]=Texture'BW_Core_WeaponTex.A73RedLayout.A73BAmmoSkin'
	CollisionRadius=8.0000000
	CollisionHeight=4.8000000
}
