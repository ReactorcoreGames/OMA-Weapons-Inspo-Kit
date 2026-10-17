class AP_AK490Mag extends BallisticAmmoPickup;

var Pickup AltAmmo;
var() Class<Pickup> AltAmmoClass;

event PostBeginPlay()
{
	local Vector S, V, HitLoc, HitNorm, E;

	local Actor t;
	local Rotator R;

	super(Actor).PostBeginPlay();
	V = VRand() * float(64);
	V.Z = 0.0000000;
	S = Location;
	S.Z += (AltAmmoClass.default.CollisionHeight - CollisionHeight);
	E.X = AltAmmoClass.default.CollisionRadius;
	E.Y = AltAmmoClass.default.CollisionRadius;
	E.Z = AltAmmoClass.default.CollisionHeight;
	t = Trace(HitLoc, HitNorm, S + V, S, false, E);
	// End:0xE2
	if(t == none)
	{
		HitLoc = S + V;
	}
	R.Yaw = Rand(65536);
	AltAmmo = Spawn(AltAmmoClass,,, HitLoc, R);
	//return;	
}

simulated function Destroyed()
{
	// End:0x17
	if(AltAmmo != none)
	{
		AltAmmo.Destroy();
	}
	super(Pickup).Destroyed();
	//return;	
}

defaultproperties
{
	AltAmmoClass=Class'BWBP_SKC_Pro.X8Pickup'
	AmmoAmount=40
	InventoryType=Class'BWBP_SKC_Pro.Ammo_AK762mm'
	PickupMessage="You picked up two AK-490 magazines."
	PickupSound=Sound'BW_Core_WeaponSound.Ammo.ClipPickup'
	StaticMesh=StaticMesh'BWBP_SKC_Static.AK490.AK490AmmoPickup'
	DrawScale=0.6000000
	PrePivot=(X=0.0000000,Y=0.0000000,Z=5.0000000)
	CollisionRadius=8.0000000
	CollisionHeight=5.2000000
}
