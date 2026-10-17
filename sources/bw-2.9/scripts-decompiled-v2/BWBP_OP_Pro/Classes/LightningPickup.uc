class LightningPickup extends BallisticWeaponPickup;

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
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_OP_Static.LightningGun.LightningGunPickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_OP_Static.LightningGun.LightningGunPickupLo');
	//return;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BWBP_OP_Static.LightningGun.LightningGunPickupLo'
	PickupDrawScale=0.1500000
	InventoryType=Class'BWBP_OP_Pro.LightningRifle'
	RespawnTime=20.0000000
	PickupMessage="You picked up the ARC-79 lightning rifle."
	PickupSound=Sound'BW_Core_WeaponSound.R78.R78Putaway'
	StaticMesh=StaticMesh'BWBP_OP_Static.LightningGun.LightningGunPickupHi'
	Physics=0
	DrawScale=0.1100000
	CollisionHeight=3.0000000
}
