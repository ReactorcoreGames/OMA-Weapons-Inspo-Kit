class M99Pickup extends BallisticWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BWBP_JCF_Tex.M99.M99_A');
	L.AddPrecacheMaterial(Texture'BWBP_JCF_Tex.M99.M99_B');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_JCF_Static.M99.M99PickupHi');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_JCF_Static.M99.M99PickupLo');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	super(Actor).UpdatePrecacheMaterials();
	Level.AddPrecacheMaterial(Texture'BWBP_JCF_Tex.M99.M99_A');
	Level.AddPrecacheMaterial(Texture'BWBP_JCF_Tex.M99.M99_B');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	super(Actor).UpdatePrecacheStaticMeshes();
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_JCF_Static.M99.M99PickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_JCF_Static.M99.M99PickupLo');
	//return;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BWBP_JCF_Static.M99.M99PickupLo'
	PickupDrawScale=0.5000000
	InventoryType=Class'BWBP_JCF_Pro.M99Rifle'
	RespawnTime=20.0000000
	PickupMessage="You picked up the M99-ECS Anti Material Rifle"
	PickupSound=Sound'BW_Core_WeaponSound.R78.R78Putaway'
	StaticMesh=StaticMesh'BWBP_JCF_Static.M99.M99PickupHi'
	Physics=0
	DrawScale=0.2700000
	CollisionHeight=3.0000000
}
