class BioAmmoPickup extends UTAmmoPickup;

simulated function PostBeginPlay()
{
	local Actor HitActor;
	local Vector HitLocation, HitNormal;

	super(Actor).PostBeginPlay();
	HitActor = Trace(HitLocation, HitNormal, Location - (CollisionHeight * vect(0.0000000, 0.0000000, 1.0000000)), Location + (CollisionHeight * vect(0.0000000, 0.0000000, 1.0000000)), false);
	// End:0x8D
	if((HitActor != none) && HitActor.bWorldGeometry)
	{
		SetLocation(HitLocation + (vect(0.0000000, 0.0000000, 1.0000000) * CollisionHeight));
	}
	//return;	
}

defaultproperties
{
	AmmoAmount=20
	MaxDesireability=0.3200000
	InventoryType=Class'XWeapons.BioAmmo'
	PickupMessage="You picked up some Bio-Rifle ammo"
	PickupSound=Sound'PickupSounds.FlakAmmoPickup'
	PickupForce="FlakAmmoPickup"
	DrawType=8
	StaticMesh=StaticMesh'WeaponStaticMesh.BioAmmoPickup'
	PrePivot=(X=0.0000000,Y=0.0000000,Z=10.5000000)
	CollisionHeight=8.2500000
}
