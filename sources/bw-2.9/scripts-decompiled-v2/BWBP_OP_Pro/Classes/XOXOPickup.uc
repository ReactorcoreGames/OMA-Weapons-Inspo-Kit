class XOXOPickup extends BallisticWeaponPickup;

var float Lewdness;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'BWBP_OP_Tex.XOXO.XOXOBase');
	L.AddPrecacheMaterial(Texture'BWBP_OP_Tex.XOXO.XOXO_Light');
	L.AddPrecacheMaterial(Texture'BWBP_OP_Tex.XOXO.hearteffect');
	L.AddPrecacheMaterial(Texture'BWBP_OP_Tex.XOXO.xeffect');
	L.AddPrecacheMaterial(Texture'BWBP_OP_Tex.XOXO.oeffect');
	L.AddPrecacheMaterial(Texture'BWBP_OP_Tex.XOXO.xenon4');
	L.AddPrecacheMaterial(Texture'BWBP_OP_Tex.XOXO.XOXOMagicBand');
	L.AddPrecacheMaterial(Texture'BWBP_OP_Tex.XOXO.xoxoShaderMask');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_OP_Static.XOXO.Heart');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_OP_Static.XOXO.X');
	L.AddPrecacheStaticMesh(StaticMesh'BWBP_OP_Static.XOXO.O');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'BWBP_OP_Tex.XOXO.XOXOBase');
	Level.AddPrecacheMaterial(Texture'BWBP_OP_Tex.XOXO.XOXO_Light');
	Level.AddPrecacheMaterial(Texture'BWBP_OP_Tex.XOXO.hearteffect');
	Level.AddPrecacheMaterial(Texture'BWBP_OP_Tex.XOXO.xeffect');
	Level.AddPrecacheMaterial(Texture'BWBP_OP_Tex.XOXO.oeffect');
	Level.AddPrecacheMaterial(Texture'BWBP_OP_Tex.XOXO.xenon4');
	Level.AddPrecacheMaterial(Texture'BWBP_OP_Tex.XOXO.XOXOMagicBand');
	Level.AddPrecacheMaterial(Texture'BWBP_OP_Tex.XOXO.xoxoShaderMask');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_OP_Static.XOXO.XOXOPickupHi');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_OP_Static.XOXO.XOXOPickupLo');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_OP_Static.XOXO.XOXOAmmo');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_OP_Static.XOXO.Heart');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_OP_Static.XOXO.X');
	Level.AddPrecacheStaticMesh(StaticMesh'BWBP_OP_Static.XOXO.O');
	//return;	
}

defaultproperties
{
	bOnSide=false
	LowPolyStaticMesh=StaticMesh'BWBP_OP_Static.XOXO.XOXOPickupLo'
	PickupDrawScale=1.4500000
	InventoryType=Class'BWBP_OP_Pro.XOXOStaff'
	RespawnTime=20.0000000
	PickupMessage="You picked up le big XOXO."
	PickupSound=Sound'BW_Core_WeaponSound.A73.A73Putaway'
	StaticMesh=StaticMesh'BWBP_OP_Static.XOXO.XOXOPickupHi'
	bOrientOnSlope=true
	Physics=0
	DrawScale=1.6000000
	CollisionHeight=4.5000000
}
