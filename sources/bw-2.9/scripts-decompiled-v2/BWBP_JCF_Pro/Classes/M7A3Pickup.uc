class M7A3Pickup extends BallisticWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BWBP_JCF_Tex.M7A3.M7A3_D');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_JCF_Static.M7A3.M7A3PickupHi');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_JCF_Static.M7A3.M7A3PickupLo');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	super(Actor).UpdatePrecacheMaterials();
	Level.AddPrecacheMaterial(Texture'BWBP_JCF_Tex.M7A3.M7A3_D');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	super(Actor).UpdatePrecacheStaticMeshes();
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_JCF_Static.M7A3.M7A3PickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_JCF_Static.M7A3.M7A3PickupLo');
	//return;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BWBP_JCF_Static.M7A3.M7A3PickupLo'
	PickupDrawScale=0.2600000
	InventoryType=Class'BWBP_JCF_Pro.M7A3AssaultRifle'
	RespawnTime=20.0000000
	PickupMessage="You picked up the M7A3 Assault Rifle"
	PickupSound=Sound'BW_Core_WeaponSound.XK2.XK2-Putaway'
	StaticMesh=StaticMesh'BWBP_JCF_Static.M7A3.M7A3PickupHi'
	Physics=0
	DrawScale=0.3000000
	CollisionHeight=4.0000000
}
