class WendigoPickup extends BallisticWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BWBP_APC_Tex.Wendigo.Wendigo_Body_Main');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_APC_Static.Wendigo.WendigoPickupHi');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_APC_Static.Wendigo.WendigoPickupLo');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BWBP_APC_Tex.Wendigo.Wendigo_Body_Main');
	super(Actor).UpdatePrecacheMaterials();
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_APC_Static.Wendigo.WendigoPickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_APC_Static.Wendigo.WendigoPickupLo');
	super(Actor).UpdatePrecacheStaticMeshes();
	//return;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BWBP_APC_Static.Wendigo.WendigoPickupLo'
	InventoryType=Class'BWBP_APC_Pro.WendigoSMG'
	RespawnTime=20.0000000
	PickupMessage="You picked up the Wendigo SMG."
	PickupSound=Sound'BW_Core_WeaponSound.M50.M50Putaway'
	StaticMesh=StaticMesh'BWBP_APC_Static.Wendigo.WendigoPickupHi'
	Physics=0
	CollisionHeight=4.0000000
}
