class AkeronPickup extends BallisticWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BWBP_OP_Tex.Akeron.AkeronFront');
	L.AddPrecacheMaterial(Texture'BWBP_OP_Tex.Akeron.AkeronBack');
	L.AddPrecacheMaterial(Texture'BWBP_OP_Tex.Akeron.AkeronGrip');
	L.AddPrecacheMaterial(Texture'BWBP_OP_Tex.Akeron.AkeronMag');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_OP_Static.Akeron.AkeronPickupHi');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_OP_Static.Akeron.AkeronPickupLo');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BWBP_OP_Tex.Akeron.AkeronFront');
	Level.AddPrecacheMaterial(Texture'BWBP_OP_Tex.Akeron.AkeronBack');
	Level.AddPrecacheMaterial(Texture'BWBP_OP_Tex.Akeron.AkeronGrip');
	Level.AddPrecacheMaterial(Texture'BWBP_OP_Tex.Akeron.AkeronMag');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_OP_Static.Akeron.AkeronPickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_OP_Static.Akeron.AkeronPickupLo');
	//return;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BWBP_OP_Static.Akeron.AkeronPickupLo'
	PickupDrawScale=1.4500000
	InventoryType=Class'BWBP_OP_Pro.AkeronLauncher'
	RespawnTime=20.0000000
	PickupMessage="You picked up the AN-56 Akeron launcher."
	PickupSound=Sound'BW_Core_WeaponSound.G5.G5-Putaway'
	StaticMesh=StaticMesh'BWBP_OP_Static.Akeron.AkeronPickupHi'
	Physics=0
	DrawScale=1.7000000
	CollisionHeight=6.0000000
}
