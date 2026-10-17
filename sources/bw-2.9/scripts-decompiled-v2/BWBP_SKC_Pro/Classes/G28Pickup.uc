class G28Pickup extends BallisticWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.G28.G28-Main');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.G28.G28Proj');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BWBP_SKC_Tex.G28.G28-Main');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.G28.G28Proj');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.G28.G28PickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_SKC_Static.G28.G28PickupLo');
	//return;	
}

defaultproperties
{
	bOnSide=false
	LowPolyStaticMesh=StaticMesh'BWBP_SKC_Static.G28.G28PickupLo'
	PickupDrawScale=0.3500000
	bWeaponStay=false
	InventoryType=Class'BWBP_SKC_Pro.G28Grenade'
	RespawnTime=20.0000000
	PickupMessage="You picked up G28 medicinal aerosol."
	PickupSound=Sound'BW_Core_WeaponSound.Ammo.GrenadePickup'
	StaticMesh=StaticMesh'BWBP_SKC_Static.G28.G28PickupHi'
	bOrientOnSlope=true
	Physics=0
	DrawScale=0.4000000
	CollisionHeight=5.6000000
}
