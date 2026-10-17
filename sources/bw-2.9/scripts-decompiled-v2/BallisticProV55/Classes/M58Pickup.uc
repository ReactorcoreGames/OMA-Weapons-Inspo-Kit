class M58Pickup extends BallisticWeaponPickup;

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.M58.M58GrenadeSkin');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.T10.T10Clip');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.M58.M58Projectile');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.T10.T10Pickup');
	//return;	
}

defaultproperties
{
	bOnSide=false
	LowPolyStaticMesh=StaticMesh'BW_Core_WeaponStatic.T10.T10Pickup'
	PickupDrawScale=0.3500000
	bWeaponStay=false
	InventoryType=Class'BallisticProV55.M58Grenade'
	RespawnTime=20.0000000
	PickupMessage="You picked up the M58 smoke grenade."
	PickupSound=Sound'BW_Core_WeaponSound.Ammo.GrenadePickup'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.T10.T10Pickup'
	bOrientOnSlope=true
	Physics=0
	DrawScale=0.7000000
	Skins[0]=Texture'BW_Core_WeaponTex.M58.M58GrenadeSkin'
	CollisionHeight=5.6000000
}
