class XM84Pickup extends BallisticWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.XM84.XM84-MainDark');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.XM84.XM84Projectile');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.XM84.XM84PickupHi');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.XM84.XM84PickupLo');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.XM84.XM84-MainDark');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Particles.Explode2');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Particles.Shockwave');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.explosion1');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.explosion2');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.explosion3');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.Explosion4');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.XM84.XM84Clip');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.XM84.XM84Projectile');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.XM84.XM84PickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.XM84.XM84PickupLo');
	//return;	
}

defaultproperties
{
	bOnSide=false
	LowPolyStaticMesh=StaticMesh'BWBP_SKC_Static.XM84.XM84PickupLo'
	PickupDrawScale=1.0000000
	bWeaponStay=false
	InventoryType=Class'BWBP_SKC_Pro.XM84Flashbang'
	RespawnTime=20.0000000
	PickupMessage="You picked up the XM84 heavy tech grenade."
	PickupSound=Sound'BW_Core_WeaponSound.Ammo.GrenadePickup'
	StaticMesh=StaticMesh'BWBP_SKC_Static.XM84.XM84PickupHi'
	bOrientOnSlope=true
	Physics=0
	DrawScale=1.6000000
	CollisionHeight=5.6000000
}
