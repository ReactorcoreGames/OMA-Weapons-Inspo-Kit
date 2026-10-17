class ParticleStreamPickup extends BallisticWeaponPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Shader'BWBP_OP_Tex.ProtonPack.proton_gun_SH1');
	L.AddPrecacheMaterial(Shader'BWBP_OP_Tex.ProtonPack.proton_pack_SH_1');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_OP_Static.ProtonPack.ProtonPackPickupHi');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_OP_Static.ProtonPack.ProtonPackPickupLo');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_OP_Static.ProtonPack.proton_pack_static_test');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Shader'BWBP_OP_Tex.ProtonPack.proton_gun_SH1');
	Level.AddPrecacheMaterial(Shader'BWBP_OP_Tex.ProtonPack.proton_pack_SH_1');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_OP_Static.ProtonPack.ProtonPackPickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_OP_Static.ProtonPack.ProtonPackPickupLo');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_OP_Static.ProtonPack.proton_pack_static_test');
	//return;	
}

defaultproperties
{
	bOnSide=false
	LowPolyStaticMesh=StaticMesh'BWBP_OP_Static.ProtonPack.ProtonPackPickupLo'
	PickupDrawScale=0.7500000
	InventoryType=Class'BWBP_APC_Pro.ParticleStreamer'
	RespawnTime=20.0000000
	PickupMessage="You picked up the mk.II E90-N particle accelerator."
	PickupSound=Sound'BW_Core_WeaponSound.M50.M50Putaway'
	StaticMesh=StaticMesh'BWBP_OP_Static.ProtonPack.ProtonPackPickupHi'
	Physics=0
	DrawScale=0.7500000
	Skins[0]=none
	Skins[1]=Shader'BWBP_OP_Tex.ProtonPack.proton_pack_SH_1'
	CollisionHeight=4.5000000
}
