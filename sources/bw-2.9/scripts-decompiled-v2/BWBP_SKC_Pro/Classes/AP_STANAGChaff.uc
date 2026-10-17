class AP_STANAGChaff extends BallisticAmmoPickup;

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
	AltAmmoClass=Class'BWBP_SKC_Pro.ChaffPickup'
	AmmoAmount=60
	InventoryType=Class'BallisticProV55.Ammo_556mm'
	PickupMessage="You got two 30 round 5.56mm magazines"
	PickupSound=Sound'BW_Core_WeaponSound.Ammo.ClipPickup'
	StaticMesh=StaticMesh'BWBP_SKC_Static.MJ51.CarbineSM_Ammo'
	DrawScale=0.5500000
	PrePivot=(X=0.0000000,Y=0.0000000,Z=5.0000000)
	CollisionRadius=8.0000000
	CollisionHeight=5.2000000
}
