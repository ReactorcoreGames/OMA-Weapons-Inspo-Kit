class ClassicSniperAmmoPickup extends UTAmmoPickup;

defaultproperties
{
	AmmoAmount=10
	InventoryType=Class'UTClassic.ClassicSniperAmmo'
	PickupMessage="You picked up sniper ammo."
	PickupSound=Sound'PickupSounds.SniperAmmoPickup'
	PickupForce="SniperAmmoPickup"
	DrawType=8
	StaticMesh=StaticMesh'NewWeaponStatic.ClassicSniperAmmoM'
	PrePivot=(X=0.0000000,Y=0.0000000,Z=16.0000000)
	CollisionHeight=16.0000000
}
