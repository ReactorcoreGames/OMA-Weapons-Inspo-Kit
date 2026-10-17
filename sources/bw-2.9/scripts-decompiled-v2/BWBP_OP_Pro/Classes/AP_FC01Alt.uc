class AP_FC01Alt extends BallisticAmmoPickup;

simulated event PreBeginPlay()
{
	//return;	
}

defaultproperties
{
	AmmoAmount=40
	InventoryType=Class'BWBP_OP_Pro.Ammo_FC01Alt'
	PickupMessage="You picked up an FC01 Power Pack."
	PickupSound=Sound'BW_Core_WeaponSound.Ammo.ShotBoxPickup'
	StaticMesh=StaticMesh'BWBP_OP_Static.ProtoLMG.ProtoLMG_SM_Ammo'
	DrawScale=0.1000000
	CollisionRadius=8.0000000
	CollisionHeight=5.2000000
}
