class SHADRACHPickup extends BallisticWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BWBP_APC_Tex.SRXSmg.SRX-RadGrenade');
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.M4A1.M4-Ord');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Particles.Explode2');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Particles.Shockwave');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.explosion1');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.explosion2');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.explosion3');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.Explosion4');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_APC_Static.SPXSmg.SHADRACH_Proj');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BWBP_APC_Tex.SRXSmg.SRX-RadGrenade');
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.M4A1.M4-Ord');
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
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.MOAC.MOACPickup');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_APC_Static.SPXSmg.SHADRACH_Proj');
	//return;	
}

defaultproperties
{
	bOnSide=false
	LowPolyStaticMesh=StaticMesh'BWBP_SKC_Static.MOAC.MOACPickup'
	PickupDrawScale=0.1800000
	bWeaponStay=false
	InventoryType=Class'BWBP_APC_Pro.SRKSubMachinegun'
	RespawnTime=20.0000000
	PickupMessage="You picked up the MOA-C chaff grenade."
	PickupSound=Sound'BW_Core_WeaponSound.Ammo.GrenadePickup'
	StaticMesh=StaticMesh'BWBP_SKC_Static.MOAC.MOACPickup'
	bOrientOnSlope=true
	Physics=0
	DrawScale=2.0000000
	CollisionHeight=5.6000000
}
