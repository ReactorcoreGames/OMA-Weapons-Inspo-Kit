class HB4Pickup extends BallisticWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BWBP_APC_Tex.HoloBlaster.HoloBlaster_Main_Tex');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_APC_Static.HoloBlaster.HoloBlasterPickupHi');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_APC_Static.HoloBlaster.HoloBlasterPickupLo');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BWBP_APC_Tex.HoloBlaster.HoloBlaster_Main_Tex');
	super(Actor).UpdatePrecacheMaterials();
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_APC_Static.HoloBlaster.HoloBlasterPickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_APC_Static.HoloBlaster.HoloBlasterPickupLo');
	super(Actor).UpdatePrecacheStaticMeshes();
	//return;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BWBP_APC_Static.HoloBlaster.HoloBlasterPickupLo'
	InventoryType=Class'BWBP_APC_Pro.HB4GrenadeBlaster'
	RespawnTime=120.0000000
	PickupMessage="You picked up the HB4 Electro Grenade Blaster."
	PickupSound=Sound'BW_Core_WeaponSound.M763.M763Putaway'
	StaticMesh=StaticMesh'BWBP_APC_Static.HoloBlaster.HoloBlasterPickupHi'
	Physics=0
	DrawScale=0.6000000
	CollisionHeight=3.0000000
}
