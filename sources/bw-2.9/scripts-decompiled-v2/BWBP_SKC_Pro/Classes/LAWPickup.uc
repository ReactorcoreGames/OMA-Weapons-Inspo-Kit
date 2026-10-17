class LAWPickup extends BallisticWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.LAW.LAW-Main');
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.LAW.LAW-Rocket');
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.LAW.LAW-ScopeView');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Particles.Explode2');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Particles.Shockwave');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.explosion1');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.explosion2');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.explosion3');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.Explosion4');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.LAW.LAWRocket');
	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.G5.BazookaMuzzleFlash');
	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.G5.BazookaBackFlash');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.LAW.LAW-Main');
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.LAW.LAW-Rocket');
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.LAW.LAW-ScopeView');
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
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.LAW.LAWRocket');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.G5.BazookaMuzzleFlash');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.G5.BazookaBackFlash');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.LAW.LAWAmmo');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.LAW.LAWPickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.LAW.LAWPickupLo');
	//return;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BWBP_SKC_Static.LAW.LAWPickupLo'
	PickupDrawScale=0.7000000
	InventoryType=Class'BWBP_SKC_Pro.LAWLauncher'
	RespawnTime=120.0000000
	PickupMessage="You picked up the FGM-70 'Shockwave' LAW."
	PickupSound=Sound'BW_Core_WeaponSound.G5.G5-Putaway'
	StaticMesh=StaticMesh'BWBP_SKC_Static.LAW.LAWPickupHi'
	Physics=0
	DrawScale=0.4500000
	CollisionHeight=6.0000000
}
