class T10Pickup extends BallisticWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.T10.T10GrenadeSkin');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.T10.T10GrenadeSkin');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.T10.T10Clip');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.T10.T10Projectile');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.T10.T10Pickup');
	//return;	
}

defaultproperties
{
	bOnSide=false
	LowPolyStaticMesh=StaticMesh'BW_Core_WeaponStatic.T10.T10Pickup_LD'
	PickupDrawScale=0.3500000
	bWeaponStay=false
	InventoryType=Class'BallisticProV55.T10Grenade'
	RespawnTime=20.0000000
	PickupMessage="You picked up the T10 toxic grenade."
	PickupSound=Sound'BW_Core_WeaponSound.Ammo.GrenadePickup'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.T10.T10Pickup'
	bOrientOnSlope=true
	Physics=0
	DrawScale=0.7000000
	CollisionHeight=5.6000000
}
