class WrenchPickup extends BallisticWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BWBP_OP_Tex.Wrench.WrenchTex');
	L.AddPrecacheMaterial(Texture'BWBP_OP_Tex.Wrench.ShieldGenerator_BLU');
	L.AddPrecacheMaterial(Texture'BWBP_OP_Tex.Wrench.Teleport_BLU');
	L.AddPrecacheMaterial(Texture'BWBP_OP_Tex.Wrench.JumpPad_BLU');
	L.AddPrecacheMaterial(Texture'BWBP_OP_Tex.Wrench.Teleport_RED');
	L.AddPrecacheMaterial(Texture'BWBP_OP_Tex.Wrench.JumpPad_RED');
	L.AddPrecacheMaterial(Texture'BWBP_OP_Tex.Wrench.Unreal2_CrateTex');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_OP_Static.Wrench.AmmoCrate');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_OP_Static.Wrench.BoostPad');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_OP_Static.Wrench.EnergyWall');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_OP_Static.Wrench.ShieldGenCore');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_OP_Static.Wrench.ShieldOut2');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BWBP_OP_Tex.Wrench.WrenchTex');
	Level.AddPrecacheMaterial(Texture'BWBP_OP_Tex.Wrench.ShieldGenerator_BLU');
	Level.AddPrecacheMaterial(Texture'BWBP_OP_Tex.Wrench.Teleport_BLU');
	Level.AddPrecacheMaterial(Texture'BWBP_OP_Tex.Wrench.JumpPad_BLU');
	Level.AddPrecacheMaterial(Texture'BWBP_OP_Tex.Wrench.Teleport_RED');
	Level.AddPrecacheMaterial(Texture'BWBP_OP_Tex.Wrench.JumpPad_RED');
	Level.AddPrecacheMaterial(Texture'BWBP_OP_Tex.Wrench.Unreal2_CrateTex');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_OP_Static.Wrench.AmmoCrate');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_OP_Static.Wrench.BoostPad');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_OP_Static.Wrench.EnergyWall');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_OP_Static.Wrench.ShieldGenCore');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_OP_Static.Wrench.ShieldOut2');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_OP_Static.Wrench.WrenchPickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_OP_Static.Wrench.WrenchPickupLo');
	//return;	
}

defaultproperties
{
	LowPolyStaticMesh=StaticMesh'BWBP_OP_Static.Wrench.WrenchPickupLo'
	PickupDrawScale=0.7500000
	InventoryType=Class'BWBP_OP_Pro.WrenchWarpDevice'
	RespawnTime=10.0000000
	PickupMessage="You picked up the NFUD Combat Wrench."
	PickupSound=Sound'BW_Core_WeaponSound.Knife.KnifePutaway'
	StaticMesh=StaticMesh'BWBP_OP_Static.Wrench.WrenchPickupHi'
	Physics=0
	DrawScale=0.7500000
	CollisionHeight=4.0000000
}
