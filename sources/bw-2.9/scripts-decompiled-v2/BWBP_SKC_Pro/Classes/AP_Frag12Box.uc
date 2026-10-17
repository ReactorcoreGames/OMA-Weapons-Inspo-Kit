class AP_Frag12Box extends BallisticAmmoPickup;

simulated event PreBeginPlay()
{
	//return;	
}

defaultproperties
{
	AmmoAmount=3
	InventoryType=Class'BWBP_SKC_Pro.Ammo_20mmGrenade'
	PickupMessage="You picked up 3 FRAG-12 explosives."
	PickupSound=Sound'BW_Core_WeaponSound.Ammo.GrenadePickup'
	StaticMesh=StaticMesh'BWBP_SKC_Static.Bulldog.Frag12Ammo'
	DrawScale=0.8000000
	CollisionRadius=8.0000000
	CollisionHeight=10.0000000
}
