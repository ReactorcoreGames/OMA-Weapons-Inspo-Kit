class GASCPickup extends BallisticHandgunPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BWBP_APC_Tex.GASC.GASCMain');
	L.AddPrecacheMaterial(Texture'BWBP_APC_Tex.GASC.GASCMagMain');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_APC_Static.GASC.GASCPickupHi');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_APC_Static.GASC.GASCPickupLo');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BWBP_APC_Tex.GASC.GASCMain');
	Level.AddPrecacheMaterial(Texture'BWBP_APC_Tex.GASC.GASCMagMain');
	super(Actor).UpdatePrecacheMaterials();
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_APC_Static.GASC.GASCPickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_APC_Static.GASC.GASCPickupLo');
	super(Actor).UpdatePrecacheStaticMeshes();
	//return;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BWBP_APC_Static.GASC.GASCPickupLo'
	PickupDrawScale=0.6000000
	InventoryType=Class'BWBP_APC_Pro.GASCPistol'
	RespawnTime=10.0000000
	PickupMessage="You picked up the Gaucho and Stallion"
	PickupSound=Sound'BW_Core_WeaponSound.M806.M806Putaway'
	StaticMesh=StaticMesh'BWBP_APC_Static.GASC.GASCPickupHi'
	Physics=0
	CollisionHeight=4.0000000
}
