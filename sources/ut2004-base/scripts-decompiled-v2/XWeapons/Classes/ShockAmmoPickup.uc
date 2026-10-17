class ShockAmmoPickup extends UTAmmoPickup;

defaultproperties
{
	AmmoAmount=10
	InventoryType=Class'XWeapons.ShockAmmo'
	PickupMessage="You picked up a Shock Core."
	PickupSound=Sound'PickupSounds.ShockAmmoPickup'
	PickupForce="ShockAmmoPickup"
	DrawType=8
	StaticMesh=StaticMesh'WeaponStaticMesh.ShockAmmoPickup'
	DrawScale3D=(X=0.8000000,Y=1.0000000,Z=0.5000000)
	PrePivot=(X=0.0000000,Y=0.0000000,Z=32.0000000)
	CollisionHeight=32.0000000
}
