class MRLPickup extends BallisticWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.MRL.MRL_Main');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.MRL.MRL_AmmoBox');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.MRL.MRL_Rocket');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Particles.Explode2');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Particles.Shockwave');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.explosion1');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.explosion2');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.explosion3');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.Explosion4');
	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.MRL.MRLRocket');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.MRL.MRL_Main');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.MRL.MRL_AmmoBox');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.MRL.MRL_Rocket');
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
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.MRL.JL21Pickup-HD');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.MRL.JL21Pickup-LD');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.MRL.MRLRocket');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.MRL.JL21-Ammo');
	//return;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BW_Core_WeaponStatic.MRL.JL21Pickup-LD'
	PickupDrawScale=0.2800000
	InventoryType=Class'BallisticProV55.MRocketLauncher'
	RespawnTime=120.0000000
	PickupMessage="You got the JL21-MRL PeaceMaker."
	PickupSound=Sound'BW_Core_WeaponSound.G5.G5-Putaway'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.MRL.JL21Pickup-HD'
	Physics=0
	DrawScale=0.3000000
	PrePivot=(X=0.0000000,Y=0.0000000,Z=-18.0000000)
	CollisionHeight=6.0000000
}
