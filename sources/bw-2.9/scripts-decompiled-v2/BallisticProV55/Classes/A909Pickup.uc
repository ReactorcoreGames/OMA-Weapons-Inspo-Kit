class A909Pickup extends BallisticWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.A909.WristBladeSkin');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.A73BladeCut');
	L.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.A73BladeCutWood');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.A909.WristBladeSkin');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.A73BladeCut');
	Level.AddPrecacheMaterial(Texture'BW_Core_WeaponTex.Decals.A73BladeCutWood');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.A909.A909Hi');
	Level.AddPrecacheStaticMesh(StaticMesh'BW_Core_WeaponStatic.A909.A909Lo');
	//return;	
}

defaultproperties
{
	bOnSide=false
	LowPolyStaticMesh=StaticMesh'BW_Core_WeaponStatic.A909.A909Lo'
	PickupDrawScale=0.3000000
	InventoryType=Class'BallisticProV55.A909SkrithBlades'
	RespawnTime=10.0000000
	PickupMessage="You picked up the A909 Skrith wrist blades."
	PickupSound=Sound'BW_Core_WeaponSound.A909.A909Putaway'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.A909.A909Hi'
	bOrientOnSlope=true
	Physics=0
	DrawScale=0.3500000
	CollisionHeight=4.0000000
}
