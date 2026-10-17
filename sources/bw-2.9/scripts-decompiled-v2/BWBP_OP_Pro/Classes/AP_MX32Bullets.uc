class AP_MX32Bullets extends BallisticAmmoPickup;

var Pickup SecondaryAmmo;
var() Class<Pickup> SecondaryAmmoClass;

event PostBeginPlay()
{
	local Vector S, V, HitLoc, HitNorm, E;

	local Actor t;
	local Rotator R;

	super(Actor).PostBeginPlay();
	V = VRand() * float(64);
	V.Z = 0.0000000;
	S = Location;
	S.Z += (SecondaryAmmoClass.default.CollisionHeight - CollisionHeight);
	E.X = SecondaryAmmoClass.default.CollisionRadius;
	E.Y = SecondaryAmmoClass.default.CollisionRadius;
	E.Z = SecondaryAmmoClass.default.CollisionHeight;
	t = Trace(HitLoc, HitNorm, S + V, S, false, E);
	// End:0xE2
	if(t == none)
	{
		HitLoc = S + V;
	}
	R.Yaw = Rand(65536);
	SecondaryAmmo = Spawn(SecondaryAmmoClass,,, HitLoc, R);
	//return;	
}

simulated function Destroyed()
{
	// End:0x17
	if(SecondaryAmmo != none)
	{
		SecondaryAmmo.Destroy();
	}
	super(Pickup).Destroyed();
	//return;	
}

defaultproperties
{
	SecondaryAmmoClass=Class'BWBP_OP_Pro.AP_MX32Rockets'
	AmmoAmount=100
	InventoryType=Class'BallisticProV55.Ammo_556mm'
	PickupMessage="You got two MX-32 magazines."
	PickupSound=Sound'BW_Core_WeaponSound.Ammo.ClipPickup'
	StaticMesh=StaticMesh'BWBP_OP_Static.MX32.MX32-AmmoStatic'
	DrawScale=0.1000000
	CollisionRadius=8.0000000
	CollisionHeight=5.2000000
}
