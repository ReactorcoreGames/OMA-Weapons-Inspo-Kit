class LinkAmmoPickup extends UTAmmoPickup;

function PostBeginPlay()
{
	super(Actor).PostBeginPlay();
	// End:0x2D
	if(Level.Game.bAllowVehicles)
	{
		MaxDesireability *= 1.9000000;
	}
	//return;	
}

defaultproperties
{
	AmmoAmount=50
	MaxDesireability=0.2400000
	InventoryType=Class'XWeapons.LinkAmmo'
	PickupMessage="You picked up link charges."
	PickupSound=Sound'PickupSounds.LinkAmmoPickup'
	PickupForce="LinkAmmoPickup"
	DrawType=8
	StaticMesh=StaticMesh'WeaponStaticMesh.LinkAmmoPickup'
	CollisionHeight=10.5000000
}
