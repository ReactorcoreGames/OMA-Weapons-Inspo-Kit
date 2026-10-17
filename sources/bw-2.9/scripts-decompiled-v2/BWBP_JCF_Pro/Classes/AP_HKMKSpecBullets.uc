class AP_HKMKSpecBullets extends BallisticAmmoPickup;

var Pickup M900Ammo;
var() Class<Pickup> M900AmmoClass;

event PostBeginPlay()
{
	local Vector S, V, HitLoc, HitNorm, E;

	local Actor t;
	local Rotator R;

	super(Actor).PostBeginPlay();
	V = VRand() * float(64);
	V.Z = 0.0000000;
	S = Location;
	S.Z += (M900AmmoClass.default.CollisionHeight - CollisionHeight);
	E.X = M900AmmoClass.default.CollisionRadius;
	E.Y = M900AmmoClass.default.CollisionRadius;
	E.Z = M900AmmoClass.default.CollisionHeight;
	t = Trace(HitLoc, HitNorm, S + V, S, false, E);
	// End:0xE2
	if(t == none)
	{
		HitLoc = S + V;
	}
	R.Yaw = Rand(65536);
	M900Ammo = Spawn(M900AmmoClass,,, HitLoc, R);
	//return;	
}

simulated function Destroyed()
{
	// End:0x17
	if(M900Ammo != none)
	{
		M900Ammo.Destroy();
	}
	super(Pickup).Destroyed();
	//return;	
}

defaultproperties
{
	M900AmmoClass=Class'BWBP_JCF_Pro.AP_HKMKSG'
	AmmoAmount=32
	InventoryType=Class'BWBP_JCF_Pro.Ammo_HKMKSpecBullets'
	PickupMessage="You got 32 .45 ACP rounds & 12 Buckshot Rounds for the HKM-26 Pistol"
	PickupSound=Sound'BW_Core_WeaponSound.Ammo.ClipPickup'
	DrawScale=0.3000000
	CollisionRadius=8.0000000
	CollisionHeight=16.0000000
}
