class R78Pickup extends BallisticWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.R78.RifleSkin');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.R78.ScopeSkin');
	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.Brass.EmptyRifleRound');
	L.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.R78.RifleMuzzleFlash');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.R78.RifleSkin');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.R78.ScopeSkin');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.Brass.EmptyRifleRound');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.R78.RifleMuzzleFlash');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.Ammo.R78Clip');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.R78.R78PickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.R78.R78PickupLo');
	//return;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BW_Core_WeaponStatic.R78.R78PickupLo'
	PickupDrawScale=0.5000000
	InventoryType=Class'BallisticProV55.R78Rifle'
	RespawnTime=20.0000000
	PickupMessage="You picked up the R78A1 sniper rifle."
	PickupSound=Sound'BW_Core_WeaponSound.R78.R78Putaway'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.R78.R78PickupHi'
	Physics=0
	DrawScale=0.3500000
	CollisionHeight=3.0000000
}
