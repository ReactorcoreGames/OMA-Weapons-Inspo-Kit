class SPASPickup extends BallisticWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BWBP_JCF_Tex.SPAS.SPASShort_Main_D');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_JCF_Static.SPAS.SPASPickupHi');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_JCF_Static.SPAS.SPASPickupLo');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	super(Actor).UpdatePrecacheMaterials();
	Level.AddPrecacheMaterial(Texture'BWBP_JCF_Tex.SPAS.SPASShort_Main_D');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	super(Actor).UpdatePrecacheStaticMeshes();
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_JCF_Static.SPAS.SPASPickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_JCF_Static.SPAS.SPASPickupLo');
	//return;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BWBP_JCF_Static.SPAS.SPASPickupLo'
	PickupDrawScale=0.1000000
	InventoryType=Class'BWBP_JCF_Pro.SPASShotgun'
	RespawnTime=20.0000000
	PickupMessage="You picked up the SP-12 Compact Shotgun"
	PickupSound=Sound'BW_Core_WeaponSound.M763.M763Putaway'
	StaticMesh=StaticMesh'BWBP_JCF_Static.SPAS.SPASPickupHi'
	Physics=0
	DrawScale=0.1500000
	CollisionHeight=3.0000000
}
